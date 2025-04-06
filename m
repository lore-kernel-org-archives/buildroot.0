Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A452C36010
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 01:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C67B60690;
	Sun,  6 Apr 2025 01:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGI4_IPK_-lh; Sun,  6 Apr 2025 01:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DC7606B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DC7606B8;
	Sun,  6 Apr 2025 01:14:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67C4D1C7
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E2DA40794
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnFddhmQv6zd for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 01:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 520F440859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 520F440859
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 520F440859
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 240F2584527
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 00:49:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23199443EE;
 Sun,  6 Apr 2025 00:49:10 +0000 (UTC)
Date: Sun, 06 Apr 2025 02:48:58 +0200
MIME-Version: 1.0
Message-Id: <20250406-fix_zxing-v2-5-0bce0e835a60@bootlin.com>
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
 d=bootlin.com; s=gm1; t=1743900550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jL1eRZb8MIEojSkbR+xfQ1/nSkmGWGMZ+YDW1jF1+U=;
 b=AZ24TW7V6xn1VdMJJq4+g3xTrZM9rerI4swDFJv+eDAEL+IcBIQu/TqVxixpahXNViRRGS
 IvZVwF9HfPTr3qm3ve7X+RLBaQtluI6BAH2m1RxrzRLhkTZLCny1rcK1JR5KHdM/mDnaZ1
 s+HAo/8UvvQNQwsLQVtyb9MgBPLXuCbjQhEp9nxd8T3Brmt8XVJZ/ZwFcjWeiyleYY6PEt
 HaH3HktLMPQMrRlqktdRwVLgNX2dGg8W/18mAJAHESQNM1n2M7AQmnNw9RyUrQ+8VngfRl
 O2WvRMbVqpPTfn8U7+B+WZcsRup3DY5GfqblWbuNxKM+Ovx8tesA04fdxsgS5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AZ24TW7V
Subject: [Buildroot] [PATCH v2 05/11] package/gstreamer1/gst1-rtsp-server:
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
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 98b211f7a2be259766f6bbc2ac87211800b54e31..cabd77b0584adcbce659755a4aad8f17b451c2a8 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.12.tar.xz.sha256sum
-sha256  bf6c7871e7cf3528e4ec87ddc2f2949691cd269f98e536482ae744c1405cf451  gst-rtsp-server-1.22.12.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.11.tar.xz.sha256sum
+sha256  d147ff75bc445235fe0a4a4714c26d6b7bf9a485a1ae3a722bd530ab28f98bd3  gst-rtsp-server-1.24.11.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index a8c382e115ced57b1081f40fe9614dd3800bd0ce..6a1cca016e9e3c1479e6cb85dc6cc2d87d6d9069 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.22.12
+GST1_RTSP_SERVER_VERSION = 1.24.11
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
