From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Apr 2016 19:20:50 +0200
Subject: [Buildroot] [PATCH] package/racehound: fix comment
Message-ID: <1460481650-19136-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

racehound requires a kernel >= 3.14 to be built and to run.

However, the current conditions on the corresponding comments are wrong:
  - the comment about the kernel has a dependency on the requested
    headers
  - the comment on the toolchain features does not have this condition.

Thus, the comments are not shown/hidden under the appropriate
conditions, like in this situation:
  - toolchain with headers < 3.14 (e.g. Sourcery CodeBench x86/x86_64
    2012.09 with headers 3.5)
  - kernel 4.5 enabled

this comment is shown:
    racehound needs an Linux kernel >= 3.14 to be built

So, this is incorrect, because:
 1- a kernel >= 3.14 is indeed to be built
 2- the headers version mismatch is not reported

Fix that by moving the dependency on the kernel headers to the
appropriate comment and enhance it.

Since there is no way we can know the kernel version to be built, we can
not add such a condition; still, we leave the kernel message as-is.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/racehound/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 9f1011b..53e39a8 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -27,10 +27,11 @@ config BR2_PACKAGE_RACEHOUND
 	  https://github.com/winnukem/racehound
 
 comment "racehound needs an Linux kernel >= 3.14 to be built"
-	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+	depends on !BR2_LINUX_KERNEL
 	depends on BR2_i386 || BR2_x86_64
 
-comment "racehound needs a uClibc or (e)glibc toolchain w/ C++, wchar, dynamic library"
+comment "racehound needs a uClibc or (e)glibc toolchain w/ C++, wchar, dynamic library, headers >= 3.14"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
-- 
1.9.1
