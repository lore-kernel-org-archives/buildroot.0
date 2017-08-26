From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 26 Aug 2017 18:12:16 -0300
Subject: [Buildroot] [RFC-next 2/2] support/testing: add tests for the
 genimage generation logic
References: <20170823204547.16672-3-thomas.petazzoni@free-electrons.com>
Message-ID: <59a1e43030772_9073fef6c9318e0610b8@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Looks good. Only nits below.

On Wed, Aug 23, 2017 at 05:45 PM, Thomas Petazzoni wrote:

> This commit adds two new test cases, to validate that the genimage
> related functionality in Buildroot is working as expected:
> 
>  - One test case with just one ext4 partition. We do the build, check
>    in the image that one partition is available with the right type,
>    and then boot the system under Qemu to validate that the root
>    filesystem can be mounted from /dev/mmcblk0p1.

The root filesystem ends up mounted as read-only due to limitations in the
builtin kernel image. From the -run.log:
Filesystem with huge files cannot be mounted RDWR without CONFIG_LBDAF

But I think it is OK since whether it is writable or not is not the subject of
the test.

[snip]
> ---
>  support/testing/tests/fs/genimage-simple.cfg |  9 ++++
>  support/testing/tests/fs/genimage-vfat.cfg   | 25 ++++++++++
>  support/testing/tests/fs/test_genimage.py    | 74 ++++++++++++++++++++++++++++
>  3 files changed, 108 insertions(+)

I don't know if it was intended (due to RFC status) or not, but the update to
.gitlab-ci.yml is missing.

[snip]
> +++ b/support/testing/tests/fs/test_genimage.py

Since it's a new file, could fix the 9 code style warnings from flake8?

[snip]
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +             """
> +             BR2_TARGET_ROOTFS_EXT2=y
> +             BR2_TARGET_ROOTFS_EXT2_4=y
> +             BR2_TARGET_ROOTFS_GENIMAGE=y
> +             BR2_TARGET_ROOTFS_GENIMAGE_CFG_FILE="{}"
> +             """.format(infra.filepath("tests/fs/genimage-simple.cfg"))

This is a triple-quoted string and the test infra removes the white space at
beginning of lines, so any indentation would be valid.
But perhaps we could adopt a default and use everywhere for consistency. See
support/testing/tests/init/test_none.py that indents one level in this case.
    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
        """

Regards,
Ricardo
