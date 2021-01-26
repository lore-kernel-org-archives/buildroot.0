From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 18:08:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/ushare: bump to release 2.0
In-Reply-To: <20210126063332.1449469-1-fontaine.fabrice@gmail.com>
References: <20210126063332.1449469-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126170805.GU2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-26 07:33 +0100, Fabrice Fontaine spake thusly:
> As suggested by Yann E. Morin, switch to an active fork with all our
> patches as upstream seems pretty dead, and they even acknowledge that
> status:
> 
>     https://ushare.geexbox.org/
> 
>     By lack of spare time, motivation and interest, uShare development
>     is currently discontinued (this may change though). Don't expect
>     release anytime soon :-(
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ushare/0001-compile-fixes.patch       | 206 ---------
>  ...002-ushare-fix-building-with-gcc-5.x.patch |  49 --
>  ...fig-h-before-checking-for-CONFIG-NLS.patch |  42 --
>  .../0004-switch-to-libupnp-1.14.x-API.patch   | 433 ------------------
>  package/ushare/ushare.hash                    |   2 +-
>  package/ushare/ushare.mk                      |   5 +-
>  6 files changed, 3 insertions(+), 734 deletions(-)
>  delete mode 100644 package/ushare/0001-compile-fixes.patch
>  delete mode 100644 package/ushare/0002-ushare-fix-building-with-gcc-5.x.patch
>  delete mode 100644 package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch
>  delete mode 100644 package/ushare/0004-switch-to-libupnp-1.14.x-API.patch
> 
> diff --git a/package/ushare/0001-compile-fixes.patch b/package/ushare/0001-compile-fixes.patch
> deleted file mode 100644
> index cfdf5e3404..0000000000
> --- a/package/ushare/0001-compile-fixes.patch
> +++ /dev/null
> @@ -1,206 +0,0 @@
> -Patch nixed from OpenWRT svn to fix build breakage.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> ---- a/src/cds.c
> -+++ b/src/cds.c
> -@@ -20,6 +20,8 @@
> -  */
> - 
> - #include <stdlib.h>
> -+#include <stdio.h>
> -+#include <string.h>
> - #include <upnp/upnp.h>
> - #include <upnp/upnptools.h>
> - 
> ---- a/src/http.c
> -+++ b/src/http.c
> -@@ -25,6 +25,7 @@
> - #include <errno.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> -+#include <string.h>
> - #include <unistd.h>
> - #include <errno.h>
> - 
> -@@ -77,8 +78,7 @@ set_info_file (struct File_Info *info, c
> -   info->content_type = ixmlCloneDOMString (content_type);
> - }
> - 
> --static int
> --http_get_info (const char *filename, struct File_Info *info)
> -+int http_get_info (const char *filename, struct File_Info *info)
> - {
> -   extern struct ushare_t *ut;
> -   struct upnp_entry_t *entry = NULL;
> -@@ -197,8 +197,7 @@ get_file_memory (const char *fullpath, c
> -   return ((UpnpWebFileHandle) file);
> - }
> - 
> --static UpnpWebFileHandle
> --http_open (const char *filename, enum UpnpOpenFileMode mode)
> -+UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode)
> - {
> -   extern struct ushare_t *ut;
> -   struct upnp_entry_t *entry = NULL;
> -@@ -251,8 +250,7 @@ http_open (const char *filename, enum Up
> -   return ((UpnpWebFileHandle) file);
> - }
> - 
> --static int
> --http_read (UpnpWebFileHandle fh, char *buf, size_t buflen)
> -+int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen)
> - {
> -   struct web_file_t *file = (struct web_file_t *) fh;
> -   ssize_t len = -1;
> -@@ -286,8 +284,7 @@ http_read (UpnpWebFileHandle fh, char *b
> -   return len;
> - }
> - 
> --static int
> --http_write (UpnpWebFileHandle fh __attribute__((unused)),
> -+int http_write (UpnpWebFileHandle fh __attribute__((unused)),
> -             char *buf __attribute__((unused)),
> -             size_t buflen __attribute__((unused)))
> - {
> -@@ -296,8 +293,7 @@ http_write (UpnpWebFileHandle fh __attri
> -   return 0;
> - }
> - 
> --static int
> --http_seek (UpnpWebFileHandle fh, off_t offset, int origin)
> -+int http_seek (UpnpWebFileHandle fh, off_t offset, int origin)
> - {
> -   struct web_file_t *file = (struct web_file_t *) fh;
> -   off_t newpos = -1;
> -@@ -371,8 +367,7 @@ http_seek (UpnpWebFileHandle fh, off_t o
> -   return 0;
> - }
> - 
> --static int
> --http_close (UpnpWebFileHandle fh)
> -+int http_close (UpnpWebFileHandle fh)
> - {
> -   struct web_file_t *file = (struct web_file_t *) fh;
> - 
> -@@ -402,13 +397,3 @@ http_close (UpnpWebFileHandle fh)
> - 
> -   return 0;
> - }
> --
> --struct UpnpVirtualDirCallbacks virtual_dir_callbacks =
> --  {
> --    http_get_info,
> --    http_open,
> --    http_read,
> --    http_write,
> --    http_seek,
> --    http_close
> --  };
> ---- a/src/http.h
> -+++ b/src/http.h
> -@@ -25,6 +25,18 @@
> - #include <upnp/upnp.h>
> - #include <upnp/upnptools.h>
> - 
> --struct UpnpVirtualDirCallbacks virtual_dir_callbacks;
> -+int http_get_info (const char *filename, struct File_Info *info);
> -+
> -+UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode);
> -+
> -+int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen);
> -+
> -+int http_seek (UpnpWebFileHandle fh, off_t offset, int origin);
> -+
> -+int http_write (UpnpWebFileHandle fh __attribute__((unused)),
> -+	char *buf __attribute__((unused)),
> -+	size_t buflen __attribute__((unused)));
> -+
> -+int http_close (UpnpWebFileHandle fh);
> - 
> - #endif /* _HTTP_H_ */
> ---- a/src/ushare.c
> -+++ b/src/ushare.c
> -@@ -188,7 +188,7 @@ handle_action_request (struct Upnp_Actio
> -   if (strcmp (request->DevUDN + 5, ut->udn))
> -     return;
> - 
> --  ip = request->CtrlPtIPAddr.s_addr;
> -+  ip = (*(struct sockaddr_in *)&request->CtrlPtIPAddr).sin_addr.s_addr;
> -   ip = ntohl (ip);
> -   sprintf (val, "%d.%d.%d.%d",
> -            (ip >> 24) & 0xFF, (ip >> 16) & 0xFF, (ip >> 8) & 0xFF, ip & 0xFF);
> -@@ -348,13 +348,23 @@ init_upnp (struct ushare_t *ut)
> - 
> -   UpnpEnableWebserver (TRUE);
> - 
> --  res = UpnpSetVirtualDirCallbacks (&virtual_dir_callbacks);
> --  if (res != UPNP_E_SUCCESS)
> --  {
> --    log_error (_("Cannot set virtual directory callbacks\n"));
> --    free (description);
> --    return -1;
> --  }
> -+#define upnp_set_callback(cb, func) \
> -+  do {                                                            \
> -+    res = UpnpVirtualDir_set_##cb##Callback(func);                \
> -+    if (res != UPNP_E_SUCCESS)                                    \
> -+    {                                                             \
> -+      log_error (_("Cannot set virtual directory callbacks\n"));  \
> -+      free (description);                                         \
> -+      return -1;                                                  \
> -+    }                                                             \
> -+  } while(0)
> -+
> -+  upnp_set_callback(GetInfo, http_get_info);
> -+  upnp_set_callback(Open,    http_open);
> -+  upnp_set_callback(Read,    http_read);
> -+  upnp_set_callback(Seek,    http_seek);
> -+  upnp_set_callback(Write,   http_write);
> -+  upnp_set_callback(Close,   http_close);
> - 
> -   res = UpnpAddVirtualDir (VIRTUAL_DIR);
> -   if (res != UPNP_E_SUCCESS)
> ---- a/src/cms.c
> -+++ b/src/cms.c
> -@@ -20,6 +20,8 @@
> -  */
> - 
> - #include <stdlib.h>
> -+#include <stdio.h>
> -+#include <string.h>
> - #include <upnp/upnp.h>
> - #include <upnp/upnptools.h>
> - 
> ---- a/src/mime.c
> -+++ b/src/mime.c
> -@@ -20,6 +20,7 @@
> -  */
> - 
> - #include <stdlib.h>
> -+#include <stdio.h>
> - #include <string.h>
> - 
> - #include "mime.h"
> ---- a/src/presentation.c
> -+++ b/src/presentation.c
> -@@ -19,6 +19,8 @@
> -  */
> - 
> - #include <stdlib.h>
> -+#include <stdio.h>
> -+#include <string.h>
> - 
> - #if HAVE_LANGINFO_CODESET
> - # include <langinfo.h>
> ---- a/src/services.c
> -+++ b/src/services.c
> -@@ -20,6 +20,8 @@
> -  */
> - 
> - #include <stdlib.h>
> -+#include <stdio.h>
> -+#include <string.h>
> - #include <upnp/upnp.h>
> - #include <upnp/upnptools.h>
> - 
> diff --git a/package/ushare/0002-ushare-fix-building-with-gcc-5.x.patch b/package/ushare/0002-ushare-fix-building-with-gcc-5.x.patch
> deleted file mode 100644
> index abef81fe4d..0000000000
> --- a/package/ushare/0002-ushare-fix-building-with-gcc-5.x.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 6abc52190accc8d8b17455420e234a1d7dc7ba55 Mon Sep 17 00:00:00 2001
> -From: Peter Korsgaard <peter@korsgaard.com>
> -Date: Mon, 16 Nov 2015 23:15:27 +0100
> -Subject: [PATCH] ushare: fix building with gcc 5.x
> -
> -GCC5 defaults to -std=gnu11, which has different semantics for inline than
> -previous versions:
> -
> -https://gcc.gnu.org/gcc-5/porting_to.html
> -
> -Which causes linker issues when display_headers() and start_log() are
> -referenced from other files.  There's no real reason why these needs to be
> -inline, so just drop the keyword.
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - src/trace.c  | 2 +-
> - src/ushare.c | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/trace.c b/src/trace.c
> -index 50729ef..4e314ef 100644
> ---- a/src/trace.c
> -+++ b/src/trace.c
> -@@ -57,7 +57,7 @@ print_log (log_level level, const char *format, ...)
> -   va_end (va);
> - }
> - 
> --inline void
> -+void
> - start_log (void)
> - {
> -   openlog (PACKAGE_NAME, LOG_PID, LOG_DAEMON);
> -diff --git a/src/ushare.c b/src/ushare.c
> -index b64451e..af46e78 100644
> ---- a/src/ushare.c
> -+++ b/src/ushare.c
> -@@ -496,7 +496,7 @@ reload_config (int s __attribute__ ((unused)))
> -   }
> - }
> - 
> --inline void
> -+void
> - display_headers (void)
> - {
> -   printf (_("%s (version %s), a lightweight UPnP A/V and DLNA Media Server.\n"),
> --- 
> -2.1.4
> -
> diff --git a/package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch b/package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch
> deleted file mode 100644
> index e97c3deabc..0000000000
> --- a/package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -ushare.c: include config.h before checking for CONFIG_NLS
> -
> -When NLS support is enabled, we get following build errors:
> -
> -  ushare.c: In function 'setup_i18n':
> -  ushare.c:745:3: warning: implicit declaration of function 'setlocale' [-Wimplicit-function-declaration]
> -     setlocale (LC_ALL, "");
> -     ^
> -  ushare.c:745:14: error: 'LC_ALL' undeclared (first use in this function)
> -     setlocale (LC_ALL, "");
> -                ^
> -  ushare.c:745:14: note: each undeclared identifier is reported only once for each function it appears in
> -  make[2]: *** [ushare.o] Error 1
> -
> -When NLS support is enabled, configure script creates macro in config.h.
> -We check for CONFIG_NLS before including config.h which results in above
> -build errors as locale.h doesn't get included.
> -
> -This patch fixes above build error by including config.h before we check for
> -CONFIG_NLS.
> -
> -This build error is detected by Buildroot autobuilder
> -http://autobuild.buildroot.net/results/19d/19d67dd43e5a313c77e4be97ecb9811ffa52f797/
> -
> -Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> -
> ---- ushare-1.1a/src/ushare.c.old	2016-09-20 19:04:00.915239326 +0530
> -+++ ushare-1.1a/src/ushare.c	2016-09-20 19:04:24.707239276 +0530
> -@@ -56,11 +56,12 @@
> - #include <upnp/upnp.h>
> - #include <upnp/upnptools.h>
> - 
> -+#include "config.h"
> -+
> - #if (defined(HAVE_SETLOCALE) && defined(CONFIG_NLS))
> - # include <locale.h>
> - #endif
> - 
> --#include "config.h"
> - #include "ushare.h"
> - #include "services.h"
> - #include "http.h"
> diff --git a/package/ushare/0004-switch-to-libupnp-1.14.x-API.patch b/package/ushare/0004-switch-to-libupnp-1.14.x-API.patch
> deleted file mode 100644
> index e200bb1926..0000000000
> --- a/package/ushare/0004-switch-to-libupnp-1.14.x-API.patch
> +++ /dev/null
> @@ -1,433 +0,0 @@
> -From 4643b9cb9e6c0331fd663437a7ed8061b9edf971 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 24 Aug 2020 19:26:03 +0200
> -Subject: [PATCH] switch to libupnp 1.14.x API
> -
> -Use the new libupnp 1.14.x API (i.e. UpnpInit2) to allow ushare to be
> -protected against CallStranger a.k.a. CVE-2020-12695
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/ddugovic/uShare/commit/4643b9cb9e6c0331fd663437a7ed8061b9edf971]
> ----
> - configure      |  2 --
> - src/http.c     | 50 +++++++++++++++++++++++++++++++-------------------
> - src/http.h     | 24 ++++++++++++++++++------
> - src/services.c | 28 ++++++++++++++++++----------
> - src/services.h |  6 +++---
> - src/ushare.c   | 36 ++++++++++++++++++------------------
> - src/ushare.h   |  2 +-
> - 7 files changed, 89 insertions(+), 59 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 20a08ed..4a3efe0 100755
> ---- a/configure
> -+++ b/configure
> -@@ -638,8 +638,6 @@ fi
> - echolog "Checking for libixml ..."
> - check_lib upnp/ixml.h ixmlRelaxParser -lixml || die "Error, can't find libixml !"
> - 
> --echolog "Checking for libthreadutil ..."
> --check_lib upnp/ThreadPool.h ThreadPoolAdd "-lthreadutil -lpthread" || die "Error, can't find libthreadutil !"
> - add_extralibs -lpthread
> - 
> - libupnp_min_version="1.4.2"
> -diff --git a/src/http.c b/src/http.c
> -index 8a4e67d..1e5b350 100644
> ---- a/src/http.c
> -+++ b/src/http.c
> -@@ -68,17 +68,19 @@ struct web_file_t {
> - 
> - 
> - static inline void
> --set_info_file (struct File_Info *info, const size_t length,
> -+set_info_file (UpnpFileInfo *info, const size_t length,
> -                const char *content_type)
> - {
> --  info->file_length = length;
> --  info->last_modified = 0;
> --  info->is_directory = 0;
> --  info->is_readable = 1;
> --  info->content_type = ixmlCloneDOMString (content_type);
> -+  UpnpFileInfo_set_FileLength(info, length);
> -+  UpnpFileInfo_set_LastModified(info, 0);
> -+  UpnpFileInfo_set_IsDirectory(info, 0);
> -+  UpnpFileInfo_set_IsReadable(info, 1);
> -+  UpnpFileInfo_set_ContentType(info, ixmlCloneDOMString (content_type));
> - }
> - 
> --int http_get_info (const char *filename, struct File_Info *info)
> -+int http_get_info (const char *filename, UpnpFileInfo *info,
> -+                   const void* cookie __attribute__((unused)),
> -+                   const void** requestCookie __attribute__((unused)))
> - {
> -   extern struct ushare_t *ut;
> -   struct upnp_entry_t *entry = NULL;
> -@@ -143,15 +145,15 @@ int http_get_info (const char *filename, struct File_Info *info)
> -   {
> -     if (errno != EACCES)
> -       return -1;
> --    info->is_readable = 0;
> -+    UpnpFileInfo_set_IsReadable(info, 0);
> -   }
> -   else
> --    info->is_readable = 1;
> -+    UpnpFileInfo_set_IsReadable(info, 1);
> - 
> -   /* file exist and can be read */
> --  info->file_length = st.st_size;
> --  info->last_modified = st.st_mtime;
> --  info->is_directory = S_ISDIR (st.st_mode);
> -+  UpnpFileInfo_set_FileLength(info, st.st_size);
> -+  UpnpFileInfo_set_LastModified(info, st.st_mtime);
> -+  UpnpFileInfo_set_IsDirectory(info, S_ISDIR (st.st_mode));
> - 
> -   protocol = 
> - #ifdef HAVE_DLNA
> -@@ -172,11 +174,11 @@ int http_get_info (const char *filename, struct File_Info *info)
> - 
> -   if (content_type)
> -   {
> --    info->content_type = ixmlCloneDOMString (content_type);
> -+    UpnpFileInfo_set_ContentType(info, ixmlCloneDOMString (content_type));
> -     free (content_type);
> -   }
> -   else
> --    info->content_type = ixmlCloneDOMString ("");
> -+    UpnpFileInfo_set_ContentType(info, ixmlCloneDOMString (""));
> - 
> -   return 0;
> - }
> -@@ -197,7 +199,9 @@ get_file_memory (const char *fullpath, const char *description,
> -   return ((UpnpWebFileHandle) file);
> - }
> - 
> --UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode)
> -+UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode,
> -+                             const void* cookie __attribute__((unused)),
> -+                             const void* requestCookie __attribute__((unused)))
> - {
> -   extern struct ushare_t *ut;
> -   struct upnp_entry_t *entry = NULL;
> -@@ -250,7 +254,9 @@ UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode)
> -   return ((UpnpWebFileHandle) file);
> - }
> - 
> --int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen)
> -+int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen,
> -+               const void* cookie __attribute__((unused)),
> -+               const void* requestCookie __attribute__((unused)))
> - {
> -   struct web_file_t *file = (struct web_file_t *) fh;
> -   ssize_t len = -1;
> -@@ -285,14 +291,18 @@ int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen)
> - 
> - int http_write (UpnpWebFileHandle fh __attribute__((unused)),
> -             char *buf __attribute__((unused)),
> --            size_t buflen __attribute__((unused)))
> -+            size_t buflen __attribute__((unused)),
> -+            const void* cookie __attribute__((unused)),
> -+            const void* requestCookie __attribute__((unused)))
> - {
> -   log_verbose ("http write\n");
> - 
> -   return 0;
> - }
> - 
> --int http_seek (UpnpWebFileHandle fh, off_t offset, int origin)
> -+int http_seek (UpnpWebFileHandle fh, off_t offset, int origin,
> -+               const void* cookie __attribute__((unused)),
> -+               const void* requestCookie __attribute__((unused)))
> - {
> -   struct web_file_t *file = (struct web_file_t *) fh;
> -   off_t newpos = -1;
> -@@ -366,7 +376,9 @@ int http_seek (UpnpWebFileHandle fh, off_t offset, int origin)
> -   return 0;
> - }
> - 
> --int http_close (UpnpWebFileHandle fh)
> -+int http_close (UpnpWebFileHandle fh,
> -+                const void* cookie __attribute__((unused)),
> -+                const void* requestCookie __attribute__((unused)))
> - {
> -   struct web_file_t *file = (struct web_file_t *) fh;
> - 
> -diff --git a/src/http.h b/src/http.h
> -index 32d6bcc..c912a7b 100644
> ---- a/src/http.h
> -+++ b/src/http.h
> -@@ -25,18 +25,30 @@
> - #include <upnp/upnp.h>
> - #include <upnp/upnptools.h>
> - 
> --int http_get_info (const char *filename, struct File_Info *info);
> -+int http_get_info (const char *filename, UpnpFileInfo *info,
> -+	const void* cookie __attribute__((unused)),
> -+	const void** requestCookie __attribute__((unused)));
> - 
> --UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode);
> -+UpnpWebFileHandle http_open (const char *filename, enum UpnpOpenFileMode mode,
> -+	const void* cookie __attribute__((unused)),
> -+	const void* requestCookie __attribute__((unused)));
> - 
> --int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen);
> -+int http_read (UpnpWebFileHandle fh, char *buf, size_t buflen,
> -+	const void* cookie __attribute__((unused)),
> -+	const void* requestCookie __attribute__((unused)));
> - 
> --int http_seek (UpnpWebFileHandle fh, off_t offset, int origin);
> -+int http_seek (UpnpWebFileHandle fh, off_t offset, int origin,
> -+	const void* cookie __attribute__((unused)),
> -+	const void* requestCookie __attribute__((unused)));
> - 
> - int http_write (UpnpWebFileHandle fh __attribute__((unused)),
> - 	char *buf __attribute__((unused)),
> --	size_t buflen __attribute__((unused)));
> -+	size_t buflen __attribute__((unused)),
> -+	const void* cookie __attribute__((unused)),
> -+	const void* requestCookie __attribute__((unused)));
> - 
> --int http_close (UpnpWebFileHandle fh);
> -+int http_close (UpnpWebFileHandle fh,
> -+ 	const void* cookie __attribute__((unused)),
> -+	const void* requestCookie __attribute__((unused)));
> - 
> - #endif /* _HTTP_H_ */
> -diff --git a/src/services.c b/src/services.c
> -index aec9cf8..287df55 100644
> ---- a/src/services.c
> -+++ b/src/services.c
> -@@ -62,25 +62,28 @@ static struct service_t services[] = {
> - };
> - 
> - bool
> --find_service_action (struct Upnp_Action_Request *request,
> -+find_service_action (UpnpActionRequest *request,
> -                      struct service_t **service,
> -                      struct service_action_t **action)
> - {
> -   int c, d;
> -+  const char *actionName = NULL;
> - 
> -   *service = NULL;
> -   *action = NULL;
> -+  
> -+  actionName = UpnpActionRequest_get_ActionName_cstr(request);
> - 
> --  if (!request || !request->ActionName)
> -+  if (!request || !actionName)
> -     return false;
> - 
> -   for (c = 0; services[c].id != NULL; c++)
> --    if (!strcmp (services[c].id, request->ServiceID))
> -+    if (!strcmp (services[c].id, UpnpActionRequest_get_ServiceID_cstr(request)))
> -     {
> -       *service = &services[c];
> -       for (d = 0; services[c].actions[d].name; d++)
> -       {
> --        if (!strcmp (services[c].actions[d].name, request->ActionName))
> -+        if (!strcmp (services[c].actions[d].name, actionName))
> -         {
> -           *action = &services[c].actions[d];
> -           return true;
> -@@ -97,6 +100,7 @@ upnp_add_response (struct action_event_t *event, char *key, const char *value)
> - {
> -   char *val;
> -   int res;
> -+  IXML_Document* actionResult = NULL;
> - 
> -   if (!event || !event->status || !key || !value)
> -     return false;
> -@@ -105,8 +109,9 @@ upnp_add_response (struct action_event_t *event, char *key, const char *value)
> -   if (!val)
> -     return false;
> - 
> --  res = UpnpAddToActionResponse (&event->request->ActionResult,
> --                                 event->request->ActionName,
> -+  actionResult = UpnpActionRequest_get_ActionResult(event->request);
> -+  res = UpnpAddToActionResponse (&actionResult,
> -+                                 UpnpActionRequest_get_ActionName_cstr(event->request),
> -                                  event->service->type, key, val);
> - 
> -   if (res != UPNP_E_SUCCESS)
> -@@ -120,14 +125,17 @@ upnp_add_response (struct action_event_t *event, char *key, const char *value)
> - }
> - 
> - char *
> --upnp_get_string (struct Upnp_Action_Request *request, const char *key)
> -+upnp_get_string (UpnpActionRequest *request, const char *key)
> - {
> -   IXML_Node *node = NULL;
> -+  IXML_Document *actionRequest = NULL;
> - 
> --  if (!request || !request->ActionRequest || !key)
> -+  actionRequest = UpnpActionRequest_get_ActionRequest(request);
> -+
> -+  if (!request || !actionRequest || !key)
> -     return NULL;
> - 
> --  node = (IXML_Node *) request->ActionRequest;
> -+  node = (IXML_Node *) actionRequest;
> -   if (!node)
> -   {
> -     log_verbose ("Invalid action request document\n");
> -@@ -157,7 +165,7 @@ upnp_get_string (struct Upnp_Action_Request *request, const char *key)
> - }
> - 
> - int
> --upnp_get_ui4 (struct Upnp_Action_Request *request, const char *key)
> -+upnp_get_ui4 (UpnpActionRequest *request, const char *key)
> - {
> -   char *value;
> -   int val;
> -diff --git a/src/services.h b/src/services.h
> -index 89c072e..d5726b4 100644
> ---- a/src/services.h
> -+++ b/src/services.h
> -@@ -39,15 +39,15 @@ struct service_t {
> - 
> - #define SERVICE_CONTENT_TYPE "text/xml"
> - 
> --bool find_service_action (struct Upnp_Action_Request *request,
> -+bool find_service_action (UpnpActionRequest *request,
> -                           struct service_t **service,
> -                           struct service_action_t **action);
> - 
> - bool upnp_add_response (struct action_event_t *event,
> -                         char *key, const char *value);
> - 
> --char * upnp_get_string (struct Upnp_Action_Request *request, const char *key);
> -+char * upnp_get_string (UpnpActionRequest *request, const char *key);
> - 
> --int upnp_get_ui4 (struct Upnp_Action_Request *request, const char *key);
> -+int upnp_get_ui4 (UpnpActionRequest *request, const char *key);
> - 
> - #endif /* _SERVICES_H_ */
> -diff --git a/src/ushare.c b/src/ushare.c
> -index 28fd67e..92e2345 100644
> ---- a/src/ushare.c
> -+++ b/src/ushare.c
> -@@ -177,7 +177,7 @@ ushare_signal_exit (void)
> - }
> - 
> - static void
> --handle_action_request (struct Upnp_Action_Request *request)
> -+handle_action_request (UpnpActionRequest *request)
> - {
> -   struct service_t *service;
> -   struct service_action_t *action;
> -@@ -187,25 +187,25 @@ handle_action_request (struct Upnp_Action_Request *request)
> -   if (!request || !ut)
> -     return;
> - 
> --  if (request->ErrCode != UPNP_E_SUCCESS)
> -+  if (UpnpActionRequest_get_ErrCode(request) != UPNP_E_SUCCESS)
> -     return;
> - 
> --  if (strcmp (request->DevUDN + 5, ut->udn))
> -+  if (strcmp (UpnpActionRequest_get_DevUDN_cstr(request) + 5, ut->udn))
> -     return;
> - 
> --  ip = (*(struct sockaddr_in *)&request->CtrlPtIPAddr).sin_addr.s_addr;
> -+  ip = (*(struct sockaddr_in *)UpnpActionRequest_get_CtrlPtIPAddr(request)).sin_addr.s_addr;
> -   ip = ntohl (ip);
> -   sprintf (val, "%d.%d.%d.%d",
> -            (ip >> 24) & 0xFF, (ip >> 16) & 0xFF, (ip >> 8) & 0xFF, ip & 0xFF);
> - 
> -   if (ut->verbose)
> -   {
> --    DOMString str = ixmlPrintDocument (request->ActionRequest);
> -+    DOMString str = ixmlPrintDocument (UpnpActionRequest_get_ActionRequest(request));
> -     log_verbose ("***************************************************\n");
> -     log_verbose ("**             New Action Request                **\n");
> -     log_verbose ("***************************************************\n");
> --    log_verbose ("ServiceID: %s\n", request->ServiceID);
> --    log_verbose ("ActionName: %s\n", request->ActionName);
> -+    log_verbose ("ServiceID: %s\n", UpnpActionRequest_get_ServiceID_cstr(request));
> -+    log_verbose ("ActionName: %s\n", UpnpActionRequest_get_ActionName_cstr(request));
> -     log_verbose ("CtrlPtIP: %s\n", val);
> -     log_verbose ("Action Request:\n%s\n", str);
> -     ixmlFreeDOMString (str);
> -@@ -220,11 +220,11 @@ handle_action_request (struct Upnp_Action_Request *request)
> -       event.service = service;
> - 
> -       if (action->function (&event) && event.status)
> --        request->ErrCode = UPNP_E_SUCCESS;
> -+        UpnpActionRequest_set_ErrCode(request, UPNP_E_SUCCESS);
> - 
> -       if (ut->verbose)
> -       {
> --        DOMString str = ixmlPrintDocument (request->ActionResult);
> -+        DOMString str = ixmlPrintDocument (UpnpActionRequest_get_ActionResult(request));
> -         log_verbose ("Action Result:\n%s", str);
> -         log_verbose ("***************************************************\n");
> -         log_verbose ("\n");
> -@@ -235,22 +235,22 @@ handle_action_request (struct Upnp_Action_Request *request)
> -     }
> - 
> -   if (service) /* Invalid Action name */
> --    strcpy (request->ErrStr, "Unknown Service Action");
> -+    UpnpActionRequest_strcpy_ErrStr(request, "Unknown Service Action");
> -   else /* Invalid Service name */
> --    strcpy (request->ErrStr, "Unknown Service ID");
> -+    UpnpActionRequest_strcpy_ErrStr(request, "Unknown Service ID");
> - 
> --  request->ActionResult = NULL;
> --  request->ErrCode = UPNP_SOAP_E_INVALID_ACTION;
> -+  UpnpActionRequest_set_ActionResult(request, NULL);
> -+  UpnpActionRequest_set_ErrCode(request, UPNP_SOAP_E_INVALID_ACTION);
> - }
> - 
> - static int
> --device_callback_event_handler (Upnp_EventType type, void *event,
> -+device_callback_event_handler (Upnp_EventType type, const void *event,
> -                                void *cookie __attribute__((unused)))
> - {
> -   switch (type)
> -     {
> -     case UPNP_CONTROL_ACTION_REQUEST:
> --      handle_action_request ((struct Upnp_Action_Request *) event);
> -+      handle_action_request ((UpnpActionRequest *) event);
> -       break;
> -     case UPNP_CONTROL_ACTION_COMPLETE:
> -     case UPNP_EVENT_SUBSCRIPTION_REQUEST:
> -@@ -323,7 +323,7 @@ init_upnp (struct ushare_t *ut)
> - #endif /* HAVE_DLNA */
> - 
> -   log_info (_("Initializing UPnP subsystem ...\n"));
> --  res = UpnpInit (ut->ip, ut->port);
> -+  res = UpnpInit2 (ut->interface, ut->port);
> -   if (res != UPNP_E_SUCCESS)
> -   {
> -     log_error (_("Cannot initialize UPnP subsystem\n"));
> -@@ -351,7 +351,7 @@ init_upnp (struct ushare_t *ut)
> -   log_info (_("UPnP MediaServer listening on %s:%d\n"),
> -             UpnpGetServerIpAddress (), ut->port);
> - 
> --  UpnpEnableWebserver (TRUE);
> -+  UpnpEnableWebserver (1);
> - 
> - #define upnp_set_callback(cb, func) \
> -   do {                                                            \
> -@@ -371,7 +371,7 @@ init_upnp (struct ushare_t *ut)
> -   upnp_set_callback(Write,   http_write);
> -   upnp_set_callback(Close,   http_close);
> - 
> --  res = UpnpAddVirtualDir (VIRTUAL_DIR);
> -+  res = UpnpAddVirtualDir (VIRTUAL_DIR, NULL, NULL);
> -   if (res != UPNP_E_SUCCESS)
> -   {
> -     log_error (_("Cannot add virtual directory for web server\n"));
> -diff --git a/src/ushare.h b/src/ushare.h
> -index a29da01..cd86cef 100644
> ---- a/src/ushare.h
> -+++ b/src/ushare.h
> -@@ -125,7 +125,7 @@ struct ushare_t {
> - };
> - 
> - struct action_event_t {
> --  struct Upnp_Action_Request *request;
> -+  UpnpActionRequest *request;
> -   bool status;
> -   struct service_t *service;
> - };
> diff --git a/package/ushare/ushare.hash b/package/ushare/ushare.hash
> index 03c675f094..4d009dd99f 100644
> --- a/package/ushare/ushare.hash
> +++ b/package/ushare/ushare.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  7b9b85c79968d4f4560f02a99e33c6a33ff58f9d41d8faea79e31cce2ee78665  ushare-1.1a.tar.bz2
> +sha256  3bfc2eecdbbbf3c1778f70e8e8a8fc4638fbf52081c4b047a59204f079a4a580  ushare-2.0.tar.gz
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
> index bb194f6374..59dddb4bf1 100644
> --- a/package/ushare/ushare.mk
> +++ b/package/ushare/ushare.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -USHARE_VERSION = 1.1a
> -USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
> -USHARE_SITE = http://ushare.geexbox.org/releases
> +USHARE_VERSION = 2.0
> +USHARE_SITE = $(call github,ddugovic,uShare,v$(USHARE_VERSION))
>  USHARE_DEPENDENCIES = host-pkgconf libupnp $(TARGET_NLS_DEPENDENCIES)
>  USHARE_LICENSE = GPL-2.0+
>  USHARE_LICENSE_FILES = COPYING
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
