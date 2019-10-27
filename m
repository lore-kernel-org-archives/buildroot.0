From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:35:06 +0100
Subject: [Buildroot] [git commit] package/zmqpp: don't override variable
Message-ID: <20191027092901.932CA88C71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3934a287567661bd56fe067ae258d4a3eab8a3e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of reseting the variable when we can't set it, just set it when
we can: we just have to negate the condition.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zmqpp/zmqpp.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index ea6b50e826..3cd19d644a 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -12,15 +12,14 @@ ZMQPP_LICENSE = MPL-2.0
 ZMQPP_LICENSE_FILES = LICENSE
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
-ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),debug,release)
 
 # gcc bug internal compiler error: in merge_overlapping_regs, at
 # regrename.c:304. This bug is fixed since gcc 6.
 # By setting CONFIG to empty, all optimizations such as -funroll-loops
-# -ffast-math -finline-functions -fomit-frame-pointer are disabled
-ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
-# check-package OverriddenVariable
-ZMQPP_CONFIG =
+# -ffast-math -finline-functions -fomit-frame-pointer are disabled,
+# so only set CONFIG for the non-affected cases.
+ifneq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
+ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),debug,release)
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
