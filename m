From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 23:44:26 +0100
Subject: [Buildroot] [git commit] package/mpv: fix build with libva 2.0
Message-ID: <20180115224439.1563283E07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55052287d37ce97ba6df7426b4475e90eeba7985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: rename to 0004-libva20.patch]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/0004-libva20.patch | 93 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/package/mpv/0004-libva20.patch b/package/mpv/0004-libva20.patch
new file mode 100644
index 0000000..349dd3c
--- /dev/null
+++ b/package/mpv/0004-libva20.patch
@@ -0,0 +1,93 @@
+From 2ecf240b1cd20875991a5b18efafbe799864ff7f Mon Sep 17 00:00:00 2001
+From: Mark Thompson <sw@jkqxz.net>
+Date: Mon, 9 Oct 2017 20:10:26 +0100
+Subject: [PATCH] vaapi: Use libva2 message callbacks
+
+They are no longer global, so they work vaguely sensibly.
+
+Downloaded from upstream commit:
+https://github.com/mpv-player/mpv/commit/2ecf240b1cd20875991a5b18efafbe799864ff7f
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ video/vaapi.c | 32 +++++++++++++++++++++++++++++---
+ 1 file changed, 29 insertions(+), 3 deletions(-)
+
+diff --git a/video/vaapi.c b/video/vaapi.c
+index 6bedbbaa18..3b1cb9cc41 100644
+--- a/video/vaapi.c
++++ b/video/vaapi.c
+@@ -40,9 +40,27 @@ int va_get_colorspace_flag(enum mp_csp csp)
+     return 0;
+ }
+ 
+-// VA message callbacks are global and do not have a context parameter, so it's
+-// impossible to know from which VADisplay they originate. Try to route them
+-// to existing mpv/libmpv instances within this process.
++#if VA_CHECK_VERSION(1, 0, 0)
++static void va_message_callback(void *context, const char *msg, int mp_level)
++{
++    struct mp_vaapi_ctx *res = context;
++    mp_msg(res->log, mp_level, "libva: %s", msg);
++}
++
++static void va_error_callback(void *context, const char *msg)
++{
++    va_message_callback(context, msg, MSGL_ERR);
++}
++
++static void va_info_callback(void *context, const char *msg)
++{
++    va_message_callback(context, msg, MSGL_V);
++}
++#else
++// Pre-libva2 VA message callbacks are global and do not have a context
++// parameter, so it's impossible to know from which VADisplay they
++// originate.  Try to route them to existing mpv/libmpv instances within
++// this process.
+ static pthread_mutex_t va_log_mutex = PTHREAD_MUTEX_INITIALIZER;
+ static struct mp_vaapi_ctx **va_mpv_clients;
+ static int num_va_mpv_clients;
+@@ -77,6 +95,7 @@ static void va_info_callback(const char *msg)
+ {
+     va_message_callback(msg, MSGL_V);
+ }
++#endif
+ 
+ static void open_lavu_vaapi_device(struct mp_vaapi_ctx *ctx)
+ {
+@@ -108,6 +127,10 @@ struct mp_vaapi_ctx *va_initialize(VADisplay *display, struct mp_log *plog,
+         },
+     };
+ 
++#if VA_CHECK_VERSION(1, 0, 0)
++    vaSetErrorCallback(display, va_error_callback, res);
++    vaSetInfoCallback(display,  va_info_callback,  res);
++#else
+     pthread_mutex_lock(&va_log_mutex);
+     MP_TARRAY_APPEND(NULL, va_mpv_clients, num_va_mpv_clients, res);
+     pthread_mutex_unlock(&va_log_mutex);
+@@ -118,6 +141,7 @@ struct mp_vaapi_ctx *va_initialize(VADisplay *display, struct mp_log *plog,
+     vaSetErrorCallback(va_error_callback);
+     vaSetInfoCallback(va_info_callback);
+ #endif
++#endif
+ 
+     int major, minor;
+     int status = vaInitialize(display, &major, &minor);
+@@ -154,6 +178,7 @@ void va_destroy(struct mp_vaapi_ctx *ctx)
+         if (ctx->destroy_native_ctx)
+             ctx->destroy_native_ctx(ctx->native_ctx);
+ 
++#if !VA_CHECK_VERSION(1, 0, 0)
+         pthread_mutex_lock(&va_log_mutex);
+         for (int n = 0; n < num_va_mpv_clients; n++) {
+             if (va_mpv_clients[n] == ctx) {
+@@ -164,6 +189,7 @@ void va_destroy(struct mp_vaapi_ctx *ctx)
+         if (num_va_mpv_clients == 0)
+             TA_FREEP(&va_mpv_clients); // avoid triggering leak detectors
+         pthread_mutex_unlock(&va_log_mutex);
++#endif
+ 
+         talloc_free(ctx);
+     }
