Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB8C5AE49
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 19:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9CC840CD;
	Fri, 20 Feb 2026 19:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWfdSK2J13Ld; Fri, 20 Feb 2026 19:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 767AD840C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771616838;
	bh=HGNHLcjt1T2VU+I0+fF2mBbBCp+lFr8FsdEpXGiDp8c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tCplztWqaaqenCQXFJjGlgH7gTw4dK7Gz/rKo1eNnLzNISS65cGr8AjedfeD7CnKz
	 QRJWxFHAr/RH6ZJ2krrbjdPdPRyNhhbA4eJo6sF08ShFKXSrjCKUzLqY9it8SdMI3Y
	 VrPtAovKar/HNWXvdxDrPz/RzKg37ZlMETcptlkac/j30JE7ZWEV3uaMlWB9lg5uTJ
	 m9IBbMzg5CZdjwRkRk//fkRFF5eBP+PeYIqVNBzliAnZwQa+9bU8I2ZMKdAsiN5FFL
	 yzGHcgmBLekvZkrnCBY0Axs1Oab+HqUtyw8X7BsEDMiQzrrt92Rn3eXX8gs6wv8QLN
	 FjtR8hGBW3s7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 767AD840C9;
	Fri, 20 Feb 2026 19:47:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FEE1183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 19:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35C4F40B5B
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLpM1PZM7FK5 for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 19:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C09E740B41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C09E740B41
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C09E740B41
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 19:47:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 364F4A4C0983;
 Fri, 20 Feb 2026 20:47:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34356)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vtWSs-000000005Ww-2woX;
 Fri, 20 Feb 2026 19:47:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 20 Feb 2026 20:47:02 +0100
Message-ID: <20260220194702.3078327-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771616831;
 bh=Jh9ob8jWiF6PiWH4DfXssO4thJT2AycmYsup3n6VBvs=;
 h=From:To:Cc:Subject:Date:From;
 b=Q1a0+x2OdZ7dSpiK0YCdfSWdDwYdgM2RdloE5uczWPoryU2Qu50pOyCktC7fTTTi3
 7ex9EQpiBJ9ZYmzOqlhJJgCcszoE5HLexS8vVi5CQC4smTfZh3P3PC7LQj1qg9uJKG
 wNDck1Tv+H0TIS/vxE+oUVOD5/xTzcuzO3mtEu25idSD6x2RgPLMgPsPHkU88dytm9
 yJdrtgkZ0YLaFnkeo0Ht1qeI98gW/WyvJaOdcZ/whQO3XG+bWBF9rLGk2vgQds5ONJ
 AwH3kYxCPkPHNGr5JoEiqrNLwDcp6yOzSG6TwiB0DZck10fPJfckOEXmDQo8+A+R/6
 xLy13Q/0wLEIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Q1a0+x2O
Subject: [Buildroot] [PATCH 1/1] package/wmctrl: fix tarball URL
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

Current site is down, switch to Debian.

Fixes:
https://autobuild.buildroot.net/results/679/679a9f6224d1771ec2ab52e45fd74af8d03c1604/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wmctrl/wmctrl.hash | 2 +-
 package/wmctrl/wmctrl.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wmctrl/wmctrl.hash b/package/wmctrl/wmctrl.hash
index 531f64a0d8..86b04d0c01 100644
--- a/package/wmctrl/wmctrl.hash
+++ b/package/wmctrl/wmctrl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl-1.07.tar.gz
+sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl_1.07.orig.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index 36ad3513ff..e948f7a939 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 WMCTRL_VERSION = 1.07
-WMCTRL_SITE = https://sites.google.com/site/tstyblo/wmctrl
+WMCTRL_SOURCE = wmctrl_$(WMCTRL_VERSION).orig.tar.gz
+WMCTRL_SITE = https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/wmctrl
 WMCTRL_LICENSE = GPL-2.0+
 WMCTRL_LICENSE_FILES = COPYING
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
