From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:36:23 +0100
Subject: [Buildroot] [git commit] jq: enable host package
Message-ID: <20151025203728.764FE81980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db6fb49e7fcd703f85edddd25dee3d0709a499dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow building jq as host utility for use in post-build scripts.
This can be useful to created, edit, merge or even perform syntax checking
on JSON files.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host    |    1 +
 package/jq/Config.in.host |   11 +++++++++++
 package/jq/jq.mk          |    3 +++
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 1f69687..ce1b6bc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
+	source "package/jq/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/jq/Config.in.host b/package/jq/Config.in.host
new file mode 100644
index 0000000..a0aabc0
--- /dev/null
+++ b/package/jq/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_JQ
+	bool "host jq"
+	help
+	  jq is like sed for JSON data - you can use it to slice and filter
+	  and map and transform structured data with the same ease that sed,
+	  awk, grep and friends let you play with text.
+
+	  As a host tool, jq can be useful to create/edit/merge/check JSON
+	  files from a post-build script.
+
+	  http://stedolan.github.io/jq/
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 8053e39..9a094ba 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -11,8 +11,11 @@ JQ_LICENSE_FILES = COPYING
 
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
+HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
 
 # jq explicitly enables maintainer mode, which we don't need/want
 JQ_CONF_OPTS += --disable-maintainer-mode
+HOST_JQ_CONF_OPTS += --disable-maintainer-mode
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
