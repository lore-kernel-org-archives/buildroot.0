From: Vadym Kochan <vadym.kochan@plvision.eu>
Date: Mon,  2 Nov 2020 01:48:10 +0200
Subject: [Buildroot] [PATCH] Revert "keepalived: needs headers >= 3.4"
Message-ID: <20201101234810.10137-1-vadym.kochan@plvision.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit d01b0bbad04b97a5e8e1dd3ac3c1026555f793fb.

Original commit  made restriction for Linux headers < 3.4 which was
related to keepalived version 1.3.5, but it compiles fine now at least
with a toolchain based on 3.2 headers and keepalived 2.0.15 together
with ipset enabled.

Probably it was fixed by this commit:

    https://github.com/acassen/keepalived/commit/5a7f895bb795269f79e6353c6269dfbc0b782281

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
 package/keepalived/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index c71821545c..2a0663fed0 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KEEPALIVED
 	bool "keepalived"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # uses libdl
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_OPENSSL
 	help
 	  The main goal of the keepalived project is to add a strong &
@@ -15,6 +14,6 @@ config BR2_PACKAGE_KEEPALIVED
 
 	  http://www.keepalived.org/
 
-comment "keepalived needs a toolchain w/ dynamic library, headers >= 3.4"
+comment "keepalived needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_STATIC_LIBS
-- 
2.17.1
