Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38282C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF52606FD;
	Wed, 10 Jul 2024 09:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i28lnwM4AwhF; Wed, 10 Jul 2024 09:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF1E460FCD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF1E460FCD;
	Wed, 10 Jul 2024 09:09:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D65191BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFC4F80BEC
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWT0slT6lw24 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:09:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85FF080BBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FF080BBA
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85FF080BBA
 for <buildroot@busybox.net>; Wed, 10 Jul 2024 09:09:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-36798779d75so5267992f8f.3
 for <buildroot@busybox.net>; Wed, 10 Jul 2024 02:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720602539; x=1721207339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2NQN1A5YaOwTn1Y++qxZyuxUF9cRscx7WJV1Ihkkbs=;
 b=LQfBCgHsw+4upfZVi5SJ7widJnJlHwiW2jox7lvUAbc5KgtTXJXsktLICXBUNDC2Ju
 DtpsLOR8DkaQTiYuvhwgr7gBieSv7WwlYTlcEqxRCo0R/CJrUp/aHt9P8wXGmOKS4TlD
 l/TlQ7aW9DwK4gCgFirGQcI6samXE7j7X2lMACyplmg144JuW10OOOq38fxVXmtKYbfU
 I/8As/0G6OgVQOZuju4qCTn4r/oLirE5yxzHFijrL1opArHMidULo8c2grrECMwQmwUd
 bM7qJs16ekBhnpBPE2QXhzUdI/27zVDu3hABXJGRTSGBXmfS6+ZbnJPmpHeyn71SuwgE
 Ld8Q==
X-Gm-Message-State: AOJu0YwAMNLKGHVwJP6LiRvhBhEwDdceekpCl4aqw3xOYx9tSpT/KksE
 BahTPKWqxSzApccTncJ21fsD8YvenAmKEJA7zj/UiWXkgGXZs+vVQ2rZ74GoO6Jf9a9LWeK8o9U
 sNw==
X-Google-Smtp-Source: AGHT+IEI5cRL2kEc3xS/Zqwu5LL6HZNujJ/zoZUkNIYB4VXm6IMflS0X4rIIIAJW1ynZz7NLWu4QbQ==
X-Received: by 2002:a5d:6da6:0:b0:367:9881:7d5f with SMTP id
 ffacd0b85a97d-367cea46465mr5108911f8f.3.1720602539540; 
 Wed, 10 Jul 2024 02:08:59 -0700 (PDT)
Received: from vm-2404.. ([37.66.35.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde8425asm4749792f8f.26.2024.07.10.02.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 02:08:59 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 10 Jul 2024 11:08:48 +0200
Message-ID: <20240710090848.2697402-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710090848.2697402-1-francois.perrad@gadz.org>
References: <20240710090848.2697402-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1720602539; x=1721207339; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2NQN1A5YaOwTn1Y++qxZyuxUF9cRscx7WJV1Ihkkbs=;
 b=NjhWbPH73adrmuzjJf1NgUm1wo2z4yitVan6Zh3yJpBsD7/76ZvAe2VDfnt+Ohqgdo
 PpFKhrwyIBUyatKjI/TNBgXHJzz0yImFhuiM9at7fuDfgZcTiqNdz3fcagpm2DXeyKtN
 +Ezv+7WL5exdtEffb0wQbELmYwP5oMq9XOuN8AfLARKwQ4pHQsJyOYTgsymWnq15z0Cw
 zClLX329K+drFKSzxIKtxvcJcYuiQirdggF/+SwQwtWqe365ZZ624ypVNhWiBhpJLWmJ
 U3LWefA2bNiznHgVDMjY6KEbHIuJC0UbXe+oUKBI67WedVSAN17kqFwUVj+UopE9jVQK
 5tag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=NjhWbPH7
Subject: [Buildroot] [PATCH 2/2] package/lua-livr-extra: bump to version
 0.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
    -Copyright (C) 2018-2023 Francois Perrad.
    +Copyright (C) 2018-2024 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-livr-extra/lua-livr-extra.hash | 4 ++--
 package/lua-livr-extra/lua-livr-extra.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr-extra/lua-livr-extra.hash b/package/lua-livr-extra/lua-livr-extra.hash
index 7f8f66f05..28f71e4f0 100644
--- a/package/lua-livr-extra/lua-livr-extra.hash
+++ b/package/lua-livr-extra/lua-livr-extra.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  363e571d001b2e56eeafe2379c20aca65d67b5197199c957f9bb2a0c169aab5a  lua-livr-extra-0.2.0-1.src.rock
-sha256  ded97ea3e541833b9c2c9bf9b266f037a83b57e2e2847fecdfbb9397818f5623  lua-LIVR-extra-0.2.0/COPYRIGHT
+sha256  3033526912977b3c618090c9f6e610d8dca596d423c9d09446c3507f2cc1f879  lua-livr-extra-0.3.0-1.src.rock
+sha256  94306dda50b3db0017b5d4fc31de4b82658153fed00a579f8b53abba43182c8c  lua-LIVR-extra-0.3.0/COPYRIGHT
diff --git a/package/lua-livr-extra/lua-livr-extra.mk b/package/lua-livr-extra/lua-livr-extra.mk
index ce783f519..c86da9372 100644
--- a/package/lua-livr-extra/lua-livr-extra.mk
+++ b/package/lua-livr-extra/lua-livr-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_EXTRA_VERSION = 0.2.0-1
+LUA_LIVR_EXTRA_VERSION = 0.3.0-1
 LUA_LIVR_EXTRA_NAME_UPSTREAM = lua-LIVR-extra
 LUA_LIVR_EXTRA_LICENSE = MIT
 LUA_LIVR_EXTRA_LICENSE_FILES = $(LUA_LIVR_EXTRA_SUBDIR)/COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
