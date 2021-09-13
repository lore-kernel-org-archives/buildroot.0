Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51681C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B8D6103B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9B8D6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9AE5402C1;
	Mon, 13 Sep 2021 21:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaN-eQ7yubgs; Mon, 13 Sep 2021 21:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF7D940299;
	Mon, 13 Sep 2021 21:05:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42FBD1BF97F
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F0940293
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIoh9tkV_KBl for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C175140299
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567052;
 bh=JyeuaVz1rFyGJC3cueq0vlqUGe4YDbkqAhf/cmUj2Q8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=MhZL8ECe6LZU41K1qgwYLI7ZnV443TSXP+f0gFbsbje6kDXzF0uckUToY7hczgJRV
 FO/sU8QWIeywBEmwrREt+SNbQGPlNoH6uumBQ5FGg6fEJ243Gt4xAzPfwM1EtQtq0A
 kA8G3xP3eFufdXOuoaLUq29YPuYjNWSVdUwsOK+8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MbirE-1mv5TG2ere-00dCtT for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:12 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:00 +0200
Message-Id: <20210913210412.24042-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UMm8uArXdz4ftCTuJwNU7z7PfsGOEQgRpbCgtscwB9/kguGf9hU
 lQoPlv+P68xOSYFPnCkdpIicxLn4EV/Fe70jzuefCq8Qx06Vm8VfxPapdlt5BTSEGkxAepc
 p1akgsp+KxtQ0LHkTPXkIl+EMhK8XzRfj8HNnoBpaSnnKHzW2T4QnG1UQpthSrjJT+clUSV
 2h+AT7WmUrvO5dlaruNrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E1WgQEnmT2g=:gwKrce/JGvLeWMZovcmGJC
 oc6akd43kWVDQKKwpDeFODF9DaZ6IMmKEgSWgBSl5qRFW9T1oPhStFmfixBrB8qz8jFmLSR/b
 Rmdg36J3omKBIK2gXrNM4UXoTknU1nPa9+y7GX8o1Gcxdm7ye70TqOOy/yE5GyuEGkclxSvot
 gjnqwHH9qh0Lc3zu9l8QmXergebRUDlMTvzW/H2G43iChzBALaNYU93MF0bjex7xKtxnFG59p
 vNMg0k/TPPSwaOmcINj41WPt61CRdm/IIY96L+iEWLF324LK15M89Ac3QkrEIzTBABN3/++SW
 4WL6eFomZQrao53SijXjlSF2JsYQUh/7R+XgR5UqAgnLLL9lQR3LYkokLXYxSMz/ivdG1819G
 pgPgFN7EBM9XiDML7bAilctz0EH0pP5qjwYrJ68vnMubCdcG4/3YOqKbnh3pr1YQNyJ7izKo0
 8xt3qxvUZSOETGNvrUG/kDPOR/Z5cIUR+3nl9qiGuQRDS4Lh3M5wVMbFk6PQ9YUJB82Vz1Rb2
 aOFOoJW0lpQXBIMY5ZZWClBBTM84KVSIq9/NLmcnAnpWebYph0N5GDUp9z4d/NePnUTOXV/hz
 9oCrusb7DM3nYGasmJv/DBRjI6+ZlE8JWML7GpRXs0g+VGb2w5+1HKq83Zky3iSOZ/CAsteCb
 w1lypkYF+fe9AaFQWGJrXcGuS3mqTvS5yRGgA5gMLqVE4aKOEGYaWOW1hJco9DAyTGNTLPsZm
 JT6pFyxjw+W64smy1dkmLotfxlZzNQ8fMX9g3yMAbaHffCbneCgOGowFBTNQ9dUvtemaJ8OBh
 nIj6UlSAPH23XYidi2r4f2/Q3VTQn9Ayd6hRsFi9/m78I+wNt6SmJPCRPSAQPp7EP2Ai/k3fr
 FF9dYjP3eWHZIIyjFYLLVkSBHPIR51l0s354vj/O/zjnqSuZ1zDS9r40v/olc7z1vWoDcC72A
 Skup7IQc4JVsaDsyyyQuFQKWW2/yx/t4aF6RnyYN2UlG421/XmxMGrmdUezI9jZda7P5jvaOT
 3eN7RwIRfCyl1T3HR8j6kBflinhAH9UiVgWz+ZFij6PwhDwy7wK5z6lpuRS+YOhuZ7cE7aeO/
 vwTWoe1AQpdLj4=
Subject: [Buildroot] [PATCH v1 01/13] package/gstreamer1: bump version to
 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index e9709ef0c9..c6282454ca 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.4.tar.xz.sha256sum
-sha256  9aeec99b38e310817012aa2d1d76573b787af47f8a725a65b833880a094dfbc5  gstreamer-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.5.tar.xz.sha256sum
+sha256  55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a  gstreamer-1.18.5.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 171ea2b8e3..9bdd00caec 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.18.4
+GSTREAMER1_VERSION = 1.18.5
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
