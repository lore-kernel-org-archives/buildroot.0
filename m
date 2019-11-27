From: Tudor Holton <tudor@tudorholton.com>
Date: Wed, 27 Nov 2019 16:31:31 +1100
Subject: [Buildroot] [PATCH 1/1] package/openjdk: modify site from mirror to
 official repos
Message-ID: <20191127053131.3344-1-tudor@tudorholton.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tudor Holton <buildroot@tudorholton.com>

Since Java 11 (and possibly earlier), OpenJDK now has its own official repository 
at hg.openjdk.java.net which is referenced in all OpenJDK documentation.  
This patch brings buildroot into line with that source and allows consistent 
patching both across projects and for patches specific to buildroot environments.

Signed-off-by: Tudor Holton <buildroot@tudorholton.com>
---
 DEVELOPERS                   | 3 +++
 package/openjdk/openjdk.hash | 2 +-
 package/openjdk/openjdk.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 991be89849..7c9cebfb2f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2365,6 +2365,9 @@ F:	package/redis/
 N:	Trent Piepho <tpiepho@impinj.com>
 F:	package/libp11/
 
+N:	Tudor Holton <buildroot@tudorholton.com>
+F:	package/openjdk/
+
 N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 00d080aa3f..beed7a34a2 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5f73d86ed516173965b27754f1bb21374ccb1194a17c2d89d8018280ce5ffa78  openjdk-12.0.2+10.tar.gz
+sha256 b2bcad35656b00928683416f3480ad00363b00993eb711c3e1886e4fe77eefeb  jdk-12.0.2+10.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index ea2555edcc..3081c2f895 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -7,7 +7,10 @@
 OPENJDK_VERSION_MAJOR = 12.0.2
 OPENJDK_VERSION_MINOR = 10
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
+OPENJDK_PROJECT = jdk-updates
+OPENJDK_RELEASE = jdk12u
+OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
+OPENJDK_SITE = https://hg.openjdk.java.net/$(OPENJDK_PROJECT)/$(OPENJDK_RELEASE)/archive
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
@@ -83,9 +86,6 @@ OPENJDK_CONF_OPTS = \
 	--with-native-debug-symbols=none \
 	--without-version-pre \
 	--with-sysroot=$(STAGING_DIR) \
-	--with-vendor-name="AdoptOpenJDK" \
-	--with-vendor-url="https://adoptopenjdk.net/" \
-	--with-vendor-version-string="AdoptOpenJDK" \
 	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
 	--with-version-string="$(OPENJDK_VERSION_MAJOR)"
 
-- 
2.20.1
