From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 01:32:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] paxtest: new package
In-Reply-To: <1499308509-30051-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1499308509-30051-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <4bd9bc00-761e-be3a-6981-5def37da00e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 04:35, Matt Weber wrote:
[snip]
> diff --git a/package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch b/package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch
> new file mode 100644
> index 0000000..8e836d6
> --- /dev/null
> +++ b/package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch
> @@ -0,0 +1,49 @@
> +From 70406ad5668a15fedce2ae1ed3bc4fad04d9f040 Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Wed, 5 Jul 2017 20:47:42 -0500
> +Subject: [PATCH] paxtest: page alignment ARM and NIOS2 arch
> +
> +- Extended ARM range from ARMv6-v7 to also include v4-v7
> +- Added NIOS2 arch to conditionally have smaller alignment
> +
> +Submitted Upstream to pageexec at freemail.hu.  Also posted a
> +bug to both (Hardened) Suse and Gentoo's bugtrackers.
> +https://bugzilla.opensuse.org/show_bug.cgi?id=1047422
> +https://bugs.gentoo.org/show_bug.cgi?id=623946
> +
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + paxtest.h | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/paxtest.h b/paxtest.h
> +index 8623bfb..a230c1a 100644
> +--- a/paxtest.h
> ++++ b/paxtest.h
> +@@ -5,13 +5,21 @@
> + #include <unistd.h>
> + 
> + /*
> +- * ARMv6 and ARMv7 do not like 64k alignment, 32k is ok
> ++ * ARMv4 through ARMv7 do not like 64k alignment, 32k is ok
> +  */
> +-#if defined(__arm__) && __ARM_ARCH >= 6 && __ARM_ARCH <= 7
> ++#if defined(__arm__) && __ARM_ARCH >= 4 && __ARM_ARCH <= 7

 >= 4 is always true, isn't it? I mean, ARMv3 has been dead for several decades, no?

> + #define PAGE_SIZE_MAX  (32768)
> + #else
> + #define PAGE_SIZE_MAX	0x10000	/* 64k should cover most arches */
> + #endif
> ++
> ++/*
> ++ * NIOS2's assemblier doesn't like 64k alignment
> ++ */
> ++#if defined(__nios2_arch__)
> ++#define PAGE_SIZE_MAX  (32768)
> ++#endif
> ++
> + #ifndef __aligned
> + #define __aligned(x)	__attribute__((aligned(x)))
> + #endif
> +-- 
> +1.9.1
> +
> diff --git a/package/paxtest/Config.in b/package/paxtest/Config.in
> new file mode 100644
> index 0000000..5782d46
> --- /dev/null
> +++ b/package/paxtest/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PAXTEST
> +	bool "paxtest"
> +	# No UCLIBC or MUSL because __NO_A_OUT_SUPPORT
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  PaX regression test suite
> +
> +	  http://pax.grsecurity.net/docs

 There should be a comment about the glibc requirement.

> diff --git a/package/paxtest/paxtest.hash b/package/paxtest/paxtest.hash
> new file mode 100644
> index 0000000..c10566c
> --- /dev/null
> +++ b/package/paxtest/paxtest.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	d553848431fd8c2ab6c8361b62e5cedfed1cc1d60088241f4a33d2af15dd667f	paxtest-0.9.15.tar.gz
> diff --git a/package/paxtest/paxtest.mk b/package/paxtest/paxtest.mk
> new file mode 100644
> index 0000000..fe88571
> --- /dev/null
> +++ b/package/paxtest/paxtest.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# paxtest
> +#
> +################################################################################
> +
> +PAXTEST_VERSION = 0.9.15
> +PAXTEST_SOURCE = paxtest-$(PAXTEST_VERSION).tar.gz

 This is the default and can be removed.

> +PAXTEST_SITE = https://www.grsecurity.net/~spender
> +PAXTEST_LICENSE = GPL-2.0+
> +PAXTEST_LICENSE_FILES = README
> +
> +# Not using TARGET_CONFIGURE_OPTS as this package needs to set it's own
> +# compile/link flags to do checks for things like if -fPIE is working, etc

 We typically do export TARGET_CONFIGURE_OPTS in the environment, which means
the Makefile settings take precedence. Doesn't this work for the paxtest Makefile?

> +
> +define PAXTEST_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC) LD=$(TARGET_LD) linux

 TARGET_CC may consist of multiple words, so you have to quote this.

 Does this package really use LD? That's usually annoying because it breaks
situations that require specific architecture options to build correctly. Can
you try if it works with LD=$(TARGET_CC) ?

> +endef
> +
> +define PAXTEST_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \

 Please use the same options as for building, i.e. include CC= and LD=, just in
case something still gets built at install time.

 Regards,
 Arnout

> +		BINDIR="usr/bin" \
> +		RUNDIR="usr/lib" -f Makefile.psm install
> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
