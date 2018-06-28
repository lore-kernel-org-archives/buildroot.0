From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:32:58 +0200
Subject: [Buildroot] [git commit] package/protobuf: add a patch to fix
 building on mips big endian
Message-ID: <20180628203034.37E9F83707@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b092df866f0e8369002ceffcdcaccccc6fd1d384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch was submitted upstream as
https://github.com/google/protobuf/pull/4657.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...w-a-compilation-under-mips-big-endian-wit.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch b/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch
new file mode 100644
index 0000000000..d2b34f15e6
--- /dev/null
+++ b/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch
@@ -0,0 +1,38 @@
+From d105213bccfa4392eda889a95f808dd9cdf84494 Mon Sep 17 00:00:00 2001
+From: Charles Hardin <charles.hardin@storagecraft.com>
+Date: Mon, 21 May 2018 09:19:30 -0700
+Subject: [PATCH] Fix to allow a compilation under mips big endian with gcc
+
+The __MIPSEL__ is mips little endian specific, but we needed to
+compile for a big endian mips target that also happened to be a
+mips64. This commit replaces the __MIPSEL__ test with a __mips__ test
+which preserves the build on little endian and allows building for a
+big endian setup.
+
+	$ echo | mips64-linux-gcc -E -dM -
+	... snip snip ...
+	#define __mips__ 1
+	#define __MIPSEB__ 1
+
+Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
+Upstream-status: https://github.com/google/protobuf/pull/4657
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
