From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Nov 2013 22:29:05 +0100
Subject: [Buildroot] [git commit] binutils: fix static linking
Message-ID: <20131127213147.BBDEC9BD91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6fa695639b06b475565980e0c99f9f261786e81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-autotools.mk already handles static/shared linking, so no need to
explictly force it. Worse even, the build fails with BR2_PREFER_STATIC_LINK
as we end up calling libtool with --static when it tries to link the .so,
breaking the build:

../ld: attempted static link of dynamic object
`../opcodes/.libs/libopcodes.so'
collect2: error: ld returned 1 exit status

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f1723b2..b3ccee2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -39,7 +39,6 @@ BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 		--host=$(GNU_TARGET_NAME) \
 		--target=$(GNU_TARGET_NAME) \
-		--enable-shared \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Install binutils after busybox to prefer full-blown utilities
