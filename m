From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 21:21:22 +0100
Subject: [Buildroot] [git commit] poco: avoid build failures on multicore
	hosts
Message-ID: <20170120202351.C72FF819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=126162b9159a185ac1897db1a9956f0379fc1428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Parallel build still fails on heavilly multicore machines (e.g. -j25)
and hacks likecommit 32f4957b153bdabe7af60d529942aca7d1a4783d do not
seem to be effective.

Let's simply use MAKE1 for the build step, instead.

Fixes:
http://autobuild.buildroot.net/results/388/38834ad3013fe79e5e4f75997133f1bd827be6dc

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/poco.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 4b82c50..90dfb34 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -57,8 +57,9 @@ define POCO_CONFIGURE_CMDS
 		--no-samples)
 endef
 
+# Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
 define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
 		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
