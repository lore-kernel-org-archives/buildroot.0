Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5CDC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B97B40E23;
	Sun, 20 Sep 2026 14:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFvZrlGgt3U4; Sun, 20 Sep 2026 14:16:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE11440E0B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913773;
	b=kQatdqKhTwZY8Zt61E9CSbN00Bwqq65GLbRLRHa5zaTDxGA2Ub1mJNEVnc8nDGGIUzSB
	 Tk+rDkOjf9s8dKzo0Lsqiu/lccIBRecOSbOXRuLm/1obYlxKl8hnc1l3RwTuHpy33w+jk
	 dNMhShfnafGEYtxl0n+rR4zkb8cu+xSZlX2yYWZuAmfAMi4W81o/fdHGgQ602ZGuUcZGB
	 djzz7JIkgUZcaY/QBmw7g3ehoO8nNjGR/d0w5gl1fIm66U2IyBdDr+7eJglIb5WSIVk+Y
	 x3Z3YmO+3JwhazYo4cyBTuSRRIWaZDSpAvT9WTmIg3COEEdPzBfLTt2n2SuXv1BYCTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913773;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=Q3cEbQTEAR6wbYiCsriqqHEBkL9vKiiFS7mYD8h810hkGZR/xSc1ppfv/s3V4GeQBwpy
	 b6hk4HyBV0Z3dik/rDEvCFQMZCX/+maQNusK/k3bEqN6iVN5tDAhYhn1EvgRPzTNvgcuT
	 CJT5HA/UMk5d6Amj4hoQVezs+U3jMHKPVmkwBobXi5AA+CrLKtfDMdbVn2Bdh9GIgRrEr
	 1WFVv4T1MSO9PfWPuybe6f0LIKjnbQNHo7lXu+Y6Ulog7I05BKl5YQjpKuiU5P87Ypyd6
	 8gwFTdZCFzv8ge4bHHpXh+8PIs5lyzPMzFqup+WL5euOkF4xo9s89ayqpCp6CGFwsKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913773;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IB3ZrN89+5FFP97TeB/3TPymHFPMdIhDzXQnAE8R/nMn6Akn9qYQxFsERYPuAdsUz
	 YYISI8BteIS603YBhZCgNE7vngbXCH3yHNRH0wJ3dIpQKsd1V24131Hai9X3AY6xkz
	 qTfGd2wiCAzwQ2IVBTxjK0fqQQYr0pGCrFZwYiuCknGpRzVxlVhjoR9KeRQOMH9EMl
	 GJkm7Q+SoJZu5+MshnU2sP/XBpEzGk+zTDQt2vOKC0GTeie/xKImOYexepvV7ZrDf2
	 JVjUptDo4RCEsOrRD1v1UBlVibGftAHwJF6TH0znZJiStmjMPE970OKR/bB/wyxLff
	 Lacvz5oCeacTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE11440E0B;
	Sun, 20 Sep 2026 14:16:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E181371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5471C400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAUnK0VOUmEr for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:16:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6994640022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913771;
 b=JGlGl0RhlWSLZLAO4x+ihJydkThSQq+RaPqr9OGfK0gSpQO2HunSUJVPxVYlBJMmlbIp
 GJ7tHNil3kbK3z0Lh4nL00/C2bBSzOoJJ+/FtLR2MQWlHijSvSd9u00UiZMYel9qct6KU
 s+n7ozB+STbj1n4Az3wGyf2RZjc8lMKGP6/FR/uPcho90wnfgWvKdFQa1wycHi1bE/zsn
 Op9biSjfsr6NBMbjvKMhhNeOxImiegEndsQPifF7e5X0yCFZbsz45q9HT/aRYY9+NmwL1
 iTn6Oe0rupkEvsVBpq9k8L3/gIpU0R3yus8Pg0wIElTnmcoSZdUDIKAPmdK30Ol05VA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913771;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=ooFvBIjhZpLvj+qQE6Wp1ZhYCPNIPT5hyt3MQBEoar/DguYqmgAmblVIRQFDiI7UT5j+
 nPHWBYUtBygUIKcnw+JU4qH/QMZU+qARNZOhKTwRccrMq2RuZR4n/vPyah3wqBJ8bmLIC
 qDMnoBlSrUTtzl3/dFodjtbkmc0hyv17tSM/iFgf7ObVR6Xt1vD/PRFKOiMxHWfxN1KXi
 RtFjWpRlukONPWiIArDzfXopi++tqL1pu9aHld4IFEWS+QXsPaEk8PGprMFHGF7hqVbvs
 +BqXfqrd5i9jPeQJVJruMPaYt1W09l0MXHOl4G65jZco1HIYkOJd3RDJzCZkbEMMSGw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JbUaHe4U; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JbUaHe4U
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6994640022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913240;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JbUaHe4Uwderd/kv5TMoAH4BJ/MNpkynTR0aqvgTjGD7V93iXwSu+GTsOpktWrsxn
 p8OhNbV1sIBMVCZTuG8uKQ4NRpg6jySmEzSN1PNz3lsBxYh1EcTyMYyyNhhZzaDqVR
 d4Vr+Ev5w7qw/OxN0spEeDFVb91u7cGd08QNKAP8HX5BjamJniGef75RN5kgxyfqCR
 5iCrq2KcwtTy1zXGXSNiKmRwb9GGo74+JY0k18bIg+xTr3+weZnMO8FotLZhiyIimy
 MylTKvVe5MlwkDC3wfhgOLR6TYDLu3SLQgFiTJm7Snd8B8RmWbVuNqDPvZ1UAUOCRU
 K+PGXpI9srxxw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:kBibEdsnhpUTp4+ZR8oISJVccwamO4VP76Fh1JyV7QbQzWkSh1oyE5AVR/fUCRKUjjFqn+CdF/UcluOBeiDWNOLHkKRwZw29HZ2HakkSpYKc3l8exsQ8FgJIn9yu9mksl1eWdM6vPMgRZggiroFBx6WnX0aRb0M3WI/FF/W7RrC1L1SDhNT94Q60vT+YGuuinJooPp8/21uNbD15nfjrZYbKqSSIthQvzmCaf4ayz7sE9vkSW/xNHYQKKJvU87KlP5ky1ZcdDlHzcB024Ah0WPCisxrNxEbjjiM169FkFvWW2qwgv/AIy+G4ZhxfgSQxKe166BAiZmgAurwLVcbqgX27LwJ3kqaHeooIlYAQKfpVwgc4VtZSmnmktfVxMfG9rAwCUNvsygzPcd1CN1rijI8b7vmpCT+2ozb7onAusSd0z6NkFbdYOUhriUNiUhsvwo49PKkk1Swf9UPEEUJJiVHdKJMrTdbRkT8LttfiWowYOJcJy6f7sOcltINUAHhcGSXw2VS6eabiulshshOe4U1wCaLbnh4TtN6WhaRz8oKCRYvkhr69zC2SMKqpu5DLdj5f26OJ0pCXranUFSuDBATC+3pK6uQ12W8GadwIseHkVS
 TADadIIfQyOW/rdl8+6Mlqthjy2khboRQgUeLN1oUWREw5P6nCVpauF9Ji9ZvYl2R80xhs2/Zh4nM0xlXE4E2+jqd9uyoUcXzRX3NxyodcPBjG3HdDseM=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0BA0EA4C487E;
 Sun, 20 Sep 2026 16:07:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBJ-000000002J9-1zaG;
 Sun, 20 Sep 2026 14:06:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:34 +0200
Message-ID: <20260920140605.3005461-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 36/66] package/libesmtp: Fix build with
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
