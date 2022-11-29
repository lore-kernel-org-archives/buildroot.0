Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71FCC4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 11:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AFF54097F;
	Tue, 29 Nov 2022 11:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AFF54097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFJTjfz5dLaw; Tue, 29 Nov 2022 11:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55CA9408C6;
	Tue, 29 Nov 2022 11:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55CA9408C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 211F51BF2C3
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 11:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 087AF8142E
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 11:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087AF8142E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzCtd0VXp3i1 for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 11:41:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14F4381465
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14F4381465
 for <buildroot@busybox.net>; Tue, 29 Nov 2022 11:41:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso10579574wms.4
 for <buildroot@busybox.net>; Tue, 29 Nov 2022 03:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aUdr52qZuR/yEpJE/Fr3LajpKSpUnvhtVa4dJXsRyl0=;
 b=YkRb3q0m64cnmkAccp30nJIBCj0cSxcSAYf4cOUkkqOwNcTj+FHz6rtMqjPaeDllbr
 IrGJgqvzTzxLbOiGqpOg1bJ76TUajHQwyhavpHA6guyoDJiEE8tVwzSE+FS8CsmPbW2j
 B7fz2b2xyKzdgFsQQUOmRZQ5rl3prV/TcVYroy7JnDQ5Kgo/Sc0plkRwzGlWoBLPhnbw
 cJ57NfugZp5mckFWnz5DEGwGeKLtS08RFGWjYb1qgCzX+tBiXhIxFxiNtrSQF7qNnZ9V
 c/V209QcpQKSiC1mp9vqQpwKkSEGaNe2bUhvZlYBEcVha6dsOaYmGdHNZq2xxzzmlsWP
 HI8g==
X-Gm-Message-State: ANoB5pnWvmKWda07VLO6d7NXEcHIsjgZOzMJShlaYQFgvoMpOdNu6Qz9
 oEmBa38V3r4xJuqvIpWGwby1JsI7dEI=
X-Google-Smtp-Source: AA0mqf5Qh24lvHpwrIEFTt3dlXllDD/VsFkp+VhaAOXnE7s/tTzcDbD2hNMLwyZHNZ6v8r+W0G6utw==
X-Received: by 2002:a05:600c:1f0f:b0:3d0:2a82:1cb2 with SMTP id
 bd15-20020a05600c1f0f00b003d02a821cb2mr26848507wmb.206.1669722071081; 
 Tue, 29 Nov 2022 03:41:11 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bo24-20020a056000069800b00241d544c9b1sm15644344wrb.90.2022.11.29.03.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 03:41:10 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 29 Nov 2022 12:41:08 +0100
Message-Id: <20221129114108.1372290-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aUdr52qZuR/yEpJE/Fr3LajpKSpUnvhtVa4dJXsRyl0=;
 b=Pep64Mu2KWV9uPpBF7i4+2nTMyZXNkDkZCF3mlRzehLdZvCuO82DmuekjWo4a1X6bi
 2KgYVityDRL4fHZD1toWEtOreQn3NtP3quC7fAVYFZde/1EOkaO0m8uvvD0vcTfh3Mla
 2wCt4P1JYINWo39CLrCne4qPRm/xrI7xKlAx40prVbiYuUl+pwvYHcFmecg0On6j5dgG
 cFyy2Truoq03RnDs8WOWm70qBgLcMTfqURtZmMlv23l9TIjB1ugz4XO67ssGwHOwssl2
 pmHnRJOIv3BK13F9//yh82Y2BIpz7zR6dmuc+rECT/PIc/1iYNJFeyNZWjhgMU12MdcZ
 oD1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Pep64Mu2
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.12
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
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index d073526cf..60a6809ab 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.11.sha256sum
-sha256  8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae  pango-1.50.11.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.12.sha256sum
+sha256  caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3  pango-1.50.12.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index a61473431..698894d0c 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).11
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).12
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
