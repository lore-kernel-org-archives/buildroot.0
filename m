From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 12:52:25 +0100
Subject: [Buildroot] [git commit] dropbear: add extra build customization
	options
Message-ID: <20150207120036.61D947FF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b49e4cf3ec7eab7505957c704a0d9727edcdbcca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v2: only offer option to disable building SSH client.
    do not offer options to disable password authentication and TCP forwarding.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/Config.in   |   10 ++++++++++
 package/dropbear/dropbear.mk |   17 ++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 68c3b71..c14c654 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -8,6 +8,16 @@ config BR2_PACKAGE_DROPBEAR
 
 if BR2_PACKAGE_DROPBEAR
 
+config BR2_PACKAGE_DROPBEAR_CLIENT
+	bool "client programs"
+	default y
+	help
+	  Provides the programs: dbclient, ssh
+
+	  Note that the following programs are also used server-side
+	  and are therefore always build regardless this setting:
+	  dropbear, dropbearkey, dropbearconvert, scp
+
 config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	bool "disable reverse DNS lookups"
 	help
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 6e020c2..e063b10 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,13 +7,20 @@
 DROPBEAR_VERSION = 2015.67
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-DROPBEAR_MAKE = \
-	$(MAKE) MULTI=1 SCPPROGRESS=1 \
-	PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
-
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
 DROPBEAR_LICENSE_FILES = LICENSE
+DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
+DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
+
+ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
+# Build dbclient, and create a convenience symlink named ssh
+DROPBEAR_PROGRAMS += dbclient
+DROPBEAR_TARGET_BINS += dbclient ssh
+endif
+
+DROPBEAR_MAKE = \
+	$(MAKE) MULTI=1 SCPPROGRESS=1 \
+	PROGRAMS="$(DROPBEAR_PROGRAMS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DROPBEAR_MAKE += STATIC=1
