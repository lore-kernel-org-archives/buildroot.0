Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7742C46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB4A41548;
	Mon,  2 Jan 2023 12:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BB4A41548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUQ3iZa-bLXb; Mon,  2 Jan 2023 12:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7C9410DC;
	Mon,  2 Jan 2023 12:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7C9410DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC5901BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9857281E63
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9857281E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiZT9PbyzUio for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:21:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A9081349
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3A9081349
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:21:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so15073104wmk.4
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fk+MSB8svNX0fcfjN8pv2UvO2W89GWN9UZxRtIAHlwY=;
 b=0x0qZX/Om+dGjLiTYbEsGGv41T6/cO96K0hvpWmJ3CAV2cJpi2fI7JN1w43C8Tv6+F
 fSyiXh/jlnxMIPwU2ojbfvcXPlKKFx8XJhm/ctXtTViQABMAzxNWyffxpG5tdjxpfqIQ
 r3LnlISkFg6MMi9Glhi/S4fFqkH67PkBtv9tdYsMhVcEbOWF/FqJs/D6BWDvticw4c/q
 32qJrxGMX+YZGyzeHB9TWgXuaadWMoJtAypnYdhQ3DXwEL/6dvn9vgFd2oCAGPg4WQwf
 YBLmt9csjjio5BEjBOjg2PrYC28iEIxGPNaxop0qVaZYR3dR0gA9+LIG/j1tgnRQhuyZ
 Lulg==
X-Gm-Message-State: AFqh2koWlIxvvjmCJbBG/qWw9/zRlTpoH6IwDkgQWa8PO5OdULm8IOhh
 jzJcMuVLuNgywkw2VTpgiEUJD0t4u7Y=
X-Google-Smtp-Source: AMrXdXtuPdZj9aI7OfYvT1dMS3GETWqW7SW782y6HoxNDMLW8Zx+9H58pUGN4M9Ba4fuCPIN31rV9Q==
X-Received: by 2002:a05:600c:4fd4:b0:3d3:4877:e556 with SMTP id
 o20-20020a05600c4fd400b003d34877e556mr30880428wmq.29.1672662116896; 
 Mon, 02 Jan 2023 04:21:56 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c0a4a00b003c6b70a4d69sm38828051wmq.42.2023.01.02.04.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:21:56 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:21:52 +0100
Message-Id: <20230102122152.1912325-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fk+MSB8svNX0fcfjN8pv2UvO2W89GWN9UZxRtIAHlwY=;
 b=dCKIRdi7mDaVEeTImIVqjShJVZ7JpTWKPyczDNlT1Sx03SBhTxSrMWiv11UUVGpz7a
 TLRCZHb/g2D/Tb7qUL9txBZsWqk2QNNnouc/xm6rhwnnnVmPnM8kKORN2H6bR1xrMSZG
 18bqPPXzKAaHqg5WnKz6iPncTmCiupcbTzIYwk2zjxJAcGHZNeD0G2yAfX/AV8VvWVoj
 WhwQ3k4yolgBPhREXKPMMQAaAOW9/wr/LBriov3mrVgnA6Qp/aC9NOrrHPVX//KWmrqV
 00YUTfbsvDck8ghFWo3ak1xc3HnVSvemDeXI5XIFUCcC9cl2uABqVqo+TGVY6xKwkL5e
 WoAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dCKIRdi7
Subject: [Buildroot] [PATCH] package/pcre2: bump to version 10.42
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index e3fe6b2d5..f609bdaee 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.40/pcre2-10.40.tar.bz2.sig
-sha256  14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68  pcre2-10.40.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.bz2.sig
+sha256  8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840  pcre2-10.42.tar.bz2
 # Locally computed
 sha256  87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 06a0afc9b..aba378cab 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.40
+PCRE2_VERSION = 10.42
 PCRE2_SITE = https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
