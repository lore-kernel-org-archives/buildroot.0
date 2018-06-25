From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jun 2018 00:02:36 +0200
Subject: [Buildroot] [PATCH v2,2/3] boost: coroutine selects context
In-Reply-To: <20180625220237.15217-1-fontaine.fabrice@gmail.com>
References: <20180625220237.15217-1-fontaine.fabrice@gmail.com>
Message-ID: <20180625220237.15217-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace the coroutine dependency on context by a select

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index bb53adccdd..b390c6fce8 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -97,12 +97,18 @@ comment "boost-contract needs a toolchain w/ NPTL"
 
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
-	depends on BR2_PACKAGE_BOOST_CONTEXT
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	select BR2_PACKAGE_BOOST_CONTEXT
 	help
 	  deprecated coroutine library, the non-depricated coroutine2
 	  library is a header-only library and does not need to be
 	  selected.
 
+comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
 	help
-- 
2.14.1
