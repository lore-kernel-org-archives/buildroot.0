From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Mar 2017 17:00:01 +0100
Subject: [Buildroot] [PATCH v2 2/5] support/testing: add core tests
In-Reply-To: <1488726201-6507-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1488726201-6507-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305160001.GI3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-05 16:03 +0100, Thomas Petazzoni spake thusly:
> This commit adds a few Buildroot "core" tests, testing functionalities
> such as:
> 
>  - post-build and post-image scripts
>  - root filesystem overlays
>  - timezone support
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I won't be commenting on the Python code, because I'm no Python
expert... ;-)

Yet, a few questions below...

> ---
>  support/testing/tests/core/__init__.py             |   0
>  support/testing/tests/core/post-build.sh           |  10 ++++
>  support/testing/tests/core/post-image.sh           |  10 ++++
>  .../testing/tests/core/rootfs-overlay1/test-file1  | Bin 0 -> 4096 bytes
>  .../tests/core/rootfs-overlay2/etc/test-file2      | Bin 0 -> 8192 bytes

What are those two binary blobs for?
Why are they binary blobs?
Can't they be generated locally?

>  support/testing/tests/core/test_post_scripts.py    |  35 +++++++++++
>  support/testing/tests/core/test_rootfs_overlay.py  |  27 +++++++++
>  support/testing/tests/core/test_timezone.py        |  66 +++++++++++++++++++++
>  8 files changed, 148 insertions(+)
>  create mode 100644 support/testing/tests/core/__init__.py
>  create mode 100755 support/testing/tests/core/post-build.sh
>  create mode 100755 support/testing/tests/core/post-image.sh
>  create mode 100644 support/testing/tests/core/rootfs-overlay1/test-file1
>  create mode 100644 support/testing/tests/core/rootfs-overlay2/etc/test-file2
>  create mode 100644 support/testing/tests/core/test_post_scripts.py
>  create mode 100644 support/testing/tests/core/test_rootfs_overlay.py
>  create mode 100644 support/testing/tests/core/test_timezone.py
> 
> diff --git a/support/testing/tests/core/__init__.py b/support/testing/tests/core/__init__.py
> new file mode 100644
> index 0000000..e69de29
> diff --git a/support/testing/tests/core/post-build.sh b/support/testing/tests/core/post-build.sh
> new file mode 100755
> index 0000000..fbea726
> --- /dev/null
> +++ b/support/testing/tests/core/post-build.sh
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +echo $1 > ${BUILD_DIR}/post-build.log
> +echo $2 >> ${BUILD_DIR}/post-build.log
> +echo $3 >> ${BUILD_DIR}/post-build.log
> +echo ${TARGET_DIR}  >> ${BUILD_DIR}/post-build.log
> +echo ${BUILD_DIR}   >> ${BUILD_DIR}/post-build.log
> +echo ${HOST_DIR}    >> ${BUILD_DIR}/post-build.log
> +echo ${STAGING_DIR} >> ${BUILD_DIR}/post-build.log
> +echo ${BINARIES_DIR}  >> ${BUILD_DIR}/post-build.log
> +echo ${BR2_CONFIG}  >> ${BUILD_DIR}/post-build.log

This is ugly, and I guess it will be hard to maintain consistency
between this list and the checks done in the code.

This does not work well if there are any problematice character in
there, so I'd at least quote the variables.

But I would even go further and print key-value pairs to the file:

    #!/bin/sh
    printf "what='%s'\n" "${1}"
    printf "arg2='%s'\n" "${2}"
    printf "arg3='%s'\n" "${2}"
    printf "TARGET_DIR='%s'\n" "${TARGET_DIR}"
    printf "BUILD_DIR='%s'\n" "${BUILD_DIR}"
    [...]

And then use a parser [*] to read that file and store the values in an
associative array (aka dictionnary) in the python code, then you can do
things like:

    self.assert(post_log["what"], os.path.join(self.builddir, what))
    self.assert(post_log["TARGET_DIR"], os.path.join(self.builddir, "target"))

and so on... Which is much more readable IMHO...

[*] I don't know which parser, but probably one that can read key-value
pairs from a file... ;-)  Python experts may help you here... ;-]

> diff --git a/support/testing/tests/core/post-image.sh b/support/testing/tests/core/post-image.sh
> new file mode 100755
> index 0000000..5856c0f
> --- /dev/null
> +++ b/support/testing/tests/core/post-image.sh
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +echo $1 > ${BUILD_DIR}/post-image.log
> +echo $2 >> ${BUILD_DIR}/post-image.log
> +echo $3 >> ${BUILD_DIR}/post-image.log
> +echo ${TARGET_DIR}  >> ${BUILD_DIR}/post-image.log
> +echo ${BUILD_DIR}   >> ${BUILD_DIR}/post-image.log
> +echo ${HOST_DIR}    >> ${BUILD_DIR}/post-image.log
> +echo ${STAGING_DIR} >> ${BUILD_DIR}/post-image.log
> +echo ${BINARIES_DIR}  >> ${BUILD_DIR}/post-image.log
> +echo ${BR2_CONFIG}  >> ${BUILD_DIR}/post-image.log

Ditto.

> diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
> new file mode 100644
> index 0000000..7b4a829
> --- /dev/null
> +++ b/support/testing/tests/core/test_post_scripts.py
> @@ -0,0 +1,35 @@
> +import os
> +
> +import infra.basetest
> +
> +class TestPostScripts(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +"""
> +BR2_INIT_NONE=y
> +BR2_SYSTEM_BIN_SH_NONE=y
> +# BR2_PACKAGE_BUSYBOX is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="{}"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="foobar baz"
> +""".format(infra.filepath("tests/core/post-build.sh"),
> +           infra.filepath("tests/core/post-image.sh"))
> +
> +    def check_post_log_file(self, path, what):
> +        with open(path, "r") as f:
> +            lines = f.read().splitlines()
> +        self.assertEqual(lines[0], os.path.join(self.builddir, what))
> +        self.assertEqual(lines[1], "foobar")
> +        self.assertEqual(lines[2], "baz")
> +        self.assertEqual(lines[3], os.path.join(self.builddir, "target"))
> +        self.assertEqual(lines[4], os.path.join(self.builddir, "build"))
> +        self.assertEqual(lines[5], os.path.join(self.builddir, "host"))
> +        staging = os.readlink(os.path.join(self.builddir, "staging"))
> +        self.assertEqual(lines[6], staging)
> +        self.assertEqual(lines[7], os.path.join(self.builddir, "images"))
> +        self.assertEqual(lines[8], os.path.join(self.builddir, ".config"))

See above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
