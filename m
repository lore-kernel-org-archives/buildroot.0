From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 21:38:25 +0200
Subject: [Buildroot] [git commit] Revert "core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set"
Message-ID: <20210704190628.F01438A4D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1c7cff1a081765c082c196bd9e6c1e72ceee797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enabling -DNEBUG, although correct on the paper, causes a lot of
packages to fail to build because they explicitly require not building
with NDEBUG; they use assert() to check actual runtime errors and expect
it to not be elidded away (sometimes with side effects in the arguments
passed to assert().

This reverts commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0, as
discussed on the list:
    http://lists.busybox.net/pipermail/buildroot/2021-July/313646.html

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Makefile.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 955e6a8e8c..86db62ba5b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -148,9 +148,6 @@ endif
 ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
-ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
-TARGET_DEBUGGING += -DNDEBUG
-endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
