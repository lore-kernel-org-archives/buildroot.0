Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE9CD3427
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFAF7810BD;
	Sun,  1 Sep 2024 21:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlYa6EkPHUJ2; Sun,  1 Sep 2024 21:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B2A810C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40B2A810C5;
	Sun,  1 Sep 2024 21:20:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40ED11BF584
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FEAC40450
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaB-MceZk31Z for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 21:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D97E34013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D97E34013F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D97E34013F
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 21:20:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-374c84dcc64so483132f8f.1
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 14:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725225639; x=1725830439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5EHHyVWgcBwAuFreNm7xhCFfbjfhFXkeBE1I5wiP8JA=;
 b=PYpwm3onJrTQSW3VkvDR3zGCOE4EQPPW8uGdJtQUUwIY0tAzi8hOmm+9LffUQFUCqz
 NWvsF5o0933pXRP5MaG3le+1Ct2D7Vsmb4z1GdEC7pcP4X9kMnpnpdy9YvOtkQDm6+Nj
 56E1HM1ZdLpumJL7hfU4BkgyD7Oqw4LQeXdxo/cuRYuLEboSx/GEtZZr9+QnxY8j/WXH
 ww2wwUCSfOCwARYyuokUSK80IIkYDF3sZ+WU/XgRE0fKxL9IUvyEh+CYMnRyWNUOVy6/
 qb8Sx9qsozkmVjVaqSXjTblSPF6c/jI4gvwALcSb/K45QTlbLQjo9s1Vtxf/YjefQa8/
 WLJA==
X-Gm-Message-State: AOJu0Yyqi0eunQgtCWuMfQ4Rgjcgx3z6ymfCNHdWFfnewZLSkIyRrKt4
 6hjKDd2h0i3KBxwApgy/cfVQkRBJheXWRwVFFJTeDmdhTpw4apXveoFTLQ==
X-Google-Smtp-Source: AGHT+IECxBF6cWcpkhMKlId+HALNZ0POZUgBQ0vHcPFvZpdXyoV5zInNZsb2v7kJ06qdBv0aJUK+jA==
X-Received: by 2002:adf:e6c8:0:b0:374:c3cd:73de with SMTP id
 ffacd0b85a97d-374c3cd74d5mr2830154f8f.35.1725225638615; 
 Sun, 01 Sep 2024 14:20:38 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4a5edsm9742102f8f.1.2024.09.01.14.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 14:20:38 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 23:20:33 +0200
Message-ID: <29ff0b534ad44685212bec013e65858781e077ce.1725225634.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725225634.git.yann.morin.1998@free.fr>
References: <cover.1725225634.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725225639; x=1725830439; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EHHyVWgcBwAuFreNm7xhCFfbjfhFXkeBE1I5wiP8JA=;
 b=D5yNDui7ikp9lUaOOEs0PHGgBTSwM9NPZwAChE26o+heBoTZuuKSur231O9DgAOQIy
 ThrJT2/4xRzZOfndrHW0cJESOCpzAIcFt67Keh/ltapHb8tpD+SCKjam2/2zyLnWzdkl
 Jr//EaKAQvhtjr38MoyrHzkf1MQ60ohvBqLYVOXTvhWsiDBuBwEeEsHpQTkXLmyFwCPW
 LfmUulBKB9OS2li1c0z2YYb9HI/BgjLJzjDurbqbwpCtaGPe2FZ16WwiinwA48fJHjM3
 tj7ZLN+5TvlV8Ll2ggciMw7hKcgvyug5pXzjEH2C+FHItPwRNHO4IDczjt8FORe0CMjX
 zS8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D5yNDui7
Subject: [Buildroot] [PATCH 2/6 v3] package/gobject-introspection: update
 homepage
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The homepage has moved, the previous one links to the new URL.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[yann.morin.1998@free.fr: split into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 42250eb776..345118745f 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	  language bindings can read this metadata and automatically
 	  provide bindings to call into the C library.
 
-	  https://wiki.gnome.org/action/show/Projects/GObjectIntrospection
+	  https://gi.readthedocs.io/
 
 comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
