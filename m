From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Sep 2017 10:04:19 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix remaining code
	style
In-Reply-To: <20170929022713.2967-4-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
 <20170929022713.2967-4-ricardo.martincoski@gmail.com>
Message-ID: <20170929080419.GA2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-09-28 23:27 -0300, Ricardo Martincoski spake thusly:
> Fix the remaining code style warnings from flake8:
>  - break lines at 79 columns;
>  - replace some long lines by equivalent code;
>  - make flake8 ignore some long lines that need to be that way;
>  - properly indent continuation lines;
>  - use simpler code to test a parameter is not None.

NACK for that last one. PEP8 https://www.python.org/dev/peps/pep-0008/
says:

---8<---
Also, beware of writing if x when you really mean if x is not None --
e.g. when testing whether a variable or argument that defaults to None
was set to some other value. The other value might have a type (such as
a container) that could be false in a boolean context!
---8<---

But you are right in a sense, in that we should write "if x is not None"
instead of the current "if not x is None".

And that is exactly what flake8 reports, by the way. ;-)

Regards,
Yann E. MORIN.

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Warnings from flake8 change from 17 to 0.
> ---
>  support/testing/infra/basetest.py                 |  7 ++++---
>  support/testing/tests/core/test_post_scripts.py   | 15 ++++++++++-----
>  support/testing/tests/core/test_rootfs_overlay.py |  3 ++-
>  support/testing/tests/fs/test_iso9660.py          |  4 ++--
>  support/testing/tests/fs/test_squashfs.py         |  9 ++++++---
>  support/testing/tests/init/base.py                |  6 +++---
>  support/testing/tests/init/test_none.py           |  4 +++-
>  7 files changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 9d5f714b02..045f5e80a4 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -41,13 +41,14 @@ class BRTest(unittest.TestCase):
>      def __init__(self, names):
>          super(BRTest, self).__init__(names)
>          self.testname = self.__class__.__name__
> -        self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
> +        self.builddir = self.outputdir and os.path.join(self.outputdir,
> +                                                        self.testname)

I think that in such situation, a better break would be right after the
'and' operator (but Python is stupid and errors if there is no explicit
line continuation):

    self.builddir = self.outputdir and \
                    os.path.join(self.outputdir, self.testname)

However, I don't understand what this was supposed to do in the first
place... If self.outputdir does not evaluate to False, I understand. But
if it does evaluate to "False" (in fact, probably because it is "None"),
then we assign "None" to self.builddir.

However, we do ensure that self.outputdir is indeed set, because we do
require the -o option to be passed.

Hmm... Unless we are just listing the tests, in which case -o is not
mandatory... Is that it? If so, this is confusing... :-/

[--SNIP--]
> diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
> index fedd40d8ac..31d6c0fb5e 100644
> --- a/support/testing/tests/core/test_rootfs_overlay.py
> +++ b/support/testing/tests/core/test_rootfs_overlay.py
> @@ -24,7 +24,8 @@ class TestRootfsOverlay(infra.basetest.BRTest):
>          ret = compare_file(overlay_file, target_file)
>          self.assertEqual(ret, 0)
>  
> -        target_file = os.path.join(self.builddir, "target", "etc", "test-file2")
> +        target_file = os.path.join(self.builddir, "target", "etc",
> +                                   "test-file2")

Sometimes, rules are stupid... :-/ I would again have found that a
better break would have been right between self.builddir and "target",
like so:

    target_file = os.path.join(self.builddir, 
                               "target", "etc", "test-file2")

But why is the "target/etc/test-file2" path split in the first place? It
should probably be a single argument, no?

