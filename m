From: Paugam Luc <luc.paugam@thomson.net>
Date: Fri, 24 Nov 2006 17:37:22 +0100
Subject: [Buildroot] problem with absolute paths to tools in ccache
Message-ID: <E55CA8ECFBA85E4CB8E8173566B9EFEB375E45@rennsmail04.eu.thmulti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I mentioned to the list the same problem 1 month ago.
Here is the patch I use for building the toochain from builroot:

--- buildroot.orig/toolchain/ccache/ccache.mk	2006-06-26 07:15:03.000000000 +0000
+++ buildroot/toolchain/ccache/ccache.mk	2006-07-17 16:34:58.000000000 +0000
@@ -24,10 +24,6 @@
 	# Should probably patch things to use a relative path.
 	$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/bin-ccache\",g" \
 		$(CCACHE_DIR1)/execute.c
-	# WARNING - this will break if the toolchain build dir is deleted.
-	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(CCACHE_DIR1)/cache\",g" \
-		$(CCACHE_DIR1)/ccache.c
-	mkdir -p $(CCACHE_DIR1)/cache
 	touch $(CCACHE_DIR1)/.patched
 
 $(CCACHE_DIR1)/.configured: $(CCACHE_DIR1)/.patched

Avoid hardcode path, and use .ccache directory from a user account instead.

Regards - Luc

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Real.Magic at gmx.de
Sent: vendredi 24 novembre 2006 11:53
To: buildroot at uclibc.org
Subject: [Buildroot] problem with absolute paths to tools in ccache


Hello all!

I have got a problem because ccache is using absolute paths to the ccache working directory and to the tools like gcc.

To prevent ccache from using an absolute path to the ccache working directory, I have applied the following patch successfully:

http://www.busybox.net/lists/buildroot/2006-October/000355.html

 
But how can I prevent ccache from using absolute paths to tools like gcc?


Kind regards,

Matthias


--
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal f?r Modem und ISDN: http://www.gmx.net/de/go/smartsurfer
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
