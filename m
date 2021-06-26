From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 22:27:19 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing/tests: fix tests to use
 infra.img_round_power2()
In-Reply-To: <20210621202547.360391-3-thomas.petazzoni@bootlin.com>
References: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
 <20210621202547.360391-3-thomas.petazzoni@bootlin.com>
Message-ID: <20210626202719.GC2582576@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-21 22:25 +0200, Thomas Petazzoni spake thusly:
> All the tests that are using if=sd as a Qemu options are changed to
> use infra.img_round_power2() instead of simply extending the size of
> the image to the next MB boundary, which is not longer sufficient with
> Qemu >= 5.1.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/tests/core/test_file_capabilities.py | 2 +-
>  support/testing/tests/fs/test_squashfs.py            | 2 +-
>  support/testing/tests/init/base.py                   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
> index b9ece18d7b..bd46f5138d 100644
> --- a/support/testing/tests/core/test_file_capabilities.py
> +++ b/support/testing/tests/core/test_file_capabilities.py
> @@ -28,7 +28,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
>  
>      def test_run(self):
>          img = os.path.join(self.builddir, "images", "rootfs.squashfs")
> -        subprocess.call(["truncate", "-s", "%1M", img])
> +        infra.img_round_power2(img)
>  
>          self.emulator.boot(arch="armv7",
>                             kernel=os.path.join(self.builddir, "images", "zImage"),
> diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
> index 234f4944be..7d6297ec5e 100644
> --- a/support/testing/tests/fs/test_squashfs.py
> +++ b/support/testing/tests/fs/test_squashfs.py
> @@ -22,7 +22,7 @@ class TestSquashfs(infra.basetest.BRTest):
>          self.assertEqual(out[3], "Compression lz4")
>  
>          img = os.path.join(self.builddir, "images", "rootfs.squashfs")
> -        subprocess.call(["truncate", "-s", "%1M", img])
> +        infra.img_round_power2(img)

Not the fault of this patch, but still your fault: this squashfs test no
longer works after the kernel update in 3cf2782906d5...

I temporarily switched it back to using gxip to test it (but did not
commit that change).

Applied to master, thanks.

Regards,
Yann E. MORIN.

>          self.emulator.boot(arch="armv7",
>                             kernel="builtin",
> diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
> index 75cfbe9c59..7ed035263b 100644
> --- a/support/testing/tests/init/base.py
> +++ b/support/testing/tests/init/base.py
> @@ -7,7 +7,7 @@ class InitSystemBase(infra.basetest.BRTest):
>  
>      def start_emulator(self, fs_type, kernel=None, dtb=None, init=None):
>          img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
> -        subprocess.call(["truncate", "-s", "%1M", img])
> +        infra.img_round_power2(img)
>  
>          options = ["-drive",
>                     "file={},if=sd,format=raw".format(img),
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
