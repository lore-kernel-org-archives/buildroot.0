From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:24:59 +0200
Subject: [Buildroot] [git commit] boost: coroutine selects context
Message-ID: <20180630203109.7582C838E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb3dc94501415220c52c87843b908658d700968c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace the coroutine dependency on context by a select

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
