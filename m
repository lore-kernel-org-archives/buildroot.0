From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 29 Jan 2013 10:21:45 +0100
Subject: [Buildroot] [PATCH] New package: cache-calibrator
In-Reply-To: <1359450921-22549-1-git-send-email-sho@relinux.de>
References: <1359448315-22100-1-git-send-email-sho@relinux.de>
 <1359450921-22549-1-git-send-email-sho@relinux.de>
Message-ID: <510794A9.7090608@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I tried to add a PATCHv3 to the header using "git send-email
--subject-prefix PATCHv3", but this obviously did not work. Does anybody
have an idea why?

Kind regards

Stephan

Am 29.01.2013 10:15, schrieb Stephan Hoffmann:
> The Calibrator is a small C program that is supposed to analyze
> a computers (cache-) memory system and extract the following
> parameters:
>
>     number of cache levels
>     for each cache level:
>         its size
>         its linesize
>         its access/miss latency
>     main memory access latency
>     number of TLB levels
>     for each TLB level:
>         its capacity (i.e. number of entries)
>         the pagesize used
>         the TLB miss latency
>
> http://homepages.cwi.nl/~manegold/Calibrator/
>
> It is also recommended as a load generator for realtime testing in:
>
> https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO#Benchmarking
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
> v2: Review by Arnout Vandecappelle
> 	Fix License
> 	Use $(TARGET_CFLAGS) and $(TARGET_LDFLAGS)
> 	Fix Typo
> 	Remove $(CACHE_CALIBRATOR_DIR) 
> v3: Review by Thomas Petazzoni
> 	Fix CACHE_CALIBRATOR_EXTRACT_CMDS
>
>  package/Config.in                                  |    1 +
>  package/cache-calibrator/Config.in                 |   13 +++
>  ...calibrator-Fix-conflicting-round-function.patch |  108 ++++++++++++++++++++
>  package/cache-calibrator/cache-calibrator.mk       |   24 +++++
>  4 files changed, 146 insertions(+), 0 deletions(-)
>  create mode 100644 package/cache-calibrator/Config.in
>  create mode 100644 package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch
>  create mode 100644 package/cache-calibrator/cache-calibrator.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ebd9817..e6682fc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -19,6 +19,7 @@ endmenu
>  
>  menu "Debugging, profiling and benchmark"
>  source "package/bonnie/Config.in"
> +source "package/cache-calibrator/Config.in"
>  source "package/dhrystone/Config.in"
>  source "package/dstat/Config.in"
>  source "package/dmalloc/Config.in"
> diff --git a/package/cache-calibrator/Config.in b/package/cache-calibrator/Config.in
> new file mode 100644
> index 0000000..6425cd0
> --- /dev/null
> +++ b/package/cache-calibrator/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_CACHE_CALIBRATOR
> +	bool "cache-calibrator"
> +	help
> +	  Cache calibrator is a small C program that is
> +	  supposed to analyze a computers (cache-) memory
> +	  system and extract useful information
> +
> +	  http://homepages.cwi.nl/~manegold/Calibrator/
> +
> +	  It is also recommended as a load generator for
> +	  realtime testing in:
> +
> +	  https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO
> diff --git a/package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch b/package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch
> new file mode 100644
> index 0000000..71181a6
> --- /dev/null
> +++ b/package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch
> @@ -0,0 +1,108 @@
> +From 39ac7268c4350040976005da98daf10edf676d3e Mon Sep 17 00:00:00 2001
> +From: Stephan Hoffmann <sho@relinux.de>
> +Date: Mon, 28 Jan 2013 17:32:10 +0100
> +Subject: [PATCH] Fix conflicting round() function
> +
> +calibrator.c defines a local round() function that conflicts
> +with the one from the standard library.
> +
> +This is fixed by renaming the local function.
> +
> +Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> +---
> + calibrator.c |   30 +++++++++++++++---------------
> + 1 files changed, 15 insertions(+), 15 deletions(-)
> +
> +diff --git a/calibrator.c b/calibrator.c
> +index e045dfd..8471c04 100644
> +--- a/calibrator.c
> ++++ b/calibrator.c
> +@@ -128,7 +128,7 @@ void ErrXit(char *format, ...) {
> + 	exit(1);
> + }
> + 
> +-lng round(dbl x)
> ++lng lng_round(dbl x)
> + {
> + 	return (lng)(x + 0.5);
> + }
> +@@ -890,16 +890,16 @@ void plotCache(cacheInfo *cache, lng **result, lng MHz, char *fn, FILE *fp, lng
> + 	fprintf(fp, ")\n");
> + 	fprintf(fp, "set y2tics");
> + 	for (l = 0, s = " ("; l <= cache->levels; l++, s = ", ") {
> +-		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(cache->latency1[l] - delay)), NSperIt(cache->latency1[l] - delay));
> +-			else	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(cache->latency2[l] - delay)), NSperIt(cache->latency2[l] - delay));
> ++		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(cache->latency1[l] - delay)), NSperIt(cache->latency1[l] - delay));
> ++			else	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(cache->latency2[l] - delay)), NSperIt(cache->latency2[l] - delay));
> + 	}
> + 	for (y = 1; y <= yh; y *= 10) {
> + 		fprintf(fp, "%s'%1.3g' %ld", s, (dbl)(y * MHz) / 1000.0, y);
> + 	}
> + 	fprintf(fp, ")\n");
> + 	for (l = 0; l <= cache->levels; l++) {
> +-		if (!delay)	z = (dbl)round(CYperIt(cache->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
> +-			else	z = (dbl)round(CYperIt(cache->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
> ++		if (!delay)	z = (dbl)lng_round(CYperIt(cache->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
> ++			else	z = (dbl)lng_round(CYperIt(cache->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
> + 		fprintf(fp, "set label %ld '(%1.3g)  ' at %f,%f right\n", l + 1, z, xl, z);
> + 		fprintf(fp, "set arrow %ld from %f,%f to %f,%f nohead lt 0\n", l + 1, xl, z, xh, z);
> + 	}
> +@@ -986,16 +986,16 @@ void plotTLB(TLBinfo *TLB, lng **result, lng MHz, char *fn, FILE *fp, lng delay)
> + 	fprintf(fp, "%s'<L1>' %ld)\n", s, TLB->mincachelines);
> + 	fprintf(fp, "set y2tics");
> + 	for (l = 0, s = " ("; l <= TLB->levels; l++, s = ", ") {
> +-		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(TLB->latency1[l] - delay)), NSperIt(TLB->latency1[l] - delay));
> +-			else	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(TLB->latency2[l] - delay)), NSperIt(TLB->latency2[l] - delay));
> ++		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(TLB->latency1[l] - delay)), NSperIt(TLB->latency1[l] - delay));
> ++			else	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(TLB->latency2[l] - delay)), NSperIt(TLB->latency2[l] - delay));
> + 	}
> + 	for (y = 1; y <= yh; y *= 10) {
> + 		fprintf(fp, "%s'%1.3g' %ld", s, (dbl)(y * MHz) / 1000.0, y);
> + 	}
> + 	fprintf(fp, ")\n");
> + 	for (l = 0; l <= TLB->levels; l++) {
> +-		if (!delay)	z = (dbl)round(CYperIt(TLB->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
> +-			else	z = (dbl)round(CYperIt(TLB->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
> ++		if (!delay)	z = (dbl)lng_round(CYperIt(TLB->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
> ++			else	z = (dbl)lng_round(CYperIt(TLB->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
> + 		fprintf(fp, "set label %ld '(%1.3g)  ' at %f,%f right\n", l + 1, z, xl, z);
> + 		fprintf(fp, "set arrow %ld from %f,%f to %f,%f nohead lt 0\n", l + 1, xl, z, xh, z);
> + 	}
> +@@ -1023,9 +1023,9 @@ void printCPU(cacheInfo *cache, lng MHz, lng delay)
> + 	FILE	*fp = stdout;
> + 		
> + 	fprintf(fp, "CPU loop + L1 access:    ");
> +-	fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[0]), round(CYperIt(cache->latency1[0])));
> ++	fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[0]), lng_round(CYperIt(cache->latency1[0])));
> + 	fprintf(fp, "             ( delay:    ");
> +-	fprintf(fp, " %6.2f ns = %3ld cy )\n", NSperIt(delay),            round(CYperIt(delay)));
> ++	fprintf(fp, " %6.2f ns = %3ld cy )\n", NSperIt(delay),            lng_round(CYperIt(delay)));
> + 	fprintf(fp, "\n");
> + 	fflush(fp);
> + }
> +@@ -1047,8 +1047,8 @@ void printCache(cacheInfo *cache, lng MHz)
> + 			fprintf(fp, " %3ld KB ", cache->size[l] / 1024);
> + 		}
> + 		fprintf(fp, " %3ld bytes ", cache->linesize[l + 1]);
> +-		fprintf(fp, " %6.2f ns = %3ld cy " , NSperIt(cache->latency2[l + 1] - cache->latency2[l]), round(CYperIt(cache->latency2[l + 1] - cache->latency2[l])));
> +-		fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[l + 1] - cache->latency1[l]), round(CYperIt(cache->latency1[l + 1] - cache->latency1[l])));
> ++		fprintf(fp, " %6.2f ns = %3ld cy " , NSperIt(cache->latency2[l + 1] - cache->latency2[l]), lng_round(CYperIt(cache->latency2[l + 1] - cache->latency2[l])));
> ++		fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[l + 1] - cache->latency1[l]), lng_round(CYperIt(cache->latency1[l + 1] - cache->latency1[l])));
> + 	}
> + 	fprintf(fp, "\n");
> + 	fflush(fp);
> +@@ -1075,9 +1075,9 @@ void printTLB(TLBinfo *TLB, lng MHz)
> + 		} else {
> + 			fprintf(fp, "  %3ld KB  ", TLB->pagesize[l + 1] / 1024);
> + 		}
> +-		fprintf(fp, " %6.2f ns = %3ld cy ", NSperIt(TLB->latency2[l + 1] - TLB->latency2[l]), round(CYperIt(TLB->latency2[l + 1] - TLB->latency2[l])));
> ++		fprintf(fp, " %6.2f ns = %3ld cy ", NSperIt(TLB->latency2[l + 1] - TLB->latency2[l]), lng_round(CYperIt(TLB->latency2[l + 1] - TLB->latency2[l])));
> + /*
> +-		fprintf(fp, " %6.2f ns = %3ld cy" , NSperIt(TLB->latency1[l + 1] - TLB->latency1[l]), round(CYperIt(TLB->latency1[l + 1] - TLB->latency1[l])));
> ++		fprintf(fp, " %6.2f ns = %3ld cy" , NSperIt(TLB->latency1[l + 1] - TLB->latency1[l]), lng_round(CYperIt(TLB->latency1[l + 1] - TLB->latency1[l])));
> + */
> + 		fprintf(fp, "\n");
> + 	}
> +-- 
> +1.7.0.4
> +
> diff --git a/package/cache-calibrator/cache-calibrator.mk b/package/cache-calibrator/cache-calibrator.mk
> new file mode 100644
> index 0000000..a36bb8a
> --- /dev/null
> +++ b/package/cache-calibrator/cache-calibrator.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# cache-calibrator
> +#
> +#############################################################
> +
> +CACHE_CALIBRATOR_SOURCE = calibrator.c
> +CACHE_CALIBRATOR_SITE = http://homepages.cwi.nl/~manegold/Calibrator/src
> +CACHE_CALIBRATOR_LICENSE = Cache calibrator license
> +CACHE_CALIBRATOR_LICENSE_FILES = calibrator.c
> +
> +define CACHE_CALIBRATOR_EXTRACT_CMDS
> +	cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(D)
> +endef
> +
> +define CACHE_CALIBRATOR_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/calibrator.c -o $(@D)/cache_calibrator -lm
> +endef
> +
> +define CACHE_CALIBRATOR_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/cache_calibrator $(TARGET_DIR)/usr/bin/cache_calibrator
> +endef
> +
> +$(eval $(generic-package))


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
