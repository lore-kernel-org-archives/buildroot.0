Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290C9C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 08:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCAF6821BD;
	Sat, 14 Jan 2023 08:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCAF6821BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69gy4JfLDXGY; Sat, 14 Jan 2023 08:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C4AD821AF;
	Sat, 14 Jan 2023 08:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C4AD821AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0621BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06958400F8
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06958400F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9z1B_3_O7rG for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 08:06:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EEF400F2
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15EEF400F2
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 08:06:28 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b4so14629997edf.0
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KXP/NtGETwyZWys0rEYtvE5cosQkunbRonJPMt7HiJk=;
 b=UJ8eAu2KELuT8l33DcyeS3iuN9CO7fTqJS01dQ9xdaAbf+7757k2IYGIqmFDD+rDoV
 8MxDCQ1/KhjqK08AB5glepPPxQe7UTD9aUL9nkBk/0n62/Ep0DD3nccjvotQGz1yYpww
 3xqEqw7b5iHrVKcY7isY1pIYmvk4fUgH6sowOKVRkdcw2PlAQnpiouVpVtnRgurW5icD
 UnZOc6vbWRM77/0kSU8hOg2gPnTUA8F+Ka6lTTCjRTIV0cuqGNQMRfaXo+nUQCZ+nxtk
 Wzgrb/+oaO4EGi+A0XsMXRuv2dgp4GvSsbprT0CueLrqw+9xac2IhDpZVC0iJcS4sGoP
 Er7A==
X-Gm-Message-State: AFqh2koUaDeOdydgz8dTHOUjvob2EBDS3TSBeeWUg+1BML+6m2na//KC
 h7WKKIPsePGdoYELs7Tymv8uQeegIbI=
X-Google-Smtp-Source: AMrXdXuqoTd9XCYbrKP/qFJhVqZKaetN3XPT70NXQKG0ifpmqwqiC5t+NO9f2FjOAFuFedKBqEDQLg==
X-Received: by 2002:aa7:c6d5:0:b0:49d:f44f:7ef1 with SMTP id
 b21-20020aa7c6d5000000b0049df44f7ef1mr248319eds.14.1673683586216; 
 Sat, 14 Jan 2023 00:06:26 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 p1-20020aa7cc81000000b00499cc326a4fsm4694485edt.9.2023.01.14.00.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 00:06:25 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 09:06:12 +0100
Message-Id: <20230114080611.27225-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KXP/NtGETwyZWys0rEYtvE5cosQkunbRonJPMt7HiJk=;
 b=fwGo+XmpaSyDhfuhs9TCYVQLZ53rELM0ZV5sfqNb+jqZQ04t3f08WJaCZSo9m7nwdj
 /QUHpRPWiH5vVm5XBZCcSz44AXl52R+3+gj6j69wOjSVFRXtnyaWxi4v6ANxCjWPSFi2
 rmopBji1OQ1KdC4xRDS9jvIGkHMD9GwKWbDB2wo1EJbQl3ri9o9bOcU6qya2GRGluKW4
 FMcygQIIS+TWgo/YcNcwtn+iTN41Z7K/UHjUvP33wlHEk59XJByWDNca38aY2Fw2rmM0
 4cbONSG/Urq6v0CJy9OXAUy6vEYm0E98EIq7thXgSJ9fRPFqw0OtB2LVh4yHxTTcpTYY
 +FIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fwGo+Xmp
Subject: [Buildroot] [PATCH] package/network-manager-openvpn: bump to
 version 1.10.2
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
Cc: Alex Michel <alex.michel@wiedemann-group.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/network-manager-openvpn/network-manager-openvpn.hash | 4 ++--
 package/network-manager-openvpn/network-manager-openvpn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
index d0cbc7ca87..11fb28f8c8 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.hash
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.14.sha256sum
-sha256  e7419053fc3b5a7e25f1a7517c313ad4531b6ea280255524ebb85a70c76fdbeb  NetworkManager-openvpn-1.8.14.tar.xz
+# From https://download.gnome.org/sources/NetworkManager-openvpn/1.10/NetworkManager-openvpn-1.10.2.sha256sum
+sha256  62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945dad4adfb56d076d21  NetworkManager-openvpn-1.10.2.tar.xz
 # Locally computed
 sha256  c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
index d5d4c5da42..ccc86e45f7 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.mk
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.8
-NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).14
+NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.10
+NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).2
 NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
 NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
