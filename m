From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Aug 2020 23:31:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez-tools: fix build with gcc 10
Message-ID: <20200826213134.408126-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/2641cea0483c5f6b65ece8016d546ee9bea0d7d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../bluez-tools/0001-fix-gcc-10-compile.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/bluez-tools/0001-fix-gcc-10-compile.patch

diff --git a/package/bluez-tools/0001-fix-gcc-10-compile.patch b/package/bluez-tools/0001-fix-gcc-10-compile.patch
new file mode 100644
index 0000000000..028c2db69d
--- /dev/null
+++ b/package/bluez-tools/0001-fix-gcc-10-compile.patch
@@ -0,0 +1,46 @@
+From 687105d611b38961f390f0a328f9cfa3b93aeb18 Mon Sep 17 00:00:00 2001
+From: Leigh Scott <leigh123linux@gmail.com>
+Date: Tue, 28 Jan 2020 22:46:37 +0000
+Subject: [PATCH] fix gcc-10 compile
+
+[Retrieved from:
+https://github.com/khvzak/bluez-tools/pull/34/commits/687105d611b38961f390f0a328f9cfa3b93aeb18]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lib/agent-helper.c | 2 ++
+ src/lib/agent-helper.h | 4 ++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/agent-helper.c b/src/lib/agent-helper.c
+index bf50bcc..2b94100 100644
+--- a/src/lib/agent-helper.c
++++ b/src/lib/agent-helper.c
+@@ -33,6 +33,8 @@
+ 
+ #include "agent-helper.h"
+ 
++gboolean agent_need_unregister;
++
+ static const gchar *_bt_agent_introspect_xml = "<node name=\"/org/blueztools\">\n\t<interface name=\"org.bluez.Agent1\">\n\t\t<method name=\"Release\">\n\t\t</method>\n\t\t<method name=\"RequestPinCode\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"pincode\" direction=\"out\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"DisplayPinCode\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"pincode\" direction=\"in\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"RequestPasskey\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"out\" type=\"u\"/>\n\t\t</method>\n\t\t<method name=\"DisplayPasskey\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"in\" type=\"u\"/>\n\t\t\t<arg name=\"entered\" direction=\"in\" type=\"q\"/>\n\t\t</method>\n\t\t<method name=\"RequestConfirmation\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"in\" type=\"u\"/>\n\t\t</method>\n\t\t<method name=\"RequestAuthorization\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t</method>\n\t\t<method name=\"AuthorizeService\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"uuid\" direction=\"in\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"Cancel\">\n\t\t</method>\n\t</interface>\n</node>\n";
+ static guint _bt_agent_registration_id = 0;
+ static GHashTable *_pin_hash_table = NULL;
+diff --git a/src/lib/agent-helper.h b/src/lib/agent-helper.h
+index 8e1cc85..9a952c4 100644
+--- a/src/lib/agent-helper.h
++++ b/src/lib/agent-helper.h
+@@ -35,7 +35,7 @@ extern "C" {
+ #define AGENT_DBUS_INTERFACE "org.bluez.Agent1"
+ #define AGENT_PATH "/org/blueztools"
+ 
+-gboolean agent_need_unregister;
++extern gboolean agent_need_unregister;
+ 
+ void register_agent_callbacks(gboolean interactive_console, GHashTable *pin_dictonary, gpointer main_loop_object, GError **error);
+ void unregister_agent_callbacks(GError **error);
+@@ -44,4 +44,4 @@ void unregister_agent_callbacks(GError **error);
+ }
+ #endif
+ 
+-#endif /* __AGENT_HELPER_H */
+\ No newline at end of file
++#endif /* __AGENT_HELPER_H */
-- 
2.28.0