Or are we afraid that this might have to run on a system where path
separator are not forward slashes?  (note: only Windows uses backslash
as a path separator, and we never claimed we would work on Windows. And
if one uses cygwin, then Cygwin works very well with forward slashes.
There's just this new fancy WSL stuff, but I haven't touched a Windows
in a decade, so I can't say.)

So, back to the point: why not make it a siungle argument?

Especially since we do have such path in a lot of other places all over
the tree (e.g. [...].format(infra.filepath("conf/grub2.cfg")) below [0]).

>          overlay_file = "{}2/etc/test-file2".format(self.rootfs_overlay_path)
>          ret = compare_file(overlay_file, target_file)
>          self.assertEqual(ret, 0)
> diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
> index 41430eb4d2..216a005a1c 100644
> --- a/support/testing/tests/fs/test_iso9660.py
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -57,7 +57,7 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
>          BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
>          BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
>          BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -        """.format(infra.filepath("conf/grub2.cfg"))
> +        """.format(infra.filepath("conf/grub2.cfg"))  # noqa

[0] ... here.

>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
> @@ -77,7 +77,7 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
>          BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
>          BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
>          BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -        """.format(infra.filepath("conf/grub2.cfg"))
> +        """.format(infra.filepath("conf/grub2.cfg"))  # noqa

[0] ... here.

>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
> diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
> index 066c054342..58640d557f 100644
> --- a/support/testing/tests/fs/test_squashfs.py
> +++ b/support/testing/tests/fs/test_squashfs.py
> @@ -14,13 +14,15 @@ class TestSquashfs(infra.basetest.BRTest):
>          """
>  
>      def test_run(self):
> -        unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
> +        unsquashfs_cmd = ["host/bin/unsquashfs", "-s",
> +                          "images/rootfs.squashfs"]

[0] ... here. OK, I made my point, I guess! ;-)

>          out = subprocess.check_output(unsquashfs_cmd,
>                                        cwd=self.builddir,
>                                        env={"LANG": "C"})
>          out = out.splitlines()
>          self.assertEqual(out[0],
> -                         "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
> +                         "Found a valid SQUASHFS 4:0 superblock on "
> +                         "images/rootfs.squashfs.")

This is typically another case where splitting is just nut. Don't; it
only brings readabilitiy issues.

But I would like to allow for a bit longer lines, because we already
have quite some deeply indented code, and 79 chars wide lines are all
the shorter.

So I would suggest we add this file:

    $ cat support/testing/setup.cfg:
    [flake8]
    max-line-length=132

Thoughts?

Regards,
Yann E. MORIN.

>          self.assertEqual(out[3], "Compression lz4")
>  
>          img = os.path.join(self.builddir, "images", "rootfs.squashfs")
> @@ -30,7 +32,8 @@ class TestSquashfs(infra.basetest.BRTest):
>                             kernel="builtin",
>                             kernel_cmdline=["root=/dev/mmcblk0",
>                                             "rootfstype=squashfs"],
> -                           options=["-drive", "file={},if=sd,format=raw".format(img)])
> +                           options=["-drive",
> +                                    "file={},if=sd,format=raw".format(img)])
>          self.emulator.login()
>  
>          cmd = "mount | grep '/dev/root on / type squashfs'"
> diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
> index c09ee46eb0..3764d6ab95 100644
> --- a/support/testing/tests/init/base.py
> +++ b/support/testing/tests/init/base.py
> @@ -6,7 +6,7 @@ import infra.basetest
>  class InitSystemBase(infra.basetest.BRTest):
>  
>      def startEmulator(self, fs_type, kernel=None, dtb=None, init=None):
> -        img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
> +        img = os.path.join(self.builddir, "images", "rootfs." + fs_type)
>          subprocess.call(["truncate", "-s", "%1M", img])
>  
>          options = ["-drive",
> @@ -18,7 +18,7 @@ class InitSystemBase(infra.basetest.BRTest):
>          else:
>              kernel = os.path.join(self.builddir, "images", kernel)
>              options.extend(["-dtb", os.path.join(self.builddir, "images",
> -                                             "{}.dtb".format(dtb))])
> +                                                 "{}.dtb".format(dtb))])
>  
>          kernel_cmdline = ["root=/dev/mmcblk0",
>                            "rootfstype={}".format(fs_type),
> @@ -26,7 +26,7 @@ class InitSystemBase(infra.basetest.BRTest):
>                            "ro",
>                            "console=ttyAMA0"]
>  
> -        if not init is None:
> +        if init:
>              kernel_cmdline.extend(["init={}".format(init)])
>  
>          self.emulator.boot(arch="armv7",
> diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
> index c8a79f0bab..22e4850853 100644
> --- a/support/testing/tests/init/test_none.py
> +++ b/support/testing/tests/init/test_none.py
> @@ -14,7 +14,9 @@ class TestInitSystemNone(InitSystemBase):
>  
>      def test_run(self):
>          self.startEmulator(fs_type="squashfs", init="/bin/sh")
> -        index = self.emulator.qemu.expect(["/bin/sh: can't access tty; job control turned off", pexpect.TIMEOUT], timeout=60)
> +        index = self.emulator.qemu.expect(["/bin/sh: can't access tty; "
> +                                           "job control turned off",
> +                                           pexpect.TIMEOUT], timeout=60)
>          if index != 0:
>              self.emulator.logfile.write("==> System does not boot")
>              raise SystemError("System does not boot")
> -- 
> 2.13.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
