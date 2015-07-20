From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 14:38:32 +0200
Subject: [Buildroot] [PATCH] busybox: linux-pam support requires threads
In-Reply-To: <6d2d86487b691cfe8c1c66a9630d0e51461290c4.1437388422.git.baruch@tkos.co.il>
References: <6d2d86487b691cfe8c1c66a9630d0e51461290c4.1437388422.git.baruch@tkos.co.il>
Message-ID: <20150720143832.15fad90b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 20 Jul 2015 13:33:42 +0300, Baruch Siach wrote:
> Commit 083aeac94e19 (busybox: added linux-pam support, 2015-07-14) enabled
> CONFIG_PAM when the linux-pam package is selected. Busybox build system adds
> -lpthread unconditionally when CONFIG_PAM is enabled, which leads to build
> failure when the toolchain does not support pthreads. Enable CONFIG_PAM only
> when the toolchain supports threads.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8df/8df14bde19a41b78aa6422a1649a570914f747ee/
> http://autobuild.buildroot.net/results/30d/30dd11b576b590de513031fce5e034353f2f5544/
> http://autobuild.buildroot.net/results/de6/de628d84b0ed49be8f5d021c789357b2e66f2b02/
> 
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I was pretty sure I already fixed that one. And I indeed already fixed
it. Except that after that I merged another patch adding again
Linux-PAM support in Busybox. Big mistake on my side:

083aeac94e19cde6abd4b29cf29db589327d8c49 busybox: added linux-pam support
b0b3dc5612a012dd29293bee0cd848aa1b7c0b7d busybox: selinux support
cdcd83f31ded1dbf6d13d16b4aafdf594b964d94 package: fix fallout from checking kconfig config files
3ff5f63e48237cf569aaba6be35e179bf8556a19 package/busybox: check for config file
89d39fc7a392530be043bac541ade0bef746edb6 initscripts: new package
b98dd2355780c732bf440042fb8faafe731efc94 busybox: improve support for telnetd
e1baac68bcb9fb3cb3d2603d238a2ce8e7eb1125 busybox: Install udhcpc script only if enabled
aa1362f220e733689fe4210b0bb2433f6d595e6b busybox: adjust configuration to add fancy options to the sleep applet
98e1848db11e707f96504ccf9cb2ed09e6787dd1 busybox: PAM support needs thread support
f21b2558a097d07b53b6f20a47770468e9e4f7ed busybox: added linux-pam support

f21b2558a097d07b53b6f20a47770468e9e4f7ed was merged first, I fixed the
thread dependency in 98e1848db11e707f96504ccf9cb2ed09e6787dd1 but then
later on, I merged again a linux-pam dependency addition, which didn't
conflict because the piece of code was added at a different place.

So really, the proper fix is to revert
083aeac94e19cde6abd4b29cf29db589327d8c49. Can you send a patch doing
this revert?

Sorry for the mess :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
