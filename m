Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B8AE65296
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F4874075C;
	Sun,  1 Feb 2026 18:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOuxsgA-RRsr; Sun,  1 Feb 2026 18:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B9440766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971199;
	bh=zdlmaujrEdFy0owmRvesE1Yh4JgVkOoe7Jau2JjPbJg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MibtAKbxlSPzYlYHI78BgHUTM1pEncWW36msxXFDWq/QpEQudHTeD2sYIhun+WJAJ
	 IcB0j+MuPJgKGT7BSI8mkClRWOLkQUBSq88trvkenhDUOxlH4mfstGWmh6sSJuxX6c
	 iC/I+ZV4SKsKEeQGIai2AJJMXbn2lec6Cwqbk2dNDs43kD+1ONxlv0rCM1b1u2UszH
	 01kgLdSHMxPARm3DcdzJOvrQCp8VN8d9KhteMEJ0DB55TfSPCEt65FBl/ccq3OSCYl
	 YOjbEfgSn/Mctdrk2TZdlwVEeQx0u4A0zOQkdX8nDYjwHXhDFmz9ZqlxjvruzfsKsg
	 +9DoAyazGMaqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B9440766;
	Sun,  1 Feb 2026 18:39:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 485CE1E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D39981227
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7z8LIex242vt for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01AA4810DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01AA4810DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01AA4810DA
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:39:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0EE75A4C547A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 19:39:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60144)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcMP-000000007VW-3jJF
 for buildroot@buildroot.org; Sun, 01 Feb 2026 18:39:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Feb 2026 19:39:49 +0100
Message-ID: <20260201183949.3297871-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971190;
 bh=B1QffZ6w8fw8P31c3na2sZDea9hT1sOMLd77kE30sH8=;
 h=From:To:Subject:Date:From;
 b=Qju+zaYbrGAynd8OiyQUb1DLJ9/67Edhp1eJ0DwUYtDg3tz8ehebv0oEHKT8/YzrZ
 frPR1aouzWjViMQ92rBAAwT3kj5B2jFA/IsV0EfNoWFG5vaoALTfB6vc65n2RgJWFU
 PKlwo9TjVHH858e5h5TWtSSK0ZW3KV4sb2oxmycYzltrd4+u2KXxlFVty3+z5ZMLl2
 +1A+/TatzVCiKLaj5FWJ0MvCG1pDUc8wFs+uY1dMM0lyUKKOOhz1YPP8wOleP9yOWJ
 hSz+zf/faOMKHw65RUxeFBdNygc2pHbT+P0UvUGH6AhhX3wIPgiKxNN9cos/cjH173
 mnla2cJZ2QQYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Qju+zaYb
Subject: [Buildroot] [PATCH 1/1] package/transmission: bump version to 4.1.0
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

https://github.com/transmission/transmission/releases/tag/4.1.0

Removed patch which is included in this release.

Updated license hash due to copyright year bump:
https://github.com/transmission/transmission/commit/5ce17df2e52eda39d61272590bdf4921c9bf7bc7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-bump-miniupnpc-to-2.2.8.patch        | 39 -------------------
 package/transmission/transmission.hash        |  4 +-
 package/transmission/transmission.mk          |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/transmission/0001-bump-miniupnpc-to-2.2.8.patch

diff --git a/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch b/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch
deleted file mode 100644
index f8fab5024f..0000000000
--- a/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From febfe49ca3ecab1a7142ecb34012c1f0b2bcdee8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?C=C5=93ur?= <coeur@gmx.fr>
-Date: Sat, 15 Jun 2024 07:24:06 +0800
-Subject: [PATCH] bump miniupnpc to 2.2.8 (#6907)
-
-* bump miniupnpc to 2.2.8
-
-* Avoid build error "ln: include/miniupnpc/.: Operation not permitted"
-
-Upstream: https://github.com/transmission/transmission/commit/febfe49ca3ecab1a7142ecb34012c1f0b2bcdee8
-
-[Bernd: rebased for version 4.0.6]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Transmission.xcodeproj/project.pbxproj  | 2 +-
- libtransmission/port-forwarding-upnp.cc | 9 +++++++--
- third-party/miniupnp                    | 2 +-
- 3 files changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/libtransmission/port-forwarding-upnp.cc b/libtransmission/port-forwarding-upnp.cc
-index 6d7bbc7f7c2..a4146e0df13 100644
---- a/libtransmission/port-forwarding-upnp.cc
-+++ b/libtransmission/port-forwarding-upnp.cc
-@@ -261,8 +261,13 @@ tr_port_forwarding_state tr_upnpPulse(
- 
-         FreeUPNPUrls(&handle->urls);
-         auto lanaddr = std::array<char, TR_ADDRSTRLEN>{};
--        if (UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1) ==
--            UPNP_IGD_VALID_CONNECTED)
-+        if (
-+#if (MINIUPNPC_API_VERSION >= 18)
-+            UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1, nullptr, 0)
-+#else
-+            UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1)
-+#endif
-+            == UPNP_IGD_VALID_CONNECTED)
-         {
-             tr_logAddInfo(fmt::format(_("Found Internet Gateway Device '{url}'"), fmt::arg("url", handle->urls.controlURL)));
-             tr_logAddInfo(fmt::format(_("Local Address is '{address}'"), fmt::arg("address", lanaddr.data())));
diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 3e470a002e..b6dcaf9ae5 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  2a38fe6d8a23991680b691c277a335f8875bdeca2b97c6b26b598bc9c7b0c45f  transmission-4.0.6.tar.xz
+sha256  dcd28c1c9e6126229c4c17dbc9e95c9fd4aed7e76f4a1f2a74604c8cddec49d6  transmission-4.1.0.tar.xz
 # Locally calculated
-sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
+sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 1eab839fd3..e4b6d8d189 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.6
+TRANSMISSION_VERSION = 4.1.0
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
