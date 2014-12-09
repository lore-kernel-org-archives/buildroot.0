From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Dec 2014 14:29:35 +0100
Subject: [Buildroot] [git commit] package/musl: fix C library installation
	directory
Message-ID: <20141209133124.503DA800B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c492abf96e9e022d717e1902501056b7b614c388
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set the installation path for the libraries to /lib instead of /usr/lib.

This fixes an issue when building a toolchain with the musl library by
the internal toolchain backend of Buildroot in the first step and import this
toolchain later as a custom external toolchain in a second step. For this use
case check-musl in toolchain/helpers.mk failed because it did not find the
libc or libm in sysroot/lib.

This patch superseeds: [PATCH 1/1] toolchain/helpers.mk: fix check-musl
http://patchwork.ozlabs.org/patch/417587/

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index fb4327d..3a45575 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -27,6 +27,7 @@ define MUSL_CONFIGURE_CMDS
 			--target=$(GNU_TARGET_NAME) \
 			--host=$(GNU_TARGET_NAME) \
 			--prefix=/usr \
+			--libdir=/lib \
 			--disable-gcc-wrapper)
 endef
 
