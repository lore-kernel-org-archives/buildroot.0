From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:45:03 +0200
Subject: [Buildroot] [git commit] libcurl: security bump to version 7.42.0
Message-ID: <20150423074852.1897581DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c8e6796814a03f564cfbab2cb7663d0f598655a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-3144 - host name out of boundary memory access
CVE-2015-3145 - cookie parser out of boundary memory access
CVE-2015-3148 - Negotiate not treated as connection-oriented
CVE-2015-3143 - Re-using authenticated connection when unauthenticated

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-connectionexists-fix-build-without-NTLM.patch |   54 ++++++++++++++++++++
 ...connectionexists-follow-up-to-fd9d3a1ef1f.patch |   48 +++++++++++++++++
 package/libcurl/libcurl.hash                       |    2 +-
 package/libcurl/libcurl.mk                         |    2 +-
 4 files changed, 104 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/0001-connectionexists-fix-build-without-NTLM.patch b/package/libcurl/0001-connectionexists-fix-build-without-NTLM.patch
new file mode 100644
index 0000000..4f91372
--- /dev/null
+++ b/package/libcurl/0001-connectionexists-fix-build-without-NTLM.patch
@@ -0,0 +1,54 @@
+From fd9d3a1ef1f7b1cb5812d04bad07818efc6f3b3a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 22 Apr 2015 13:31:35 +0200
+Subject: [PATCH 1/2] connectionexists: fix build without NTLM
+
+Do not access NTLM-specific struct fields when built without NTLM
+enabled!
+
+bug: http://curl.haxx.se/?i=231
+Reported-by: Patrick Rapin
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/url.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index f033dbc..93f15f1 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3069,9 +3069,11 @@ ConnectionExists(struct SessionHandle *data,
+   struct connectdata *check;
+   struct connectdata *chosen = 0;
+   bool canPipeline = IsPipeliningPossible(data, needle);
++#ifdef USE_NTLM
+   bool wantNTLMhttp = ((data->state.authhost.want & CURLAUTH_NTLM) ||
+                        (data->state.authhost.want & CURLAUTH_NTLM_WB)) &&
+     (needle->handler->protocol & PROTO_FAMILY_HTTP) ? TRUE : FALSE;
++#endif
+   struct connectbundle *bundle;
+ 
+   *force_reuse = FALSE;
+@@ -3208,6 +3210,7 @@ ConnectionExists(struct SessionHandle *data,
+           continue;
+       }
+ 
++#if defined(USE_NTLM)
+       if((!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) ||
+          (wantNTLMhttp || check->ntlm.state != NTLMSTATE_NONE)) {
+         /* This protocol requires credentials per connection or is HTTP+NTLM,
+@@ -3217,10 +3220,9 @@ ConnectionExists(struct SessionHandle *data,
+           /* one of them was different */
+           continue;
+         }
+-#if defined(USE_NTLM)
+         credentialsMatch = TRUE;
+-#endif
+       }
++#endif
+ 
+       if(!needle->bits.httpproxy || needle->handler->flags&PROTOPT_SSL ||
+          (needle->bits.httpproxy && check->bits.httpproxy &&
+-- 
+2.0.5
+
diff --git a/package/libcurl/0002-connectionexists-follow-up-to-fd9d3a1ef1f.patch b/package/libcurl/0002-connectionexists-follow-up-to-fd9d3a1ef1f.patch
new file mode 100644
index 0000000..28eaeb9
--- /dev/null
+++ b/package/libcurl/0002-connectionexists-follow-up-to-fd9d3a1ef1f.patch
@@ -0,0 +1,48 @@
+From 85c45d153b901d3f69dd5713924039c011477612 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 22 Apr 2015 13:58:10 +0200
+Subject: [PATCH 2/2] connectionexists: follow-up to fd9d3a1ef1f
+
+PROTOPT_CREDSPERREQUEST still needs to be checked even when NTLM is not
+enabled.
+
+Mistake-caught-by: Kamil Dudka
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/url.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 93f15f1..7dc5c45 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3210,9 +3210,11 @@ ConnectionExists(struct SessionHandle *data,
+           continue;
+       }
+ 
+-#if defined(USE_NTLM)
+-      if((!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) ||
+-         (wantNTLMhttp || check->ntlm.state != NTLMSTATE_NONE)) {
++      if((!(needle->handler->flags & PROTOPT_CREDSPERREQUEST))
++#ifdef USE_NTLM
++         || (wantNTLMhttp || check->ntlm.state != NTLMSTATE_NONE)
++#endif
++        ) {
+         /* This protocol requires credentials per connection or is HTTP+NTLM,
+            so verify that we're using the same name and password as well */
+         if(!strequal(needle->user, check->user) ||
+@@ -3220,9 +3222,10 @@ ConnectionExists(struct SessionHandle *data,
+           /* one of them was different */
+           continue;
+         }
++#if defined(USE_NTLM)
+         credentialsMatch = TRUE;
+-      }
+ #endif
++      }
+ 
+       if(!needle->bits.httpproxy || needle->handler->flags&PROTOPT_SSL ||
+          (needle->bits.httpproxy && check->bits.httpproxy &&
+-- 
+2.0.5
+
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 3b00f0d..e2bd83d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9f8b546bdc5c57d959151acae7ce6610fe929d82b8d0fc5b25a3a2296e5f8bea	curl-7.41.0.tar.bz2
+sha256	32557d68542f5c6cc8437b5b8a945857b4c5c6b6276da909e35b783d1d66d08f	curl-7.42.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 69cd8df..acb2b42 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.41.0
+LIBCURL_VERSION = 7.42.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
