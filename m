From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Mon,  4 Feb 2019 09:10:31 +0000
Subject: [Buildroot] [PATCH 1/1] package/bird: bump version to 2.0.3
Message-ID: <20190204091031.31600-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 ...fix-installation-with-disable-client.patch | 41 -------------------
 package/bird/bird.hash                        |  4 +-
 package/bird/bird.mk                          |  5 ++-
 3 files changed, 5 insertions(+), 45 deletions(-)
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
index 449e8afd8d..0570373ad3 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256 bd42d48fbcc2c0046d544f1183cd98193ff15b792d332ff45f386b0180b09335  bird-v2.0.2.tar.gz
-sha256 f018596a97af0108efc446320631e2fddc0c1d1f3ffab3129327ccdb4f0c29ed  README
+sha256 54ec151518564f87e81de4ac19376689e5ba8dd9129f1e9a79086db3df0931f8  bird-v2.0.3.tar.gz
+sha256 94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 297e21dd95..1253137afa 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-BIRD_VERSION = v2.0.2
-BIRD_SITE = $(call github,BIRD,bird,$(BIRD_VERSION))
+BIRD_VERSION = v2.0.3
+BIRD_SOURCE = bird-$(BIRD_VERSION).tar.gz
+BIRD_SITE = https://gitlab.labs.nic.cz/labs/bird/-/archive/$(BIRD_VERSION)
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
 # autoreconf is needed since the package is fetched from github
-- 
2.19.1
