Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9480FCCD193
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 20:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B7B61501;
	Mon, 20 Oct 2025 20:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UysECiWcXzwt; Mon, 20 Oct 2025 20:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D39E615A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D39E615A1;
	Mon, 20 Oct 2025 20:34:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A61277
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CDF141FE5
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdSuMax8KwOI for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 20:34:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7060B41FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7060B41FE4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7060B41FE4
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A55A4A4C207E;
 Mon, 20 Oct 2025 22:34:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38910)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAwaK-000000006LE-3GMt;
 Mon, 20 Oct 2025 20:34:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Oct 2025 22:34:27 +0200
Message-ID: <20251020203428.2751864-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020203428.2751864-1-bernd@kuhls.net>
References: <20251020203428.2751864-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760992468;
 bh=kdFF6g0+bsf/0c5HDwZv8Nijk8R71tn+5bg0slr8ezQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=0/+PxcZZ7ENngp07e01K3Y4CT4eTH/JWawZSVyw2JyBHN+qPTLZzpDvg1yJ1sVMEr
 4ofhWTy47dCZj8vJNGw8zY92FzAbZFlN3Txjl0eMK1tegpSlvmXJLKpGW4/UiLmj61
 2WBU5w6oV6z76Cajt/TGXt/AOU65H9Y7E9eDTJCYGeJdfxdj7lyUhgz8PK1ll/a3M2
 GW2pBJVOpErpZao8hwAEdGolbehQWf3uhlZLxikNtxGXINhZ6fQWhoXwgz1Q7AbIv1
 N/AowlqWw6MYogC+YJoL8vz27p1ScqlOCoARKg6zSX4cHzDaWJ0DbFci11LSH5n1Nn
 P5xUv1XS3a8Dg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=0/+PxcZZ
Subject: [Buildroot] [PATCH 3/4] package/transmission: add upstream patch to
 build with libminiupnpc >= 2.2.8
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-bump-miniupnpc-to-2.2.8.patch        | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/transmission/0001-bump-miniupnpc-to-2.2.8.patch

diff --git a/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch b/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch
new file mode 100644
index 0000000000..f8fab5024f
--- /dev/null
+++ b/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch
@@ -0,0 +1,39 @@
+From febfe49ca3ecab1a7142ecb34012c1f0b2bcdee8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?C=C5=93ur?= <coeur@gmx.fr>
+Date: Sat, 15 Jun 2024 07:24:06 +0800
+Subject: [PATCH] bump miniupnpc to 2.2.8 (#6907)
+
+* bump miniupnpc to 2.2.8
+
+* Avoid build error "ln: include/miniupnpc/.: Operation not permitted"
+
+Upstream: https://github.com/transmission/transmission/commit/febfe49ca3ecab1a7142ecb34012c1f0b2bcdee8
+
+[Bernd: rebased for version 4.0.6]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Transmission.xcodeproj/project.pbxproj  | 2 +-
+ libtransmission/port-forwarding-upnp.cc | 9 +++++++--
+ third-party/miniupnp                    | 2 +-
+ 3 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/libtransmission/port-forwarding-upnp.cc b/libtransmission/port-forwarding-upnp.cc
+index 6d7bbc7f7c2..a4146e0df13 100644
+--- a/libtransmission/port-forwarding-upnp.cc
++++ b/libtransmission/port-forwarding-upnp.cc
+@@ -261,8 +261,13 @@ tr_port_forwarding_state tr_upnpPulse(
+ 
+         FreeUPNPUrls(&handle->urls);
+         auto lanaddr = std::array<char, TR_ADDRSTRLEN>{};
+-        if (UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1) ==
+-            UPNP_IGD_VALID_CONNECTED)
++        if (
++#if (MINIUPNPC_API_VERSION >= 18)
++            UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1, nullptr, 0)
++#else
++            UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1)
++#endif
++            == UPNP_IGD_VALID_CONNECTED)
+         {
+             tr_logAddInfo(fmt::format(_("Found Internet Gateway Device '{url}'"), fmt::arg("url", handle->urls.controlURL)));
+             tr_logAddInfo(fmt::format(_("Local Address is '{address}'"), fmt::arg("address", lanaddr.data())));
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
