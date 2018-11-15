From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 15 Nov 2018 11:44:28 -0600
Subject: [Buildroot] [PATCH 3/3] package/xen: tools/xenpmd: fix possible
 truncation
In-Reply-To: <1542303868-39761-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542303868-39761-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1542303868-39761-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc-8 complains:
    xenpmd.c:207:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
             strncpy(info->oem_info, attrib_value, 32);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upstream:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=938c8f53b1f80175c6f7a1399efdb984abb0cb8b

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Bug found while fixing:
http://autobuild.buildroot.net/results/6e0d8e962e861a32f5bf2e5031ef51c25768f1f6/
---
 package/xen/0004-tools-xenpmd-truncation.patch | 74 ++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 package/xen/0004-tools-xenpmd-truncation.patch

diff --git a/package/xen/0004-tools-xenpmd-truncation.patch b/package/xen/0004-tools-xenpmd-truncation.patch
new file mode 100644
index 0000000..067ca9b
--- /dev/null
+++ b/package/xen/0004-tools-xenpmd-truncation.patch
@@ -0,0 +1,74 @@
+iFrom 938c8f53b1f80175c6f7a1399efdb984abb0cb8b Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Marek=20Marczykowski-G=C3=B3recki?=
+ <marmarek@invisiblethingslab.com>
+Date: Thu, 5 Apr 2018 03:50:53 +0200
+Subject: [PATCH] tools/xenpmd: fix possible '\0' truncation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+gcc-8 complains:
+    xenpmd.c:207:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
+             strncpy(info->oem_info, attrib_value, 32);
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+    xenpmd.c:201:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
+             strncpy(info->battery_type, attrib_value, 32);
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+    xenpmd.c:195:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
+             strncpy(info->serial_number, attrib_value, 32);
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+    xenpmd.c:189:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
+             strncpy(info->model_number, attrib_value, 32);
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Copy 31 chars, then make sure terminating '\0' is present. Those fields
+are passed to strlen and as '%s' for snprintf later.
+
+Signed-off-by: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+Release-Acked-by: Juergen Gross <jgross@suse.com>
+---
+ tools/xenpmd/xenpmd.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
+index 689c8fd670..56412a9a81 100644
+--- a/tools/xenpmd/xenpmd.c
++++ b/tools/xenpmd/xenpmd.c
+@@ -186,25 +186,29 @@ void set_attribute_battery_info(char *attrib_name,
+ 
+     if ( strstr(attrib_name, "model number") ) 
+     {
+-        strncpy(info->model_number, attrib_value, 32);
++        strncpy(info->model_number, attrib_value, 31);
++        info->model_number[31] = '\0';
+         return;
+     }
+ 
+     if ( strstr(attrib_name, "serial number") ) 
+     {
+-        strncpy(info->serial_number, attrib_value, 32);
++        strncpy(info->serial_number, attrib_value, 31);
++        info->serial_number[31] = '\0';
+         return;
+     }
+ 
+     if ( strstr(attrib_name, "battery type") ) 
+     {
+-        strncpy(info->battery_type, attrib_value, 32);
++        strncpy(info->battery_type, attrib_value, 31);
++        info->battery_type[31] = '\0';
+         return;
+     }
+ 
+     if ( strstr(attrib_name, "OEM info") ) 
+     {
+-        strncpy(info->oem_info, attrib_value, 32);
++        strncpy(info->oem_info, attrib_value, 31);
++        info->oem_info[31] = '\0';
+         return;
+     }
+ 
+-- 
+2.11.0
+
-- 
1.9.1
