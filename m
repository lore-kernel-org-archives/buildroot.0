From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Dec 2016 09:19:24 +0100
Subject: [Buildroot] [git commit] package/aespipe: fix host compile
Message-ID: <20161217081950.71FC88188E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb33a7d6bd89306635749b497cd004e986bcd7e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building host-aespipe fails on

$ cat /etc/debian_version
stretch/sid

at linking stage:

/usr/bin/gcc -L/home/buildroot/br6/output/host/lib -L/home/buildroot/br6/output/host/usr/lib -Wl,-rpath,/home/buildroot/br6/output/host/usr/lib -o aespipe aespipe.o aes-amd64.o md5-amd64.o md5-2x-amd64.o aes-intel64.o sha512.o rmd160.o
/usr/bin/ld: aes-amd64.o: relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC

Fix is also used in Debian:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837393

[Peter: add comment explaining why]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aespipe/aespipe.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 6a38556..8c7cd21 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -9,5 +9,12 @@ AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
+# Debian enables -fPIE by default, breaking the build:
+# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837393
+# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835148
+HOST_AESPIPE_CONF_ENV = \
+	CFLAGS="$(HOST_CFLAGS) -no-pie" \
+	LDFLAGS="$(HOST_LDFLAGS) -no-pie"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
