Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF56C25B7E
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F40D140BB9;
	Sun,  2 Jun 2024 18:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9y7HLOoU8VtB; Sun,  2 Jun 2024 18:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A47B40B85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A47B40B85;
	Sun,  2 Jun 2024 18:23:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFA241BF4DA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAA8D605D2
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3utlFrLqIYys for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 18:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8B1C600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B1C600D4
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8B1C600D4
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 18:23:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-35dc36b107fso2659661f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 11:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717352590; x=1717957390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T4wJWthq7IT2QP2SB4PrdKjjPJxnv/nbZF6bHAhqs7w=;
 b=vi/aoZo1hZGwfMX2K4KO+/zQvRnhw47jgD9Qn5ZMNKpAqx1Lu993ruMZx4HuIwh/R9
 1I6WnnjXY9zDin9eIWU8j/fho68ROHBXuzHxM2+QRDFHlXrLcecqvQPaPMPu/ijBvVKo
 rySYfBainKt79yyy/L/3pvi8kcVjVdP3vDxayc+I9yIMo1QCL1b/o934XFRnvVPp9pgV
 zoUuTlVEQldn79GirDzpXY/KO7ByXdAZe/yxeAhdvrEF2Ciah2pHKIxgB0hp6j/DsOJI
 mwJU22A2dBAz6++8qJHr/4koz8lNYZg1yyH+cJ7OG2Cq8yAXMUgdZIstF4VBy4oX+1bO
 zyYw==
X-Gm-Message-State: AOJu0Yy6fMckdX4y0t/CAXdhox/+Tpfcxx4WWXXIsNdAW/mPKRqtC8/R
 t2rcoFP0yrAwOLe8hAzHApFPWyhmXeJtuwhaD2TTZsimaKrrXegBfld4Dg==
X-Google-Smtp-Source: AGHT+IG5PvXjgL5d5JjPjXmauaGbLlMvP3fMe+gPgHg55aptdSG3rNQynx9cU6VQtG+7o695A28qEg==
X-Received: by 2002:adf:e908:0:b0:355:586:2245 with SMTP id
 ffacd0b85a97d-35e0f273f88mr4394937f8f.23.1717352589457; 
 Sun, 02 Jun 2024 11:23:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e52ec4616sm2528488f8f.4.2024.06.02.11.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 11:23:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 20:23:08 +0200
Message-ID: <5278eb53136fe1fd8cc2591748a1cc968ece79ad.1717352584.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717352584.git.yann.morin.1998@free.fr>
References: <cover.1717352584.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717352590; x=1717957390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4wJWthq7IT2QP2SB4PrdKjjPJxnv/nbZF6bHAhqs7w=;
 b=g1TJNMhIMyZ4lbfW90+qIAHw0CkzHwYRrmqvhRP7K90cS/Us9+eYdeOo2xegxTdgik
 catsX0b3nwLN8zHF2CS+78di/K8x5lIml5LYqyMctg6gpM0M8XADN6hhmW/xVqZyGu7k
 xqoWuO/JRbAPMyXM/cDSbLj8t/Wh7npZZ4Xf3fsKX5GS0sIxmZRcFqWkMD3pWQasGwaV
 j9Xuz5KJY7nVIOVPcHvwmvnd3VrkkuwnCB+SJ8hZKhU7nIpFBhvi/s+WUDhZ1hDh01P7
 Tli/RiYTy6J9nlY3AGrawcPnG3Cg6GwDs/fA4jCw0QZvhFIL0VbPLX8c97HhU/MkIO7S
 RYGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g1TJNMhI
Subject: [Buildroot] [PATCH 2/2 v2] utils/genrandconfig: do not check
 certificates with curl
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

genrandconfig is used in autobuilders, and some autobuilders are running
on old distributions that are lacking the most recent CAs, causing build
failures because package sources can't be retrieved.

Do for the curl backend what we already did a while back for the wget
backend, with commit 0866a280e40a (utils/genrandconfig: use
--no-check-certificate in wget by default); in curl, the equivalent
would be --insecure, and applies to the ftps transport.

The integrity of the downloads are validated against our bundled hashes
so there is no risk of corruption of the downloaded files. The only
issue would be that an MITM could inspect the transaction, the same way
as for the wget --no-check-certificate in 0866a280e40a, but this is not
considered a high-level issue (we're anyway talking FTPS here, that's a
legacy protocol that has other issues).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note: this is totally untested, because FTPS is not widespread and no
known package was available via FTPS. This patch can probably be dropped.
---
 utils/genrandconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b7d277105f..a7b012ba9b 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -689,6 +689,7 @@ async def gen_config(args):
 
     # Allow hosts with old certificates to download over https
     configlines.append("BR2_WGET=\"wget -nd -t 3 --no-check-certificate\"\n")
+    configlines.append("BR2_CURL=\"curl --ftp-pasv --retry 3 --insecure\"\n")
 
     # Per-package folder
     if randint(0, 15) == 0:
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
