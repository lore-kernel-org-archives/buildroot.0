From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Jan 2013 10:07:33 +0100
Subject: [Buildroot] [PATCH] New package: cache-calibrator
In-Reply-To: <1359448315-22100-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Tue, 29 Jan 2013 09:31:55 +0100")
References: <1359448315-22100-1-git-send-email-sho@relinux.de>
Message-ID: <87wquwcq7e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> The Calibrator is a small C program that is supposed to analyze
 Stephan> a computers (cache-) memory system and extract the following
 Stephan> parameters:

Could you please clearly state (E.G. by naming it PATCHv2) that this
superseeds your early patch and note (under the --- line) what you have
changed for future submissions, thanks.

 Stephan>     number of cache levels
 Stephan>     for each cache level:
 Stephan>         its size
 Stephan>         its linesize
 Stephan>         its access/miss latency
 Stephan>     main memory access latency
 Stephan>     number of TLB levels
 Stephan>     for each TLB level:
 Stephan>         its capacity (i.e. number of entries)
 Stephan>         the pagesize used
 Stephan>         the TLB miss latency

 Stephan> http://homepages.cwi.nl/~manegold/Calibrator/

 Stephan> It is also recommended as a load generator for realtime testing in:

 Stephan> https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO#Benchmarking

 Stephan> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 Stephan> ---
 Stephan>  package/Config.in                                  |    1 +
 Stephan>  package/cache-calibrator/Config.in                 |   13 +++
 Stephan>  ...calibrator-Fix-conflicting-round-function.patch |  108 ++++++++++++++++++++
 Stephan>  package/cache-calibrator/cache-calibrator.mk       |   21 ++++
 Stephan>  4 files changed, 143 insertions(+), 0 deletions(-)
 Stephan>  create mode 100644 package/cache-calibrator/Config.in
 Stephan>  create mode 100644 package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch
 Stephan>  create mode 100644 package/cache-calibrator/cache-calibrator.mk

 Stephan> diff --git a/package/Config.in b/package/Config.in
 Stephan> index ebd9817..e6682fc 100644
 Stephan> --- a/package/Config.in
 Stephan> +++ b/package/Config.in
 Stephan> @@ -19,6 +19,7 @@ endmenu
 
 Stephan>  menu "Debugging, profiling and benchmark"
 Stephan>  source "package/bonnie/Config.in"
 Stephan> +source "package/cache-calibrator/Config.in"
 Stephan>  source "package/dhrystone/Config.in"
 Stephan>  source "package/dstat/Config.in"
 Stephan>  source "package/dmalloc/Config.in"
 Stephan> diff --git a/package/cache-calibrator/Config.in b/package/cache-calibrator/Config.in
 Stephan> new file mode 100644
 Stephan> index 0000000..6425cd0
 Stephan> --- /dev/null
 Stephan> +++ b/package/cache-calibrator/Config.in
 Stephan> @@ -0,0 +1,13 @@
 Stephan> +config BR2_PACKAGE_CACHE_CALIBRATOR
 Stephan> +	bool "cache-calibrator"
 Stephan> +	help
 Stephan> +	  Cache calibrator is a small C program that is
 Stephan> +	  supposed to analyze a computers (cache-) memory
 Stephan> +	  system and extract useful information
 Stephan> +
 Stephan> +	  http://homepages.cwi.nl/~manegold/Calibrator/
 Stephan> +
 Stephan> +	  It is also recommended as a load generator for
 Stephan> +	  realtime testing in:
 Stephan> +
 Stephan> +	  https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO
 Stephan> diff --git a/package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch b/package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch
 Stephan> new file mode 100644
 Stephan> index 0000000..71181a6
 Stephan> --- /dev/null
 Stephan> +++ b/package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch
 Stephan> @@ -0,0 +1,108 @@
 Stephan> +From 39ac7268c4350040976005da98daf10edf676d3e Mon Sep 17 00:00:00 2001
 Stephan> +From: Stephan Hoffmann <sho@relinux.de>
 Stephan> +Date: Mon, 28 Jan 2013 17:32:10 +0100
 Stephan> +Subject: [PATCH] Fix conflicting round() function
 Stephan> +
 Stephan> +calibrator.c defines a local round() function that conflicts
 Stephan> +with the one from the standard library.
 Stephan> +
 Stephan> +This is fixed by renaming the local function.
 Stephan> +
 Stephan> +Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 Stephan> +---
 Stephan> + calibrator.c |   30 +++++++++++++++---------------
 Stephan> + 1 files changed, 15 insertions(+), 15 deletions(-)
 Stephan> +
 Stephan> +diff --git a/calibrator.c b/calibrator.c
 Stephan> +index e045dfd..8471c04 100644
 Stephan> +--- a/calibrator.c
 Stephan> ++++ b/calibrator.c
 Stephan> +@@ -128,7 +128,7 @@ void ErrXit(char *format, ...) {
 Stephan> + 	exit(1);
 Stephan> + }
 Stephan> + 
 Stephan> +-lng round(dbl x)
 Stephan> ++lng lng_round(dbl x)
 Stephan> + {
 Stephan> + 	return (lng)(x + 0.5);
 Stephan> + }
 Stephan> +@@ -890,16 +890,16 @@ void plotCache(cacheInfo *cache, lng **result, lng MHz, char *fn, FILE *fp, lng
 Stephan> + 	fprintf(fp, ")\n");
 Stephan> + 	fprintf(fp, "set y2tics");
 Stephan> + 	for (l = 0, s = " ("; l <= cache->levels; l++, s = ", ") {
 Stephan> +-		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(cache->latency1[l] - delay)), NSperIt(cache->latency1[l] - delay));
 Stephan> +-			else	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(cache->latency2[l] - delay)), NSperIt(cache->latency2[l] - delay));
 Stephan> ++		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(cache->latency1[l] - delay)), NSperIt(cache->latency1[l] - delay));
 Stephan> ++			else	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(cache->latency2[l] - delay)), NSperIt(cache->latency2[l] - delay));
 Stephan> + 	}
 Stephan> + 	for (y = 1; y <= yh; y *= 10) {
 Stephan> + 		fprintf(fp, "%s'%1.3g' %ld", s, (dbl)(y * MHz) / 1000.0, y);
 Stephan> + 	}
 Stephan> + 	fprintf(fp, ")\n");
 Stephan> + 	for (l = 0; l <= cache->levels; l++) {
 Stephan> +-		if (!delay)	z = (dbl)round(CYperIt(cache->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> +-			else	z = (dbl)round(CYperIt(cache->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> ++		if (!delay)	z = (dbl)lng_round(CYperIt(cache->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> ++			else	z = (dbl)lng_round(CYperIt(cache->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> + 		fprintf(fp, "set label %ld '(%1.3g)  ' at %f,%f right\n", l + 1, z, xl, z);
 Stephan> + 		fprintf(fp, "set arrow %ld from %f,%f to %f,%f nohead lt 0\n", l + 1, xl, z, xh, z);
 Stephan> + 	}
 Stephan> +@@ -986,16 +986,16 @@ void plotTLB(TLBinfo *TLB, lng **result, lng MHz, char *fn, FILE *fp, lng delay)
 Stephan> + 	fprintf(fp, "%s'<L1>' %ld)\n", s, TLB->mincachelines);
 Stephan> + 	fprintf(fp, "set y2tics");
 Stephan> + 	for (l = 0, s = " ("; l <= TLB->levels; l++, s = ", ") {
 Stephan> +-		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(TLB->latency1[l] - delay)), NSperIt(TLB->latency1[l] - delay));
 Stephan> +-			else	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(TLB->latency2[l] - delay)), NSperIt(TLB->latency2[l] - delay));
 Stephan> ++		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(TLB->latency1[l] - delay)), NSperIt(TLB->latency1[l] - delay));
 Stephan> ++			else	fprintf(fp, "%s'(%ld)' %f", s, lng_round(CYperIt(TLB->latency2[l] - delay)), NSperIt(TLB->latency2[l] - delay));
 Stephan> + 	}
 Stephan> + 	for (y = 1; y <= yh; y *= 10) {
 Stephan> + 		fprintf(fp, "%s'%1.3g' %ld", s, (dbl)(y * MHz) / 1000.0, y);
 Stephan> + 	}
 Stephan> + 	fprintf(fp, ")\n");
 Stephan> + 	for (l = 0; l <= TLB->levels; l++) {
 Stephan> +-		if (!delay)	z = (dbl)round(CYperIt(TLB->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> +-			else	z = (dbl)round(CYperIt(TLB->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> ++		if (!delay)	z = (dbl)lng_round(CYperIt(TLB->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> ++			else	z = (dbl)lng_round(CYperIt(TLB->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
 Stephan> + 		fprintf(fp, "set label %ld '(%1.3g)  ' at %f,%f right\n", l + 1, z, xl, z);
 Stephan> + 		fprintf(fp, "set arrow %ld from %f,%f to %f,%f nohead lt 0\n", l + 1, xl, z, xh, z);
 Stephan> + 	}
 Stephan> +@@ -1023,9 +1023,9 @@ void printCPU(cacheInfo *cache, lng MHz, lng delay)
 Stephan> + 	FILE	*fp = stdout;
 Stephan> + 		
 Stephan> + 	fprintf(fp, "CPU loop + L1 access:    ");
 Stephan> +-	fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[0]), round(CYperIt(cache->latency1[0])));
 Stephan> ++	fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[0]), lng_round(CYperIt(cache->latency1[0])));
 Stephan> + 	fprintf(fp, "             ( delay:    ");
 Stephan> +-	fprintf(fp, " %6.2f ns = %3ld cy )\n", NSperIt(delay),            round(CYperIt(delay)));
 Stephan> ++	fprintf(fp, " %6.2f ns = %3ld cy )\n", NSperIt(delay),            lng_round(CYperIt(delay)));
 Stephan> + 	fprintf(fp, "\n");
 Stephan> + 	fflush(fp);
 Stephan> + }
 Stephan> +@@ -1047,8 +1047,8 @@ void printCache(cacheInfo *cache, lng MHz)
 Stephan> + 			fprintf(fp, " %3ld KB ", cache->size[l] / 1024);
 Stephan> + 		}
 Stephan> + 		fprintf(fp, " %3ld bytes ", cache->linesize[l + 1]);
 Stephan> +-		fprintf(fp, " %6.2f ns = %3ld cy " , NSperIt(cache->latency2[l + 1] - cache->latency2[l]), round(CYperIt(cache->latency2[l + 1] - cache->latency2[l])));
 Stephan> +-		fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[l + 1] - cache->latency1[l]), round(CYperIt(cache->latency1[l + 1] - cache->latency1[l])));
 Stephan> ++		fprintf(fp, " %6.2f ns = %3ld cy " , NSperIt(cache->latency2[l + 1] - cache->latency2[l]), lng_round(CYperIt(cache->latency2[l + 1] - cache->latency2[l])));
 Stephan> ++		fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[l + 1] - cache->latency1[l]), lng_round(CYperIt(cache->latency1[l + 1] - cache->latency1[l])));
 Stephan> + 	}
 Stephan> + 	fprintf(fp, "\n");
 Stephan> + 	fflush(fp);
 Stephan> +@@ -1075,9 +1075,9 @@ void printTLB(TLBinfo *TLB, lng MHz)
 Stephan> + 		} else {
 Stephan> + 			fprintf(fp, "  %3ld KB  ", TLB->pagesize[l + 1] / 1024);
 Stephan> + 		}
 Stephan> +-		fprintf(fp, " %6.2f ns = %3ld cy ", NSperIt(TLB->latency2[l + 1] - TLB->latency2[l]), round(CYperIt(TLB->latency2[l + 1] - TLB->latency2[l])));
 Stephan> ++		fprintf(fp, " %6.2f ns = %3ld cy ", NSperIt(TLB->latency2[l + 1] - TLB->latency2[l]), lng_round(CYperIt(TLB->latency2[l + 1] - TLB->latency2[l])));
 Stephan> + /*
 Stephan> +-		fprintf(fp, " %6.2f ns = %3ld cy" , NSperIt(TLB->latency1[l + 1] - TLB->latency1[l]), round(CYperIt(TLB->latency1[l + 1] - TLB->latency1[l])));
 Stephan> ++		fprintf(fp, " %6.2f ns = %3ld cy" , NSperIt(TLB->latency1[l + 1] - TLB->latency1[l]), lng_round(CYperIt(TLB->latency1[l + 1] - TLB->latency1[l])));
 Stephan> + */
 Stephan> + 		fprintf(fp, "\n");
 Stephan> + 	}
 Stephan> +-- 
 Stephan> +1.7.0.4
 Stephan> +
 Stephan> diff --git a/package/cache-calibrator/cache-calibrator.mk b/package/cache-calibrator/cache-calibrator.mk
 Stephan> new file mode 100644
 Stephan> index 0000000..8abc647
 Stephan> --- /dev/null
 Stephan> +++ b/package/cache-calibrator/cache-calibrator.mk
 Stephan> @@ -0,0 +1,21 @@
 Stephan> +#############################################################
 Stephan> +#
 Stephan> +# cache-calibrator
 Stephan> +#
 Stephan> +#############################################################
 Stephan> +
 Stephan> +CACHE_CALIBRATOR_SOURCE = calibrator.c
 Stephan> +CACHE_CALIBRATOR_SITE = http://homepages.cwi.nl/~manegold/Calibrator/src
 Stephan> +CACHE_CALIBRATOR_EXTRACT_CMDS = cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(D)

Please use the normal define CACHE_CLIBRATOR_.. syntax. Have a look at
package/devmem2 for an example.

-- 
Bye, Peter Korsgaard
