Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9524DC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F0086063F;
	Sun, 20 Sep 2026 11:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8tbQ9xW1_Et; Sun, 20 Sep 2026 11:43:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7169E6064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789904619;
	b=RtxOvMulivwmgTeo1Pm7KnoLz6vYy3Us04arO3ZEceVnZVDz5ar2MaZbZ3f8kmtso1uN
	 5uv9tBEJDU7W0+FIbt9ZKytr8kyOUBTJealIfMjaH2wY2mh06MdUsBdQyQxaGM3i7NRID
	 mCZOEK08Aq3+zN0zp1ddZfXd7lMffn6zQ9kxUUhoecFe/gZqgTfk1ntvFnwI+QOTaSQaV
	 0QY8We1H0sy5OgWiinh//uAMC19G7k1vUx7IwwF06JuboPLTZAsqQEYJfeG0UktArRUwF
	 vrfVpXsUphVMW0I3AOOJAGwN58aURQ1GWHAxozKwpBfbVxiqalU0zAIny7Ej7KdrlGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789904619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X1baCoVqgLYmat/DsQOucQYZsgVoVflk0lLSwneCmxw=;
	b=iK5rvD4NeQfMMwypKf1QEjTk0MeHaUUY3HPWXs9FGUJNZ4GYkZeshlU7HevfdogfQCFB
	 ARK5lOyjRnZcYz81CfjDWgvLi+e29oVGw+tjxMKiv0EJKZcgqyRlVxU3mugWg1gzDhvF6
	 shr09gXutAYo4bg5yTBHPZIROtIuBZRW/hmupW3hQ0tLa4nQHPsyPCmYJshiTp85r6Hu5
	 gUZdKfzoccPUm+xm8phceKXi+PKiF5/Fpfxv1wyQkNjx/sG98pOf9sUjJur16D1zHHIQI
	 8gsbzAzkl/SBiPeI9PFuh1ivnk3bCCz226HuUccJ8MhGXWnlLj2NdJ4KKUS4Sujn03A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789904619;
	bh=X1baCoVqgLYmat/DsQOucQYZsgVoVflk0lLSwneCmxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S1Otc7bwCXwr1ohmD8o6kPMJIpT2S16f2XZ11/owjy/ws+mejSqXLqlzR6o0hVRnw
	 9eGELRRYmZ/crwUdXZZWzkrDbT3GqafvUoNjkTfwgfVjzCvEXAejvMMnLRav/N30Vo
	 xsesWSIs3pNv3mT6LhVNJ7Fc1ld149GPZ13V4j/yP1sX+M6+2fzeiGlLkXzNDZi9k1
	 SLW7DNCo5xv7rCfiBY2cs36LgDMCcXf1eJ1shcWzhzJbCIZx6S9f+0pdiK7un9WB3i
	 8bFYjWqB92y8ryyinMG7bnEt6J0SBCqkuX96HEBtDZEaJn/aRP5jvmVI0xksQFIlIv
	 BSUJzr/+crWZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7169E6064E;
	Sun, 20 Sep 2026 11:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A3C6392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E41D540098
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTnGTRsNUxVH for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:43:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 420544005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789904617;
 b=LfO2DkKImhljwid8UvF/8nUJZgbT8XGmkljy6J7ZrUDctUlZDYIBKp93G6+vq5HmjxMR
 mChGIhGLd40KYZ0q1kySX8FvjxLq9vE+FTEdgHwf48uZ7g02PJb20xQdBYairpPyJXlqF
 9kUvl2NH/WP5v/+lmF1B2pKbxrWLSL7XAZhFj+T9XqNSJNxu7igh6Tltub5Ywm78BaUWZ
 hgVNNKwC4dVQqz5HH3a9dtQPd5DfuxHsiIHOY++Q1/eKd1PUwytcp1RGdPXHDXcHvzFjc
 QvW4/X/S1ycxjLhQ1Z2giagcdMnYgDpCR5sU7SGbBf+L4Q53ENrUGHe8gE73b2AZZEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789904617;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DbJqKuYooc2VEdI0zAMvrG+QUmqtaEoG1bhI/EXx/tg=;
 b=B1zol4h8zWx0kid5RuUnKVCaN9cfkSWxJ47yfUExZenmeVJuFGyk/pnaGCQ9jYRxPA9H
 Q7T1v1EfX3SgFDvoMiVFDj6EGfAaxjwHuXGSoZlLmCKQKm+g729x2vpZP1VJcXMjIQ8Q6
 KWjfwrNH/23CPJq410Hm6StdMQ/EHxTdzjQO/XQpX3nFGTqqG1GhN7cBDZFF65enQ8snY
 oEwarwjvkebsjbogH9fdPVA/auA9ZjaaJffNUqzvVgtF30NK5AyO5YWJ5hdCpvJmSPCNO
 GYHpUSx2bqGV3/ShxjTJaHXbN7TvuzPRmiHyyHUDv7eFn9IYC1Wvko+mUK9oKWUWYzA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 420544005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFD9F8D764; Sun, 20 Sep 2026 11:42:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 13:43:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92e08f89a87d1ae111576c8e76fe4803e4501192
X-Git-Newrev: d2dc2d0c8eb84f015b53f3f29104b451e689d4e9
X-Patchwork-Hint: ignore
Message-Id: <20260920114228.EFD9F8D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/turbolua: fix build with OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2dc2d0c8eb84f015b53f3f29104b451e689d4e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rap.c-Replace-deprecated-OpenSSL-API-ASN1.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch b/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch
new file mode 100644
index 0000000000..efd1dfb080
--- /dev/null
+++ b/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch
@@ -0,0 +1,49 @@
+From e473a5b44af312679c89b759e6be2608357de57b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 11:16:12 +0200
+Subject: [PATCH] turbo_ffi_wrap.c: Replace deprecated OpenSSL API
+ ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/kernelsauce/turbo/pull/374
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/turbo_ffi_wrap.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/deps/turbo_ffi_wrap.c b/deps/turbo_ffi_wrap.c
+index f4a9e94..92cd88d 100644
+--- a/deps/turbo_ffi_wrap.c
++++ b/deps/turbo_ffi_wrap.c
+@@ -77,7 +77,12 @@ static int matches_common_name(const char *hostname, const X509 *server_cert)
+     if (!common_name_asn1) {
+         return Error;
+     }
++
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++    common_name_str = (char *) ASN1_STRING_get0_data(common_name_asn1);
++#else
+     common_name_str = (char *) ASN1_STRING_data(common_name_asn1);
++#endif
+     if (ASN1_STRING_length(common_name_asn1) != strlen(common_name_str)) {
+         return MalformedCertificate;
+     }
+@@ -113,7 +118,11 @@ static int32_t matches_subject_alternative_name(
+     for (i=0; i<san_names_nb; i++){
+         const GENERAL_NAME *current_name = sk_GENERAL_NAME_value(san_names, i);
+         if (current_name->type == GEN_DNS){
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++            char *dns_name = (char *)ASN1_STRING_get0_data(current_name->d.dNSName);
++#else
+             char *dns_name = (char *)ASN1_STRING_data(current_name->d.dNSName);
++#endif
+             dns_name_sz = strlen(dns_name);
+             if (ASN1_STRING_length(current_name->d.dNSName) != dns_name_sz){
+                 result = MalformedCertificate;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
