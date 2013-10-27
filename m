From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 11:58:11 +0100
Subject: [Buildroot] [git commit] jq: new package
Message-ID: <20131027110546.B6FE29BC06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=632fbed88dc91d882519a98d7cba91047cefc9c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jq is like sed for JSON data - you can use it to slice and filter
and map and transform structured data with the same ease that sed,
awk, grep and friends let you play with text.

[Peter: fix license, add flex/bison deps, force c99]
Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in    |    1 +
 package/jq/Config.in |    8 ++++++++
 package/jq/jq.mk     |   17 +++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 32be4d9..4c4da51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -108,6 +108,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
 endif
 source "package/intltool/Config.in"
+source "package/jq/Config.in"
 source "package/libtool/Config.in"
 source "package/m4/Config.in"
 source "package/make/Config.in"
diff --git a/package/jq/Config.in b/package/jq/Config.in
new file mode 100644
index 0000000..9329b2f
--- /dev/null
+++ b/package/jq/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_JQ
+	bool "jq"
+	help
+	  jq is like sed for JSON data - you can use it to slice and filter
+	  and map and transform structured data with the same ease that sed,
+	  awk, grep and friends let you play with text.
+
+	  http://stedolan.github.io/jq/
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
new file mode 100644
index 0000000..8d4f24f
--- /dev/null
+++ b/package/jq/jq.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# jq
+#
+################################################################################
+
+JQ_VERSION = jq-1.3
+JQ_SITE = http://github.com/stedolan/jq/tarball/$(JQ_VERSION)
+JQ_AUTORECONF = YES
+JQ_DEPENDENCIES = host-flex host-bison
+JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
+JQ_LICENSE_FILES = COPYING
+
+# uses c99 specific features
+JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
+
+$(eval $(autotools-package))
