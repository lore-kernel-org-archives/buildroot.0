From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 14:25:35 +0200
Subject: [Buildroot] [PATCH 1/8] toolchain: GCC bug 71124
In-Reply-To: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522122542.84146-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC < 8.x hangs while building sqlite for the Microblaze Arch.

Reported:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124

Similar to:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d05ad88af4..68db4a2751 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -124,6 +124,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124. This bug no
+# longer exists in gcc 8.x.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_71124
+	bool
+	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
-- 
2.17.1
