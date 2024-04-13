Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D742C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 06:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 185F282362;
	Sat, 13 Apr 2024 06:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reSmO3RndM3s; Sat, 13 Apr 2024 06:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22B888236D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22B888236D;
	Sat, 13 Apr 2024 06:42:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0561BF34B
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 06:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15F0841F43
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 06:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jo1b8Y3Dzn_M for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 06:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7939C4179E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7939C4179E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7939C4179E
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 06:42:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 96CF5A4C2DEB;
 Sat, 13 Apr 2024 08:42:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35114)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rvX5O-000000001zC-3XIa;
 Sat, 13 Apr 2024 06:42:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 08:42:03 +0200
Message-Id: <20240413064203.53781-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712990524;
 bh=ekmT8+D9lB+XRRIUQKt+4LbkS0qFG2zTTagVo5bORd0=;
 h=From:To:Cc:Subject:Date:From;
 b=Se/4mRKp/TEvu+aJ2xiKK+i3YHO7LXb/LMljJ6hI781Utub7Te6vhikr0fvMSipFz
 9xnKDQF8FdS9U3vwaYeUnLlQjL0ImlktLEVrEkMYZeeGnckY6iZ6Gplh6NWmSrfn49
 dm36tSpxiB/VK7midn3tmCREsmqTuBgRXWFZqUaJwIHdChJleust7E+DMS+7xFB9xn
 ekdLetCcNrHAb3WR0Kb1jq2OvwOEeWzmVqZsSBs8REIxQnpH5bsbbQLp6qWCk4Wq4q
 f4OSWR4cWcjHd8P1PfIqmJ9GPk571YfYSpWPmS96FErYCxwoJ0CNjPHTMpFrtQux8U
 Yvd1TXvc7ESgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=Se/4mRKp
Subject: [Buildroot] [PATCH 1/1] package/cmake: add
 BR2_HOST_CMAKE_AT_LEAST_3_28
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 38d07349daece6393800619ecb3ef98299711819 forgot to
add the corresponding BR2_HOST_CMAKE_AT_LEAST_X_Y option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/Config.in.host | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 0935e9a564..c38bb9daaa 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -47,10 +47,15 @@ config BR2_HOST_CMAKE_AT_LEAST_3_27
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_26
 
+config BR2_HOST_CMAKE_AT_LEAST_3_28
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_27
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
 	default "3.27"	if BR2_HOST_CMAKE_AT_LEAST_3_27
 	default "3.26"	if BR2_HOST_CMAKE_AT_LEAST_3_26
 	default "3.25"	if BR2_HOST_CMAKE_AT_LEAST_3_25
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
