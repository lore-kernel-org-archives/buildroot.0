From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 10:41:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/aespipe: fix host compile
In-Reply-To: <20170703084107.5620-1-arnout@mind.be>
References: <20170703084107.5620-1-arnout@mind.be>
Message-ID: <20170703084107.5620-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Building host-aespipe fails on Debian stretch at linking stage:

/usr/bin/gcc -L/home/buildroot/br6/output/host/lib -L/home/buildroot/br6/output/host/usr/lib -Wl,-rpath,/home/buildroot/br6/output/host/usr/lib -o aespipe aespipe.o aes-amd64.o md5-amd64.o md5-2x-amd64.o aes-intel64.o sha512.o rmd160.o
/usr/bin/ld: aes-amd64.o: relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC

The same problem apparently exists on recent Ubuntu and Gentoo.

Fix is also used in Debian:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837393

[Peter: add comment explaining why]
[Arnout: use host-cc-option to discover if -no-pie is available;
 cfr. 57b628a932b9b4a3c4bf80f4c82a81da5adcb173]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/aespipe/aespipe.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 6a38556ef1..5ef95d5206 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -9,5 +9,15 @@ AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
+# Recent Debian, Gentoo and Ubuntu enable -fPIE by default, breaking the build:
+# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837393
+# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835148
+# Older gcc versions however don't support the -no-pie flag, so we have to
+# check its availability.
+HOST_AESPIPE_NO_PIE_FLAG = $(call host-cc-option,-no-pie)
+HOST_AESPIPE_CONF_ENV = \
+	CFLAGS="$(HOST_CFLAGS) $(HOST_AESPIPE_NO_PIE_FLAG)" \
+	LDFLAGS="$(HOST_LDFLAGS) $(HOST_AESPIPE_NO_PIE_FLAG)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.13.2
