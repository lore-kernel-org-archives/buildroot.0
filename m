From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:13:48 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/dc3dd: disable on
 riscv32
Message-ID: <20210610194753.C04F086F8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=003645e00718cf1408003b9ad435dafa927d91f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Disable dc3dd on riscv32 because of the size of time_t (riscv32 has
never had a 32-bit time, and has always been 64-bit from the onset):

        In file included from getdate.y:40:
        verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
          132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
              |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        verify.h:138:61: note: in expansion of macro 'verify_true'
          138 | # define verify(R) extern int (* verify_function__ (void)) [verify_true (R)]
              |                                                             ^~~~~~~~~~~
        getdate.y:116:1: note: in expansion of macro 'verify'
          116 | verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
              | ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/267151dec9d2328a5f8c61ddf224219a4f617e5c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6b9d2ab4555efd7a2ee04d0437b1308cb5098052)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index 0383897cd5..715451beb7 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_DC3DD
 	  https://sourceforge.net/projects/dc3dd/
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
+	depends on !BR2_RISCV_32
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_MUSL
