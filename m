From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:46 +0100
Subject: [Buildroot] [PATCH 06/15] perf: allow build against libelf when
	available
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <18f9e31cc74896b5e758cb8d637af0e83df5fab9.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that libelf is available thanks to elfutils (for glibc only),
allow to build perf against it if available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perf/perf.mk |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
