From: Frank Bergmann <frank@frajasalo.de>
Date: Sat, 15 Feb 2014 19:52:01 +0100
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: fix missing fallocate64() on
	nios2
In-Reply-To: <52FFA40D.1040100@rosho.de>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>
 <52FFA40D.1040100@rosho.de>
Message-ID: <52FFB751.1090903@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nios2 is currently missing the fallocate64 system call. Because of
compiling the e2fsprogs package with _FILE_OFFSET_BITS=64 the fallocate
call is replaced by fallocate64 by the glibc. Therefor fallocate is
entirely disbaled while configuring the package.

e4defrag have to be disabled because it declares the fallocate64 but
the library have its own defined.

It fixes an autobuilder issue:
http://autobuild.buildroot.org/results/70a/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/

Signed-off-by: Frank Bergmann <frank@frajasalo.de>
---
  package/e2fsprogs/Config.in    | 2 +-
  package/e2fsprogs/e2fsprogs.mk | 3 ++-
  2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 7775e94..1e87aef 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -49,7 +49,7 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO

  config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
         bool "e4defrag"
-       depends on !BR2_avr32 # fallocate not implemented
+       depends on !BR2_avr32 && !BR2_nios2 # fallocate not implemented

  config BR2_PACKAGE_E2FSPROGS_FILEFRAG
         bool "filefrag"
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 2eb59f5..310f549 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -23,7 +23,8 @@ E2FSPROGS_CONF_OPT = \
         --disable-libuuid \
         --enable-fsck \
         --disable-e2initrd-helper \
-       --disable-testio-debug
+       --disable-testio-debug \
+       $(if $(BR2_nios2),ac_cv_func_fallocate=no,)

  E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux

-- 
1.8.3.1
