Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C6ACCF9E6
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 19:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB98849FD;
	Thu, 23 Oct 2025 19:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gp7odlzVC1R; Thu, 23 Oct 2025 19:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D3E849FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D3E849FA;
	Thu, 23 Oct 2025 19:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 817C170A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F14361B8A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ya5p8Zumtl7b for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A367D61B89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A367D61B89
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93F15877AC; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 21:40:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d95c34d64505214d56e452abc1f3502323266af
X-Git-Newrev: d1193da9a8ae92048152e015e9efd013f323de6b
X-Patchwork-Hint: ignore
Message-Id: <20251023195659.93F15877AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: add upstream patch
 to build with libminiupnpc >= 2.2.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1193da9a8ae92048152e015e9efd013f323de6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-bump-miniupnpc-to-2.2.8.patch             | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
