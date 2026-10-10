Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F7DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0F74095E;
	Sat, 10 Oct 2026 09:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2p4fcya0Oma; Sat, 10 Oct 2026 09:33:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A8A040C2E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624837;
	b=EZKQu3nlnd34fj99r6z9/f3LQMcD6kUfi1PUBjWVoWXPjYvytruIxNjsyuM4ZJpl9uS8
	 ZU4ttrnSnW9tu+hZQkCZl69/cXJrbFiRNCFAr1PVmx0de86l6/zBrc7WEzsYKQazTNVTn
	 owTon/GCmW7IZzWJx2td64w68QGNyspQVhSJ/Fa7MdcFTz5xvLRkW/58fSywVOXU5xhNa
	 +zS7iwMxQGWdj7YgSM5eZ0wyRUG1uroOI2ehVFIdyNuoBWkXN2jNOIik+GTMm9OJRfD0j
	 zCk5aPkWUJlhAU6dlVY/O/rW5HUMVmxu+CQHxneb0KoSmRuoJZrtbKzGrFO1xr3hlxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624837;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=yP7ddZc9SlFQBfK725ng6SQtv1tOC77/gOZmajmQ4l8=;
	b=BBn9t1gRV3TG6WGMm1/6fjF8qnsp3i9fs4A+vsKc31tRuWHrVsgYKrcxC/s0U5uXad2q
	 QnINRZsOudgGu5WSK+WWTnsSRGS24Lb/co4ReDPhkHn3lAMkCq/K8f7TEuCS/hxHkgg5c
	 28OAc+NrwVGsI84P8zA8TY9ab0t+RtuhnZrcJ7JdUah0pLGba9lorrDN98Y35qPh+Mh31
	 WDEzWKwIMTo9t46QRyXFFtEu2UFPOCt6ZrwmAiO4mw2UmBqPXNP4LexjqH3l1kjlP8NMz
	 YzB09PUkX+DTttK9bsq+ctMv5IdldQms1+QhzdqL+HEPrVprMmqXLLhhjmlv86bly0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624837;
	bh=yP7ddZc9SlFQBfK725ng6SQtv1tOC77/gOZmajmQ4l8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GuZEWB9HjP/n0HfZIjh4Lj+iTf20DbRvpQoIyrKKH0KPV5KVvbUTxX7FbHOSdLq6E
	 /Hxxyo8m/pt8RjhFylp/atUro0+3PSV9t/25ZK5hV65YTAD6PpvlmxQ86qfC+2FeuH
	 s8rS0znSYVpsTFrjFkpfgs5AJ58iS5jygGl/YCyLVI7WVeyS3XJnxeaUR2NChp2V9h
	 9SY3b9o4sujdknGJDLXj+ezbfWY7YRhTDbQh6LvIFI+PHexfBIrrLIktLscIVSkZQC
	 TgSP5DoEL8eOq98KgpSiHJvC8OjFH9Eq3ssCJgSOWYBHdApx/B/PsynXIm8LWwmIX5
	 /rub2IfSh3gFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8A040C2E;
	Sat, 10 Oct 2026 09:33:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98AF39D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95D7D40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcgUQaj6ZZ3h for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:33:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D097C400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624833;
 b=J/Q0MDaXs1YWIi6Z3Wy40KJ8GRygSjxSvQ6VCP0MmrHY+1MosJEfi4RHFcSTyiEYHJy/
 yh6dDmmr3URXtkNsP5QTPMoVfp6E0tkaMrkzqdoMwNIN7CeJn8PEpeqNVwdWxoyGS/vlh
 Z7NHyoC9Tc+yXDJgqMXj4WbnaCnnkKVObURQR6NiB3zMnnaRmPwJaUS7C1Dwf2eY+199s
 H5qJnppkQ2d37KjNWAsFoYi/254h3Pwhn5ufYkbT1Uv0DbSjzNevtUz+o6XtUgprGGt50
 5A4PUKlJgPQW+sRalX6/Ux/4zkGcUy1sbDjU8SPzbH/Vvi85d5OijrbUt8HyfODOOpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624833;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Jel+cP1+f1wiIVsMJouVXtdI+v0R0ExVO3QwgFhNXak=;
 b=PRiKDDGXltnrZVljC51qaoCC/r3WTYAl1ly1qMCThQA+BRYrOJ+3nYx1+zyyeaC1aZLz
 ruQlxNLuHuzydEUGvhj+HbH3KxbZI2Qtjh6k8grO4LlMiHr+xHjDgOjHDiKLFvjCONVlH
 FwhiLTgh4Tl38QpjhFlO+wPDzziu1FK/ueNPSAdR0tQG30Ji5CODMr6qRXKdyITDbt15w
 Xdim3WTAxMQdTxTKG52AmE1KRvrtSXiAR8Bv03QC+UjYRZETP63X0fd3r2tfkB/daC7cT
 BQURMML42sWIliug5jUW+tXPnUQBt8PHhrmPhPv7xwGTzJ1/UQzAToABtCTizOLYEMw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D097C400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:33:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A53E78F7C7; Sat, 10 Oct 2026 09:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:28:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2ee0b3e3e4f18e677f3083805f03f45bdc43321
