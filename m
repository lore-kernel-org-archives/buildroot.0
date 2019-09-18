From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 17:50:45 +0200
Subject: [Buildroot] [git commit] package/lsof: bump to version 4.93.2
Message-ID: <20190918154637.B61B38EB39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48cc4d658f36ce44c48daf510d4a44dd9985875c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New upstream at github. Update homepage link and download site.

Drop the custom extract command; we now get the source tree from github.

Drop patch #2; the code detects rpc support.

Add optional dependency on libtirpc.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsof/0002-noportmap.patch                      | 18 ------------------
 ...-funcs.patch => 0002-remove-susvlegacy-funcs.patch} |  0
 package/lsof/Config.in                                 |  2 +-
 package/lsof/lsof.hash                                 |  8 ++------
 package/lsof/lsof.mk                                   | 17 ++++++-----------
 5 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/package/lsof/0002-noportmap.patch b/package/lsof/0002-noportmap.patch
deleted file mode 100644
index 984e0d8eac..0000000000
--- a/package/lsof/0002-noportmap.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- a/print.c	2006-08-23 13:37:43.000000000 -0600
-+++ b/print.c	2006-08-23 13:38:29.000000000 -0600
-@@ -148,6 +148,7 @@
- static void
- fill_portmap()
- {
-+#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_RPC__)
- 	char buf[128], *cp, *nm;
- 	CLIENT *c;
- 	int h, port, pr;
-@@ -266,6 +267,7 @@
- 	    Pth[pr][h] = pt;
- 	}
- 	clnt_destroy(c);
-+#endif
- }
- 
- 
diff --git a/package/lsof/0004-remove-susvlegacy-funcs.patch b/package/lsof/0002-remove-susvlegacy-funcs.patch
similarity index 100%
rename from package/lsof/0004-remove-susvlegacy-funcs.patch
rename to package/lsof/0002-remove-susvlegacy-funcs.patch
diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index c27cc8160a..48ceb39a99 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_LSOF
 	  The lsof tool lists information about files opened by
 	  processes.
 
-	  http://people.freebsd.org/~abe/
+	  https://github.com/lsof-org/lsof
diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index ccb737153d..c7432ffbe8 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,7 +1,3 @@
-# From http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/CHECKSUMS_4.91
-md5 148ed410cb52e08c2adc0c60f480f11f  lsof_4.91.tar.bz2
-# Locally calculated after checking pgp signature
-# http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.91.tar.bz2.sig
-# with (old, weak) key 40BD3D55
-sha256	c9da946a525fbf82ff80090b6d1879c38df090556f3fe0e6d782cb44172450a3	lsof_4.91.tar.bz2
+# Locally calculated
+sha256	3df912bd966fc24dc73ddea3e36a61d79270b21b085936a4caabca56e5b486a2	lsof-4.93.2.tar.gz
 sha256	32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1	dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 58a2d8ef1b..939df9dd8d 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.91
-LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
-# Use http mirror since master ftp site access is very draconian
-LSOF_SITE = http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof
+LSOF_VERSION = 4.93.2
+LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
 LSOF_LICENSE_FILES = dialects/linux/dproto.h
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LSOF_DEPENDENCIES += libtirpc
+endif
+
 ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
@@ -27,13 +29,6 @@ define LSOF_CONFIGURE_LOCALE_FIXUPS
 endef
 endif
 
-# The .tar.bz2 contains another .tar, which contains the source code.
-define LSOF_EXTRACT_CMDS
-	$(call suitable-extractor,$(LSOF_SOURCE)) $(LSOF_DL_DIR)/$(LSOF_SOURCE) | \
-		$(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
-	$(TAR) --strip-components=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
-endef
-
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" \
