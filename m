From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:47 +0200
Subject: [Buildroot] [PATCH 30/32 v2] package/matchbox-panel: use ACPI for
	the battery applet
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <02cd165fbd70dc0144b7cbb257c09cd953c73886.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is possible to use ACPI to monitor the battery with the battery
mini-applet. If ACPI is not explicitly enabled, then APM is used if
available; if ACPI is not explcitly enabled and APM is not available,
then the battery applet is not built.

However, APM is not really current nowadays, and possibly missing for a
bunch of architecture...

What is a pity is that there is no way to explicitly enable or disable
the applet; it only relies on auto-detection... :-(

So, forcibly use ACPI on platforms that have it, that is x86 (32- and
64-bit) and AArch64.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - force use of ACPI instead of making it an option  (Arnout)
  - fix build of applet  (Arnout)
---
 package/matchbox-panel/0003-mb-applet-battery.patch | 21 +++++++++++++++++++++
 package/matchbox-panel/matchbox-panel.mk            |  7 +++++++
 2 files changed, 28 insertions(+)
 create mode 100644 package/matchbox-panel/0003-mb-applet-battery.patch

diff --git a/package/matchbox-panel/0003-mb-applet-battery.patch b/package/matchbox-panel/0003-mb-applet-battery.patch
new file mode 100644
index 0000000..585eb39
--- /dev/null
+++ b/package/matchbox-panel/0003-mb-applet-battery.patch
@@ -0,0 +1,21 @@
+mb-applet-battery: don't declare line_parse as static
+
+Fix this build failure:
+    mb-applet-battery.c: In function 'read_apm':
+    mb-applet-battery.c:181:2: error: invalid storage class for function 'line_parse'
+
+Reported-by: Arnout Vandecappelle <arnout@mind.be>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN matchbox-panel-0.9.3.orig/applets/mb-applet-battery.c matchbox-panel-0.9.3/applets/mb-applet-battery.c
+--- matchbox-panel-0.9.3.orig/applets/mb-applet-battery.c	2006-02-07 23:27:24.000000000 +0100
++++ matchbox-panel-0.9.3/applets/mb-applet-battery.c	2015-05-02 17:13:00.843578796 +0200
+@@ -177,7 +177,7 @@
+ 		unsigned long	present_rate;
+ 	};
+ 
+-	static int
++	int
+ 	line_parse(char *line, struct entry *e)
+ 	{
+ 		char *ptr;
diff --git a/package/matchbox-panel/matchbox-panel.mk b/package/matchbox-panel/matchbox-panel.mk
index f7d699b..a5da780 100644
--- a/package/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox-panel/matchbox-panel.mk
@@ -20,6 +20,13 @@ else
 MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
 endif
 
+# Using ACPI is only possible on x86 (32- or 64-bit) or AArch64
+ifeq ($(BR2_aarch64)$(BR2_i386)$(BR2_x86_64),y)
+MATCHBOX_PANEL_CONF_OPTS += --enable-acpi-linux
+else
+MATCHBOX_PANEL_CONF_OPTS += --disable-acpi-linux
+endif
+
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
 MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
 endif
-- 
1.9.1
