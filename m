From: guoren at kernel.org <guoren@kernel.org>
Date: Tue,  7 May 2019 17:51:05 +0800
Subject: [Buildroot] [PATCH] support/check-kernel-headers: Fixup couldn't
 compile linux rc version
Message-ID: <1557222665-9498-1-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Sometimes we want to try newest kernel rc version, but the
check-kernel-headers will prevent it. In package/linux-headers we
use BR2_TOOLCHAIN_HEADERS_AT_LEAST for checking, I think AT_LEAST means
"<" not "!=".

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 support/scripts/check-kernel-headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index a8cca78..4787678 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -23,7 +23,7 @@ int main(int argc __attribute__((unused)),
          char** argv __attribute__((unused)))
 {
     if((LINUX_VERSION_CODE & ~0xFF)
-        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
+        < KERNEL_VERSION(${HDR_M},${HDR_m},0))
     {
         printf("Incorrect selection of kernel headers: ");
         printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
-- 
2.7.4