X-Git-Newrev: 803518cba90c4660c4f947bbc83e9f0b316d9c34
X-Patchwork-Hint: ignore
Message-Id: <20261010093235.A53E78F7C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-ssleay: add support for
 OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5630027334040357188=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5630027334040357188==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/803518cba90c4660c4f947bbc83e9f0b316d9c34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch          |  39 ++++
 ...0.0-remove-support-for-some-TLS-functions.patch | 197 +++++++++++++++++++++
 ...-Net-SSLeay-to-support-opaque-ASN1_STRING.patch | 179 +++++++++++++++++++
 ...s-for-removal-of-SSLv2-Client-Hello-suppo.patch |  66 +++++++
 ...-for-Net-SSLeay-OPENSSL_info-return-value.patch |  45 +++++
 ...es-for-OPenSSL-4-support-and-update-tests.patch |  94 ++++++++++
 ...elif-but-if-with-else-to-avoid-duplicate-.patch |  83 +++++++++
 7 files changed, 703 insertions(+)

diff --git a/package/perl-net-ssleay/0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch b/package/perl-net-ssleay/0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..8257c6c00f
--- /dev/null
+++ b/package/perl-net-ssleay/0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch
@@ -0,0 +1,39 @@
+From 361b3adc1dd09f70be7bd8972992626a3240b58d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michal=20Josef=20=C5=A0pa=C4=8Dek?= <mspacek@redhat.com>
+Date: Tue, 14 Apr 2026 12:37:39 +0200
+Subject: [PATCH] Fix SSLv3 in OpenSSL 4.0.0
+
+Support for SSLv3 was removed.
+
+Upstream: https://github.com/radiator-software/p5-net-ssleay/pull/553/changes/361b3adc1dd09f70be7bd8972992626a3240b58d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ SSLeay.xs | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index 0ed7d96..5407fa1 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -2454,7 +2454,7 @@ SSL_CTX_v2_new()
+ 
+ #endif
+ #endif
+-#ifndef OPENSSL_NO_SSL3
++#if !defined(OPENSSL_NO_SSL3) && OPENSSL_VERSION_NUMBER < 0x40000000L
+ 
+ SSL_CTX *
+ SSL_CTX_v3_new()
+@@ -5600,7 +5600,7 @@ SSLv2_method()
+ #endif
+ #endif
+ 
+-#ifndef OPENSSL_NO_SSL3
++#if !defined(OPENSSL_NO_SSL3) && OPENSSL_VERSION_NUMBER < 0x40000000L
+ 
+ const SSL_METHOD *
+ SSLv3_method()
+-- 
+2.47.3
+
diff --git a/package/perl-net-ssleay/0003-OpenSSL-4.0.0-remove-support-for-some-TLS-functions.patch b/package/perl-net-ssleay/0003-OpenSSL-4.0.0-remove-support-for-some-TLS-functions.patch
new file mode 100644
index 0000000000..916acdcac9
--- /dev/null
+++ b/package/perl-net-ssleay/0003-OpenSSL-4.0.0-remove-support-for-some-TLS-functions.patch
@@ -0,0 +1,197 @@
+From 780c7ad4803d0fc8e755bb86e589f84898e65040 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michal=20Josef=20=C5=A0pa=C4=8Dek?= <mspacek@redhat.com>
+Date: Tue, 14 Apr 2026 14:08:00 +0200
+Subject: [PATCH] OpenSSL 4.0.0 remove support for some TLS functions
+
+Removes fixed version TLS methods
+(https://github.com/openssl/openssl/pull/30128)
+
+Upstream: https://github.com/radiator-software/p5-net-ssleay/pull/553/changes/780c7ad4803d0fc8e755bb86e589f84898e65040
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ SSLeay.xs          | 51 ++++++++++++++++++++++++++++++++++++++++------
+ lib/Net/SSLeay.pod | 17 +++++++++-------
+ 2 files changed, 55 insertions(+), 13 deletions(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index 5407fa1..ad996d5 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -2472,7 +2472,7 @@ SSL_CTX_v23_new()
+      OUTPUT:
+      RETVAL
+ 
+-#if !defined(OPENSSL_NO_TLS1_METHOD)
++#if !defined(OPENSSL_NO_TLS1_METHOD) && OPENSSL_VERSION_NUMBER < 0x40000000L
+ 
+ SSL_CTX *
+ SSL_CTX_tlsv1_new()
+@@ -2481,9 +2481,22 @@ SSL_CTX_tlsv1_new()
+      OUTPUT:
+      RETVAL
+ 
++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++
++SSL_CTX *
++SSL_CTX_tlsv1_new()
++     CODE:
++     RETVAL = SSL_CTX_new(TLS_method());
++     if (RETVAL) {
++          SSL_CTX_set_min_proto_version(RETVAL, TLS1_VERSION);
++          SSL_CTX_set_max_proto_version(RETVAL, TLS1_VERSION);
++     }
++     OUTPUT:
++     RETVAL
++
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && !defined(OPENSSL_NO_TLS1_1_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_1_METHOD)) /* OpenSSL 1.0.1-beta1 */
+ 
+ SSL_CTX *
+ SSL_CTX_tlsv1_1_new()
+@@ -2492,9 +2505,22 @@ SSL_CTX_tlsv1_1_new()
+      OUTPUT:
+      RETVAL
+ 
++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++
++SSL_CTX *
++SSL_CTX_tlsv1_1_new()
++     CODE:
++     RETVAL = SSL_CTX_new(TLS_method());
++     if (RETVAL) {
++          SSL_CTX_set_min_proto_version(RETVAL, TLS1_1_VERSION);
++          SSL_CTX_set_max_proto_version(RETVAL, TLS1_1_VERSION);
++     }
++     OUTPUT:
++     RETVAL
++
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && !defined(OPENSSL_NO_TLS1_2_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_2_METHOD)) /* OpenSSL 1.0.1-beta1 */
+ 
+ SSL_CTX *
+ SSL_CTX_tlsv1_2_new()
+@@ -2503,6 +2529,19 @@ SSL_CTX_tlsv1_2_new()
+      OUTPUT:
+      RETVAL
+ 
++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++
++SSL_CTX *
++SSL_CTX_tlsv1_2_new()
++     CODE:
++     RETVAL = SSL_CTX_new(TLS_method());
++     if (RETVAL) {
++          SSL_CTX_set_min_proto_version(RETVAL, TLS1_2_VERSION);
++          SSL_CTX_set_max_proto_version(RETVAL, TLS1_2_VERSION);
++     }
++     OUTPUT:
++     RETVAL
++
+ #endif
+ 
+ SSL_CTX *
+@@ -5616,7 +5655,7 @@ SSLv23_server_method()
+ const SSL_METHOD *
+ SSLv23_client_method()
+ 
+-#if !defined(OPENSSL_NO_TLS1_METHOD)
++#if !defined(OPENSSL_NO_TLS1_METHOD) && OPENSSL_VERSION_NUMBER < 0x40000000L
+ 
+ const SSL_METHOD *
+ TLSv1_method()
+@@ -5629,7 +5668,7 @@ TLSv1_client_method()
+ 
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && !defined(OPENSSL_NO_TLS1_1_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_1_METHOD)) /* OpenSSL 1.0.1-beta1 */
+ 
+ const SSL_METHOD *
+ TLSv1_1_method()
+@@ -5642,7 +5681,7 @@ TLSv1_1_client_method()
+ 
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && !defined(OPENSSL_NO_TLS1_2_METHOD)) /* OpenSSL 1.0.1-beta1 */
++#if (OPENSSL_VERSION_NUMBER >= 0x10001001L && OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_2_METHOD)) /* OpenSSL 1.0.1-beta1 */
+ 
+ const SSL_METHOD *
+ TLSv1_2_method()
+diff --git a/lib/Net/SSLeay.pod b/lib/Net/SSLeay.pod
+index 554fd11..d947ad3 100644
+--- a/lib/Net/SSLeay.pod
++++ b/lib/Net/SSLeay.pod
+@@ -1575,7 +1575,7 @@ Check openssl doc L<https://www.openssl.org/docs/manmaster/man3/SSL_CTX_new.html
+ 
+ =item * TLSv1_method, TLSv1_server_method and TLSv1_client_method
+ 
+-B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLSv1. Server and client methods not available in Net-SSLeay-1.82 and before.
++B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLSv1. Server and client methods not available in Net-SSLeay-1.82 and before. Not available in OpenSSL 4.0.0 and later. Use L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead.
+ 
+ Returns SSL_METHOD structure corresponding to TLSv1 method, the return value can be later used as a param of L</CTX_new_with_method>.
+ 
+@@ -1587,7 +1587,7 @@ Check openssl doc L<https://www.openssl.org/docs/manmaster/man3/SSL_CTX_new.html
+ 
+ =item * TLSv1_1_method, TLSv1_1_server_method and TLSv1_1_client_method
+ 
+-B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.1. Server and client methods not available in Net-SSLeay-1.82 and before.
++B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.1. Server and client methods not available in Net-SSLeay-1.82 and before. Not available in OpenSSL 4.0.0 and later. Use L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead.
+ 
+ Returns SSL_METHOD structure corresponding to TLSv1_1 method, the return value can be later used as a param of L</CTX_new_with_method>.
+ 
+@@ -1599,7 +1599,7 @@ Check openssl doc L<https://www.openssl.org/docs/manmaster/man3/SSL_CTX_new.html
+ 
+ =item * TLSv1_2_method, TLSv1_2_server_method and TLSv1_2_client_method
+ 
+-B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.2. Server and client methods not available in Net-SSLeay-1.82 and before.
++B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.2. Server and client methods not available in Net-SSLeay-1.82 and before. Not available in OpenSSL 4.0.0 and later. Use L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead.
+ 
+ Returns SSL_METHOD structure corresponding to TLSv1_2 method, the return value can be later used as a param of L</CTX_new_with_method>.
+ 
+@@ -2998,7 +2998,7 @@ Creates a new SSL_CTX object - based on SSLv3_method() - as framework to establi
+ 
+ =item * CTX_tlsv1_new
+ 
+-B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLSv1.
++B<COMPATIBILITY:> Requires OpenSSL or LibreSSL built with support for TLSv1. In OpenSSL 4.0.0 and later, this function is emulated using L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> for backward compatibility. It is recommended to use L</CTX_new> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead.
+ 
+ Creates a new SSL_CTX object - based on C<TLSv1_method()> - as a framework for establishing connections using TLSv1.
+ 
+@@ -3008,7 +3008,7 @@ Creates a new SSL_CTX object - based on C<TLSv1_method()> - as a framework for e
+ 
+ =item * CTX_tlsv1_1_new
+ 
+-B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.1.
++B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.1. In OpenSSL 4.0.0 and later, this function is emulated using L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> for backward compatibility. It is recommended to use L</CTX_new> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead.
+ 
+ Creates a new SSL_CTX object - based on C<TLSv1_1_method()> - as a framework for establishing connections using TLSv1.1.
+ 
+@@ -3018,7 +3018,7 @@ Creates a new SSL_CTX object - based on C<TLSv1_1_method()> - as a framework for
+ 
+ =item * CTX_tlsv1_2_new
+ 
+-B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.2.
++B<COMPATIBILITY:> Requires OpenSSL >= 1.0.1 or LibreSSL built with support for TLSv1.2. In OpenSSL 4.0.0 and later, this function is emulated using L</TLS_method> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> for backward compatibility. It is recommended to use L</CTX_new> with L</CTX_set_min_proto_version> and L</CTX_set_max_proto_version> instead.
+ 
+ Creates a new SSL_CTX object - based on C<TLSv1_2_method()> - as a framework for establishing connections using TLSv1.2.
+ 
+@@ -3035,7 +3035,10 @@ Creates a new SSL_CTX object based on $meth method
+     #
+     # returns: value corresponding to openssl's SSL_CTX structure (0 on failure)
+ 
+-    # example
++    # example (recommended, available since OpenSSL 1.1.0)
++    my $ctx = Net::SSLeay::CTX_new_with_method(&Net::SSLeay::TLS_method);
++
++    # example (TLSv1_method not available in OpenSSL 4.0.0+)
+     my $ctx = Net::SSLeay::CTX_new_with_method(&Net::SSLeay::TLSv1_method);
+ 
+ Check openssl doc L<https://www.openssl.org/docs/manmaster/man3/SSL_CTX_new.html>
+-- 
+2.47.3
+
diff --git a/package/perl-net-ssleay/0004-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch b/package/perl-net-ssleay/0004-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..3b828ee9d2
--- /dev/null
+++ b/package/perl-net-ssleay/0004-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch
@@ -0,0 +1,179 @@
+From 929e8eb5ae2953fdb5231588a9d916ae6cffa939 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michal=20Josef=20=C5=A0pa=C4=8Dek?= <mspacek@redhat.com>
+Date: Tue, 14 Apr 2026 14:32:27 +0200
+Subject: [PATCH] Fix Net::SSLeay to support opaque ASN1_STRING
+
+Upstream: https://github.com/radiator-software/p5-net-ssleay/pull/553/changes/929e8eb5ae2953fdb5231588a9d916ae6cffa939
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ SSLeay.xs | 95 +++++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 57 insertions(+), 38 deletions(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index ad996d5..2567d81 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -2194,35 +2194,41 @@ int ssl_ctx_set_cert_cb_invoke(SSL *ssl, void *arg)
+ 
+ time_t ASN1_TIME_timet(ASN1_TIME *asn1t, time_t *gmtoff) {
+     struct tm t;
+-    const char *p = (const char*) asn1t->data;
++#if (OPENSSL_VERSION_NUMBER >= 0x1010000f && !defined(LIBRESSL_VERSION_NUMBER)) || (LIBRESSL_VERSION_NUMBER >= 0x2070000fL)
++    const char *p = (const char*) ASN1_STRING_get0_data(asn1t);
++#else
++    const char *p = (const char*) ASN1_STRING_data(asn1t);
++#endif
++    int asn1t_length = ASN1_STRING_length(asn1t);
++    int asn1t_type = ASN1_STRING_type(asn1t);
+     size_t msec = 0, tz = 0, i, l;
+     time_t result;
+     int adj = 0;
+ 
+-    if (asn1t->type == V_ASN1_UTCTIME) {
+-	if (asn1t->length<12 || asn1t->length>17) return 0;
+-	if (asn1t->length>12) tz = 12;
++    if (asn1t_type == V_ASN1_UTCTIME) {
++	if (asn1t_length<12 || asn1t_length>17) return 0;
++	if (asn1t_length>12) tz = 12;
+     } else {
+-	if (asn1t->length<14) return 0;
+-	if (asn1t->length>14) {
++	if (asn1t_length<14) return 0;
++	if (asn1t_length>14) {
+ 	    if (p[14] == '.') {
+ 		msec = 14;
+-		for(i=msec+1;i<asn1t->length && p[i]>='0' && p[i]<='9';i++) ;
+-		if (i<asn1t->length) tz = i;
++		for(i=msec+1;i<(size_t)asn1t_length && p[i]>='0' && p[i]<='9';i++) ;
++		if (i<(size_t)asn1t_length) tz = i;
+ 	    } else {
+ 		tz = 14;
+ 	    }
+ 	}
+     }
+ 
+-    l = msec ? msec : tz ? tz : asn1t->length;
++    l = msec ? msec : tz ? tz : (size_t)asn1t_length;
+     for(i=0;i<l;i++) {
+ 	if (p[i]<'0' || p[i]>'9') return 0;
+     }
+ 
+     /* extract data and time */
+     OPENSSL_cleanse(&t, sizeof(t));
+-    if (asn1t->type == V_ASN1_UTCTIME) { /* YY - two digit year */
++    if (asn1t_type == V_ASN1_UTCTIME) { /* YY - two digit year */
+ 	t.tm_year = (p[0]-'0')*10 + (p[1]-'0');
+ 	if (t.tm_year < 70) t.tm_year += 100;
+ 	i=2;
+@@ -2242,11 +2248,11 @@ time_t ASN1_TIME_timet(ASN1_TIME *asn1t, time_t *gmtoff) {
+     if (tz) {
+ 	/* TZ is 'Z' or [+-]DDDD and after TZ the string must stop*/
+ 	if (p[tz] == 'Z') {
+-	    if (asn1t->length>tz+1 ) return 0;
+-	} else if (asn1t->length<tz+5 || (p[tz]!='-' && p[tz]!='+')) {
++	    if ((size_t)asn1t_length>tz+1 ) return 0;
++	} else if ((size_t)asn1t_length<tz+5 || (p[tz]!='-' && p[tz]!='+')) {
+ 	    return 0;
+ 	} else {
+-	    if (asn1t->length>tz+5 ) return 0;
++	    if ((size_t)asn1t_length>tz+5 ) return 0;
+ 	    for(i=tz+1;i<tz+5;i++) {
+ 		if (p[i]<'0' || p[i]>'9') return 0;
+ 	    }
+@@ -4690,7 +4696,11 @@ X509_get_subjectAltNames(cert)
+                          EXTEND(SP, 2);
+                          count++;
+                          PUSHs(sv_2mortal(newSViv(subjAltNameDN->type)));
+-                         PUSHs(sv_2mortal(newSVpv((const char*)subjAltNameDN->d.ip->data, subjAltNameDN->d.ip->length)));
++#if (OPENSSL_VERSION_NUMBER >= 0x1010000f && !defined(LIBRESSL_VERSION_NUMBER)) || (LIBRESSL_VERSION_NUMBER >= 0x2070000fL)
++                         PUSHs(sv_2mortal(newSVpv((const char*)ASN1_STRING_get0_data(subjAltNameDN->d.ip), ASN1_STRING_length(subjAltNameDN->d.ip))));
++#else
++                         PUSHs(sv_2mortal(newSVpv((const char*)ASN1_STRING_data(subjAltNameDN->d.ip), ASN1_STRING_length(subjAltNameDN->d.ip))));
++#endif
+                          break;
+ 
+                      }
+@@ -5229,15 +5239,20 @@ P_ASN1_TIME_get_isotime(tm)
+      ASN1_TIME_to_generalizedtime(tm,&tmp);
+      if (tmp) {
+        if (ASN1_GENERALIZEDTIME_check(tmp)) {
+-         if (strlen((char*)tmp->data)>=14 && strlen((char*)tmp->data)<200) {
++#if (OPENSSL_VERSION_NUMBER >= 0x1010000f && !defined(LIBRESSL_VERSION_NUMBER)) || (LIBRESSL_VERSION_NUMBER >= 0x2070000fL)
++         const char *tmp_data = (const char*)ASN1_STRING_get0_data(tmp);
++#else
++         const char *tmp_data = (const char*)ASN1_STRING_data(tmp);
++#endif
++         if (strlen(tmp_data)>=14 && strlen(tmp_data)<200) {
+            strcpy (buf,"yyyy-mm-ddThh:mm:ss");
+-           strncpy(buf,   (char*)tmp->data,   4);
+-           strncpy(buf+5, (char*)tmp->data+4, 2);
+-           strncpy(buf+8, (char*)tmp->data+6, 2);
+-           strncpy(buf+11,(char*)tmp->data+8, 2);
+-           strncpy(buf+14,(char*)tmp->data+10,2);
+-           strncpy(buf+17,(char*)tmp->data+12,2);
+-           if (strlen((char*)tmp->data)>14) strcat(buf+19,(char*)tmp->data+14);
++           strncpy(buf,   tmp_data,   4);
++           strncpy(buf+5, tmp_data+4, 2);
++           strncpy(buf+8, tmp_data+6, 2);
++           strncpy(buf+11,tmp_data+8, 2);
++           strncpy(buf+14,tmp_data+10,2);
++           strncpy(buf+17,tmp_data+12,2);
++           if (strlen(tmp_data)>14) strcat(buf+19,tmp_data+14);
+          }
+        }
+        ASN1_GENERALIZEDTIME_free(tmp);
+@@ -5250,7 +5265,6 @@ P_ASN1_TIME_set_isotime(tm,str)
+      ASN1_TIME *tm
+      const char *str
+      PREINIT:
+-     ASN1_TIME t;
+      char buf[256];
+      int i,rv;
+      CODE:
+@@ -5272,22 +5286,27 @@ P_ASN1_TIME_set_isotime(tm,str)
+      buf[14] = '\0';
+      if (strlen(str)>19 && strlen(str)<200) strcat(buf,str+19);
+ 
+-     /* WORKAROUND: ASN1_TIME_set_string() not available in 0.9.8 !!!*/
+-     /* in 1.0.0 we would simply: rv = ASN1_TIME_set_string(tm,buf); */
+-     t.length = strlen(buf);
+-     t.data = (unsigned char *)buf;
+-     t.flags = 0;
+-     t.type = V_ASN1_UTCTIME;
+-     if (!ASN1_TIME_check(&t)) {
+-        t.type = V_ASN1_GENERALIZEDTIME;
+-        if (!ASN1_TIME_check(&t)) XSRETURN_UNDEF;
++     /* ASN1_TIME_set_string() not available in 0.9.8 */
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++     rv = ASN1_TIME_set_string(tm, buf);
++     if (!rv) XSRETURN_UNDEF;
++#else
++     {
++        ASN1_TIME t;
++        t.length = strlen(buf);
++        t.data = (unsigned char *)buf;
++        t.flags = 0;
++        t.type = V_ASN1_UTCTIME;
++        if (!ASN1_TIME_check(&t)) {
++           t.type = V_ASN1_GENERALIZEDTIME;
++           if (!ASN1_TIME_check(&t)) XSRETURN_UNDEF;
++        }
++        tm->type = t.type;
++        tm->flags = t.flags;
++        if (!ASN1_STRING_set(tm,t.data,t.length)) XSRETURN_UNDEF;
++        rv = 1;
+      }
+-     tm->type = t.type;
+-     tm->flags = t.flags;
+-     if (!ASN1_STRING_set(tm,t.data,t.length)) XSRETURN_UNDEF;
+-     rv = 1;
+-
+-     /* end of ASN1_TIME_set_string() reimplementation */
++#endif
+ 
+      ST(0) = sv_newmortal();
+      sv_setiv(ST(0), rv); /* 1 = success, undef = failure */
+-- 
+2.47.3
+
diff --git a/package/perl-net-ssleay/0005-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch b/package/perl-net-ssleay/0005-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch
new file mode 100644
index 0000000000..10fd4adccf
--- /dev/null
+++ b/package/perl-net-ssleay/0005-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch
@@ -0,0 +1,66 @@
+From 1a5837fa489836f0dfc411d3a0c4d955ce8fab8c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michal=20Josef=20=C5=A0pa=C4=8Dek?= <mspacek@redhat.com>
+Date: Tue, 14 Apr 2026 14:48:51 +0200
+Subject: [PATCH] Update tests for removal of SSLv2 Client Hello support in
+ OpenSSL 4.0.0
+
+Upstream: https://github.com/radiator-software/p5-net-ssleay/pull/553/changes/1a5837fa489836f0dfc411d3a0c4d955ce8fab8c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ t/local/48_client_hello_callback.t | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/t/local/48_client_hello_callback.t b/t/local/48_client_hello_callback.t
+index d99122c..110d769 100644
+--- a/t/local/48_client_hello_callback.t
++++ b/t/local/48_client_hello_callback.t
+@@ -5,13 +5,15 @@ use Test::Net::SSLeay qw(
+     can_fork data_file_path initialise_libssl new_ctx tcp_socket
+ );
+ 
++my $has_sslv2_hello;
+ BEGIN {
+     if (not defined &Net::SSLeay::CTX_set_client_hello_cb) {
+         plan skip_all => "No SSL_CTX_set_client_hello_cb()";
+     } elsif (not can_fork()) {
+         plan skip_all => "fork() not supported on this system";
+     } else {
+-        plan tests => 41;
++        $has_sslv2_hello = Net::SSLeay::SSLeay() < 0x40000000;
++        plan tests => $has_sslv2_hello ? 41 : 30;
+     }
+ }
+ 
+@@ -172,7 +174,7 @@ my @cb_tests = (
+     # argument passed to the callback
+     # true if the callback function triggers croak()
+     # true if the client needs to test that ALPN alert (120) is received
+-    [ \&client_hello_cb_v2hello_detection, undef, 0 ],
++    ($has_sslv2_hello ? [ \&client_hello_cb_v2hello_detection, undef, 0 ] : ()),
+     [ \&client_hello_cb_getters, undef, 0 ],
+     [ \&client_hello_cb_value_passing, \$cb_test_arg, 0 ],
+     [ \&client_hello_cb_alert_alpn, undef, 0, 'alerts'],
+@@ -248,8 +250,8 @@ my @results;
+     };
+ 
+     # Start with SSLv2 ClientHello detection test. Send a canned SSLv2
+-    # ClientHello.
+-    {
++    # ClientHello. Removed in OpenSSL 4.0.0.
++    if ($has_sslv2_hello) {
+ 	my $s_clientv2 = $server->connect();
+ 	my $clientv2_hello = get_sslv2_hello();
+ 	syswrite($s_clientv2, $clientv2_hello, length $clientv2_hello);
+@@ -306,7 +308,7 @@ my @results;
+ waitpid $pid, 0;
+ push @results, [$? == 0, 'Client: server exited with 0'];
+ END {
+-  Test::More->builder->current_test(37);
++  Test::More->builder->current_test($has_sslv2_hello ? 37 : 27);
+   ok( $_->[0], $_->[1] ) for (@results);
+ }
+ 
+-- 
+2.47.3
+
diff --git a/package/perl-net-ssleay/0006-Add-default-for-Net-SSLeay-OPENSSL_info-return-value.patch b/package/perl-net-ssleay/0006-Add-default-for-Net-SSLeay-OPENSSL_info-return-value.patch
new file mode 100644
index 0000000000..62946776f0
--- /dev/null
+++ b/package/perl-net-ssleay/0006-Add-default-for-Net-SSLeay-OPENSSL_info-return-value.patch
@@ -0,0 +1,45 @@
+From 89f6aa5d9f9e0c8976d2dbb07b51abe3a12457cc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michal=20Josef=20=C5=A0pa=C4=8Dek?= <mspacek@redhat.com>
+Date: Tue, 14 Apr 2026 14:55:42 +0200
+Subject: [PATCH] Add default '' for Net::SSLeay::OPENSSL_info() return value
+ in tests
+
+The root cause was the removal of engines in OpenSSL 4.0.0, which
+triggered a warning.
+
+Upstream: https://github.com/radiator-software/p5-net-ssleay/pull/553/changes/89f6aa5d9f9e0c8976d2dbb07b51abe3a12457cc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ t/local/03_use.t | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/t/local/03_use.t b/t/local/03_use.t
+index 36364b4..f8fd1ae 100644
+--- a/t/local/03_use.t
++++ b/t/local/03_use.t
+@@ -63,12 +63,13 @@ if (defined &Net::SSLeay::OPENSSL_version_major) {
+     diag("  OPENSSL_version_build_metadata(): '" . Net::SSLeay::OPENSSL_version_build_metadata() . "'");
+     diag("");
+     diag("Library information with OPENSSL_info():");
+-    diag("  OPENSSL_INFO_CONFIG_DIR:             '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_CONFIG_DIR())             . "'");
+-    diag("  OPENSSL_INFO_ENGINES_DIR:            '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_ENGINES_DIR())            . "'");
+-    diag("  OPENSSL_INFO_MODULES_DIR:            '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_MODULES_DIR())            . "'");
+-    diag("  OPENSSL_INFO_DSO_EXTENSION:          '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_DSO_EXTENSION())          . "'");
+-    diag("  OPENSSL_INFO_DIR_FILENAME_SEPARATOR: '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_DIR_FILENAME_SEPARATOR()) . "'");
+-    diag("  OPENSSL_INFO_LIST_SEPARATOR:         '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_LIST_SEPARATOR())         . "'");
+-    diag("  OPENSSL_INFO_SEED_SOURCE:            '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_SEED_SOURCE())            . "'");
+-    diag("  OPENSSL_INFO_CPU_SETTINGS:           '" . Net::SSLeay::OPENSSL_info(Net::SSLeay::OPENSSL_INFO_CPU_SETTINGS())           . "'");
++    my $ossl_info = sub { my $v = Net::SSLeay::OPENSSL_info($_[0]); defined $v ? $v : '' };
++    diag("  OPENSSL_INFO_CONFIG_DIR:             '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_CONFIG_DIR())             . "'");
++    diag("  OPENSSL_INFO_ENGINES_DIR:            '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_ENGINES_DIR())            . "'");
++    diag("  OPENSSL_INFO_MODULES_DIR:            '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_MODULES_DIR())            . "'");
++    diag("  OPENSSL_INFO_DSO_EXTENSION:          '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_DSO_EXTENSION())          . "'");
++    diag("  OPENSSL_INFO_DIR_FILENAME_SEPARATOR: '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_DIR_FILENAME_SEPARATOR()) . "'");
++    diag("  OPENSSL_INFO_LIST_SEPARATOR:         '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_LIST_SEPARATOR())         . "'");
++    diag("  OPENSSL_INFO_SEED_SOURCE:            '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_SEED_SOURCE())            . "'");
++    diag("  OPENSSL_INFO_CPU_SETTINGS:           '" . $ossl_info->(Net::SSLeay::OPENSSL_INFO_CPU_SETTINGS())           . "'");
+ }
+-- 
+2.47.3
+
diff --git a/package/perl-net-ssleay/0007-Add-Changes-for-OPenSSL-4-support-and-update-tests.patch b/package/perl-net-ssleay/0007-Add-Changes-for-OPenSSL-4-support-and-update-tests.patch
new file mode 100644
index 0000000000..943c8f737c
--- /dev/null
+++ b/package/perl-net-ssleay/0007-Add-Changes-for-OPenSSL-4-support-and-update-tests.patch
@@ -0,0 +1,94 @@
+From cbe701c4cf200978f6332156d3b9889cf7c4984e Mon Sep 17 00:00:00 2001
+From: Heikki Vatiainen <hvn@radiatorsoftware.com>
+Date: Wed, 17 Jun 2026 10:02:11 +0300
+Subject: [PATCH] Add Changes for OPenSSL 4 support and update tests.
+
+Update the test helper module for better detection of available TLS versions
+with OpenSSL 4. Otherwise some of the tests with older TLS methods may be
+skipped even though they are available with OpenSSL 4.
+
+Upstream: https://github.com/radiator-software/p5-net-ssleay/pull/553/changes/cbe701c4cf200978f6332156d3b9889cf7c4984e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Changes                | 20 ++++++++++++++++++++
+ inc/Test/Net/SSLeay.pm | 19 +++++++++++++++++++
+ 2 files changed, 39 insertions(+)
+
+diff --git a/Changes b/Changes
+index 09113fe..ff75ff2 100644
+--- a/Changes
++++ b/Changes
+@@ -1,5 +1,25 @@
+ Revision history for Perl extension Net::SSLeay.
+ 
++1.97_01 ????-??-??
++	- Support for OpenSSL 4.0.0. Contributed by Michal Josef Špaček.
++	  - Net::SSLeay specific functions CTX_tlsv1_new(),
++	    CTX_tlsv1_1_new() and CTX_tlsv1_2_new() with OpenSSL 4.0.0
++	    and later are emulated using TLS_method() with
++	    SSL_CTX_set_min_proto_version() and
++	    SSL_CTX_set_max_proto_version() for backward
++	    compatibility. It is recommended to use
++	    Net::SSLeay::CTX_new() with
++	    Net::SSLeay::CTX_set_min_proto_version() and
++	    Net::SSLeay::CTX_set_max_proto_version() instead.
++	  - TLSv1_method, TLSv1_server_method and TLSv1_client_method,
++	    TLSv1_1_method, TLSv1_1_server_method and
++	    TLSv1_1_client_method, TLSv1_2_method,
++	    TLSv1_2_server_method and TLSv1_2_client_method are
++	    removed in OpenSSL 4.0.0. Use TLS_method() with
++	    CTX_set_min_proto_version() and
++	    CTX_set_max_proto_version() instead.
++	  - CTX_v3_new() is removed with OpenSSL 4.0.0 and later.
++
+ 1.96 2026-03-21
+ 	- New stable release incorporating all changes from developer releases
+ 	  1.95_01 to 1.95_03.
+diff --git a/inc/Test/Net/SSLeay.pm b/inc/Test/Net/SSLeay.pm
+index ce0b03e..ddcc421 100644
+--- a/inc/Test/Net/SSLeay.pm
++++ b/inc/Test/Net/SSLeay.pm
+@@ -38,6 +38,8 @@ my $data_path = catfile( dirname(__FILE__), '..', '..', '..', 't', 'data' );
+ 
+ my $initialised = 0;
+ 
++# All version-specific methods were removed in OpenSSL 4.0. This list
++# may be updated once the library is loaded and its version is known.
+ my %protos = (
+     'TLSv1.3' => {
+         constant      => \&Net::SSLeay::TLS1_3_VERSION,
+@@ -104,6 +106,15 @@ sub _libssl_fatal {
+ sub _load_net_ssleay {
+     eval { require Net::SSLeay; 1; } or croak $EVAL_ERROR;
+ 
++    if (Net::SSLeay::OPENSSL_VERSION_NUMBER() >= 0x40000000) {
++	$protos{'TLSv1.2'}->{constant} = \&Net::SSLeay::TLS1_2_VERSION;
++	$protos{'TLSv1.2'}->{constant_type} = 'version';
++	$protos{'TLSv1.1'}->{constant} = \&Net::SSLeay::TLS1_1_VERSION;
++	$protos{'TLSv1.1'}->{constant_type} = 'version';
++	$protos{'TLSv1'}->{constant} = \&Net::SSLeay::TLS1_VERSION;
++	$protos{'TLSv1'}->{constant_type} = 'version';
++    }
++
+     return 1;
+ }
+ 
+@@ -369,6 +380,14 @@ sub is_protocol_usable {
+             or _libssl_fatal('Failed to create SSL_CTX object');
+     }
+ 
++    # Security level functions were added in OpenSSL 1.1.0. Since then
++    # the default value of security level and the security level
++    # definitions have updated between the OpenSSL versions. Use level
++    # zero so that the library doesn't hide any of the protocols from
++    # us.
++    Net::SSLeay::CTX_set_security_level($ctx, 0)
++	if defined &Net::SSLeay::CTX_set_security_level;
++
+     my $ssl = Net::SSLeay::new($ctx)
+         or _libssl_fatal('Failed to create SSL structure');
+ 
+-- 
+2.47.3
+
diff --git a/package/perl-net-ssleay/0008-Do-not-use-elif-but-if-with-else-to-avoid-duplicate-.patch b/package/perl-net-ssleay/0008-Do-not-use-elif-but-if-with-else-to-avoid-duplicate-.patch
new file mode 100644
index 0000000000..5503679a94
--- /dev/null
+++ b/package/perl-net-ssleay/0008-Do-not-use-elif-but-if-with-else-to-avoid-duplicate-.patch
@@ -0,0 +1,83 @@
+From 99281b981ebd1d1367d4e871290ca84cfb295339 Mon Sep 17 00:00:00 2001
+From: Heikki Vatiainen <hvn@radiatorsoftware.com>
+Date: Wed, 17 Jun 2026 11:02:50 +0300
+Subject: [PATCH] Do not use #elif but #if with #else to avoid duplicate
+ definitions in XS.
+
+Perl XS parser seems not to understand C preproceessor #elif. Using #if with
+
+ Warning: duplicate function definition 'CTX_tlsv1_new' detected in SSLeay.xs, line 2493
+ Warning: duplicate function definition 'CTX_tlsv1_1_new' detected in SSLeay.xs, line 2517
+ Warning: duplicate function definition 'CTX_tlsv1_2_new' detected in SSLeay.xs, line 2541
+
+This was seen with Perl 5.42.0 but more may not be the cae with more recent
+Perl versions.
+
+Upstream: https://github.com/radiator-software/p5-net-ssleay/pull/553/changes/99281b981ebd1d1367d4e871290ca84cfb295339
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ SSLeay.xs | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index 2567d81..bf722a4 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -2487,7 +2487,8 @@ SSL_CTX_tlsv1_new()
+      OUTPUT:
+      RETVAL
+ 
+-#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++#else
++#if (OPENSSL_VERSION_NUMBER >= 0x40000000L)
+ 
+ SSL_CTX *
+ SSL_CTX_tlsv1_new()
+@@ -2501,6 +2502,7 @@ SSL_CTX_tlsv1_new()
+      RETVAL
+ 
+ #endif
++#endif
+ 
+ #if (OPENSSL_VERSION_NUMBER >= 0x10001001L && OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_1_METHOD)) /* OpenSSL 1.0.1-beta1 */
+ 
+@@ -2511,7 +2513,8 @@ SSL_CTX_tlsv1_1_new()
+      OUTPUT:
+      RETVAL
+ 
+-#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++#else
++#if (OPENSSL_VERSION_NUMBER >= 0x40000000L)
+ 
+ SSL_CTX *
+ SSL_CTX_tlsv1_1_new()
+@@ -2525,6 +2528,7 @@ SSL_CTX_tlsv1_1_new()
+      RETVAL
+ 
+ #endif
++#endif
+ 
+ #if (OPENSSL_VERSION_NUMBER >= 0x10001001L && OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_2_METHOD)) /* OpenSSL 1.0.1-beta1 */
+ 
+@@ -2535,7 +2539,8 @@ SSL_CTX_tlsv1_2_new()
+      OUTPUT:
+      RETVAL
+ 
+-#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++#else
++#if (OPENSSL_VERSION_NUMBER >= 0x40000000L)
+ 
+ SSL_CTX *
+ SSL_CTX_tlsv1_2_new()
+@@ -2549,6 +2554,7 @@ SSL_CTX_tlsv1_2_new()
+      RETVAL
+ 
+ #endif
++#endif
+ 
+ SSL_CTX *
+ SSL_CTX_new_with_method(meth)
+-- 
+2.47.3
+

--===============5630027334040357188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5630027334040357188==--
