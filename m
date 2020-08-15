From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Aug 2020 22:14:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: link with libatomic when
 needed
Message-ID: <20200815201415.3723205-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pistache does not mandatory link with libatomic since
https://github.com/oktal/pistache/commit/4ed3f8e148dae203730139ae3c1c4c87bfc86c02
however the logic is broken due to an unknown issue in CheckAtomic.cmake.

Instead of trying to fix it, just link with -latomic if needed

Fixes:
 - http://autobuild.buildroot.org/results/17f05238a3479f5b0c9ef8f9bb42210f6fc14fff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pistache/pistache.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index 4d6bd283ea..0ca64a05ae 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -18,4 +18,8 @@ else
 PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PISTACHE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 $(eval $(cmake-package))
-- 
2.27.0
