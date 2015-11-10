From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Nov 2015 11:42:11 +0100
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: <E219834A-E8E4-4AF5-974C-45B03804F2A2@ca2.so-net.ne.jp>
References: <201511100922.tAA9Ml77000486@ms-omx02.plus.so-net.ne.jp>
 <20151110104858.6c49b759@free-electrons.com>
 <E219834A-E8E4-4AF5-974C-45B03804F2A2@ca2.so-net.ne.jp>
Message-ID: <20151110114211.365afbbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hiroshi,

On Tue, 10 Nov 2015 19:21:26 +0900, Hiroshi Kawashima wrote:

> Most problems seems to be architectures that boehm gc not ported.

Indeed. First thing would be to see if gauche can used an external
boehm gc implementation rather than its own. Indeed, we already have a
package for boehm gc in package/bdwgc/.

And this package is only built for architectures where libatomic_ops is
available.

> Would you suggest how can I control these case in Config.in ?
> (eg. gauche is not supported on xtensa, disable selecting gauche package
> for xtensa architecture).

If you can use the bdwgc package, then please do so, and you will have
to add in gauche/Config.in "depends on
BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS" which should make most of the
architecture specific problems disappear.

If you cannot use the bdwgc package, then just add some architecture
dependencies in gauche/Config.in, probably in the form of:

config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
	bool
	default y if BR2_arm || BR2_i386 || ...

config BR2_PACKAGE_GAUCHE
	bool "gauche"
	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS

comment "gauche needs ..."
	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
