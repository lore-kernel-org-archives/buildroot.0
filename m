Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97733C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 437A841D30;
	Mon, 20 Feb 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 437A841D30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IinltCO7LRU; Mon, 20 Feb 2023 21:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39BD6429BD;
	Mon, 20 Feb 2023 21:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BD6429BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 095E21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B29140BFA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B29140BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sose2roPALf7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4E8A40C14
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4E8A40C14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE1718648F; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 15:06:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0d9f268424558c37cd9538596358a537cd2f882d
X-Git-Newrev: de6820ab1bd2a695772adc7df44036baba62913a
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.BE1718648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gensio: fix libressl
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============0047888622237231180=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0047888622237231180==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=de6820ab1bd2a695772adc7df44036baba62913a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following libressl build failure raised since bump to version
2.5.5 in commit 8f67d23af11510b447d9d0e1a71249f97e655305 and
https://github.com/cminyard/gensio/commit/12c94a29808e930a660142013c518468ca14ea62:

gensio_filter_certauth.c: In function 'v3_certauth_add_challenge_rsp':
gensio_filter_certauth.c:735:44: error: 'EVP_PKEY_ED25519' undeclared (first use in this function); did you mean 'EVP_PKEY_DSA1'?
  735 |     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519) {
      |                                            ^~~~~~~~~~~~~~~~
      |                                            EVP_PKEY_DSA1

Fixes:
 - http://autobuild.buildroot.org/results/a0348df9bf9c7ccfd576f607abb6b186da384ad9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-EVP_PKEY_ED25519-build-error-on-libressl.patch | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch b/package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch
new file mode 100644
index 0000000000..e9087aa3e5
--- /dev/null
+++ b/package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch
@@ -0,0 +1,105 @@
+From 1e7071684329f23ee3447310d203d193c283979e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 5 Oct 2022 15:30:32 -0600
+Subject: [PATCH] Fix missing EVP_PKEY_ED25519 build error on libressl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+gensio_filter_certauth.c: In function ‘v3_certauth_add_challenge_rsp’:
+gensio_filter_certauth.c:838:44: error: ‘EVP_PKEY_ED25519’ undeclared (first use in this function); did you mean ‘EVP_PKEY_DSA1’?
+  838 |     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519) {
+      |                                            ^~~~~~~~~~~~~~~~
+      |                                            EVP_PKEY_DSA1
+gensio_filter_certauth.c:838:44: note: each undeclared identifier is reported only once for each function it appears in
+gensio_filter_certauth.c: In function ‘certauth_add_challenge_rsp’:
+gensio_filter_certauth.c:901:44: error: ‘EVP_PKEY_ED25519’ undeclared (first use in this function); did you mean ‘EVP_PKEY_DSA1’?
+  901 |     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519)
+      |                                            ^~~~~~~~~~~~~~~~
+      |                                            EVP_PKEY_DSA1
+gensio_filter_certauth.c: In function ‘certauth_check_challenge’:
+gensio_filter_certauth.c:1048:35: error: ‘EVP_PKEY_ED25519’ undeclared (first use in this function); did you mean ‘EVP_PKEY_DSA1’?
+ 1048 |     if (EVP_PKEY_base_id(pkey) == EVP_PKEY_ED25519)
+      |                                   ^~~~~~~~~~~~~~~~
+      |                                   EVP_PKEY_DSA1
+
+Signed-off-by: Corey Minyard <cminyard@mvista.com>
+[Retrieved from:
+https://github.com/cminyard/gensio/commit/1e7071684329f23ee3447310d203d193c283979e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/gensio_filter_certauth.c |  6 ++++++
+ tools/gtlssh-keygen.c        | 11 ++++++++++-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/lib/gensio_filter_certauth.c b/lib/gensio_filter_certauth.c
+index 642379b6..c4552e79 100644
+--- a/lib/gensio_filter_certauth.c
++++ b/lib/gensio_filter_certauth.c
+@@ -835,11 +835,13 @@ v3_certauth_add_challenge_rsp(struct certauth_filter *sfilter)
+     unsigned int lenpos, len;
+     int rv = 0;
+ 
++#ifdef EVP_PKEY_ED25519
+     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519) {
+ 	gca_log_err(sfilter,
+ 		    "Remote end or SSL too old to support ed25519 key");
+ 	return GE_KEYINVALID;
+     }
++#endif
+ 
+     certauth_write_byte(sfilter, CERTAUTH_CHALLENGE_RSP);
+     lenpos = sfilter->write_buf_len;
+@@ -898,8 +900,10 @@ certauth_add_challenge_rsp(struct certauth_filter *sfilter)
+     if (sfilter->version < 4 || sfilter->my_version < 4)
+ 	return v3_certauth_add_challenge_rsp(sfilter);
+ 
++#ifdef EVP_PKEY_ED25519
+     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519)
+ 	digest = NULL;
++#endif
+ 
+     certauth_write_byte(sfilter, CERTAUTH_CHALLENGE_RSP);
+     lenpos = sfilter->write_buf_len;
+@@ -1045,8 +1049,10 @@ certauth_check_challenge(struct certauth_filter *sfilter)
+ 	goto out_nomem;
+     }
+ 
++#ifdef EVP_PKEY_ED25519
+     if (EVP_PKEY_base_id(pkey) == EVP_PKEY_ED25519)
+ 	digest = NULL;
++#endif
+ 
+     if (!EVP_DigestVerifyInit(sign_ctx, NULL, digest, NULL, pkey)) {
+ 	gca_logs_err(sfilter, "Digest verify init failed");
+diff --git a/tools/gtlssh-keygen.c b/tools/gtlssh-keygen.c
+index c8c28937..0779dd78 100644
+--- a/tools/gtlssh-keygen.c
++++ b/tools/gtlssh-keygen.c
+@@ -108,7 +108,12 @@ help(const char *progname)
+     P("        The default is your username for normal certificates and\n");
+     P("        the fully qualified domain name for server certificates.\n");
+     P("  --algorithm <algname> - Set the algorithm to use for the key,\n");
+-    P("        either ed25519, rsa or ec.  The default is ed25519.\n");
++    P("        either ed25519, rsa or ec.  ");
++#ifdef EVP_PKEY_ED25519
++    P("The default is ed25519.\n");
++#else
++    P("The default is ec.\n");
++#endif
+     P("  --force, -f - Don't ask questions, just do the operation.  This\n");
+     P("        may overwrite data without asking.\n");
+     P("  --version - Print the version number and exit.\n");
+@@ -831,7 +836,11 @@ genpkey_ed25519(const char *key)
+     return rc != 0;
+ }
+ 
++#ifdef EVP_PKEY_ED25519
+ static int (*genpkey)(const char *key) = genpkey_ed25519;
++#else
++static int (*genpkey)(const char *key) = genpkey_ec;
++#endif
+ 
+ /*
+  * Create a single key.  If name is NULL, it's a server key, otherwise

--===============0047888622237231180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0047888622237231180==--
