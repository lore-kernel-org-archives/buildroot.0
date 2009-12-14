From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Dec 2009 10:49:20 +0100
Subject: [Buildroot] [PATCH] mtd-utils: bump version number
In-Reply-To: <1260575725-7764-1-git-send-email-daniel@caiaq.de> (Daniel Mack's
	message of "Sat, 12 Dec 2009 07:55:25 +0800")
References: <1260575109-7459-1-git-send-email-daniel@caiaq.de>
	<1260575725-7764-1-git-send-email-daniel@caiaq.de>
Message-ID: <87ljh5sx5r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> The upstream git commit used by mtd.mk is not valid anymore,
 Daniel> for unclear reasons. Use the current HEAD as new anchor.

Hmm, it works here:

wget --passive-ftp -nd   -O /var/lib/downloads/mtd-utils-fcb52ccc99679460640386c297023f852b108f68.tar.gz "http://git.infradead.org/mtd-utils.git?a=snapshot;h=fcb52ccc99679460640386c297023f852b108f68;sf=tgz"
--2009-12-14 10:35:29--  http://git.infradead.org/mtd-utils.git?a=snapshot;h=fcb52ccc99679460640386c297023f852b108f68;sf=tgz
Resolving git.infradead.org... 18.85.46.34, 2001:4830:2446:ff00:214:51ff:fe65:c65c

ls -lah mtd-utils-fcb52ccc99679460640386c297023f852b108f68.tar.gz
-rw-r--r-- 1 peko peko 323K 2009-12-14 10:35 mtd-utils-fcb52ccc99679460640386c297023f852b108f68.tar.gz

But the directory name has indeed changed.

 Daniel>  #############################################################
 Daniel> -MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
 Daniel> +MTD_VERSION:=a4e502d99129da8ebba6d40b373a4422a175e9af
 Daniel>  MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 Daniel>  MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 Daniel>  MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd-utils-$(MTD_VERSION)
 Daniel>  MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
 Daniel>  MTD_CAT:=$(ZCAT)
 Daniel> -MTD_NAME:=mtd-utils
 Daniel> +MTD_NAME:=mtd-utils-a4e502d

It would be nice if the shortname could be computed from MTD_VERSION so
things don't break when someone goes and changes the git id. GNU make
unfortunately doesn't have a substring function, so the easiest solution
is probably cut, E.G.:

 diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
index b7e584e..db40f54 100644
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ b/package/mtd/mtd-utils.git/mtd.mk
@@ -4,12 +4,13 @@
 #
 #############################################################
 MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_SHORT_VERSION=$(shell echo $(MTD_VERSION)|cut -c -7)
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=
 MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_CAT:=$(ZCAT)
-MTD_NAME:=mtd-utils
+MTD_NAME:=mtd-utils-$(MTD_SHORT_VERSION)
 
 #############################################################
 #

-- 
Bye, Peter Korsgaard
