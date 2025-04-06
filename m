Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3F0C36010
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 01:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6719C606DF;
	Sun,  6 Apr 2025 01:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_o-mVlGNjGR; Sun,  6 Apr 2025 01:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7F7460BE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F7460BE5;
	Sun,  6 Apr 2025 01:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CDE11C7
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3196340461
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56jkYoyq6-ov for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 01:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DE11400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE11400BD
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE11400BD
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id E3CB2584625
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 00:49:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BB3B443F6;
 Sun,  6 Apr 2025 00:49:11 +0000 (UTC)
Date: Sun, 06 Apr 2025 02:49:01 +0200
MIME-Version: 1.0
Message-Id: <20250406-fix_zxing-v2-8-0bce0e835a60@bootlin.com>
References: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
In-Reply-To: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleehkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekffdtfeffveffhfejveevvedutdefffeitdeljeeuleffuefgvedtlefhteejffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepvdgrtddumegtsgduleemleelvdeimehfkedttdemudduudemtggufhejmeeggeehfhemiegsjeehnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelledvieemfhektddtmeduuddumegtughfjeemgeeghehfmeeisgejhedphhgvlhhopegludelvddrudeikedruddruddvngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiio
 hhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhhuhhnlhgvthhhsehtrhhoohguohhnqdhsohhfthifrghrvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743900551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo7rmDMkgnZIV/2KBA0Scj27EjaaOdQ9FfhAuGkBa8w=;
 b=kKNBokJyl0RdSjUiJmvgHwvKocHQ+MBB5A5mPzbvB1n/18khxNYyqaDpI0GhqCpY4DCdnH
 BGdhFGjmcM5a1Bm8hJIcOuuOXcLf7QSnrTdqIk7qasevkBa57eEnI48e1+vhDSIgSBISGg
 3BpBi16ylXZRlhqyghNvLTefUl4aK9UZFpPhASgjiQp+fTIngT2bZoHamMQxAv575K74wg
 xa4yx5dLebc/+VM74d8sdhjefg6GmOuR42CHShw5XkwV4UgibZoYmV2Xuc6fnBg6pjFWjS
 NAcvl/MjH7PvGRULksfhwkxkqlNT/dtRwb9D5vyittVSfPZMDivHuHxJ4msaEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kKNBokJy
Subject: [Buildroot] [PATCH v2 08/11] package/gstreamer1/gst1-plugins-base:
 bump version to 1.24.11
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No functional change, but bump for consistency. For details, see the
release notes:

    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 28ee14122b32fe527b891940cd9aeaad8352f610..6133825e5861133b4f3a60b1b84ac1f22825e822 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.12.tar.xz.sha256sum
-sha256  73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1  gst-plugins-base-1.22.12.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.11.tar.xz.sha256sum
+sha256  98572c1f8b710e52673e250cd96e4f2660d79bd66aa172c5dde5f690c1231e1d  gst-plugins-base-1.24.11.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 31a40406f608c2b921dfdeeb0775babfc80609de..f0cf3e8686efd9fa8443a984658c96870282ff22 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.22.12
+GST1_PLUGINS_BASE_VERSION = 1.24.11
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
