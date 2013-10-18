From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 18 Oct 2013 23:46:00 +0800
Subject: [Buildroot] [PATCH v2 2/2] spice: bump to version 0.12.4
In-Reply-To: <1382111059.30247.1.camel@phoenix>
References: <1382111059.30247.1.camel@phoenix>
Message-ID: <1382111160.30247.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the ChangeLog, spice needs glib2 since 0.12.2.
Thus add libglib2 dependency to fix build error if !BR2_PACKAGE_LIBGLIB2.
Also add a patch to fix trivial build error.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2:
Address Baruch's comment to copy libglib2 dependencies here.
Also add a patch to fix build error when BR2_PACKAGE_SPICE_TUNNEL is enabled.
The patch is merged upstream today.

 package/spice/Config.in                            |  6 +++++
 ...0001-fix-missing-monitor_latency-argument.patch | 28 ++++++++++++++++++++++
 package/spice/spice.mk                             |  2 +-
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 package/spice/spice-0001-fix-missing-monitor_latency-argument.patch

diff --git a/package/spice/Config.in b/package/spice/Config.in
index e9fd639..a0c321c 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,3 +1,6 @@
+comment "spice server needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "spice server depends on python (for pyparsing)"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_PYTHON
@@ -6,9 +9,12 @@ config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_CELT051
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_PYTHON_PYPARSING
diff --git a/package/spice/spice-0001-fix-missing-monitor_latency-argument.patch b/package/spice/spice-0001-fix-missing-monitor_latency-argument.patch
new file mode 100644
index 0000000..e14dd2c
--- /dev/null
+++ b/package/spice/spice-0001-fix-missing-monitor_latency-argument.patch
@@ -0,0 +1,28 @@
+From 0d3767853ca179ce04a9b312d7a30d33d1266a3b Mon Sep 17 00:00:00 2001
+From: Axel Lin <axel.lin@ingics.com>
+Date: Thu, 10 Oct 2013 12:36:40 +0800
+Subject: [PATCH] red_tunnel_worker: Fix build error due to missing monitor_latency argument
+
+Fix missing monitor_latency argument in red_channel_client_create call.
+
+Signed-off-by: Axel Lin <axel.lin@ingics.com>
+---
+ server/red_tunnel_worker.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server/red_tunnel_worker.c b/server/red_tunnel_worker.c
+index 97dcafd..6781d73 100644
+--- a/server/red_tunnel_worker.c
++++ b/server/red_tunnel_worker.c
+@@ -3417,7 +3417,7 @@ static void handle_tunnel_channel_link(RedChannel *channel, RedClient *client,
+     }
+ 
+     tcc = (TunnelChannelClient*)red_channel_client_create(sizeof(TunnelChannelClient),
+-                                                          channel, client, stream,
++                                                          channel, client, stream, FALSE,
+                                                           0, NULL, 0, NULL);
+     if (!tcc) {
+         return;
+-- 
+1.8.1.2
+
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index a016da6..c23b67e 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION         = 0.12.0
+SPICE_VERSION         = 0.12.4
 SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE            = http://www.spice-space.org/download/releases/
 SPICE_LICENSE         = LGPLv2.1+
-- 
1.8.1.2
