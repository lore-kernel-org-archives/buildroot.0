From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 20 Jan 2017 16:18:54 -0200
Subject: [Buildroot] [PATCH] poco: avoid build failures on multicore hosts
Message-ID: <1484936334-19116-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallel build still fails on heavilly multicore machines (e.g. -j25)
and hacks likecommit 32f4957b153bdabe7af60d529942aca7d1a4783d do not
seem to be effective.

Let's simply use MAKE1 for the build step, instead.

Fixes:
http://autobuild.buildroot.net/results/388/38834ad3013fe79e5e4f75997133f1bd827be6dc

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

---
Extra information: here at DATACOM we have a build farm with several
multicore blades that usually build with "make -j25". With this setup we
have been observing compilation failures each two days.

Change-Id: If80cd0b01ceb8b0aee886ea96a266fa864fa8eb0
---
 package/poco/poco.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 79452c0..54ec701 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -57,8 +57,9 @@ define POCO_CONFIGURE_CMDS
 		--no-samples)
 endef
 
+# Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
 define POCO_BUILD_CMDS
-	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
 		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
-- 
2.7.4
