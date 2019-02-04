From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Mon,  4 Feb 2019 15:22:51 +0000
Subject: [Buildroot] [PATCH v3 1/1] package/bird: bump version to 2.0.3
In-Reply-To: <20190204161524.291fff15@windsurf>
References: <20190204161524.291fff15@windsurf>
Message-ID: <20190204152250.9012-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0001 is no longer needed as it has been ported to this version.
Also, the README changes but the licence is still GPL-2.0+

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 ...fix-installation-with-disable-client.patch | 41 -------------------
 package/bird/bird.hash                        |  4 +-
 package/bird/bird.mk                          |  6 +--
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch

diff --git a/package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch b/package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch
deleted file mode 100644
index c0faec21b0..0000000000
--- a/package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6cb15abfc00cb5e492175a9efc71bfdfd1aa457c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 9 Oct 2018 12:51:08 +0200
-Subject: [PATCH] Makefile.in: fix installation with --disable-client
-
-The configure.ac script initializes the CLIENT variable this way:
-
-CLIENT=birdcl
-if client enabled
- CLIENT=$CLIENT birdc
-fi
-
-This means that checking if @CLIENT@ is empty to decide whether birdc
-should be installed or not doesn't work, and causes a failure at
-installation time when --disable-client is passed.
-
-Instead, check if the birdc binary has been produced or not to decide
-whether it should be installed.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: http://trubka.network.cz/pipermail/bird-users/2018-October/012763.html
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index c8168bbe..fea3683e 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -171,7 +171,7 @@ install: all
- 	$(INSTALL) -d $(DESTDIR)/$(sbindir) $(DESTDIR)/$(sysconfdir) $(DESTDIR)/@runtimedir@
- 	$(INSTALL_PROGRAM) $(exedir)/bird $(DESTDIR)/$(sbindir)/bird
- 	$(INSTALL_PROGRAM) $(exedir)/birdcl $(DESTDIR)/$(sbindir)/birdcl
--	if test -n "@CLIENT@" ; then								\
-+	if test -f $(exedir)/birdc ; then							\
- 		$(INSTALL_PROGRAM) $(exedir)/birdc $(DESTDIR)/$(sbindir)/birdc ;		\
- 	fi
- 	if ! test -f $(DESTDIR)/@CONFIG_FILE@ ; then						\
--- 
-2.14.4
-
diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 449e8afd8d..3f3a93b964 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256 bd42d48fbcc2c0046d544f1183cd98193ff15b792d332ff45f386b0180b09335  bird-v2.0.2.tar.gz
-sha256 f018596a97af0108efc446320631e2fddc0c1d1f3ffab3129327ccdb4f0c29ed  README
+sha256 0f49b38327d3109553acfa662ac0cf0377719226a03c124cd2e0ea2265ecb1de  bird-2.0.3.tar.gz
+sha256 94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 297e21dd95..da2f868070 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-BIRD_VERSION = v2.0.2
-BIRD_SITE = $(call github,BIRD,bird,$(BIRD_VERSION))
+BIRD_VERSION = 2.0.3
+BIRD_SITE = ftp://bird.network.cz/pub/bird
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
-# autoreconf is needed since the package is fetched from github
-BIRD_AUTORECONF = YES
 BIRD_DEPENDENCIES = host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
-- 
2.19.1
