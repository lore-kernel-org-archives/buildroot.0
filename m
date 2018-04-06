From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 22:25:38 +0200
Subject: [Buildroot] [git commit] package/strace: add missing libunwind
 optional dependency
Message-ID: <20180406213419.EF83387828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0577bcb06fc9fdc9e72e7300ee57ad4669ab4ce6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This improve the reproducible build.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: mention the libunwind dependency as being needed for 'strace
-k' in the Config.in help text, as suggested by Thomas De
Schampheleire.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/Config.in | 3 +++
 package/strace/strace.mk | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index b84b3fd179..c7649e5789 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -7,6 +7,9 @@ config BR2_PACKAGE_STRACE
 	  Allows you to track what system calls a program makes
 	  while it is running.
 
+	  If you want 'strace -k' to work, make sure to enable the
+	  'libunwind' package.
+
 	  https://strace.io
 
 comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index f27dc4155b..0529d79af6 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -11,6 +11,13 @@ STRACE_LICENSE = BSD-3-Clause
 STRACE_LICENSE_FILES = COPYING
 STRACE_CONF_OPTS = --enable-mpers=check
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+STRACE_DEPENDENCIES += libunwind
+STRACE_CONF_OPTS += --with-libunwind
+else
+STRACE_CONF_OPTS += --without-libunwind
+endif
+
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
