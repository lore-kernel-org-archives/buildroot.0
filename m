From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:30:32 +0100
Subject: [Buildroot] [git commit] package/pulseview: bump version to 0.3.0
Message-ID: <20160201224711.266F07F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0814553660e2a63dff959ca2082018a9e00ab858
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to upstream tarball, remove autoreconf, add hash.

Upstream expects the boost unit tests being activated by default:
http://sigrok.org/gitweb/?p=pulseview.git;a=blobdiff;f=CMakeLists.txt;h=77b0137db22b7b6cab80d8aee7c97fecb8c542bf;hp=a82953cc166141af626ace0e5d2b3a285bf20eea;hb=f513bec599b8d626f914aa804a01325914bdb5e9;hpb=8ada6ef1319fa11fd594a34853967c1f9688913b
Add some logic to pulseview.mk to disable them if needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseview/pulseview.hash |  3 +++
 package/pulseview/pulseview.mk   | 15 ++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/pulseview/pulseview.hash b/package/pulseview/pulseview.hash
new file mode 100644
index 0000000..dc50ec6
--- /dev/null
+++ b/package/pulseview/pulseview.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	5ffe2cb7a602fcdc60933d400c77bcd66e6ce529bc4f6e97d6a5e5a86f2f530e	pulseview-0.3.0.tar.gz
+sha256	7de425dfe3b0f76e76e266374dca8b2951510d232380901ef2abda71c7c30bb0	dcfe0a01f72021aab961245d0ebcc9f8d4504b40.patch
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index 67f293f..35d852c 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -6,14 +6,23 @@
 
 # TODO Pulseview can be built and linked against Qt4 as well.
 
-# No https access on upstream git
-PULSEVIEW_SITE = git://sigrok.org/pulseview
-PULSEVIEW_VERSION = ec6cc07fed12f5070eee6b8cb11343e83d42533c
+PULSEVIEW_VERSION = 0.3.0
+PULSEVIEW_SITE = http://sigrok.org/download/source/pulseview
+# bug fixed upstream
+# http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1950
+PULSEVIEW_PATCH = \
+	https://github.com/abraxa/pulseview/commit/dcfe0a01f72021aab961245d0ebcc9f8d4504b40.patch
 PULSEVIEW_LICENSE = GPLv3+
 PULSEVIEW_LICENSE_FILES = COPYING
 PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
 PULSEVIEW_CONF_OPTS = -DDISABLE_WERROR=TRUE
 
+ifeq ($(BR2_PACKAGE_BOOST_TEST),y)
+PULSEVIEW_CONF_OPTS += -DENABLE_TESTS=TRUE
+else
+PULSEVIEW_CONF_OPTS += -DENABLE_TESTS=FALSE
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
 PULSEVIEW_CONF_OPTS += -DENABLE_DECODE=TRUE
 PULSEVIEW_DEPENDENCIES += libsigrokdecode
