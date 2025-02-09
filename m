Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E50C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4850B412AA;
	Sun,  9 Feb 2025 21:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mi0VeXT2HKmo; Sun,  9 Feb 2025 21:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9263940685
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9263940685;
	Sun,  9 Feb 2025 21:06:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B51CC2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 477BC40685
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx4U00ToDTMs for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 21:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEC7A4064D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEC7A4064D
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:06:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D06A687474; Sun,  9 Feb 2025 21:06:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 22:02:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad25dd6159217e6c9eb77f827fe2824a210a6c38
X-Git-Newrev: e85cd58fc5af453335645b85b73e387284fc10e2
X-Patchwork-Hint: ignore
Message-Id: <20250209210643.D06A687474@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: add upstream patch to fix
 Kodi segfault
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e85cd58fc5af453335645b85b73e387284fc10e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The error was introduced by the libcurl bump to 8.12.0 with buildroot
commit 2da031c2e54cb19efae41fb666064551cfccb59e.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-vtsl-eliminate-data-state-ssl_scache.patch | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/package/libcurl/0001-vtsl-eliminate-data-state-ssl_scache.patch b/package/libcurl/0001-vtsl-eliminate-data-state-ssl_scache.patch
new file mode 100644
index 0000000000..775aaa667f
--- /dev/null
+++ b/package/libcurl/0001-vtsl-eliminate-data-state-ssl_scache.patch
@@ -0,0 +1,147 @@
+https://github.com/curl/curl/issues/16236#issuecomment-2645385845
+https://github.com/curl/curl/commit/242a1439e7d8cdb72ae6a2fa2e705e2d9a2b7501
+
+Fixes curl bug https://github.com/curl/curl/issues/16236 "that caused
+a segfault in kodi".
+
+Instead of adding upstream commit
+https://github.com/curl/curl/commit/242a1439e7d8cdb72ae6a2fa2e705e2d9a2b7501
+which does not apply cleanly on libcurl 8.12.0 we use the Gentoo version:
+https://github.com/gentoo/gentoo/blob/master/net-misc/curl/files/curl-8.12.0-multi.patch
+
+Upstream: https://github.com/curl/curl/commit/242a1439e7d8cdb72ae6a2fa2e705e2d9a2b7501
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -1584,10 +1584,6 @@ static CURLcode setopt_pointers(struct Curl_easy *data, CURLoption option,
+       if(data->share->hsts == data->hsts)
+         data->hsts = NULL;
+ #endif
+-#ifdef USE_SSL
+-      if(data->share->ssl_scache == data->state.ssl_scache)
+-        data->state.ssl_scache = data->multi ? data->multi->ssl_scache : NULL;
+-#endif
+ #ifdef USE_LIBPSL
+       if(data->psl == &data->share->psl)
+         data->psl = data->multi ? &data->multi->psl : NULL;
+@@ -1628,10 +1624,6 @@ static CURLcode setopt_pointers(struct Curl_easy *data, CURLoption option,
+         data->hsts = data->share->hsts;
+       }
+ #endif
+-#ifdef USE_SSL
+-      if(data->share->ssl_scache)
+-        data->state.ssl_scache = data->share->ssl_scache;
+-#endif
+ #ifdef USE_LIBPSL
+       if(data->share->specifier & (1 << CURL_LOCK_DATA_PSL))
+         data->psl = &data->share->psl;
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -567,12 +567,6 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+ #endif
+   data->state.httpreq = data->set.method;
+ 
+-#ifdef USE_SSL
+-  if(!data->state.ssl_scache)
+-    /* There was no ssl session cache set via a share, use the multi one */
+-    data->state.ssl_scache = data->multi->ssl_scache;
+-#endif
+-
+   data->state.requests = 0;
+   data->state.followlocation = 0; /* reset the location-follow counter */
+   data->state.this_is_a_follow = FALSE; /* reset this */
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1199,7 +1199,6 @@ struct UrlState {
+   curl_prot_t first_remote_protocol;
+ 
+   int retrycount; /* number of retries on a new connection */
+-  struct Curl_ssl_scache *ssl_scache; /* TLS session pool */
+   int os_errno;  /* filled in with errno whenever an error occurs */
+   long followlocation; /* redirect counter */
+   int requests; /* request counter: redirects + authentication retakes */
+--- a/lib/vtls/vtls_scache.c
++++ b/lib/vtls/vtls_scache.c
+@@ -82,6 +82,17 @@ struct Curl_ssl_scache {
+   long age;
+ };
+ 
++static struct Curl_ssl_scache *cf_ssl_scache_get(struct Curl_easy *data)
++{
++  struct Curl_ssl_scache *scache = NULL;
++  /* If a share is present, its ssl_scache has preference over the multi */
++  if(data->share && data->share->ssl_scache)
++    scache = data->share->ssl_scache;
++  else if(data->multi && data->multi->ssl_scache)
++    scache = data->multi->ssl_scache;
++  return scache;
++}
++
+ static void cf_ssl_scache_clear_session(struct Curl_ssl_session *s)
+ {
+   if(s->sdata) {
+@@ -792,7 +803,7 @@ CURLcode Curl_ssl_scache_put(struct Curl_cfilter *cf,
+                              const char *ssl_peer_key,
+                              struct Curl_ssl_session *s)
+ {
+-  struct Curl_ssl_scache *scache = data->state.ssl_scache;
++  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
+   struct ssl_config_data *ssl_config = Curl_ssl_cf_get_config(cf, data);
+   CURLcode result;
+   DEBUGASSERT(ssl_config);
+@@ -826,7 +837,7 @@ CURLcode Curl_ssl_scache_take(struct Curl_cfilter *cf,
+                               const char *ssl_peer_key,
+                               struct Curl_ssl_session **ps)
+ {
+-  struct Curl_ssl_scache *scache = data->state.ssl_scache;
++  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
+   struct Curl_ssl_scache_peer *peer = NULL;
+   struct Curl_llist_node *n;
+@@ -870,7 +881,7 @@ CURLcode Curl_ssl_scache_add_obj(struct Curl_cfilter *cf,
+                                  void *sobj,
+                                  Curl_ssl_scache_obj_dtor *sobj_free)
+ {
+-  struct Curl_ssl_scache *scache = data->state.ssl_scache;
++  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
+   struct Curl_ssl_scache_peer *peer = NULL;
+   CURLcode result;
+@@ -898,7 +909,7 @@ bool Curl_ssl_scache_get_obj(struct Curl_cfilter *cf,
+                              const char *ssl_peer_key,
+                              void **sobj)
+ {
+-  struct Curl_ssl_scache *scache = data->state.ssl_scache;
++  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
+   struct Curl_ssl_scache_peer *peer = NULL;
+   CURLcode result;
+@@ -924,7 +935,7 @@ void Curl_ssl_scache_remove_all(struct Curl_cfilter *cf,
+                                 struct Curl_easy *data,
+                                 const char *ssl_peer_key)
+ {
+-  struct Curl_ssl_scache *scache = data->state.ssl_scache;
++  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
+   struct Curl_ssl_scache_peer *peer = NULL;
+   CURLcode result;
+@@ -1021,7 +1032,7 @@ CURLcode Curl_ssl_session_import(struct Curl_easy *data,
+                                  const unsigned char *shmac, size_t shmac_len,
+                                  const unsigned char *sdata, size_t sdata_len)
+ {
+-  struct Curl_ssl_scache *scache = data->state.ssl_scache;
++  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
+   struct Curl_ssl_scache_peer *peer = NULL;
+   struct Curl_ssl_session *s = NULL;
+   bool locked = FALSE;
+@@ -1092,7 +1103,7 @@ CURLcode Curl_ssl_session_export(struct Curl_easy *data,
+                                  curl_ssls_export_cb *export_fn,
+                                  void *userptr)
+ {
+-  struct Curl_ssl_scache *scache = data->state.ssl_scache;
++  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
+   struct Curl_ssl_scache_peer *peer;
+   struct dynbuf sbuf, hbuf;
+   struct Curl_llist_node *n;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
