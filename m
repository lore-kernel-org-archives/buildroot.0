From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 17 Jan 2018 09:31:48 -0500
Subject: [Buildroot] [PATCH 1/1] package/libpqxx: update dependencies
Message-ID: <20180117143148.6252-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of v6.x, libpqxx takes advantage of thread support for transaction
sleeps (adding BR2_TOOLCHAIN_HAS_THREADS).

Re-order dependencies for:
 - Key feature (postgresql)
 - Architectures dependencies
 - Remaining dependencies

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Fixes:
http://autobuild.buildroot.net/results/e1d6f62edfc5eae90953f0a93fdb30d713409c37/
---
 package/libpqxx/Config.in | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index 7832d2508ec6d4932d01d769e4d7642d01a45a0d..18f905b3780beeac9731e9ea24db971e3a4ddeb9 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -1,14 +1,17 @@
 config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_PACKAGE_POSTGRESQL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
 	  enterprise-strength open-source relational database.
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++ support, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "libpqxx needs toolchain w/ C++, gcc >= 4.7, threads"
 	depends on BR2_PACKAGE_POSTGRESQL
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.13.3.windows.1
