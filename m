From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:46 +0100
Subject: [Buildroot] [PATCH 5/7] lttng-tools: make the dependency on
	lttng-libust optional
In-Reply-To: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cc297d07bc7c92e8c986efe0dde859a7e67436e3.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/Config.in      |    4 +++-
 package/lttng-tools/lttng-tools.mk |    9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index cc74966..3040af6 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LTTNG_MODULES
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_LTTNG_LIBUST
 	help
 	  Userspace utilities for the LTTng 2.0 tracing
 	  infrastructure.
@@ -17,4 +16,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  package for the target, if babeltrace on the target is
 	  interesting.
 
+	  If userspace tracing is desired, you need to enable
+	  lttng-libust.
+
 	  http://lttng.org
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index bcf2f67..8e6fc1a 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -6,8 +6,15 @@ LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 # dependency. However, having the babeltrace utilities built for the
 # host is very useful, since those tools allow to convert the binary
 # trace format into an human readable format.
-LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace lttng-libust
+LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace
 
 LTTNG_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
+LTTNG_TOOLS_CONF_OPT += --enable-lttng-ust
+LTTNG_TOOLS_DEPENDENCIES += lttng-libust
+else
+LTTNG_TOOLS_CONF_OPT += --disable-lttng-ust
+endif
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.4.1
