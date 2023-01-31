Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C638C38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 06:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 815D54094B;
	Tue, 31 Jan 2023 06:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 815D54094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlJPNoXZQg3r; Tue, 31 Jan 2023 06:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8560440947;
	Tue, 31 Jan 2023 06:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8560440947
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9B51BF37A
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 06:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5516C813BC
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 06:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5516C813BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOgMEQ1E3n8N for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 06:45:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 698648139D
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 698648139D
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 06:45:53 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id h18so3361803ilj.6
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 22:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TFyzFGGHdtClYN19rflb/1rFtsAwmn+sHNBOTaZSHU=;
 b=7SNvb5mePrNNF9n37BjUdHR0KeiQQf4GSvE2CHyavqSXy6Q0TD/pogB/Phld03VScd
 WlULd8V58ggwywz7Z1PU/xjKOozBVQkxpeFZzt9pXSDwiSIDWSXlhXqs+95WIVB02irV
 qS4ep3ze4U7JZcnMzTC6B180/dsKSpiR+yGGEoplrcdhq9aFRwzi7LRN6hh9Wg22KCwv
 JSMdlK+zvMgi2ROk8CK71XduSxCy7TaE5sP7sInJn6b+yNFo8tSjNB+dH0/rvibjeAug
 Fl8dq0nUpPC7wolOwB/bjMfif8PfDJm2XXNCtdGca5x2iA8jjiPXw2pxeFxOqdvcktgo
 eC7w==
X-Gm-Message-State: AFqh2kpTPfuGQoe3V9bDCrkwslf+RPq77QAbjzoxBrc8nxL624souf92
 CPihUQYQ9vPzbyUTJOxLwSjurb3PDb9NMg==
X-Google-Smtp-Source: AMrXdXt5i//TaKe0yZ50sBYBZfwezMXVxinz1pIik+9TEEwwCxcolpjW3Lw6LIZgxJFeuly1V8fA4Q==
X-Received: by 2002:a92:d11:0:b0:30f:36e0:21d1 with SMTP id
 17-20020a920d11000000b0030f36e021d1mr29189739iln.3.1675147552154; 
 Mon, 30 Jan 2023 22:45:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 184-20020a021dc1000000b00375783003fcsm5342371jaj.136.2023.01.30.22.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 22:45:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 23:45:44 -0700
Message-Id: <20230131064545.3266194-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4TFyzFGGHdtClYN19rflb/1rFtsAwmn+sHNBOTaZSHU=;
 b=Ia6I6B/KRmYBtFUWBYYy+18rhQPPpa5WKkO6NsYYvcqbf/fxlljtQDeBYW3zGX14Cx
 yBNY0AOw/2GheEgqNYj4cr+lChPJfGM5P9D1NozrrDcJ+M5xux5s8HHyFM3hNpTX+xbz
 80p+gacT0snJEysr05Vd0z0XH/zegLBTWumD6XzKE74ZiaT9EDt2sTOTdV1TNn/hW/8n
 y08Qu8WZDlKmr5pKV1XXefsE9IISQLlHaNwEnRjYISSqqJ2YGvEf4rr6C7Ubwvpq4Hev
 TB1vdfNqFidao3md+6uO/clZjS5BgXRhF9ImqiSRLbz0jkmnnegU/QM7Um3d7INL9YF6
 +H7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ia6I6B/K
Subject: [Buildroot] [PATCH 1/2] package/tinycompress: install to staging
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be needed for upcoming pipewire compress offload support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tinycompress/tinycompress.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
index 062233ec80..c9cfbb574b 100644
--- a/package/tinycompress/tinycompress.mk
+++ b/package/tinycompress/tinycompress.mk
@@ -9,5 +9,6 @@ TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
 TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
 TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
 TINYCOMPRESS_LICENSE_FILES = COPYING
+TINYCOMPRESS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
