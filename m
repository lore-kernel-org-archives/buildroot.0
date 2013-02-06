From: victor.hiairrassary.ml at gmail.com <victor.hiairrassary.ml@gmail.com>
Date: Wed,  6 Feb 2013 17:27:16 +0100
Subject: [Buildroot] [PATCH] boost: bump version to 1.53.0
In-Reply-To: <[PATCH] boost: bump version to 1.53.0>
References: <[PATCH] boost: bump version to 1.53.0>
Message-ID: <1360168036-1073-1-git-send-email-victor.hiairrassary.ml@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>

and re-enable boost context library since its compilation with
uClibc is fixed. Disable new atomic library because it can not
compile with uClibc (fixed in upstream version).

Signed-off-by: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
---
 package/boost/Config.in | 3 +++
 package/boost/boost.mk  | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 19dcc60..e36e7d3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -21,6 +21,9 @@ if BR2_PACKAGE_BOOST
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 
+config BR2_PACKAGE_BOOST_CONTEXT
+	bool "boost-context"
+
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 5e1bb4e..84263d1 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BOOST_VERSION = 1.52.0
+BOOST_VERSION = 1.53.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
@@ -15,9 +15,12 @@ TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
 BOOST_DEPENDENCIES = bzip2 zlib
 
 BOOST_FLAGS =
-BOOST_WITHOUT_FLAGS = python context
+
+# atomic library compile only with upstream version, wait for next release
+BOOST_WITHOUT_FLAGS = python atomic
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
-- 
1.8.1.2
