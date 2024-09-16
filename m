Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB6BC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CC3E40D7F;
	Mon, 16 Sep 2024 15:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqifGC0OqVh3; Mon, 16 Sep 2024 15:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 260D040CBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 260D040CBE;
	Mon, 16 Sep 2024 15:12:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7631BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59BF140701
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPO4GeIGB2XO for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2265B40315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2265B40315
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2265B40315
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-42cb1866c00so7576785e9.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499535; x=1727104335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4Ftl+DFk7AZ+FC+1vmmwp3co0uvPYntsQx9gERB3nk=;
 b=Nveqkdwku99ECzjyj5vsuIxva0MkKCq4Bhx/7o3kZVy/XrTD2tY/QNxLETNC0r/OsT
 ORyyRh1wbSkffeWlpaXQkvygMGMIdwntWZ3HkZJBhtUVn7oHCI0L/Svsaq5ozVdAcbPn
 dySbWGyTA5WJQvAZ3Z725/jnRc0I+kq5ziO4vLuBNNe0uoRqYasKlZRabVOIIWn5ZMuO
 107qh6PMZcpSJ4bLV5fln1u58SWPQgjTFtk26rqeyXywal/WFM6BxhET42QoB0orHNS9
 aav8KRKYP2e85f7dX/dt/7W1+tBinMfyPH0CBA1aTdWJWkUg7yT9DU1Z0ocNvK5NBM5y
 m9BQ==
X-Gm-Message-State: AOJu0Yy6eXdi+D0vQR7J+3qT8xBO7+SDVGDTjrqfFK7zr9ggg/8FODZe
 0WSvu1VIQoce6hYPj95/3UADzhNdwsICR0BViUtHyOQTUVrY0mdaDHOWXgAS5FaK0kC67UqDjeB
 GnhKFhgLU
X-Google-Smtp-Source: AGHT+IH046BBGAWsgVjUWOYRPTQBUn+eC3j/sXM/zBhU9xsYFmfLjXFYJcMAIG0d7u5vTslD138V4w==
X-Received: by 2002:a5d:598a:0:b0:375:b51:4d45 with SMTP id
 ffacd0b85a97d-378c2d51d16mr5053383f8f.10.1726499534557; 
 Mon, 16 Sep 2024 08:12:14 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:14 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:11:59 +0200
Message-ID: <20240916151206.947484-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499535; x=1727104335;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4Ftl+DFk7AZ+FC+1vmmwp3co0uvPYntsQx9gERB3nk=;
 b=W2jXLrLMX/3fnyCWLaS83U2UK2oxBYBc+zhdkAZ1ZHJadvgAdEr19CTPqufbgNOi1F
 9bjLj3sYuqJU+wTSkw26KrfjfzWIBhS+Ci+YPURamCclZqY6xnsDEgu/tvRl89F6si4C
 BOfZeLUDseubE2oP872Wmj9kVirf96vrjCNTQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=W2jXLrLM
Subject: [Buildroot] [PATCH 06/13] package/restorecond: bump version to 3.7
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 5b86afdcc0..34847f28f1 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  8f8aa2c6c66bcc6d91c6edd63913e5d738de6428928f27d1019d89c31cf347b1  restorecond-3.6.tar.gz
+sha256  4192595c08c775ff540f5ab850885ce11b132a4a4e29b65f20e751dd0a69d31f  restorecond-3.7.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 93495d8b7f..4624b9204d 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.6
+RESTORECOND_VERSION = 3.7
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
