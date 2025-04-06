Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB305C369A1
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 01:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F3581F42;
	Sun,  6 Apr 2025 01:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRXavcARlse3; Sun,  6 Apr 2025 01:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF9A81EE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF9A81EE1;
	Sun,  6 Apr 2025 01:14:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 331CF221
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2077E40461
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9mfMJEbv6pH for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 01:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2072B40407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2072B40407
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2072B40407
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id A4BEF5844C0
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 00:49:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 167B7443E5;
 Sun,  6 Apr 2025 00:49:09 +0000 (UTC)
Date: Sun, 06 Apr 2025 02:48:55 +0200
MIME-Version: 1.0
Message-Id: <20250406-fix_zxing-v2-2-0bce0e835a60@bootlin.com>
References: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
In-Reply-To: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleehkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekffdtfeffveffhfejveevvedutdefffeitdeljeeuleffuefgvedtlefhteejffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepvdgrtddumegtsgduleemleelvdeimehfkedttdemudduudemtggufhejmeeggeehfhemiegsjeehnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelledvieemfhektddtmeduuddumegtughfjeemgeeghehfmeeisgejhedphhgvlhhopegludelvddrudeikedruddruddvngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiio
 hhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhhuhhnlhgvthhhsehtrhhoohguohhnqdhsohhfthifrghrvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743900549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DZD05a5AiChq/iVQHJ+wAVPd2CYVgDN1AZbzlSgm2/g=;
 b=AMhCnkSpc5C0WNMrfqmDy0slQIC/VdfPE0B62u0RqdKTRaF4AG0urWkyy2YI92TqeT7aML
 2f8r0dj8BI4Hh/DEVYdvyeNFQgqK4dF6lRKsywuTdqKgIHTgOOifT2c+xY+lLsZwDv2aaF
 0FeaRO/5TT3ScCG1KucFg2LYU4EVFljvq4khapAP8HXL6LxLRfBZeCv55ztf28GOIUvkLl
 iQFSweT22Z6IjmXG+KQDgySiS3keVJC38AFtK71JDf0JMo0i/uQccC3WhyAQgEpnJjSMio
 ojrqwtRDkur9EH03IoQOTNuYXsvk+yU4GeAHJ7vmqoklwLUsHM2r9W40bDD9fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AMhCnkSp
Subject: [Buildroot] [PATCH v2 02/11] package/gstreamer1/gst1-devtools: bump
 version to 1.24.11
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
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index d194dd32e6b78c39b12585d5e67e65a51aea6d4e..fe98dd763136b440aa617c663e8ac4bd1d95ab41 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.12.tar.xz.sha256sum
-sha256  015ff62789dab423edafe979b019c7de4c849a2b7e74912b20b74a70e5b68f72  gst-devtools-1.22.12.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.11.tar.xz.sha256sum
+sha256  73990a939c1ea9d9ca199b8cd135dd3a7120b495004aaa79299257d9cd897834  gst-devtools-1.24.11.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 66aec4a8e9550c0ce479b96345fcb549c7d41120..d4877a8afdada60c3869502e9f50b1ccea925646 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.22.12
+GST1_DEVTOOLS_VERSION = 1.24.11
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
