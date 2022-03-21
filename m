Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F408C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C57CA60E25;
	Mon, 21 Mar 2022 07:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9X1f0Fu-Z1a; Mon, 21 Mar 2022 07:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB13660E17;
	Mon, 21 Mar 2022 07:38:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB8311BF983
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AABF1824EF
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKAb8VHNHuz2 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:38:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E647E81815
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:38:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CFF8384711; Mon, 21 Mar 2022 07:29:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 08:31:39 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f6481753b2de93bb1c781068619e0fdd0cee40d4
X-Git-Newrev: 8b1b2c3b77371fcda26c9f49738570b22d04b9a8
X-Patchwork-Hint: ignore
Message-Id: <20220321072912.CFF8384711@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libressl: always
 expose SSL_OP_NO_TLSv1_3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b1b2c3b77371fcda26c9f49738570b22d04b9a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the build of vsftpd 3.0.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 181a5e229b347c1996eeca7d7727ee66bc566f01)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-always-expose-SSL_OP_NO_TLSv1_3.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
new file mode 100644
index 0000000000..f34ae85834
--- /dev/null
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -0,0 +1,37 @@
+always expose SSL_OP_NO_TLSv1_3
+
+like in OpenSSL, see https://github.com/openssl/openssl/blob/master/include/openssl/ssl.h.in#L399
+
+like SSL_OP_NO_DTLSv1_2, see commit "Expose various DTLSv1.2 specific functions and defines"
+
+this change fixes the compilation of vsftpd 3.0.4 & 3.0.5, which fails with the following error:
+```
+ssl.c: In function 'ssl_init':
+ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this function); did you mean 'SSL_OP_NO_TLSv1_1'?
+```
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Fetched from: https://github.com/libressl-portable/openbsd/pull/124
+---
+ include/openssl/ssl.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
+index 46f24b2ea..4048a6e63 100644
+--- a/include/openssl/ssl.h
++++ b/include/openssl/ssl.h
+@@ -516,11 +516,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+ #define SSL_OP_NO_TLSv1					0x04000000L
+ #define SSL_OP_NO_TLSv1_2				0x08000000L
+ #define SSL_OP_NO_TLSv1_1				0x10000000L
+-
+-#if defined(LIBRESSL_HAS_TLS1_3) || defined(LIBRESSL_INTERNAL)
+ #define SSL_OP_NO_TLSv1_3				0x20000000L
+-#endif
+-
+ #define SSL_OP_NO_DTLSv1				0x40000000L
+ #define SSL_OP_NO_DTLSv1_2				0x80000000L
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
