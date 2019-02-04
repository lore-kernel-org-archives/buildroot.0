From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 Feb 2019 11:30:06 +0100
Subject: [Buildroot] [PATCH] package/opentracing-cpp: needs threads
Message-ID: <20190204103007.10599-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

opentracing-cpp uses std::mutex since 1.3.0.

Fixes: http://autobuild.buildroot.net/results/121a9f2aacf9e7b1f5d0b3f2c55bc1da36c7cfb6/

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/opentracing-cpp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
index 4ee7b29de2..ebcce35aa8 100644
--- a/package/opentracing-cpp/Config.in
+++ b/package/opentracing-cpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENTRACING_CPP
 	bool "opentracing-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	help
@@ -8,8 +9,8 @@ config BR2_PACKAGE_OPENTRACING_CPP
 
 	  http://opentracing.io
 
-comment "opentracing-cpp needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "opentracing-cpp needs a toolchain w/ C++, threads, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "opentracing-cpp needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.19.2
