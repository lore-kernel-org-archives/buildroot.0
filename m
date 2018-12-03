From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 09:14:35 +0100
Subject: [Buildroot] [PATCH 1/1] libbsd: fix display of comment
In-Reply-To: <20181202102551.18249-1-fontaine.fabrice@gmail.com>
References: <20181202102551.18249-1-fontaine.fabrice@gmail.com>
Message-ID: <20181203091435.2fc5051a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun,  2 Dec 2018 11:25:51 +0100, Fabrice Fontaine wrote:
> Commit e13855c48f21eaee07a81f8b02678839be274a45 wrongly added
> depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
> to display the comment "libbsd needs a toolchain w/ threads, wchar"
> 
> Set the correct dependency:
> depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Instead of this (and the related minizip change), what about moving the:

	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)

to BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS ?

Since we don't display a comment about it, it is effectively treated
like an architecture dependency, and it kind of is, since anyway the
only C library that supports noMMU systems is uClibc (yes, musl
supports noMMU on SH2, but we don't support that in Buildroot).

Having this dependency directly in BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
avoid the need to replicate it to all reverse dependencies of libbsd
(and therefore the reverse dependencies should be changed as well).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
