From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Mon, 21 May 2018 10:53:07 -0700
Subject: [Buildroot] [PATCH v2 2/5] package/protobuf: add a patch for mips
 big endian
In-Reply-To: <20180521175310.18563-1-charles.hardin@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
Message-ID: <20180521175310.18563-3-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

This patch got submitted as a pull upstream, but hasn't
been approved or yanked in yet. So, adding it here
for now until an upstream solution is determined.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 ...w-a-compilation-under-mips-big-endian-wit.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch

diff --git a/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch b/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch
new file mode 100644
index 0000000000..b98a459be8
--- /dev/null
+++ b/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch
@@ -0,0 +1,38 @@
+From d105213bccfa4392eda889a95f808dd9cdf84494 Mon Sep 17 00:00:00 2001
+From: Charles Hardin <charles.hardin@storagecraft.com>
+Date: Mon, 21 May 2018 09:19:30 -0700
+Subject: [PATCH 1/1] Fix to allow a compilation under mips big endian with gcc
+
+The __MIPSEL__ is mips little endian, specific and we needed
+to compile for a big endian mips target that also happened
+to be a mips64, so replaced the __MIPSEL__ with a __mip__
+which should preserve the build on little endian and allow a
+build for a big endian setup.
+
+	$ echo | mips64-linux-gcc -E -dM -
+	... snip snip ...
+	#define __mips__ 1
+	#define __MIPSEB__ 1
+
+Signed-off-by: Charles Hardin <ckhardin@gmail.com>
+Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
+---
+ src/google/protobuf/stubs/platform_macros.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/google/protobuf/stubs/platform_macros.h b/src/google/protobuf/stubs/platform_macros.h
+index c3a64dd2..f9e2bff6 100644
+--- a/src/google/protobuf/stubs/platform_macros.h
++++ b/src/google/protobuf/stubs/platform_macros.h
+@@ -56,7 +56,7 @@
+ #elif defined(__aarch64__)
+ #define GOOGLE_PROTOBUF_ARCH_AARCH64 1
+ #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
+-#elif defined(__MIPSEL__)
++#elif defined(__mips__)
+ #if defined(__LP64__)
+ #define GOOGLE_PROTOBUF_ARCH_MIPS64 1
+ #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
+-- 
+2.15.1 (Apple Git-101)
+
-- 
2.15.1 (Apple Git-101)
