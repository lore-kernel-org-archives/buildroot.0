From: Frank Bergmann <frank@frajasalo.de>
Date: Thu, 20 Feb 2014 22:59:38 +0100
Subject: [Buildroot] [PATCH v2 2/2] e2fsprogs: disable e4defrag for nios
In-Reply-To: <1392933578-2256-1-git-send-email-frank@frajasalo.de>
References: <1392933578-2256-1-git-send-email-frank@frajasalo.de>
Message-ID: <1392933578-2256-2-git-send-email-frank@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

e4defrag has to be disabled because of the (external) toolchain declares
the fallocate64 call in the header files but don't implement it in the
library. e4defrag defines its own fallocate64 function that throws an
error because of the previous declaration in the toolchain header.

Signed-off-by: Frank Bergmann <frank@frajasalo.de>
---
 package/e2fsprogs/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 7775e94..1e87aef 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -49,7 +49,7 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
-	depends on !BR2_avr32 # fallocate not implemented
+	depends on !BR2_avr32 && !BR2_nios2 # fallocate not implemented
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
-- 
1.7.10.4
