From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 23 Apr 2011 18:18:34 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: correctly copy the
	dynamic linker
In-Reply-To: <1303575514-22656-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1303575514-22656-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1303575514-22656-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depending on some setting (which? Arch? Others?), the dynamic linker
can get different names. Some times, it is named ld-linux.something.so,
other times, it is ld.so.1, and maybe other variants as well...

The fix is to always copy ls*.so, even if it is a symlink: we create
the destination file by its SONAME, and if ld*.so matches more than
one file, that's no issue, as they would all get the same SONAME (being
symlinks ones to the others).

Split long lines at the same time.

Reported-by: Ettore Campion <ecampion@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index e52bdee..015cd13 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -36,13 +36,14 @@ endef
 
 #--------------
 # The generic system libraries (in /lib)
-CTNG_LIBS_LIB := libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
+CTNG_LIBS_LIB := ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so    \
+                 libnsl.so libpthread.so libresolv.so librt.so libutil.so
 
 #--------------
 # The libc-specific system libraries (in /lib)
 # Note: it may be needed to tweak the NSS libs in the glibc and eglibc cases...
-CTNG_LIBS_uClibc := ld-uClibc.so
-CTNG_LIBS_glibc  := ld-linux.so libnss_files.so libnss_dns.so
+CTNG_LIBS_uClibc :=
+CTNG_LIBS_glibc  := libnss_files.so libnss_dns.so
 CTNG_LIBS_eglibc := $(CTNG_LIBS_glibc)
 
 #--------------
-- 
1.7.2.3
