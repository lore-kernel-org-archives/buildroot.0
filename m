Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E9BC369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 20:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 648BF60A74;
	Wed, 30 Apr 2025 20:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqf70Il4ziX0; Wed, 30 Apr 2025 20:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCAC76088D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCAC76088D;
	Wed, 30 Apr 2025 20:42:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07F60E4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 050BC80E79
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 20:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qxz0M2uQUA7T for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 20:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E03C780DC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E03C780DC4
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E03C780DC4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 20:42:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so165168f8f.0
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045733; x=1746650533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/vJP2jvuwb36ewnSZ/XowK6qJpOlIJJwHTIMgLjgplU=;
 b=OcJLnNRhCd6/PReHrATcg74ENVHf+ihxAymRPxq21dVe89ku4ev64OALHTSgurZpW9
 DDvMd/pg7Ps4yqiyoj2vfqs2mLCHx/lmmMGhjUXgug05hUTRtIfNGZ/bJg+kutHz32Bw
 6quX+151p6UadOaHCVQ9rS8YNkGZqGVL8NfB0YBTzkgEBtfMQhdzMMcM44NhrZSkaSVM
 Z8a51J02pc5YqORvmT4CKeDu6C0AResOKCzAfOYKi/g7xvwFAj/29n0TPiDhyflxrnji
 ZsMf3kGAMlcsoQyVOT3UYcXroYW2CP0lIQ5ND7Y2X2Fl+jtBG1hzuv+wFGJEWsKgZjXG
 AwtA==
X-Gm-Message-State: AOJu0YzO+IUE3y/S02/Aox1LvcjdAsSAhW/tpfljkyu26eZ0eYoWsi1o
 gEGX1dNLsFmllQjlKmMeAiy3pxImxKb1ka/b2wiPAo4PpqaYRk7L2chr2BX2IZtrpxDoGYQp0A2
 lXoU=
X-Gm-Gg: ASbGncsvkW+wNqazuiQfK4BUhQ37q0Xi2Hp2Q59uFD+Is9N94U1MSj0bgJs2a6D1kbC
 QXwgD1/Ou3urgQTh1+gOn2XVmw7ag9at6BqC9y3foJ5xtGbSGk/xpFmhlRVum6okSXpiflqEXNz
 EkksXAUy79GUrr5ZMyPC5fRZCqnHFuTT5n5yNTnW+6naJqsMcQtHPZkME7urfmpd1ZY1opccCwc
 5MezMMNY/QxR2x4zlVqUT/rkfIyReIB/Ie9pbxX3pCgdXV5t6EQE+A1xLile5LwGbLiZLAUD8GT
 ubHyMQjdxIpCZKzY0COOD2zL0gIyzdfW6lrjHDgjY6J4E7CDX8Bd/3k=
X-Google-Smtp-Source: AGHT+IG5LPEUPTa/7spxKpIELBo72e/29xd1d50+bxlvsmfbIHCjs2ZtmotPxZMGOt25wDqGrELQSQ==
X-Received: by 2002:a5d:5c84:0:b0:39c:1257:ccae with SMTP id
 ffacd0b85a97d-3a08f7b7c0bmr4465998f8f.57.1746045733067; 
 Wed, 30 Apr 2025 13:42:13 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca556bsm18043816f8f.37.2025.04.30.13.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:42:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 30 Apr 2025 22:41:37 +0200
Message-ID: <20250430204137.1071918-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746045733; x=1746650533; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/vJP2jvuwb36ewnSZ/XowK6qJpOlIJJwHTIMgLjgplU=;
 b=L+XagcyQ9+yq5B3SWl8gEsbBRtc1n7V9c1QfeU4KhKDRtMKK8I/H4XIk+apwMASqrv
 cp8cndhgSLkErG0KsNjQn3AgACzYx/S0pfOv2LPt4YPVIy8pr/ZNwJSn4BE7SoYhOFOf
 841KCTFK/rL4LZQ0OCnmCJpkB5fJ27UO+m3leJaUwas3Hi0kKx1qElF+fFK32r74u8f0
 mmU1em8zvYOlFb5c1t0ddSgQc3ig0uyiGcGKD2kv2DbcidxiDLwW1lfJEFkr90qJbEZV
 ZeTI4HCpX8t4cuZ3IHY456PRTzM3Hzkjnmm2n0d+yBXVJ3wTkbiAjrXbui2TyIWy9Amx
 Kgww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L+XagcyQ
Subject: [Buildroot] [PATCH 1/1] package/bird: fix build failure with bfd
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 'bird' package with only the `BR2_PACKAGE_BIRD_BFD=y` protocol
enabled fails to build with the following error

```
bison  -Dparse.lac=full -Dparse.error=verbose -dv -pcf_ -b obj/conf/cf-parse obj/conf/cf-parse.y
proto/bfd/config.Y:204.27-33: error: symbol 'ADDRESS' is used, but is not defined as a token and has no rules
  204 |  | bfd_show_sessions_args ADDRESS net_or_ipa { net_copy(&($$->address...
      |                           ^~~~~~~
```

The `ADDRESS` token is defined only when certain protocols (e.g. OSPF,
RIP, RPKI, or BGP) are enabled. As a result, builds including any of
these protocols do not encounter the issue.

This patch backports upstream commits that define the `ADDRESS` token
for the BFD protocol.

Fixes: https://autobuild.buildroot.org/results/68c/68c5dd84585a7018ad57ea3e7134748c08858ef7/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...BFD-Fix-missing-keyword-declarations.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/bird/0002-BFD-Fix-missing-keyword-declarations.patch

diff --git a/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch b/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch
new file mode 100644
index 0000000000..29ec8abf7b
--- /dev/null
+++ b/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch
@@ -0,0 +1,31 @@
+From e5b582868c5fa7e185a12023784adc8df7b8c7a2 Mon Sep 17 00:00:00 2001
+From: Ondrej Zajicek <santiago@crfreenet.org>
+Date: Thu, 9 Jan 2025 00:30:37 +0100
+Subject: [PATCH] BFD: Fix missing keyword declarations
+
+Some keywords were missing for BFD-only build.
+
+Upstream: https://gitlab.nic.cz/labs/bird/-/commit/c386369645e584facaad88ec292f2fe0bc70d974
+[tperale: backport v2.15.1]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ proto/bfd/config.Y | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/proto/bfd/config.Y b/proto/bfd/config.Y
+index 1a7474b0..70b09ad8 100644
+--- a/proto/bfd/config.Y
++++ b/proto/bfd/config.Y
+@@ -21,8 +21,8 @@ extern struct bfd_config *bfd_cf;
+ 
+ CF_DECLS
+ 
+-CF_KEYWORDS(BFD, MIN, IDLE, RX, TX, INTERVAL, MULTIPLIER, PASSIVE,
+-	INTERFACE, MULTIHOP, NEIGHBOR, DEV, LOCAL, AUTHENTICATION,
++CF_KEYWORDS(BFD, MIN, IDLE, RX, TX, INTERVAL, MULTIPLIER, PASSIVE, ADDRESS,
++	INTERFACE, MULTIHOP, NEIGHBOR, DEV, ALL, LOCAL, AUTHENTICATION,
+ 	NONE, SIMPLE, METICULOUS, KEYED, MD5, SHA1, IPV4, IPV6, DIRECT,
+ 	STRICT, BIND)
+ 
+-- 
+2.49.0
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
