From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 22:00:05 +0200
Subject: [Buildroot] [Bug 5900] config flags to the Xenomai build system
 ...
In-Reply-To: <20140716193802.9BD869D25A@busybox.osuosl.org>
References: <bug-5900-163@https.bugs.busybox.net/>
 <20140716193802.9BD869D25A@busybox.osuosl.org>
Message-ID: <20140716200005.GE9252@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-16 19:38 +0000, bugzilla at busybox.net spake thusly:
> https://bugs.busybox.net/show_bug.cgi?id=5900
> 
> --- Comment #5 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-07-16 19:38:01 UTC ---
> I tried reproducing this issue. Since I don't have a target board to test with,
> I have to resort to checking the parameters passed to the compilation.
> 
> Since I believe that the FPU support check you are referring to in the
> testsuite originates from the 'switchtest', I checked with strace which
> parameters are passed to the real compiler (by the compiler wrapper):

Note that you can obtain the same info by running:
    BR2_DEBUG_WRAPPER=N make

Which tells the wrapper to output the command line it uses to call the
real compiler.

Set N to '1' to get the command line on a single line, set it to '2' to
get each argument on a single line.

See: http://nightly.buildroot.org/#toolchain-custom ;-)

Regards,
Yann E. MORIN.

> execve("/home/tdescham/repo/contrib/buildroot-reproduce/output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi-gcc",
> ["/home/tdescham/repo/contrib/buildroot-reproduce/output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi-gcc",
> "--sysroot",
> "/home/tdescham/repo/contrib/buildroot-reproduce/output/host/usr/arm-buildroot-linux-gnueabi/sysroot",
> "-mabi=aapcs-linux", "-msoft-float", "-marm", "-pipe", "-mfloat-abi=soft",
> "-march=armv4t", "-mcpu=arm920t", "-DHAVE_CONFIG_H", "-I.",
> "-I../../../src/include", "-I../../../include/posix", "-O2", "-D_GNU_SOURCE",
> "-D_REENTRANT", "-Wall", "-Werror-implicit-function-declaration", "-pipe",
> "-D__XENO__", "-D__IN_XENO__", "-Wstrict-prototypes", "-g",
> "-I../../../include", "-D_LARGEFILE_SOURCE", "-D_LARGEFILE64_SOURCE",
> "-D_FILE_OFFSET_BITS=64", "-D_LARGEFILE_SOURCE", "-D_LARGEFILE64_SOURCE",
> "-D_FILE_OFFSET_BITS=64", "-pipe", "-Os", "-MT", "switchtest-switchtest.o",
> "-MD", "-MP", "-MF", ".deps/switchtest-switchtest.Tpo", "-c", "-o",
> "switchtest-switchtest.o", "switchtest.c"], [/* 54 vars */]) = 0
> 
> 
> 
> This shows that the requested flags are effectively passed to the compilation,
> so I don't expect issues. 
> 
> This was checked with an external sourcery toolchain. The defconfig (buildroot
> 2014.05-git) is:
> 
> BR2_arm=y
> BR2_arm920t=y
> BR2_DL_DIR="~/repo/contrib/dl"
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_DEFCONFIG="mx1"
> BR2_LINUX_KERNEL_EXT_XENOMAI=y
> 
> (don't mind the kernel defconfig, it is bogus).
> 
> So at this point, we believe that there is no issue.
> 
> If you do believe there is an issue, then please:
> - provide a .config for us to reproduce
> - provide more details / confirmation about the test that fails (switchtest?)
> - verify the output of strace as I did above
> 
> -- 
> Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
> ------- You are receiving this mail because: -------
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
