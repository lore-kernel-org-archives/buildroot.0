From: Yann Droneaud <ydroneaud@opteya.com>
Date: Mon,  2 Sep 2019 08:37:28 +0200
Subject: [Buildroot] [PATCH 2/2] packages/sox: disable stack protector if
 SSP is not enabled
In-Reply-To: <20190902063728.31203-1-ydroneaud@opteya.com>
References: <20190902063728.31203-1-ydroneaud@opteya.com>
Message-ID: <20190902063728.31203-2-ydroneaud@opteya.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, sox link with libssp.so when available.

libssp.so is usually available within builtroot, as it's
provided by almost, if not all, external cross toolchains.

Unfortunately, unlike libgcc_s.so, libssp.so is not copied
on the target filesystem, so it's only available at link
time and not at runtime, hence the following failures on
target:

  $ sox
  sox: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory

  $ rec
  rec: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory

If BR2_SSP_NONE is set, libssp.so is not expected to be copied, so
sox must not use it, and must be configured with --disable-stack-protector.

If BR2_SSP_REGULAR, BR2_SSP_STRONG, or BR2_SSP_ALL is set, as libssp.so
provides __stack_chk_fail, and *_chk symbols, the library should be made
available on target, so sox could use it.

Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
---
 package/sox/sox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 0b3dc136d815..a3d1089bf747 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -13,6 +13,10 @@ SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
 SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
+ifeq ($(BR2_SSP_NONE),y)
+SOX_CONF_OPTS += --disable-stack-protector
+endif
+
 # MIPS Codescape toolchains don't support stack-smashing protection
 # despite of using glibc.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-- 
2.21.0
