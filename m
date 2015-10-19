From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 19 Oct 2015 12:42:09 +0200
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Allow building jq as host utility for use in post-build scripts.
This can be useful to created, edit, merge or even perform syntax checking
on JSON files.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/Config.in.host    |  1 +
 package/jq/Config.in.host | 11 +++++++++++
 package/jq/jq.mk          |  3 +++
 3 files changed, 15 insertions(+)
 create mode 100644 package/jq/Config.in.host

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
-- 
1.9.5
