From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Apr 2012 11:36:22 -0300
Subject: [Buildroot] [PATCH 2/2] ushare: new package
In-Reply-To: <1334154982-23530-1-git-send-email-gustavo@zacarias.com.ar>
References: <1334154982-23530-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1334154982-23530-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

UPnP media streamer.

TODO: Add DLNA support (libdlna) if there's interest.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                         |    1 +
 package/ushare/Config.in                  |   13 ++
 package/ushare/ushare-compile-fixes.patch |  206 +++++++++++++++++++++++++++++
 package/ushare/ushare.mk                  |   31 +++++
 4 files changed, 251 insertions(+), 0 deletions(-)
 create mode 100644 package/ushare/Config.in
 create mode 100644 package/ushare/ushare-compile-fixes.patch
 create mode 100644 package/ushare/ushare.mk

diff --git a/package/Config.in b/package/Config.in
index aee6fc9..486ddf5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -528,6 +528,7 @@ source "package/tn5250/Config.in"
 source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
+source "package/ushare/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
 source "package/vtun/Config.in"
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
new file mode 100644
index 0000000..a714fa0
--- /dev/null
+++ b/package/ushare/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_USHARE
+	bool "ushare"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBUPNP
+	help
+	  uShare is a UPnP (TM) A/V & DLNA Media Server.
+	  It implements the server component that provides UPnP media devices
+	  with information on available multimedia files.
+
+	  http://ushare.geexbox.org/
+
+comment "ushare requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/ushare/ushare-compile-fixes.patch b/package/ushare/ushare-compile-fixes.patch
new file mode 100644
index 0000000..cfdf5e3
--- /dev/null
+++ b/package/ushare/ushare-compile-fixes.patch
@@ -0,0 +1,206 @@
+Patch nixed from OpenWRT svn to fix build breakage.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/src/cds.c
++++ b/src/cds.c
+@@ -20,6 +20,8 @@
+  */
+ 
+ #include <stdlib.h>
++#include <stdio.h>
++#include <string.h>
+ #include <upnp/upnp.h>
+ #include <upnp/upnptools.h>
+ 
+--- a/src/http.c
++++ b/src/http.c
+@@ -25,6 +25,7 @@
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <errno.h>
+ 
+@@ -77,8 +78,7 @@ set_info_file (struct File_Info *info, c
+   info->content_type = ixmlCloneDOMString (content_type);
+ }
+ 
+-static int
+-http_get_info (const char *filename, struct File_Info *info)
++int http_get_info (const char *filename, struct File_Info *info)
+ {
+   extern struct ushare_t *ut;
+   struct upnp_entry_t *entry = NULL;
+@@ -197,8 +197,7 @@ get_file_memory (const char *fullpath, c
+   return ((UpnpWebFileHandle) file);
+ }
+ 
+-static UpnpWebFileHandle
+-http_open (const char *filename, enum UpnpOpenFileMode mode)
++UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode)
+ {
+   extern struct ushare_t *ut;
+   struct upnp_entry_t *entry = NULL;
+@@ -251,8 +250,7 @@ http_open (const char *filename, enum Up
+   return ((UpnpWebFileHandle) file);
+ }
+ 
+-static int
+-http_read (UpnpWebFileHandle fh, char *buf, size_t buflen)
++int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen)
+ {
+   struct web_file_t *file = (struct web_file_t *) fh;
+   ssize_t len = -1;
+@@ -286,8 +284,7 @@ http_read (UpnpWebFileHandle fh, char *b
+   return len;
+ }
+ 
+-static int
+-http_write (UpnpWebFileHandle fh __attribute__((unused)),
++int http_write (UpnpWebFileHandle fh __attribute__((unused)),
+             char *buf __attribute__((unused)),
+             size_t buflen __attribute__((unused)))
+ {
+@@ -296,8 +293,7 @@ http_write (UpnpWebFileHandle fh __attri
+   return 0;
+ }
+ 
+-static int
+-http_seek (UpnpWebFileHandle fh, off_t offset, int origin)
++int http_seek (UpnpWebFileHandle fh, off_t offset, int origin)
+ {
+   struct web_file_t *file = (struct web_file_t *) fh;
+   off_t newpos = -1;
+@@ -371,8 +367,7 @@ http_seek (UpnpWebFileHandle fh, off_t o
+   return 0;
+ }
+ 
+-static int
+-http_close (UpnpWebFileHandle fh)
++int http_close (UpnpWebFileHandle fh)
+ {
+   struct web_file_t *file = (struct web_file_t *) fh;
+ 
+@@ -402,13 +397,3 @@ http_close (UpnpWebFileHandle fh)
+ 
+   return 0;
+ }
+-
+-struct UpnpVirtualDirCallbacks virtual_dir_callbacks =
+-  {
+-    http_get_info,
+-    http_open,
+-    http_read,
+-    http_write,
+-    http_seek,
+-    http_close
+-  };
+--- a/src/http.h
++++ b/src/http.h
+@@ -25,6 +25,18 @@
+ #include <upnp/upnp.h>
+ #include <upnp/upnptools.h>
+ 
+-struct UpnpVirtualDirCallbacks virtual_dir_callbacks;
++int http_get_info (const char *filename, struct File_Info *info);
++
++UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode);
++
++int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen);
++
++int http_seek (UpnpWebFileHandle fh, off_t offset, int origin);
++
++int http_write (UpnpWebFileHandle fh __attribute__((unused)),
++	char *buf __attribute__((unused)),
++	size_t buflen __attribute__((unused)));
++
++int http_close (UpnpWebFileHandle fh);
+ 
+ #endif /* _HTTP_H_ */
+--- a/src/ushare.c
++++ b/src/ushare.c
+@@ -188,7 +188,7 @@ handle_action_request (struct Upnp_Actio
+   if (strcmp (request->DevUDN + 5, ut->udn))
+     return;
+ 
+-  ip = request->CtrlPtIPAddr.s_addr;
++  ip = (*(struct sockaddr_in *)&request->CtrlPtIPAddr).sin_addr.s_addr;
+   ip = ntohl (ip);
+   sprintf (val, "%d.%d.%d.%d",
+            (ip >> 24) & 0xFF, (ip >> 16) & 0xFF, (ip >> 8) & 0xFF, ip & 0xFF);
+@@ -348,13 +348,23 @@ init_upnp (struct ushare_t *ut)
+ 
+   UpnpEnableWebserver (TRUE);
+ 
+-  res = UpnpSetVirtualDirCallbacks (&virtual_dir_callbacks);
+-  if (res != UPNP_E_SUCCESS)
+-  {
+-    log_error (_("Cannot set virtual directory callbacks\n"));
+-    free (description);
+-    return -1;
+-  }
++#define upnp_set_callback(cb, func) \
++  do {                                                            \
++    res = UpnpVirtualDir_set_##cb##Callback(func);                \
++    if (res != UPNP_E_SUCCESS)                                    \
++    {                                                             \
++      log_error (_("Cannot set virtual directory callbacks\n"));  \
++      free (description);                                         \
++      return -1;                                                  \
++    }                                                             \
++  } while(0)
++
++  upnp_set_callback(GetInfo, http_get_info);
++  upnp_set_callback(Open,    http_open);
++  upnp_set_callback(Read,    http_read);
++  upnp_set_callback(Seek,    http_seek);
++  upnp_set_callback(Write,   http_write);
++  upnp_set_callback(Close,   http_close);
+ 
+   res = UpnpAddVirtualDir (VIRTUAL_DIR);
+   if (res != UPNP_E_SUCCESS)
+--- a/src/cms.c
++++ b/src/cms.c
+@@ -20,6 +20,8 @@
+  */
+ 
+ #include <stdlib.h>
++#include <stdio.h>
++#include <string.h>
+ #include <upnp/upnp.h>
+ #include <upnp/upnptools.h>
+ 
+--- a/src/mime.c
++++ b/src/mime.c
+@@ -20,6 +20,7 @@
+  */
+ 
+ #include <stdlib.h>
++#include <stdio.h>
+ #include <string.h>
+ 
+ #include "mime.h"
+--- a/src/presentation.c
++++ b/src/presentation.c
+@@ -19,6 +19,8 @@
+  */
+ 
+ #include <stdlib.h>
++#include <stdio.h>
++#include <string.h>
+ 
+ #if HAVE_LANGINFO_CODESET
+ # include <langinfo.h>
+--- a/src/services.c
++++ b/src/services.c
+@@ -20,6 +20,8 @@
+  */
+ 
+ #include <stdlib.h>
++#include <stdio.h>
++#include <string.h>
+ #include <upnp/upnp.h>
+ #include <upnp/upnptools.h>
+ 
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
new file mode 100644
index 0000000..b61b525
--- /dev/null
+++ b/package/ushare/ushare.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# ushare
+#
+#############################################################
+
+USHARE_VERSION = 1.1a
+USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
+USHARE_SITE = http://ushare.geexbox.org/releases
+USHARE_DEPENDENCIES = host-pkg-config libupnp
+
+define USHARE_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure --prefix=/usr $(DISABLE_NLS) --cross-compile \
+		--cross-prefix="$(TARGET_CROSS)" --sysconfdir=/etc \
+		--disable-strip --disable-debug \
+	)
+endef
+
+define USHARE_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define USHARE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	rm -f $(TARGET_DIR)/etc/init.d/ushare
+endef
+
+# Even though configure is called it's not autoconf
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
