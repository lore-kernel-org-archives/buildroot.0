From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Oct 2011 23:19:10 +0200
Subject: [Buildroot] [git commit] binutils: build host version statically
Message-ID: <20111002212757.9FFCB8DA6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1c10778092702f8856c1cc92126ef9801952d74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we end up with libbfd/libopcodes in host/usr/$BUILD/$TARGET/lib,
used by the binaries. Unfortunately it also adds rpaths, which first look
in the build directory before here, causing trouble if the toolchain is
used outside BR (E.G. for a SDK) and the build directory location reused
for another incompatible build (E.G. another ARCH), as the binutils
binaries then end up using the wrong libs.

Fix it by linking statically instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/binutils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 2d60ce0..5123568 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -30,6 +30,7 @@ endif
 # We just keep the convention of "host utility" for now
 HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			--target=$(REAL_GNU_TARGET_NAME) \
+			--disable-shared --enable-static \
 			$(BR2_CONFIGURE_STAGING_SYSROOT) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
