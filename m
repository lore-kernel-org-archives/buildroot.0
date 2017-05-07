From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 7 May 2017 22:55:48 +0200
Subject: [Buildroot] [PATCH v3 3/5] support/testing: add fs tests
In-Reply-To: <1490042214-6762-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <dff1d449-5d0a-c6f8-2fd7-000e5a79247b@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this the review I had written a few days ago. Since the patch has just
been applied, I've reworded it as a list of proposed improvements and
request for clarifications.

On 20/03/2017 21:36, Thomas Petazzoni wrote:
> This commit adds a number of test cases for various filesystem formats:
> ext2/3/4, iso9660, jffs2, squashfs, ubi/ubifs and yaffs2. All of them
> except yaffs2 are runtime tested. The iso9660 set of test cases is
> particularly rich, testing the proper operation of the iso9660 support
> with all of grub, grub2 and isolinux.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/conf/grub-menu.lst                 |  20 +++
>  support/testing/conf/grub2.cfg                     |   7 +
>  support/testing/conf/isolinux.cfg                  |   5 +
>  .../testing/conf/minimal-x86-qemu-kernel.config    |  23 +++
>  support/testing/tests/fs/__init__.py               |   0
>  support/testing/tests/fs/test_ext.py               | 119 +++++++++++++++
>  support/testing/tests/fs/test_iso9660.py           | 162 +++++++++++++++++++++
>  support/testing/tests/fs/test_jffs2.py             |  45 ++++++
>  support/testing/tests/fs/test_squashfs.py          |  37 +++++
>  support/testing/tests/fs/test_ubi.py               |  39 +++++
>  support/testing/tests/fs/test_yaffs2.py            |  12 ++
>  11 files changed, 469 insertions(+)
>  create mode 100644 support/testing/conf/grub-menu.lst
>  create mode 100644 support/testing/conf/grub2.cfg
>  create mode 100644 support/testing/conf/isolinux.cfg

I suspect it's already been suggested, but I would rather put these
files in the 'fs' subdirectory, unless we expect to use them for non-fs
tests.

Do other people agree? Should I send a patch?

> diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
> new file mode 100644
> index 0000000..f7e2e85
> --- /dev/null
> +++ b/support/testing/tests/fs/test_ext.py
[...]
> +def dumpe2fs_getprop(out, prop):
> +    for lines in out:

Here 'lines' is set to a string (one line)...

> +        lines = lines.split(": ")

...and here it is reassigned to a list (the line fields, as they are
called in awk. Or is the second assignment of 'lines' creating a new
variable with the same name? Whether the reply, I don't like this.

> +        if lines[0] == prop:
> +            return lines[1].strip()

My proposal (tested):

def dumpe2fs_getprop(out, prop):
    for line in out:
        fields = line.split(": ")
        if fields[0] == prop:
            return fields[1].strip()

Unless there's a good reason to keep the code as is, I'll send a patch
anyway, to improve readability at least.

> +def boot_img_and_check_fs_type(emulator, builddir, fs_type):
> +    img = os.path.join(builddir, "images", "rootfs.{}".format(fs_type))

Here (and similarly in several other places) this looks a lot more
intuitive and concise to me:

  "rootfs." + fs_type

Any good reason the initial form is preferred? Pythonists out there?

[...]

> +class TestExt3(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +"""
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_3=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +"""
> +
> +    def test_run(self):
> +        out = dumpe2fs_run(self.builddir, "rootfs.ext3")
> +        self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
> +        self.assertIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
> +
> +        exit_code = boot_img_and_check_fs_type(self.emulator,
> +                                               self.builddir, "ext3")
> +        self.assertEqual(exit_code, 0)
> +
> +class TestExt4(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +"""
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_BLOCKS=16384
> +BR2_TARGET_ROOTFS_EXT2_INODES=3000
> +BR2_TARGET_ROOTFS_EXT2_RESBLKS=10
> +# BR2_TARGET_ROOTFS_TAR is not set
> +"""
> +
> +    def test_run(self):
> +        out = dumpe2fs_run(self.builddir, "rootfs.ext4")
> +        self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
> +        self.assertEqual(dumpe2fs_getprop(out, BLOCKCNT_PROP), "16384")
> +        # Yes there are 8 more inodes than requested
> +        self.assertEqual(dumpe2fs_getprop(out, INODECNT_PROP), "3008")
> +        self.assertEqual(dumpe2fs_getprop(out, RESBLKCNT_PROP), "1638")
> +        self.assertIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
> +        self.assertIn("extent", dumpe2fs_getprop(out, FEATURES_PROP))

It would be nice to have both positive and a negative test for each
tested item. Specifically, I'd add self.assertIn("extent", ...) for ext3.

I'll send a patch for this.

> diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
> new file mode 100644
> index 0000000..eec6e89
> --- /dev/null
> +++ b/support/testing/tests/fs/test_iso9660.py

[...]

> +#
> +# Syslinux
> +#
> +
> +class TestIso9660SyslinuxExternal(infra.basetest.BRTest):

The two syslinux tests are failing on top of current master. This is
since commit 6e432d5ecb46 ("syslinux: build with the target toolchain").

The error message is:

  .../i686-linux-ld: unrecognized option '--no-dynamic-linker'

> diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
> new file mode 100644
> index 0000000..edaa087
> --- /dev/null
> +++ b/support/testing/tests/fs/test_squashfs.py
[...]
> +    def test_run(self):
> +        unsquashfs_cmd = ["host/usr/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
> +        out = subprocess.check_output(unsquashfs_cmd,
> +                                      cwd=self.builddir,
> +                                      env={"LANG": "C"})
> +        out = out.splitlines()
> +        self.assertEqual(out[0],
> +                         "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
> +        self.assertEqual(out[3], "Compression lz4")
> +
> +        img = os.path.join(self.builddir, "images", "rootfs.squashfs")
> +        subprocess.call(["truncate", "-s", "%1M", img])

Why do we need this call to truncate?

-- 
Luca
