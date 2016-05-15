From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 15 May 2016 22:38:26 +0200
Subject: [Buildroot] [PATCH v1] uclibc: enable debug build option
In-Reply-To: <20160515215950.1e41e583@free-electrons.com>
References: <1463077504-3646-1-git-send-email-ps.report@gmx.net>
 <20160515215950.1e41e583@free-electrons.com>
Message-ID: <20160515223826.39e5ada6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 15 May 2016 21:59:50 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Thu, 12 May 2016 20:25:04 +0200, Peter Seiderer wrote:
> 
> >  #
> > +# Debug
> > +#
> > +ifeq ($(BR2_ENABLE_DEBUG),y)
> > +define UCLIBC_DEBUG_CONFIG
> > +	$(call KCONFIG_ENABLE_OPT,DODEBUG=y,$(@D)/.config)
> 
> Has this patch really been tested? Inded, I think this line should be:
> 
> 	$(call KCONFIG_ENABLE_OPT,DODEBUG,$(@D)/.config)
> 
> Indeed, setting =y is done by KCONFIG_ENABLE_OPT.
> 

Yes, seems to work including the typo:

$ diff -u uclibc-1.0.14-config-orig build/uclibc-1.0.14/.config
--- uclibc-1.0.14-config-orig   2016-05-12 20:09:24.612415956 +0200
+++ build/uclibc-1.0.14/.config 2016-05-15 22:20:47.504628970 +0200
@@ -237,13 +237,12 @@
 #
 CROSS_COMPILER_PREFIX="/home/seiderer/Work/zeiss/freescale-imx6/build_rpi_010/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-"
 UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DOSTRIP is not set
+DODEBUG=y
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
 # UCLIBC_MALLOC_DEBUGGING is not set
 # UCLIBC_HAS_BACKTRACE is not set
 WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
+EXTRA_WARNINGS=y
 # DOMULTI is not set

Will send an updated patch with the typo fixed immediately...

> It is worth mentioning that we used to do exactly this (setting
> DODEBUG=y when BR2_ENABLE_DEBUG=y), but removed that in commit
> 70b7079d3797304fe3c9ba2941d3f446af3cea79in December 2013 because
> DODEBUG=y was breaking the build. But since then, uClibc has been
> replaced by uClibc-ng and I guess Waldemar has fixed DODEBUG=y.
> 
> Peter, did you do a test build on ARM, to verify that you're not
> falling into the issue mentioned in commit
> 70b7079d3797304fe3c9ba2941d3f446af3cea79 ?
> 

Was not aware of the history, but I did compile test the patch with
raspberrypi3_defconfig and additional BR2_ENABLE_DEBUG=y
 
> In any case, please resend an updated version with the =y removed. I
> normally do such minor fixups myself when applying, but in this case, I
> really want to be sure that you have done a test build.
> 

Thanks for spotting the typo, updated patch follows...

Regards,
Peter

> Thanks!
> 
> Thomas
