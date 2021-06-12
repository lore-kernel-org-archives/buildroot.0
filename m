From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 16:17:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbpf: add
 BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
Message-ID: <20210612141714.520748-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libbpf does not support all architectures, for example ARM is not
supported resulting in the following build failure:

bpf.c:53:4: error: #error __NR_bpf not defined. libbpf does not support your arch.
 #  error __NR_bpf not defined. libbpf does not support your arch.
    ^

Fixes:
 - http://autobuild.buildroot.org/results/288d54100a2e736195a3a04a9e2e035d02ea5c16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbpf/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index c5b24c5eb5..9eadf0254a 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -1,5 +1,15 @@
+config BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
+	bool
+	# see src/bpf.c
+	default y if BR2_arc
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
+
 config BR2_PACKAGE_LIBBPF
 	bool "libbpf"
+	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
@@ -15,6 +25,7 @@ config BR2_PACKAGE_LIBBPF
 	  https://github.com/libbpf/libbpf
 
 comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-- 
2.30.2
