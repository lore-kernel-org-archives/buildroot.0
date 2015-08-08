From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:12 -0000
Subject: [Buildroot] [git commit branch/next] package/gcc: fix libgcc build
	for xtensa
Message-ID: <20150808105641.2360780414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c44cf2cc97df1729577263d2b0cb5263e8cdc4c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

xtensa libgcc can't be built with -mtext-section-literals flag, now
coming from TARGET_CFLAGS, because it needs to emit literals to
.init/.fini sections, which is not currently supported.

Filter -mtext-section-literals flag out of GCC_COMMON_TARGET_CFLAGS.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index accb429..501fcea 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -112,6 +112,13 @@ GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
 endif
 endif
 
+# Xtensa libgcc can't be built with -mtext-section-literals
+# because of the trick used to generate .init/.fini sections.
+ifeq ($(BR2_xtensa),y)
+GCC_COMMON_TARGET_CFLAGS = $(filter-out -mtext-section-literals,$(TARGET_CFLAGS))
+GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mtext-section-literals,$(TARGET_CXXFLAGS))
+endif
+
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
