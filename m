From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 26 Mar 2017 23:53:19 +0200
Subject: [Buildroot] [PATCH v3 5/5] support/testing: add toolchain tests
In-Reply-To: <1490042214-6762-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <616b063e-057b-c68e-9036-ea44b9bef9fe@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 20/03/2017 21:36, Thomas Petazzoni wrote:
> This commit adds an initial toolchain test case, testing the ARM
> CodeSourcery toolchain, just checking that the proper sysroot is used,
> and that a minimal Linux system boots fine under Qemu.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/tests/toolchain/__init__.py      |   0
>  support/testing/tests/toolchain/test_external.py | 156 +++++++++++++++++++++++
>  2 files changed, 156 insertions(+)
>  create mode 100644 support/testing/tests/toolchain/__init__.py
>  create mode 100644 support/testing/tests/toolchain/test_external.py
> 
> diff --git a/support/testing/tests/toolchain/__init__.py b/support/testing/tests/toolchain/__init__.py
> new file mode 100644
> index 0000000..e69de29
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> new file mode 100644
> index 0000000..1fbf81f
> --- /dev/null
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -0,0 +1,156 @@
> +import os
> +import infra
> +
> +BASIC_CONFIG = \
> +"""
> +BR2_TARGET_ROOTFS_CPIO=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +"""
> +
> +def check_broken_links(path):
> +    for root, dirs, files in os.walk(path):
> +        for f in files:
> +            fpath = os.path.join(root, f)
> +            if not os.path.exists(fpath):
> +                return True
> +    return False

For predicate functions I find it a lot more understandable when the
name contains a predicate verb. IOW I suggest renaming to
has_broken_links(). This would make it immediately understandable to me,
while with the current name I had to go through the Python docs to
understand what it does.

The rest looks OK, but I haven't checked it in depth enough to give any
formal tag, sorry.

-- 
Luca
