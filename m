From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 19 Nov 2009 06:47:38 -0600
Subject: [Buildroot] Documentation support
In-Reply-To: <200911181711.25352.minimod@morethan.org>
References: <200911181711.25352.minimod@morethan.org>
Message-ID: <200911190647.40852.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed November 18 2009, Michael S. Zick wrote:
> 
> Is there a way to "turn on" the "man" utility in BB
> when the buildroot option to store man pages in the
> target is selected?
> 

In answer to my own question. . . 
The short answer: Yes

The longer answer:
Signed-off-by: Michael S. Zick <minimod@morethan.org>

diff --git a/Config.in b/Config.in
index 6967d25..da3fc14 100644
--- a/Config.in
+++ b/Config.in
@@ -318,6 +318,16 @@ config BR2_HAVE_MANPAGES
 	  If you say n here, your target will not contain any
 	  manpage.
 
+config BR2_USE_PACKAGE_BUSYBOX_MAN
+	bool "use Busybox man page reader"
+	depends on BR2_HAVE_MANPAGES
+	default n
+	help
+	  Enables the man utility in the BusyBox configuration.
+
+	  Not required if your build includes another way to
+	  use man pages on the target.
+
 config BR2_HAVE_INFOPAGES
 	bool "infopages on the target"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 187a06a..d207074 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -77,6 +77,10 @@ ifeq ($(BR2_INET_RPC),y)
 else
 	$(SED) "s/^.*CONFIG_FEATURE_MOUNT_NFS.*/CONFIG_FEATURE_MOUNT_NFS=n/;" $(BUSYBOX_DIR)/.config
 endif
+ifeq ($(BR2_USE_PACKAGE_BUSYBOX_MAN),y)
+	# force man utility on
+	$(SED) "s/^.*CONFIG_MAN.*/CONFIG_MAN=y/" $(BUSYBOX_DIR)/.config
+endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_MKSTATIC),y)
 	# force static build on
 	$(SED) "s/^.*CONFIG_STATIC.*/CONFIG_STATIC=y/" $(BUSYBOX_DIR)/.config
