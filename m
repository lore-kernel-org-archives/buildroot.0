Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48023C9832F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 08:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA95605F0;
	Mon, 28 Sep 2026 08:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohBgs_zcHsga; Mon, 28 Sep 2026 08:27:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 10D2560603
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790584064;
	b=oE7Pnn8AGeneO7XVrnNe68YHLg7prfk+hh710vJ5KbcNTD3XTF8yOM1lZvtyTdHywSx6
	 bfh4qMMkTV2EcrkoEw97CLh6YXwtZpMqr46RU52Kebfz8KTAh5iUPIpJKh3dU6JHfB2IG
	 HaxIsJkmB+EuFOynZYSzRtxHsiv10jiFvbbxUMQz6gVwK1Js+9IBy5b17+KxRB+MQXNIL
	 xP4CfkghkFCAduojP7xA0IjZcXN838ucyZLwzaaKc0fth9EQc8r57yRnjUgxqZnWZ1M7V
	 mLMdf+8SGyrajJisPBgW4QrRAriWFpKgiAv47iCoNrM3NCZeub0UWnExm7OdPIY8Hyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790584064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hcyrc3fkRfUreE2gVwUL5K+v8NNiaOMn/p8u5N0gdl4=;
	b=LgLBWNeHTnAXlmteKNNyIFz6dyFQLlnHiO1QkZUTaL8dp5rDOsP6yXHrrKntfuoasDu7
	 03SK/Iau/K+ek1+hIIePljrIv6CqyJvI31TnQHLxpxSFGqvcck+BY9IrDqRSDYlxY00BT
	 xTq5RdI4vXsal6e7AeQWz1+9WrtP2OeFUFgsxtNrE8S5J3ECfCK9kiIrATMTwZaJHhv5L
	 Zqk3dSsriXLSt+QUuiltaN9ed7mZh6TuIHxKUrRKGaGsYG8U7us0u4L2uwZGmf1RNIitj
	 G4CsEQ1kFOkcuuS3YYI/cQNcDgxFcDVi58mXDmFcfEt5YYy+dVWdkTt8M10bIic6/mg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790584064;
	bh=hcyrc3fkRfUreE2gVwUL5K+v8NNiaOMn/p8u5N0gdl4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cC1Dmv6oMS0DGrsNwQxOvTflWr0WAeTJ+IpXFGJvAEUxjmB6JOkCIaHGEDrl24Eoo
	 0keuYmP32wai91LGLkX4z/otJ2E522Bub87kaXIN0LXB5gzJCQHZeNZ22NCaujhCvR
	 HJMjLg5NCG/VCOeleWfwBGdJG/79p/abD3Y4ZfKm9+BW8l7xFIo8aa8YcmLauaeAQX
	 KFwjPiHQo3vcmZR3p8R9ZNzEznJUpkIDWtYh5r8+f2q2oPrClkRCpdoMQ74vSArsJh
	 j2IjQSqig40vn2OtRSNBz2snJr5hxFs4gkPFFFVoj8UyhK7hqCipl5jKFORz3CgOCK
	 Unt4gxQApIyRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D2560603;
	Mon, 28 Sep 2026 08:27:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C46072
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC68A8085D
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0UGmykZPQOI for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 08:27:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 99D7280835
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790584060;
 b=VwV+OSjXO5WHS3xiE4XjdCi5NvCNfMP/PIXFsqqSL5oa8As0gZK/RtTMGVgUKUpMIwUa
 ZEC85E53yyseSsckJN7og1OqyzxvTeCZUTFdTCxhsq7poykxoMiALvZD4O55qhlGuUi59
 D9foL/7gS0IXvP/PQe8P4FQillzRwGp54NrfkxU0inEYhxWUl5i1oVKLYYZu960qiY5f4
 deO/24lmy6YtkvyoSI1FNlZj4nH2HBZ9a9ZLd3DKRQW1UO2tN47Q/rTm15FmEnT4S51NR
 YHys3ByYz+x5kS7s+9DGajb4h14WyzsBwpFY7oBod49DqaKqExTzGMMZ77GgxTv5GMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790584060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sNH74IBaTQzzzd2u2GTTtp+KqV9YqT1qQ2rz+yDwjRs=;
 b=NQt9Tm2isXtQz96Y+NIsw26yDyIo0OPM3Gn6rnwMvKnHl+D/18vJj+1QtShaoZj7dfeX
 YgSqBnM1Y5j0mClznwX4dFwqV2Tj2y4l46l4eTBChc1fpReKyG1qwSCNqXjvzNv9Vxn/J
 yVM7tkwRNdhjCLFrlJkxy5LuFhAU8nrfNaMHnE6XOYyCQcTukN+N6Two6aMkHz0lSraiz
 bXGyse8tuci3+WXAu+z+LoOX4vyCkyf2iw1Z2jt0rj02H8B7AG/3Q9bXqHZi78/ZkEfjW
 CJ6D2ingutybAT2DNndng5HgSpeuV7/npf3DLalHENkYdUPWOOMJzI+Tu3w8SSFTfEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99D7280835
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:27:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 790C395C83; Mon, 28 Sep 2026 08:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 10:23:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e523c64d3b2fbcfe7bfaa7e41ad552f902a46b2d
X-Git-Newrev: df39c8c52422c44d30cc70879b5d222569cf5cad
X-Patchwork-Hint: ignore
Message-Id: <20260928082628.790C395C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: fix build with OpenSSL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df39c8c52422c44d30cc70879b5d222569cf5cad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-of-bundled-libpjsip-with-OpenSSL-4.x.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..dfaed419ac
--- /dev/null
+++ b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
@@ -0,0 +1,63 @@
+From 520061e78d1ec24d0d4b97555e11de01f4db8c2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 13:08:28 +0200
+Subject: [PATCH] Fix build of bundled libpjsip with OpenSSL 4.x
+
+Source of the patch:
+https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Upstream: https://github.com/asterisk/asterisk/commit/9a3bd18d4d4c4310eef46b5e6db9d7f3d0268768
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../pjproject/patches/0030-openssl4.patch     | 38 +++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+ create mode 100644 third-party/pjproject/patches/0030-openssl4.patch
+
+diff --git a/third-party/pjproject/patches/0030-openssl4.patch b/third-party/pjproject/patches/0030-openssl4.patch
+new file mode 100644
+index 0000000000..bfeefa2677
+--- /dev/null
++++ b/third-party/pjproject/patches/0030-openssl4.patch
+@@ -0,0 +1,38 @@
++From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
++From: Ravi Kant Sharma <rks1986@gmail.com>
++Date: Wed, 24 Jun 2026 11:30:40 +0200
++Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
++
++---
++ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
++ 1 file changed, 4 insertions(+), 7 deletions(-)
++
++diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
++index 000aabad61..93fcf10f14 100644
++--- a/pjlib/src/pj/ssl_sock_ossl.c
+++++ b/pjlib/src/pj/ssl_sock_ossl.c
++@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
++                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
++                         break;
++ 
++-                    if ((xn = X509_get_subject_name(x)) == NULL)
++-                        break;
++-
++-                    if ((xn = X509_NAME_dup(xn)) == NULL )
+++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
++                         break;
++ 
++ #if !USING_BORINGSSL
++@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
++     pj_parsed_time pt;
++     int i;
++ 
++-    utc = tm->type == V_ASN1_UTCTIME;
++-    p = (char*)tm->data;
++-    len = tm->length;
+++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
+++    p = (char*)M_ASN1_STRING_data(tm);
+++    len = M_ASN1_STRING_length(tm);
++     end = p + len - 1;
++ 
++     /* GMT */
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
