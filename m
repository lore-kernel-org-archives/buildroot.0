From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Aug 2015 20:58:34 +0200
Subject: [Buildroot] [PATCH] package/elfutils: fix dependency on C library
Message-ID: <1439060314-23045-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As Thomas puts it:

    The comment can only be visible when a toolchain that is *not*
    uclibc and *not* glibc is used. I.e, the comment is now only visible
    when musl is used. Which is not what we want.

Indeed, I completely borked the conditions. When a glibc or uClibc
toolchain is selected, the comment is entirely hidden, and we don;t get
the extra requirements (wchar, !static).

Fix that with the solution proposed by Thomas.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/avrdude/Config.in    | 4 ++--
 package/elfutils/Config.in   | 4 ++--
 package/kexec-lite/Config.in | 4 ++--
 package/ltrace/Config.in     | 4 ++--
 package/racehound/Config.in  | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 79b26a2..460f155 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -16,6 +16,6 @@ config BR2_PACKAGE_AVRDUDE
 	  https://github.com/kcuzner/avrdude
 
 comment "avrdude needs a uclibc or (e)glibc toolchain w/ threads, wchar, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 	depends on !BR2_bfin
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 19ab8fc..ca93770 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,7 +1,7 @@
 comment "elfutils needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
 	depends on !BR2_bfin
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 6242c46..ede5cba 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -16,5 +16,5 @@ config BR2_PACKAGE_KEXEC_LITE
 
 comment "kexec-lite needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 5576efc..ff4d7bd 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -19,5 +19,5 @@ config BR2_PACKAGE_LTRACE
 	  http://ltrace.org
 
 comment "ltrace needs a uclibc or (e)glibc toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index af56b03..b9c4f36 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -30,6 +30,6 @@ comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on BR2_i386 || BR2_x86_64
 
 comment "racehound needs a uClibc or (e)glibc toolchain w/ C++, wchar, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-- 
1.9.1
