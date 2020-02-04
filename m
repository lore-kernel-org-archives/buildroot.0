From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  3 Feb 2020 17:22:00 -0800
Subject: [Buildroot] [PATCH v3 8/8] package/mariadb: security bump version
 to 10.4.12
In-Reply-To: <20200204012200.7273-1-bluemrp9@gmail.com>
References: <20200204012200.7273-1-bluemrp9@gmail.com>
Message-ID: <20200204012200.7273-8-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://mariadb.com/kb/en/library/mariadb-10412-release-notes/

Changelog:
https://mariadb.com/kb/en/library/mariadb-10412-changelog/

Fixes the following security vulnerability:
CVE-2020-2574: Vulnerability in the MySQL Client product of Oracle MySQL
(component: C API). Supported versions that are affected are 5.6.46 and
prior, 5.7.28 and prior and 8.0.18 and prior. Difficult to exploit
vulnerability allows unauthenticated attacker with network access via
multiple protocols to compromise MySQL Client. Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Client.

Upgrading from 10.3 to 10.4:
https://mariadb.com/kb/en/library/upgrading-from-mariadb-103-to-mariadb-104/

The hash for README.md has been updated due to minor changes throughout
the document. The text in licensing section is unchanged.

Patch 0002-fix-build-error-with-newer-cmake.patch has been removed as it
has been applied upstream. The remaining patches have been renamed to correct
the order.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - bump version to 10.4.12 instead of 10.4.11
Changes v1 -> v2:
  - bump version to 10.4.11 instead of 10.4.10
  - replace patch for mysql_install_db (suggested by Thomas)
  - split other changes to startup scripts into separate patches (suggested by Thomas)
---
 ...-add-sysroot-path-to-mariadb_config.patch} |  0
 ...002-fix-build-error-with-newer-cmake.patch | 44 -------------------
 package/mariadb/mariadb.hash                  | 12 ++---
 package/mariadb/mariadb.mk                    |  5 ++-
 4 files changed, 10 insertions(+), 51 deletions(-)
 rename package/mariadb/{0003-add-sysroot-path-to-mariadb_config.patch => 0002-add-sysroot-path-to-mariadb_config.patch} (100%)
 delete mode 100644 package/mariadb/0002-fix-build-error-with-newer-cmake.patch

diff --git a/package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
similarity index 100%
rename from package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch
rename to package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
diff --git a/package/mariadb/0002-fix-build-error-with-newer-cmake.patch b/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
deleted file mode 100644
index 5ffac688a3..0000000000
--- a/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c90ae2ca3dff267b9e21595376d22de397f6f78f Mon Sep 17 00:00:00 2001
-From: Ryan Coe <bluemrp9@gmail.com>
-Date: Tue, 20 Aug 2019 06:22:43 -0700
-Subject: [PATCH] Fix build error with newer cmake
-
-Fixes the following build error:
-
-CMake Error at cmake/os/Linux.cmake:29 (STRING):
-STRING sub-command REPLACE requires at least four arguments.
-Call Stack (most recent call first):
-CMakeLists.txt:101 (INCLUDE)
-
-CMake Error at cmake/os/Linux.cmake:29 (STRING):
-STRING sub-command REPLACE requires at least four arguments.
-Call Stack (most recent call first):
-CMakeLists.txt:101 (INCLUDE)
-
-https://jira.mariadb.org/browse/MDEV-20596
-
-Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
----
- cmake/os/Linux.cmake | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cmake/os/Linux.cmake b/cmake/os/Linux.cmake
-index 50a2b21c838d8d6ca4cacc0704a9be4da3a57a0a..b871586acc9cfaddc3836cc9afafd85969120420 100644
---- a/cmake/os/Linux.cmake
-+++ b/cmake/os/Linux.cmake
-@@ -26,9 +26,9 @@ SET(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -D_GNU_SOURCE=1)
- 
- # Fix CMake (< 2.8) flags. -rdynamic exports too many symbols.
- FOREACH(LANG C CXX)
--  STRING(REPLACE "-rdynamic" "" 
--  CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS
--  ${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}  
-+  STRING(REPLACE "-rdynamic" ""
-+  "CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS"
-+  "${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}"
-   )
- ENDFOREACH()
- 
--- 
-2.17.1
-
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index a742d87daa..43adce803f 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.3.18
-md5 b3524c0825c3a1c255496daea38304a0  mariadb-10.3.18.tar.gz
-sha1 922a317edd6f44baacc49831ca278e7a9878a363  mariadb-10.3.18.tar.gz
-sha256 69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc  mariadb-10.3.18.tar.gz
-sha512 817253d18f20c74f9ec8030678fd50a28b1726fd59153023a3a5e9b3f79e1f44d79feb24ae9ed72d8c1c04017110c932aba7be0610fb06245590c7f5610db242  mariadb-10.3.18.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.4.12
+md5 97d7c0f508c04a31c138fdb24e95dbc4  mariadb-10.4.12.tar.gz
+sha1 8a07057e1249c66c7cb11a92936d45ef242581b1  mariadb-10.4.12.tar.gz
+sha256 fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb69434fcde735aa208  mariadb-10.4.12.tar.gz
+sha512 518dae18c04a1f7fcc6fd4d2dfbfbfbdf5e83e72ca41e66e1074328df8d92ab41b458e6a9973771419ac09a7348f264f158916cd198c335085d6e823e707bbc6  mariadb-10.4.12.tar.gz
 
 # Hash for license files
-sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
+sha256 fbcc1db54ebdc4af733aeaea9a00ec140f5f5fc43683f3966645450734c05747  README.md
 sha256 240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 4e7d693aee..34ee064d60 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.18
+MARIADB_VERSION = 10.4.12
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
@@ -57,6 +57,9 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 # Explicitly disable dtrace to avoid detection of a host version
 MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
 
+# Disable support for REST and JDBC
+MARIADB_CONF_OPTS += -DCONNECT_WITH_REST=OFF -DCONNECT_WITH_JDBC=OFF
+
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
-- 
2.25.0
