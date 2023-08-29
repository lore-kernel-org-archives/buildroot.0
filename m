Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C376BC71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 19:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F703414C9;
	Tue, 29 Aug 2023 19:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F703414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ocDaEItx5qC; Tue, 29 Aug 2023 19:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 764A2401A3;
	Tue, 29 Aug 2023 19:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 764A2401A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9561BF2C7
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 19:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 462A8401A3
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 19:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 462A8401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zW2uZBW8U7JH for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 19:17:34 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37D9440195
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 19:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37D9440195
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bcc187e0b5so73393241fa.1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693336651; x=1693941451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gh+U00wM5uwVRy/yM/2rPmnYSoYSEHcgWMwQr1c81As=;
 b=MLkXFVaa9fPIj3L2/x8zeX4hdxbF0+NZ5roeYKeWP6ACO93WacAnWRNlDkChaW7Ksq
 ndyFHfOkQnqcM78dsfvpZtR28/153X3yLn5KRJDDdC7zv46yRXIgrWxjDTg1b77SM6Z3
 c4p2AY5b7ReKXXxATCakEYOPUMLPrCe6rCESYukbikmduVOSXBjtmIiiwLlBRgRTva0c
 l/eS9/Ae//TEoP7tdJ+8O/+6u0qYKmZfQAsq4Os5bJOarCGKEkCr9crVHTC70DdHfsCs
 8Wn5ABWlaApcKb5lLf25TiBs6/gJmsA+k3UMJl9irnkjeemJYlqcVWLR2zkHIQqDWc/P
 b8ig==
X-Gm-Message-State: AOJu0YzzZNn31ZOK69si8iGUtq1SXgWYN9ShTaHi2Mpf4BbG9IQMJWaQ
 uXOHi8ceMX1q8JtHGawpPwyLsWa2UOOvdw==
X-Google-Smtp-Source: AGHT+IFft32N99ljHt0i8iq2qQcSy0xFNyYggDF7uAZ8gOTXD4QTuPmSj13KGaNS+qmtBUYA1eEVgg==
X-Received: by 2002:a05:6512:2307:b0:500:bddc:56d5 with SMTP id
 o7-20020a056512230700b00500bddc56d5mr4126822lfu.37.1693336651253; 
 Tue, 29 Aug 2023 12:17:31 -0700 (PDT)
Received: from nibiru.lan (109-252-101-181.nat.spd-mgts.ru. [109.252.101.181])
 by smtp.gmail.com with ESMTPSA id
 j27-20020ac2551b000000b004fe3c53bb69sm2079886lfk.307.2023.08.29.12.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 12:17:30 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 22:17:09 +0300
Message-ID: <20230829191709.405687-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693336651; x=1693941451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gh+U00wM5uwVRy/yM/2rPmnYSoYSEHcgWMwQr1c81As=;
 b=U4TsfnrXy8GcPqpQKbHgYcq7SY1CICAfH70MYbMGF/RwogLDgt/a8n6xT/zxgVa1IX
 8P/Kg4HOyTAUIf0fpe/dv3Mkt0lC+nwEJygDzQ9k2FRaq5Xj8JtUHr70xU6I+MY5RCIU
 VhteayQaF0iHUL8YEGo0Y2yxc/ttFeEa4Ar9irKeYFLtFE2DIcOXIQ1/ukspjSXHWITi
 49s1DbsbBSl8Ez5wdb4WzoybzoGgbX+P2pOc11/q3dElHsG1hr6IMOZTb/XeFGxA1WW7
 utdey05y7jTLiBPcDWLJ14DVh2noy2UySzNs4Q7+j+TvFwwFntUT9E3rOJEsalR7QhDF
 MwHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=U4TsfnrX
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.3.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.3.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 169fad2807..5b2391db50 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  7f7231904abb6a996b8c18ddc5fb50078ef5dff5191649abf9f127aff41d24e9  v1.2.0.tar.gz
+sha256  d44f59abdd64d8f1ca3af7db58bc6518cb081fc9ff16285c3d75a68f5c073d10  v1.3.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 0e8d74cfcd..52e5c50cd2 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 1.2.0
+SDBUS_CPP_VERSION = 1.3.0
 SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
