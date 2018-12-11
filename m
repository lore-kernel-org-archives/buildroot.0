From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Dec 2018 17:13:44 +0100
Subject: [Buildroot] [PATCH] package/lua-cqueues: needs host-m4
Message-ID: <20181211161344.1481-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lua-cqueues build system uses m4 during the build:

cd /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src && m4 /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src/errno.c.m4 >| /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src/errno.c.tmp

Therefore, the package should depend on host-m4. This has been
detected using per-package directory support, but a minimal defconfig
with just lua and lua-cqueues on a system that doesn't have m4
installed system-wide also exhibits the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-cqueues/lua-cqueues.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index 4f4be1e049..4f31c3277f 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -8,7 +8,7 @@ LUA_CQUEUES_VERSION = rel-20161215
 LUA_CQUEUES_SITE = $(call github,wahern,cqueues,$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
-LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl
+LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl host-m4
 
 define LUA_CQUEUES_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-- 
2.19.2
