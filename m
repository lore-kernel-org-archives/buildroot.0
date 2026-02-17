Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A5E909DB
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 16:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E48940197;
	Tue, 17 Feb 2026 16:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLqzi112sgRG; Tue, 17 Feb 2026 16:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 873AA407D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771346737;
	bh=p+lYPN1SIyencv1Xk5dTeU0HoCoMkwSvkvvOiMIwoTc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YYcJO5mdX9prduOcNmnXSdX5+AL/YaaPWqn1ctB2tqEnGyTyVU0Tr/geV4mNhCH6m
	 tpvSVDGsKQPVHYxYSQLIhB6U1rOakzpmd33lR/fsYO7Cc9zmPrm7OMnY0RWpLplXDe
	 RF7X6kCi2CFCuCJmZhn8sdpyTKYKhHu7/RY41JeZUdA5/58UljN61fO9SVO2p2RCvT
	 uJqXT7vxFjDYVxvg5zLODxgc8CiDzbuD4/svFN3d/I8/+j8FubvwChJnLOgE6DntRQ
	 BzUdP1oZ8d6zK3x+5ZaeDmjIVPGO41s5Lt3hVK27v4iAbayOtdHcK6MCu2oo01dRpX
	 kVqKiTDk/HAqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873AA407D4;
	Tue, 17 Feb 2026 16:45:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05CF3206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A6340213
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvWUjujoc0ri for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 16:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB83F400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB83F400D7
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB83F400D7
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:45:34 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-385d9fb297dso38837561fa.2
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771346732; x=1771951532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCVn1gVJdx82hYrIsX/ZkxpXdMqP4g64XqJBou52vpo=;
 b=aGJI6t9T//EqUxuKBCSAZLA9Ro4CB/niRywoJvp/QkqMc97+6IVbb2O2eBSGuGRBuZ
 kzGpJjV08S3tJR0ce9GM9bZQR7uvMjOTcnXHlQl6FI+oMwA7KZzt/nARuh2JrXOlFOWJ
 8E9ahvVHYGueIWEm4Jxg7em4JtoHZdT9VUlaT0ry/faXLJB4ZMi53XHBkvIbuEnVqs62
 qkoJlbE2jSTMjR9HLYNdU7o3WTogHNohLloVbmRbr1JFvpbsLjIcLyk/FrbHntg+EJEk
 w4gzQ+vn24dcAZjhXAMkXANCit8sINWTCowKcV+hcEHEkmdSf4g/D9u00g3Gm4kr7TV7
 RVRQ==
X-Gm-Message-State: AOJu0Yz/kUpQ/LHqg2rG5DYVAQxc9HtypwrrR0WDkF87Y1dc6paYGf9L
 YrHPfWdYbhI2iRZT91EmDqKIGeZWqNiSEGvoOHRqgSr96EJ9LgZxiFFiWTfcGirGcBZkCE1u49S
 pkFCi
X-Gm-Gg: AZuq6aKfzYOsEwIqX+giJOT35ZASkPFCZcitrXskJxmgjDcduh93LUhV3ua7xtPFpGC
 WSss5vv0tQl2b1wbXhKlgrTpB03jW6jMofzYrGjNbqULhmVv9BkMNKhOJ2GOd2NpMhZIKV811xr
 y2oZrp3ikXJ7rIooWSOayMdrMelCdBlIwIJw4EUdIKsvhgFFPzCFg8BRpsJS4Z6noGX6MzZFmvf
 QdqgDk+efqUCkXDCTEyII1u4prwcjBxFaxsjvFRJAkBiWFyBngeznmcqo/jDDHG6AE5Ok8XqVer
 KHIoDiwCoBfbtUSMnVYOdDDk+/g1bQbw44ejtPeHPXbQ/Wqp+EC37c97LedjgU3HdLGBc/z6Num
 vFhYlzN5wp4QTkz9MWznlvOd1XWgQ9AuRq9wrsmJsb3NS93Ar8HsdFRlaTMVlefAkR3QjkOTFPM
 K5FDJpMeaeSd14zY//p2rW1Xg3BXdhsB07MYE9PsBMbsh1U8ECBcrd0Q0EmNpNVQ/YsWZPbm5K4
 aO5rb+rOqcihaafQWzW/nWtIsFVh5re+XH1kMmDSiXYk1VCU0W4sDrub973AMZuAbUYJX8qXFKo
 R1WEfVtZaYrWgDE+6qHN2F+MAkyD49Sw0Lg=
X-Received: by 2002:a05:651c:2204:b0:385:d067:1c23 with SMTP id
 38308e7fff4ca-388106bea8emr41211981fa.42.1771346732057; 
 Tue, 17 Feb 2026 08:45:32 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3870657a90fsm34716391fa.0.2026.02.17.08.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 08:45:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Martin Bark <martin@barkynet.com>, linux-amarula@amarulasolutions.com
Date: Tue, 17 Feb 2026 17:45:24 +0100
Message-ID: <20260217164524.513706-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771346732; x=1771951532;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jCVn1gVJdx82hYrIsX/ZkxpXdMqP4g64XqJBou52vpo=;
 b=p9jbYOcWQ+BjGPhQui7ebmK5p2lIyJpBgRZ7eW1W/GZzjDhFWvJbj1b2pKbfqn47OZ
 zGC6m79lXiVzllja3bVuPAfoRUx/1yq31+WVk8Oc6b7N73NFbCfTdHYGdDmM+YjiWbS/
 gyrW+xJrotV8uXdFH62TpDiV34as6E9/47lic=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=p9jbYOcW
Subject: [Buildroot] [PATCH 1/1] package/connman: bump to version 2.0
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

Release notes:
https://git.kernel.org/pub/scm/network/connman/connman.git/tree/ChangeLog?h=2.0
https://git.kernel.org/pub/scm/network/connman/connman.git/log/?h=2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 807f7144b1a2..da9c879b0b53 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913  connman-1.45.tar.xz
+sha256  d25c2ddc0b5ad13e986ec35ad765ae8d2f4b7acb47c958a05616c943cd082527  connman-2.0.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 695a81f1e547..0100509405bb 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.45
+CONNMAN_VERSION = 2.0
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
