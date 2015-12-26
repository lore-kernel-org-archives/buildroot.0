From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 16:42:10 +0100
Subject: [Buildroot] [PATCH] toolchain-external: CodeSourcery PowerPC:
 Revert the removal of CS PowerPC 2011.03
In-Reply-To: <1451131225-9384-1-git-send-email-romain.naour@gmail.com>
References: <1451131225-9384-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20151226164210.2a30c04f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, 26 Dec 2015 13:00:25 +0100, Romain Naour wrote:

> Also re-add the old CS toolchain handling for pixman and liquid-dsp.

This part is not good. With your change, the "fixes" on pixman and
liquid-dsp are now also applied when using the SPE-capable 2012.03
toolchain, while in the past they were only used for the non-SPE
capable 2010.xx and 2011.xx toolchains:

-# Altivec detection isn't reliable for CS toolchains
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103)$(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
-PIXMAN_CONF_OPTS += --disable-vmx
-endif

 config BR2_PACKAGE_LIQUID_DSP
        bool "liquid-dsp"
        depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
        depends on !BR2_STATIC_LIBS
-       # These result in internal compiler error
-       depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
-       depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
        help
          Liquid-DSP is a free and open-source signal processing
          library for software-defined radios written in C.  Its

So either we need to have two Config.in symbols:
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC and
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_SPE, or you need to adjust
the fixes to test that SPE is not set, like:

-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC):$(BR2_POWERPC_CPU_HAS_SPE),y:)
-PIXMAN_CONF_OPTS += --disable-vmx
-endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
