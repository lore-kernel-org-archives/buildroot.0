From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 00:03:09 +0100
Subject: [Buildroot] [PATCH 1/4] vpnc: switch to github as the new site
In-Reply-To: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1455145392-2355-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The vpnc upstream project has not made any tarball release since many
years, but they have continued to update their Subversion
repository.

A Github repository synced with the Subversion repository now exists
at https://github.com/ndpgroup/vpnc, which is more practical to
generate patches and submit pull requests. For this reason, we move to
using this Github repository as the new source for the vpnc
package. The specific commit that we use corresponds to version 0.5.3
exactly.

All patches are re-formatted using Git.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...le-cleanup-and-fix-the-VERSION-definitio.patch} | 24 +++++++++++-----
 package/vpnc/0002-Don-t-build-manpages.patch       | 31 +++++++++++++++++++++
 package/vpnc/0002-nomanual.patch                   | 15 ----------
 ...recated-SUSv3-functions-with-POSIX-equiva.patch | 32 ++++++++++++++++++++++
 package/vpnc/0003-susv3-legacy.patch               | 12 --------
 package/vpnc/vpnc.hash                             |  2 +-
 package/vpnc/vpnc.mk                               |  4 +--
 7 files changed, 83 insertions(+), 37 deletions(-)
 rename package/vpnc/{0001-fix-build.patch => 0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch} (78%)
 create mode 100644 package/vpnc/0002-Don-t-build-manpages.patch
 delete mode 100644 package/vpnc/0002-nomanual.patch
 create mode 100644 package/vpnc/0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch
 delete mode 100644 package/vpnc/0003-susv3-legacy.patch

diff --git a/package/vpnc/0001-fix-build.patch b/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
similarity index 78%
rename from package/vpnc/0001-fix-build.patch
rename to package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
index e21348b..d091dde 100644
--- a/package/vpnc/0001-fix-build.patch
+++ b/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
@@ -1,14 +1,21 @@
-Misc. Makefile cleanup and fix the VERSION definition.
+From fd7e584bd28bd541464f8cb6cc72e76de2347640 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 8 Feb 2016 23:02:45 +0100
+Subject: [PATCH] Misc. Makefile cleanup and fix the VERSION definition.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
-diff -purN vpnc-0.5.3.orig/Makefile vpnc-0.5.3/Makefile
---- vpnc-0.5.3.orig/Makefile	2012-08-06 00:03:22.677914146 +0200
-+++ vpnc-0.5.3/Makefile	2012-08-06 00:06:58.506744901 +0200
+ Makefile | 40 +++++++++++++++++++---------------------
+ 1 file changed, 19 insertions(+), 21 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9b96d83..1ca6459 100644
+--- a/Makefile
++++ b/Makefile
 @@ -19,21 +19,19 @@
  #
- # $Id: Makefile 312 2008-06-15 18:09:42Z Joerg Mayer $
+ # $Id$
  
 -DESTDIR=
 -PREFIX=/usr/local
@@ -60,7 +67,7 @@ diff -purN vpnc-0.5.3.orig/Makefile vpnc-0.5.3/Makefile
  
  ifeq ($(shell uname -s), SunOS)
  LDFLAGS += -lnsl -lresolv -lsocket
-@@ -84,7 +82,7 @@ cisco-decrypt : cisco-decrypt.o decrypt-
+@@ -81,7 +79,7 @@ cisco-decrypt : cisco-decrypt.o decrypt-utils.o
  	$(CC) -o $@ $^ $(LDFLAGS)
  
  .depend: $(SRCS) $(BINSRCS)
@@ -69,3 +76,6 @@ diff -purN vpnc-0.5.3.orig/Makefile vpnc-0.5.3/Makefile
  
  vpnc-debug.c vpnc-debug.h : isakmp.h enum2debug.pl
  	LC_ALL=C perl -w ./enum2debug.pl isakmp.h >vpnc-debug.c 2>vpnc-debug.h
