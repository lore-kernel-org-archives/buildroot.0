From: WK <sdrb@onet.eu>
Date: Fri, 4 Jan 2019 11:38:01 +0100
Subject: [Buildroot] Generation of locales
Message-ID: <a7f64d7d-6e93-3d7b-e1d0-ab77dde72e11@onet.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I noticed that compiling buildroot a few times without "make clean" the 
size of locale-archive file in $(TARGET_DIR)/usr/lib/locale is increasing.

The strange thing is that it occures about three times and then it stops 
increasing.


My solution for this issue is following:

--- Makefile	2019-01-04 10:03:37.136971246 +0100
+++ Makefile	2019-01-04 10:39:15.298119675 +0100
@@ -647,6 +647,7 @@ PACKAGES += host-localedef

  define GENERATE_GLIBC_LOCALES
  	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
+	$(Q)rm -f $(TARGET_DIR)/usr/lib/locale/locale-archive
  	$(Q)for locale in $(GLIBC_GENERATE_LOCALES) ; do \
  		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
  		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \



Is that patch proper as a fix for this problem? Or maybe there is better 
solution?


Kind Regards,
Witold Kowolik
