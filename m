From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 17:54:07 +0200
Subject: [Buildroot] [git commit] libiio: Disable IIOD on Blackfin
Message-ID: <20160829155904.75EC780269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53996bee433f09a91b12aa53b2be0f7d22c0acbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IIOD uses accept4, which is not yet available on Blackfin.

Fixes:
 http://autobuild.buildroot.net/results/b75/b7552c9325ffcc7f1cb6e114b82648f3280fded6/

[Peter: hide other toolchain comment on bfin]
Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 69269e0..2e7a76d 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -53,12 +53,17 @@ config BR2_PACKAGE_LIBIIO_IIOD
 	bool "IIO Daemon"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_bfin
 	default y
 	help
 	  Install the IIO Daemon.
 
 comment "IIO Daemon needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_bfin
+
+comment "IIO Daemon is not yet available on Blackfin"
+	depends on BR2_bfin
 
 config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
