From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  2 Nov 2016 02:55:07 -0400
Subject: [Buildroot] [PATCH v4 3/4] lttng-babeltrace: add host Babeltrace as
	host utility
In-Reply-To: <20161102065508.3162-1-eeppeliteloop@gmail.com>
References: <20161102065508.3162-1-eeppeliteloop@gmail.com>
Message-ID: <20161102065508.3162-4-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although Babeltrace is available for all major Linux distributions, some
of them have a quite old version of this project.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
Changes v3 -> v4:
  - Config.in.host: remove paragraph about the fact that you can
    transfer traces on the host and use a host Babeltrace (as requested
    by Yann).

 package/Config.in.host                       |  1 +
 package/lttng-babeltrace/Config.in           |  6 ++++--
 package/lttng-babeltrace/Config.in.host      | 14 ++++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk |  1 +
 4 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 package/lttng-babeltrace/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index e33cbb5..3b115c5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -22,6 +22,7 @@ menu "Host utilities"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
+	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mke2img/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 2e8d778..95b635d 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -20,8 +20,10 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  Having this tool on the target is not mandatory. You can
 	  transfer the binary trace output from the target to your
-	  development workstation, and use babeltrace here. Babeltrace
-	  is packaged for all major Linux distributions.
+	  development workstation, and use babeltrace here.
+
+	  See the lttng-babeltrace host utility to install Babeltrace
+	  on the host.
 
 	  http://diamon.org/babeltrace
 
diff --git a/package/lttng-babeltrace/Config.in.host b/package/lttng-babeltrace/Config.in.host
new file mode 100644
index 0000000..71b9c7d
--- /dev/null
+++ b/package/lttng-babeltrace/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_LTTNG_BABELTRACE
+	bool "host lttng-babeltrace"
+	help
+	  The Babeltrace project provides trace read and write
+	  libraries, as well as a trace converter application. Plugins
+	  can be created for any trace format to allow its conversion
+	  to/from another trace format.
+
+	  Babeltrace is the reference implementation of the Common
+	  Trace Format (see <http://diamon.org/ctf/>). Babeltrace
+	  can decode and display LTTng traces, since the latter are
+	  written using the CTF format.
+
+	  http://diamon.org/babeltrace
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 291a561..deb2d07 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -13,6 +13,7 @@ LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
 LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
 HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
 	host-popt host-util-linux host-libglib2 host-pkgconf
+HOST_LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
