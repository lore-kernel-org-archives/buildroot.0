From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:40 +0200
Subject: [Buildroot] [RFC v4 06/16] tooclahin-external: add support for
	GCC_SYSROOT
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-7-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To support the per-package staging feature, when the GCC_SYSROOT
environament variable is defined pass it to gcc in the "--sysroot"
option.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 toolchain/toolchain-external/ext-toolchain-wrapper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index e2d01dc..f262b3d 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -98,6 +98,7 @@ int main(int argc, char **argv)
 	char *basename;
 	char *env_debug;
 	char *paranoid_wrapper;
+	char *gcc_sysroot;
 	int paranoid;
 	int ret, i, count = 0, debug;
 
@@ -145,7 +146,13 @@ int main(int argc, char **argv)
 		perror(__FILE__ ": overflow");
 		return 3;
 	}
-	ret = snprintf(sysroot, sizeof(sysroot), "%s/" BR_SYSROOT, absbasedir);
+	gcc_sysroot = getenv("GCC_SYSROOT");
+	if (gcc_sysroot) {
+		ret = snprintf(sysroot, sizeof(sysroot), "%s", gcc_sysroot);
+	} else {
+		ret = snprintf(sysroot, sizeof(sysroot), "%s/" BR_SYSROOT, \
+			       absbasedir);
+	}
 	if (ret >= sizeof(sysroot)) {
 		perror(__FILE__ ": overflow");
 		return 3;
-- 
2.4.3
