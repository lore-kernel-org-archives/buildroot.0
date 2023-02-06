Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E640FC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81EE6402EB;
	Mon,  6 Feb 2023 10:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81EE6402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bftECzMa2A2E; Mon,  6 Feb 2023 10:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD07540364;
	Mon,  6 Feb 2023 10:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD07540364
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FEBE1BF4E3
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36F7B605AF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F7B605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CchtVEkq8RDi for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:02:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED9F9605A9
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED9F9605A9
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:02:13 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id k12so4482634ilv.10
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 02:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pn2lBUSsU9oCPJu+IYdKuRNZwhbA0uA/2QPHS3O8Z8c=;
 b=Q1iizIuRMTQpDnXVyGkq4e8s9DzHN3dmEp8jFcPyjQWcIB8dlu7q2d31g9im+i1/Yw
 ZITvNJOSUFWeR42jqgeikC/O2R7yFIGre0zA1MWYQPp5lZFBy+cJXyjnqmMIlcnvYwm9
 OzUAECQzUiPUXVsB+dLkOVYrIoqNc6tKiTlvU7ozl3FGnXmv31dB3lQpsieE42SOIzB3
 SHxYeLSJwHBgr0IaLQ9uSD3yPYJXV8bCj03ZGp7CO1n0bLkdf4hi5bfaCVHfyZIX7duu
 K6DVsQMDuA03t8qizqARulWii4N/rsXUaft6D+EhR6KagwFH3OOchyTdCEwg0nGaSL7B
 psKQ==
X-Gm-Message-State: AO0yUKWaETFv4CYoCfyjZ9moFPAojgXhMgtpP3ZiidJFKVxE1LURhi7V
 HfpaofKL90amdAZeRIpLgSNZudzTxA8S4w==
X-Google-Smtp-Source: AK7set88Io8I161Qt7yYTPFVs7KxSlDER4VPMoEa398DsQB7SyiOIq8+f6RMaoIHtp+Cl09XfyAK3A==
X-Received: by 2002:a05:6e02:1a68:b0:30f:5fb7:117e with SMTP id
 w8-20020a056e021a6800b0030f5fb7117emr16780104ilv.2.1675677732884; 
 Mon, 06 Feb 2023 02:02:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 r9-20020a92ce89000000b00313ca4be5e1sm552143ilo.12.2023.02.06.02.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:02:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 03:02:10 -0700
Message-Id: <20230206100210.1220585-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pn2lBUSsU9oCPJu+IYdKuRNZwhbA0uA/2QPHS3O8Z8c=;
 b=aloihg/mzS1wiXtooFDxoFCBG6pC727hGCLrSN/55ejU/u9XIJhhVVEdWrxhJrsGJH
 bvazodLhk3s0GBhhXcioSgp33U46zm9zV8LIoTAFx06/ak8cTmQ76xm+UkS59nSiGMus
 72xu/8/wQhbVNqyj9Bv6uVneVih1mOiucK9pQlSnW9e2kljth+0FsOn0ktRyLn4a0SsE
 58xyFazXdTDahlybrshD1yiYNO2+qowTUnZC5babBP5w6JxHJYYuBTykcMySMluXH57j
 PMwDoZ0GmhUUhoZ+yhi1qP2Ye3antG+YQ6BeJ2KH6XZbVydm1sI6D7Vk3xEsLvYd0Mtc
 xBIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aloihg/m
Subject: [Buildroot] [PATCH 1/1] package/iwd: bump to version 2.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index be048b3da6..1647f93d9e 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  dfeada6d1680221fb128dc6be50fc2d6b40e314b98458acbd696418f8da5c570  iwd-2.2.tar.xz
+sha256  b0506d797a8bfb88f3c3eeea5e49dcf4ee8e6cef118f57c118e587eeb377ac64  iwd-2.3.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index b0a2f6e9ed..c54031b102 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 2.2
+IWD_VERSION = 2.3
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
