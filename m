Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61916E9A762
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 11:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED8760BDD;
	Tue, 24 Mar 2026 11:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xaQnzgBk-qz; Tue, 24 Mar 2026 11:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B306071B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774350134;
	bh=eB3j1A1+ZTo2ac8bddStebD/qKLIkHLX5ryn259/DG8=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=s/DydE4cI3l9gLNV7sVnP5qrnsS28thfjhhr+Ic3w/s367ZUEky6cK+oEC7SpZwDo
	 U5Pe/HCcABAFxV8mZcCM+ysG14ex2/crdDStFYtwEyJGJCSShZlwL/PfTsLyxzmCDY
	 hpPETpB2pJa2vGThTtFerm1C7og8wSkMF+FPuMdx3ZwGf/7YFABYrQ8ZLMrHPUXXf7
	 CvlmMrK1UJpwTSrWTKeb93tiA4aCKFexP8omO9KpigYAc7SxS4Xkl//tyLB7dMinIj
	 pxLmREVsIVU6FjqW6T43rBWXtmx/PzD5SsUsMXk0I9Alne78esJ9G9pzt60IjoyFz3
	 cxi97Y4cSzkNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B306071B;
	Tue, 24 Mar 2026 11:02:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44422353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3614482289
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-Q_YXb-3EZt for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 11:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.13;
 helo=smtp-bc0d.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5ACE282284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACE282284
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch
 [45.157.188.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ACE282284
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:11 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6c])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fg6Yt0kpkzr1N;
 Tue, 24 Mar 2026 12:02:10 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fg6Ys49B7zNMN; Tue, 24 Mar 2026 12:02:09 +0100 (CET)
Date: Tue, 24 Mar 2026 12:01:47 +0100
MIME-Version: 1.0
Message-Id: <20260324-qt5-5-15-18-2025-02-x-v1-2-9d25b343a6e3@cherry.de>
References: <20260324-qt5-5-15-18-2025-02-x-v1-0-9d25b343a6e3@cherry.de>
In-Reply-To: <20260324-qt5-5-15-18-2025-02-x-v1-0-9d25b343a6e3@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774350129;
 bh=ttn+7Xxwhc+N+o1s+RcKgfuYZ6sDVodL7bA+SLJhauI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dIdvpMkJ/XaYUwkrUunK0kz9h2asje27mGkdq/Vjy3ImKA3wCEG2YOsTD6ZnvfYD6
 EIfhK5eZ+/LNr871T2rdiw2jr3u3+RK287p9tVhkAH0F9Eflx8TXdoOYIUGyvtfaWQ
 SLe8YJPpkOwuX/BFgShRodmPlw9oXtMJQgcqtCwIbb4x9pXADmQAt7OQ8RjSenzlfg
 4cscZ6gSa0MiQp/hj4z6VD11U9dr6eqmH+9sQnrChdPMpE0cUa02kUckfER88PcE5e
 ilSPH6VWyAtzYWxPHcJMovdCaaiUyj1k5UBp3SfyiwfmjcfwXkeTOh0couwgyQmvM/
 nhwi3gb79vSPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=dIdvpMkJ
Subject: [Buildroot] [PATCH 2025.02.x 2/5] package/qt5/qt53d: force using
 Buildroot's assimp when selected
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

If we're adding a dependency to the package, it's for its build system
to use it. Unfortunately, when -feature-system-assimp is not passed, the
assimp module from the sources will be used. Moreover, it doesn't build
currently.

Unfortunately, qt53d still doesn't build with assimp from Buildroot.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/qt5/qt53d/qt53d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 459b019902..ae15b58df3 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -16,6 +16,8 @@ QT53D_CONF_OPTS = --
 
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+QT53D_CONF_OPTS += \
+	-feature-system-assimp
 else
 QT53D_CONF_OPTS += \
 	-no-feature-assimp

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
