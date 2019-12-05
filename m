From: Tudor Holton <tudor@tudorholton.com>
Date: Thu,  5 Dec 2019 16:57:04 +1100
Subject: [Buildroot] [PATCH 1/1] modify site from adoptopenjdk mirror to
 official hg.openjdk.java.net repository
Message-ID: <20191205055704.14170-1-tudor@tudorholton.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Java 11 (and possibly earlier), OpenJDK now has its own official
repository at hg.openjdk.java.net which is referenced in all OpenJDK documentation.
This patch brings buildroot into line with that source, reducing the opportunity
for code injection, and allowing consistent patching both across projects and for
patches specific to buildroot environments.

diff -ru shows that the only changes between the downstream and upstream files at
this point in time is the addition of a .hg_archive.txt file,  containing:

repo: fd16c54261b32be1aaedd863b7e856801b7f8543
node: 7b6accc7c009304dd2979ea16c1cb15bf749a1fc
branch: default
tag: jdk-12.0.2+10
tag: jdk-12.0.2-ga

This does, however, change the hash for the tar.gz file (but not for the license).

With respect to the concern regarding upstream hash consistency, we have now been
using these archives for just over a year (since OpenJDK 11) and we haven't seen an
archive hash change in that time.  This was a vast improvement on the previous
Mercurial forest.  /archive is exactly as is sounds.  It's an archive that doesn't
change, which is why it effectively negates the need for a "downstream" mirror.

Tests completed successfully (which is not surprising since there are no code changes here):

$ ./support/testing/run-tests -d ./dl/ -k -o test_dir tests.package.test_openjdk.TestOpenJdk
14:35:25 TestOpenJdk                              Starting
['Hello, World']
['Test: Get JNI Version passed', 'Test: Read Native String Constant passed', 'Test: Write Java String to Native Library passed', 'Test: Write Java Char Array to Native Library passed', 'Test: Write String Member to Native Library passed', 'Test: Set String Member from Native Library passed', 'Test: Execeute Java Function from Native Library passed', 'Test: Instantiate Java Class passed', 'Test: Call Native Library to Set System Time passed']
14:35:46 TestOpenJdk                              Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 20.614s

OK

Signed-off-by: Tudor Holton <tudor@tudorholton.com>
---
 DEVELOPERS                   | 3 +++
 package/openjdk/openjdk.hash | 2 +-
 package/openjdk/openjdk.mk   | 6 ++----
 3 files changed, 6 insertions(+), 5 deletions(-)

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
index ea2555edcc..e95ece2eba 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -7,7 +7,8 @@
 OPENJDK_VERSION_MAJOR = 12.0.2
 OPENJDK_VERSION_MINOR = 10
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
+OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
+OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk12u/archive
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
@@ -83,9 +84,6 @@ OPENJDK_CONF_OPTS = \
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
