Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15617C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C443340A72;
	Sun, 20 Sep 2026 13:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5rdaqTEqN5Y; Sun, 20 Sep 2026 13:04:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D260140A73
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909458;
	b=kB/xbxYgLNAhl3gn920MqQZARwVrzmQ7Nw2chG2LeLX7xnIRN8y+WP4CFk/+doNOAFUN
	 jD/l0U+AY1pmYUOPq+7MKmP9CFp4scHgaAoK3fOVDMhtiugasDz6r7r9MXltdZDKH/p8f
	 91bPO8hkPsJtBox0IaEg6T19Q3XiQIF+Repl2CPC/F7TssOlxs5RB17lsF4jMW+hODseA
	 23Hha/wzPt4PnGsVaCxgLTuXcoMcATQYUAFnwBjb+/XB+KpxUXmSkGbdM23zjkamxEQq3
	 Xd4iZ5QO7eU+aL62y9P7aLOQItkkA4HNrgn8j9MHTYpn0RFzd60mDl8fmIrAGgerFKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zu2j6RoxTD5xajYt2gyrM5nGzShcAq/WBImNnItfvok=;
	b=dZBmLaLYoMzrbL+ZFuedtADA0E9ZVZv5UH8Cc1Ygm+YJqtVkwEe69BWNtJ6uBACEeJq4
	 wRJ3AdVWKZxPUMAoI9cteU5vgmVj2VRF/gvYZTHNgB6uOJ5Gs0MhTEyBKq5F8MNdp74cE
	 z0DaGp9k7o4rAnzB8ogqp7xOQRj+n+xV5q0L7NG9OCtF5TGxa70XO4DN3eeRvYzEYxYhk
	 m3cJZPdI+v2St65/OxPHrh26rmbC9ftq/3X+Oz0zSZSjprdI3KpOrMsa7IVS9CR00DAyK
	 77n3Fj9c34Pz185bT2LOFeOD4u9oQRE733rokXV5lD8U7YqVXke4r2n1MYGOw7Pa06Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909458;
	bh=zu2j6RoxTD5xajYt2gyrM5nGzShcAq/WBImNnItfvok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WpcVswhmkJguIqQAmsa5OPAXw39oVqmNHFPuYvKjSl5u3rq0q9v7+7BVVgthE6Rpj
	 xEtqewq5UxcYKsJG7G4051lBLuSeBl3Yj0kQDb1LRMha8pq8deQvkJtG0xJO6MFd66
	 k3y2tG2qhyPXy81O/FcXgRGBcNq4/ME0VIuGkbVkeSUQKFph4swJe+i2t7gisT2D+q
	 LC1optjsMzobQN+FRESGf7fd9yhFNDV1AXRuuOCxLf7DNjuSyRyDnFp2hVje8jDzkV
	 8fzxgKf+TGV9xOmSBo7dlECqnsHZ/hBnfZ7Q5F3g1c4KsJiHxHhqpCeNSuJNNeTmsd
	 mUA/vtef7YZLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D260140A73;
	Sun, 20 Sep 2026 13:04:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91A693AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F76440A73
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56IDWi-rk91D for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DAADB40A72
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909456;
 b=evnOjPn+bluKK+wFWQ92hSO6C69SmxZAPp2Y2+WvpjohS6Oude30ZtuPbmL9Tbld2D/G
 RpJUYKrceib9TlFkTGbQuR1GmQsJ9j7TBxUjRKZ6tZ40x9NyI8U7SMRIPhHrnxpdJuVqH
 8JXTX9Pwfvln5aKJdyx8NMugQG0miVAVJWg8o6CQ3Gw0PBCy1zV9UMA7lheSXum3QeCT4
 BzHgaiURcVqni5HnP2u0mWkDLA0LNWXEl9MyAZPyOLDWBVdaVIH4kwrUHu6VnnFSxfniw
 6IlcCpKbLq27jm8h8eZEMu5Q2+AXmHHptmaqKy8f6RGogdN3MbqNG5YXbdJsHsaVyIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909456;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=38FDRHAAWb2UYHi70/ZcxLXFc/8uqyXqnGCGAciW7S8=;
 b=dGyPNoQKWM/1z4Wsh4gRJftzm3xUThFDkCVl8sBqR+KxN5x6BPE1iuzjCbNhn8tjhiBg
 OWrrRLvx6UN9FxXFlPfYZMCbi6EjWbIkZuxLjE4JKChXGweYkeH8WcfpuDq7iM+Wt04uS
 f5JkULr8d/nJNkk/def+k5Y/I+BVieQyjg8F8b/S7iyvrzygb1ygetJwULetzXFlLpGtE
 UaKIX36DuPpCpSZx5T8gEePZer/ruiuPMjHMoN3LvVYdZ8bFPiyN7lgz0JP9ZxbF1ytO/
 QUcldMO204vcd3wuZQN2GuRrCJzHbPaYkqiYNWImA1JaexUehQ4I9GIYkhGNw9xoAUg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAADB40A72
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9649D8CA36; Sun, 20 Sep 2026 13:03:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 15:03:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a235a33cfea320907e330023c1c6ec1645a4374a
X-Git-Newrev: 03776c154e63864b6617688d668a7bdd31215f8c
X-Patchwork-Hint: ignore
Message-Id: <20260920130308.9649D8CA36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpjsip: add support for OpenSSL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03776c154e63864b6617688d668a7bdd31215f8c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...k_ossl-fix-OpenSSL-4.0-compatibility-5036.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch b/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch
new file mode 100644
index 0000000000..4d8f0d3c37
--- /dev/null
+++ b/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch
@@ -0,0 +1,44 @@
+From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Wed, 24 Jun 2026 11:30:40 +0200
+Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
+
+Upstream: https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
+index 000aabad6..93fcf10f1 100644
+--- a/pjlib/src/pj/ssl_sock_ossl.c
++++ b/pjlib/src/pj/ssl_sock_ossl.c
+@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
+                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
+                         break;
+ 
+-                    if ((xn = X509_get_subject_name(x)) == NULL)
+-                        break;
+-
+-                    if ((xn = X509_NAME_dup(xn)) == NULL )
++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
+                         break;
+ 
+ #if !USING_BORINGSSL
+@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
+     pj_parsed_time pt;
+     int i;
+ 
+-    utc = tm->type == V_ASN1_UTCTIME;
+-    p = (char*)tm->data;
+-    len = tm->length;
++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
++    p = (char*)M_ASN1_STRING_data(tm);
++    len = M_ASN1_STRING_length(tm);
+     end = p + len - 1;
+ 
+     /* GMT */
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
