From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:39:55 +0100
Subject: [Buildroot] [git commit] perf: allow build against libelf when
	available
Message-ID: <20130107212531.274379A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69030ca5c9324a36ecaf55aa3b23bfa5443b2c8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that libelf is available thanks to elfutils (for glibc only),
allow to build perf against it if available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perf/perf.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 2aef900..eed30a2 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -12,8 +12,6 @@ PERF_DEPENDENCIES = linux
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
-	NO_LIBELF=1 \
-	NO_DWARF=1 \
 	NO_LIBAUDIT=1 \
 	NO_NEWT=1 \
 	NO_GTK2=1 \
@@ -23,6 +21,12 @@ PERF_MAKE_FLAGS = \
 	prefix=/usr \
 	WERROR=0
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+	PERF_DEPENDENCIES += elfutils
+else
+	PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
+endif
+
 define PERF_BUILD_CMDS
 	$(MAKE) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D)
