Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A4DC021B1
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 22:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72C5608CA;
	Wed, 19 Feb 2025 22:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXkrEA1DLa0C; Wed, 19 Feb 2025 22:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92A3608E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92A3608E4;
	Wed, 19 Feb 2025 22:10:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7646E0C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6A8B40DA4
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDQjwkA4Cgn7 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 959AA40D8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959AA40D8D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 959AA40D8D
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-439946a49e1so1606765e9.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740003034; x=1740607834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BeyAdioQ3SblIM71yyZElG24CNwrwsSAhjnCemmxWxU=;
 b=CI5vOIYbfN5GZkohaKF9kmYq0Y5pPYFAYC6oLd0dqzt9UZqCm/XkwhqVd4L6AEZ+N5
 /mBpxn1al9pXW0xYdvz2QwLjXa7Ev+8iU2AT2hRwxg2FJv8CQxXV4yzj2sLQKVCDmyqh
 IsZ13p6QkMrnPdzVNgUOCuixenS0C/R+EG51yXC67z20cNczrrnn5kXYreJnXwy5ftxo
 /vw2v2Kwppwy6hhuvq6gYzoTDkHQ6KIrFpUCYhiOPx2TXe2KDaMB6U+VZRI+NW5+skne
 QecJ3oSGMY+cuo4uYlW/nW4To16f+CSeQqeZmPZ+0RtzMoi1FX7m+q2XjwN2T3ro53r/
 tUBg==
X-Gm-Message-State: AOJu0YxcIeS9CLzifuC+W4uqx8n5oNuRcBvBk4aluattxBbOTejz71Y4
 4Gk50AvfNrMP9HitY6RQ0eMDEVTHNgI/1QfBWoP42ZSraMSC02qdTEhHTA==
X-Gm-Gg: ASbGncs1o6zufF0/mkayohAqo/aulBGJuzZiUPDGd/vwT0tkZiZBO9kC6mdFmPcUNxe
 HP09LUoxP0+jCc/FX9LS2rdOCTXwYkOOHeBGOjHVQ9WCR789SibQ0UefZppP8a3Ncg6T6UBK02L
 75JOAzjqko/irOQk5I793C7obX8L9HBrXmHSFga+whaPDzzToGe8/eiKAA0zsHgPiduhhtkFRKq
 o05xHl3cTaSE0YWpgIyt3eVUeK6tjYVowBGMCkjcxAe+ZhkjBPCOMEja5R1Xqg+FUx/bYuBK/XG
 /glRjPMs7Hmy82Thq+fFjNaCgg==
X-Google-Smtp-Source: AGHT+IF1fZAwqSYEdzmapnO+SsGslj2OXRgDZLoAs9WKDWX4km4N3WRxknKM2hYsg95vMIBUN+GYBg==
X-Received: by 2002:a05:6000:185:b0:38f:2193:f8c2 with SMTP id
 ffacd0b85a97d-38f587ac3cbmr4226099f8f.31.1740003034074; 
 Wed, 19 Feb 2025 14:10:34 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8443sm224799365e9.35.2025.02.19.14.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 14:10:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Scott Fan <fancp2007@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 19 Feb 2025 23:10:30 +0100
Message-ID: <d740fbe0fc31d25921780dbdf38b32e745adc56f.1740003029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740003029.git.yann.morin.1998@free.fr>
References: <cover.1740003029.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740003034; x=1740607834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BeyAdioQ3SblIM71yyZElG24CNwrwsSAhjnCemmxWxU=;
 b=kRG3rzUTt9xg6lrs+WtP11G5YG++0Aaon5+STudZJd9Im9yb9w83nveu8IQ4ACaEsM
 74OFF8phVSRIoszG3iy9d1e0qUncNxAA85qD/BYrxDkXiLTp1NVNgwA5rua6/qp5jJGG
 RoceOX5/hbZK3GRdR5Tg9NYJw3lcv9KdVLRNo0vOKhNvqfEOBOCXwBxrXaRtnAtOS51W
 H4ZrpL2lqhDDbDhMxCooFS8CIoi/Q8jcKwIddUj7f80DUTgVQvXP4J99f565UPBp3ZDx
 Yc5Cg6H6OYf0n3MZC4msppAx/6n5iO8FlN4+bVM6pv/oAtbHOdaWV2Xni0FQbVcmT9SR
 /ciw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kRG3rzUT
Subject: [Buildroot] [PATCH 1/4] Revert "package/sqlite: fix build issue if
 C++ is not enabled since bump to 3.49.0"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 8a1ae9e0b151063528e67b8b34a1229dc729df3c.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/sqlite/sqlite.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8016ff1c4c..255ddc937b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -65,9 +65,7 @@ endif
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
 
 define SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
-		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
-		$(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_TARGET_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
@@ -89,8 +87,7 @@ define SQLITE_INSTALL_TARGET_CMDS
 endef
 
 define HOST_SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) \
-		$(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_HOST_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
