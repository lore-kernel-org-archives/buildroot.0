Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40336C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 091CA404D3;
	Sat, 30 Apr 2022 18:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpM1XnnHhpyr; Sat, 30 Apr 2022 18:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66B2F4034B;
	Sat, 30 Apr 2022 18:56:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB3B1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECE4E4034B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKJnLhybGbEc for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29A25404C3
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C8A8884B54; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4b19927cc12d35a74eca0016ada06b21cf32e5e
X-Git-Newrev: 94831ab236ca336109a4f2b78b30129c8dcdf1b5
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.C8A8884B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: fix build with libressl
 >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=94831ab236ca336109a4f2b78b30129c8dcdf1b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

./dnssec.c: In function 'ldns_key_buf2dsa_raw':
./dnssec.c:386:5: error: invalid use of incomplete typedef 'DSA' {aka 'struct dsa_st'}
  386 |  dsa->p = P;
      |     ^~

Fixes:
 - http://autobuild.buildroot.org/results/d754fbaa8f6687597682fbf0b71c16527c8cd603

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...001-Use-accessors-for-DSA-and-RSA-objects.patch | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch b/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
new file mode 100644
index 0000000000..f7ebbbf8b2
--- /dev/null
+++ b/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
@@ -0,0 +1,96 @@
+From 887d618239312cc8c11e41c45492eee02a8f28a2 Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Tue, 11 Jan 2022 21:14:24 +0100
+Subject: [PATCH] Use accessors for DSA and RSA objects
+
+In the upcoming LibreSSL version 3.5, the DSA and RSA structs will
+become opaque, so we should use the OpenSSL 1.1 setters and getters
+to fix the build.  The relevant API has been available since
+LibreSSL 2.7. The last LibreSSL version (2.6) not having these
+accessors was EOL late 2018, so no users should be affected by this
+change.
+
+[Retrieved from:
+https://github.com/NLnetLabs/ldns/commit/887d618239312cc8c11e41c45492eee02a8f28a2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dnssec.c   | 4 ++--
+ host2str.c | 4 ++--
+ keys.c     | 6 +++---
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/dnssec.c b/dnssec.c
+index 63fece52..fbaa518a 100644
+--- a/dnssec.c
++++ b/dnssec.c
+@@ -381,7 +381,7 @@ ldns_key_buf2dsa_raw(const unsigned char* key, size_t len)
+ 		BN_free(Y);
+ 		return NULL;
+ 	}
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ #ifndef S_SPLINT_S
+ 	dsa->p = P;
+ 	dsa->q = Q;
+@@ -468,7 +468,7 @@ ldns_key_buf2rsa_raw(const unsigned char* key, size_t len)
+ 		BN_free(modulus);
+ 		return NULL;
+ 	}
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ #ifndef S_SPLINT_S
+ 	rsa->n = modulus;
+ 	rsa->e = exponent;
+diff --git a/host2str.c b/host2str.c
+index a207a913..634c5676 100644
+--- a/host2str.c
++++ b/host2str.c
+@@ -2451,7 +2451,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
+ 					const BIGNUM *n=NULL, *e=NULL, *d=NULL,
+ 						*p=NULL, *q=NULL, *dmp1=NULL,
+ 						*dmq1=NULL, *iqmp=NULL;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ 					n = rsa->n;
+ 					e = rsa->e;
+ 					d = rsa->d;
+@@ -2504,7 +2504,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
+ 				if(1) {
+ 					const BIGNUM *p=NULL, *q=NULL, *g=NULL,
+ 						*priv_key=NULL, *pub_key=NULL;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ #ifndef S_SPLINT_S
+ 					p = dsa->p;
+ 					q = dsa->q;
+diff --git a/keys.c b/keys.c
+index 91a3dffd..78bea972 100644
+--- a/keys.c
++++ b/keys.c
+@@ -861,7 +861,7 @@ ldns_key_new_frm_fp_rsa_l(FILE *f, int *line_nr)
+ 	}
+ #endif /* splint */
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ # ifndef S_SPLINT_S
+ 	rsa->n = n;
+ 	rsa->e = e;
+@@ -982,7 +982,7 @@ ldns_key_new_frm_fp_dsa_l(FILE *f, ATTR_UNUSED(int *line_nr))
+ 	}
+ #endif /* splint */
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ # ifndef S_SPLINT_S
+ 	dsa->p = p;
+ 	dsa->q = q;
+@@ -1660,7 +1660,7 @@ ldns_key_rsa2bin(unsigned char *data, RSA *k, uint16_t *size)
+ 	if (!k) {
+ 		return false;
+ 	}
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ 	n = k->n;
+ 	e = k->e;
+ #else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
