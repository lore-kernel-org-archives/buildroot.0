From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 08:59:44 +0100
Subject: [Buildroot] [git commit] btrfs-progs: fix static build
Message-ID: <20141128082652.016E07FE3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba3821bcf75a85e2d35e9d96b736f0eb585f53f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libuuid needs -lintl when BR2_NEEDS_GETTEXT_IF_LOCALE is set.

Fixes:
http://autobuild.buildroot.net/results/9f1/9f182cd5955d724750135bcd6cb7e315fb28334f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index d16fa0d..7122df1 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -17,6 +17,10 @@ BTRFS_PROGS_LICENSE_FILES = COPYING
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 BTRFS_PROGS_MAKE_TARGET = static
 BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+# Add -lintl for libuuid
+BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
+endif
 else
 BTRFS_PROGS_MAKE_TARGET = all
 BTRFS_PROGS_MAKE_INSTALL_TARGET = install
