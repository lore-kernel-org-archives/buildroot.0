From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:19:44 +0100
Subject: [Buildroot] [git commit] motion: fix static link with gnutls
Message-ID: <20161101151956.6814180169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5349756f70fd82f05a753de1fa40e4fcf757cb9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

base64_encode is already defined in gnutls so rename it as
motion_base64_encode to prevent a definition clash when linking
statically with gnutls

Fixes:
  - http://autobuild.buildroot.org/results/592672b8826f4c731c50d29725da964d876573c4

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/motion/0002-Rename-base64_encode.patch | 116 +++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/package/motion/0002-Rename-base64_encode.patch b/package/motion/0002-Rename-base64_encode.patch
new file mode 100644
index 0000000..8b06309
--- /dev/null
+++ b/package/motion/0002-Rename-base64_encode.patch
@@ -0,0 +1,116 @@
+From 0da5428bdfe67eb17ee03f22f68e66b044abdf70 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Sun, 30 Oct 2016 19:30:46 +0100
+Subject: [PATCH] Rename base64_encode
+
+base64_encode is already defined in gnutls so rename it as
+motion_base64_encode to prevent a definition clash when linking
+statically with gnutls
+
+Fixes:
+  - http://autobuild.buildroot.org/results/592672b8826f4c731c50d29725da964d876573c4
+
+Applied upstream:
+  - https://github.com/Motion-Project/motion/commit/cc3c25527d4bada0fe98a734fa2df29f8d6cf1ad
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ netcam.c      | 4 ++--
+ netcam_wget.c | 4 ++--
+ netcam_wget.h | 2 +-
+ stream.c      | 4 ++--
+ webhttpd.c    | 4 ++--
+ 5 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/netcam.c b/netcam.c
+index a9df33a..38d4ca3 100644
+--- a/netcam.c
++++ b/netcam.c
+@@ -2019,7 +2019,7 @@ static int netcam_http_build_url(netcam_context_ptr netcam, struct url_t *url)
+     else
+         ptr = url->userpass;
+ 
+-    /* base64_encode needs up to 3 additional chars. */
++    /* motion_base64_encode needs up to 3 additional chars. */
+     if (ptr) {
+         userpass = mymalloc(strlen(ptr) + 3);
+         strcpy(userpass, ptr);
+@@ -2045,7 +2045,7 @@ static int netcam_http_build_url(netcam_context_ptr netcam, struct url_t *url)
+         /* Allocate space for the base64-encoded string. */
+         encuserpass = mymalloc(BASE64_LENGTH(strlen(userpass)) + 1);
+         /* Fill in the value. */
+-        base64_encode(userpass, encuserpass, strlen(userpass));
++        motion_base64_encode(userpass, encuserpass, strlen(userpass));
+         /* Now create the last part (authorization) of the request. */
+         request_pass = mymalloc(strlen(connect_auth_req) +
+                                 strlen(encuserpass) + 1);
+diff --git a/netcam_wget.c b/netcam_wget.c
+index 4491760..f5c1dc2 100644
+--- a/netcam_wget.c
++++ b/netcam_wget.c
+@@ -210,13 +210,13 @@ int skip_lws(const char *string)
+ 
+ 
+ /**
+- * base64_encode
++ * motion_base64_encode
+  *
+  *   Encode the string S of length LENGTH to base64 format and place it
+  *   to STORE.  STORE will be 0-terminated, and must point to a writable
+  *   buffer of at least 1+BASE64_LENGTH(length) bytes.  
+  */
+-void base64_encode(const char *s, char *store, int length)
++void motion_base64_encode(const char *s, char *store, int length)
+ {
+     /* Conversion table.  */
+     static const char tbl[64] = {
+diff --git a/netcam_wget.h b/netcam_wget.h
+index 9a091bf..e9b02b5 100644
+--- a/netcam_wget.h
++++ b/netcam_wget.h
+@@ -72,7 +72,7 @@ int rbuf_read_bufferful(netcam_context_ptr);
+ /* How many bytes it will take to store LEN bytes in base64.  */
+ #define BASE64_LENGTH(len) (4 * (((len) + 2) / 3))
+ 
+-void base64_encode(const char *, char *, int);
++void motion_base64_encode(const char *, char *, int);
+ char *strdupdelim(const char *, const char *);
+ int http_process_type(const char *, void *);
+ 
+diff --git a/stream.c b/stream.c
+index 04e67ee..ca201ac 100644
+--- a/stream.c
++++ b/stream.c
+@@ -211,10 +211,10 @@ static void* handle_basic_auth(void* param)
+ 
+         authentication = mymalloc(BASE64_LENGTH(auth_size) + 1);
+         userpass = mymalloc(auth_size + 4);
+-        /* base64_encode can read 3 bytes after the end of the string, initialize it. */
++        /* motion_base64_encode can read 3 bytes after the end of the string, initialize it. */
+         memset(userpass, 0, auth_size + 4);
+         strcpy(userpass, p->conf->stream_authentication);
+-        base64_encode(userpass, authentication, auth_size);
++        motion_base64_encode(userpass, authentication, auth_size);
+         free(userpass);
+ 
+         if (strcmp(auth, authentication)) {
+diff --git a/webhttpd.c b/webhttpd.c
+index 6df2d11..36e8beb 100644
+--- a/webhttpd.c
++++ b/webhttpd.c
+@@ -2616,10 +2616,10 @@ void httpd_run(struct context **cnt)
+ 
+         authentication = mymalloc(BASE64_LENGTH(auth_size) + 1);
+         userpass = mymalloc(auth_size + 4);
+-        /* base64_encode can read 3 bytes after the end of the string, initialize it */
++        /* motion_base64_encode can read 3 bytes after the end of the string, initialize it */
+         memset(userpass, 0, auth_size + 4);
+         strcpy(userpass, cnt[0]->conf.webcontrol_authentication);
+-        base64_encode(userpass, authentication, auth_size);
++        motion_base64_encode(userpass, authentication, auth_size);
+         free(userpass);
+     }
+ 
+-- 
+2.5.0
+