+-- 
+2.6.4
+
diff --git a/package/vpnc/0002-Don-t-build-manpages.patch b/package/vpnc/0002-Don-t-build-manpages.patch
new file mode 100644
index 0000000..be4414e
--- /dev/null
+++ b/package/vpnc/0002-Don-t-build-manpages.patch
@@ -0,0 +1,31 @@
+From 6bbd03ec8928fd2a3056fc55ee48900fc88d3061 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Mon, 8 Feb 2016 23:03:48 +0100
+Subject: [PATCH] Don't build manpages
+
+Patch originally from Ulf Samuelsson <ulf.samuelsson@atmel.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ca6459..857bf8d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -70,7 +70,10 @@ vpnc : $(OBJS) vpnc.o
+ 	$(CC) -o $@ $^ $(LDFLAGS)
+ 
+ vpnc.8 : vpnc.8.template makeman.pl vpnc
+-	./makeman.pl
++	@echo "Cannot make manual when cross compiling"
++	touch $@
++
++#	./makeman.pl
+ 
+ vpnc-script : vpnc-script.in
+ 	sed -e 's,@''PREFIX''@,$(PREFIX),g' $< > $@ && chmod 755 $@
+-- 
+2.6.4
+
diff --git a/package/vpnc/0002-nomanual.patch b/package/vpnc/0002-nomanual.patch
deleted file mode 100644
index 7f2ea53..0000000
--- a/package/vpnc/0002-nomanual.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -urN vpnc-0.5.3-0rig/Makefile vpnc-0.5.3/Makefile
---- vpnc-0.5.3-0rig/Makefile	2008-11-19 21:36:12.000000000 +0100
-+++ vpnc-0.5.3/Makefile	2009-01-15 00:38:36.000000000 +0100
-@@ -72,7 +72,10 @@
- 	$(CC) -o $@ $^ $(LDFLAGS)
- 
- vpnc.8 : vpnc.8.template makeman.pl vpnc
--	./makeman.pl
-+	@echo "Cannot make manual when cross compiling"
-+	touch $@
-+
-+#	./makeman.pl
- 
- vpnc-script : vpnc-script.in
- 	sed -e 's,@''PREFIX''@,$(PREFIX),g' $< > $@ && chmod 755 $@
diff --git a/package/vpnc/0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch b/package/vpnc/0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch
new file mode 100644
index 0000000..4b8446f
--- /dev/null
+++ b/package/vpnc/0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch
@@ -0,0 +1,32 @@
+From ca1a9ad59ae07345720e315b928bb014a8aeea4c Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Mon, 8 Feb 2016 23:05:23 +0100
+Subject: [PATCH] Replace deprecated SUSv3 functions with POSIX equivalents
+
+Replace the deprecated SUSv3 function index() by its POSIX equivalent
+strchr().
+
+Patch originally from Bernhard Reutner-Fischer
+<rep.dot.nop@gmail.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ config.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config.c b/config.c
+index bdd0833..d1750ca 100644
+--- a/config.c
++++ b/config.c
+@@ -456,7 +456,7 @@ static char *get_config_filename(const char *name, int add_dot_conf)
+ {
+ 	char *realname;
+ 	
+-	asprintf(&realname, "%s%s%s", index(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
++	asprintf(&realname, "%s%s%s", strchr(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
+ 	return realname;
+ }
+ 
+-- 
+2.6.4
+
diff --git a/package/vpnc/0003-susv3-legacy.patch b/package/vpnc/0003-susv3-legacy.patch
deleted file mode 100644
index 2e577e3..0000000
--- a/package/vpnc/0003-susv3-legacy.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -rdup vpnc-0.5.1.oorig/config.c vpnc-0.5.1/config.c
---- vpnc-0.5.1.oorig/config.c	2007-09-10 22:39:48.000000000 +0200
-+++ vpnc-0.5.1/config.c	2007-09-19 14:19:46.000000000 +0200
-@@ -538,7 +538,7 @@ static char *get_config_filename(const c
- {
- 	char *realname;
- 	
--	asprintf(&realname, "%s%s%s", index(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
-+	asprintf(&realname, "%s%s%s", strchr(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
- 	return realname;
- }
- 
diff --git a/package/vpnc/vpnc.hash b/package/vpnc/vpnc.hash
index a79df8f..3474057 100644
--- a/package/vpnc/vpnc.hash
+++ b/package/vpnc/vpnc.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 46cea3bd02f207c62c7c6f2f22133382602baeda1dc320747809e94881414884 vpnc-0.5.3.tar.gz
+sha256 925c8e879f78f1d575b69ee3868b886a0139926ea84c2138a89b9b7d8696f50a vpnc-70f1211f6f26e87e374d66f9a986e855215b8e3e.tar.gz
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index f5ab5fc..5dfc2ba 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VPNC_VERSION = 0.5.3
-VPNC_SITE = http://www.unix-ag.uni-kl.de/~massar/vpnc
+VPNC_VERSION = 70f1211f6f26e87e374d66f9a986e855215b8e3e
+VPNC_SITE = $(call github,ndpgroup,vpnc,$(VPNC_VERSION))
 VPNC_LICENSE = GPLv2+
 VPNC_LICENSE_FILES = COPYING
 
-- 
2.6.4
