Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45935CA5FE2
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 07:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74EB40638;
	Mon,  5 Oct 2026 07:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4H6ghyA-CGg; Mon,  5 Oct 2026 07:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0EEAF4055A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791183660;
	b=ZraQab9ceBrPmDQEC4rzittJi/g2c/Yp++P7A05UXAHFucOKBDbMuAVF64Tdv+AFmxlj
	 2PLkx056XuStgvPVI59QoofmMaCyNQtiasfNMjkRHyvU36a8KgcVlzubYRd9JyO7Wy61y
	 MPPzd0I2zGwZ9XtYFU8wmJ1dG+LgMQapY4lKVuWnYYcp4rl+VUw3p/m29A1zxrgGPrbJs
	 KkcYbZPaZgxdfi8lc18zse98fQ1FIqSPhtO3Khs9HuT+O2Y98Kbrf6v4LSHD28JWNgFXd
	 puMf4ZxIblxCUDti414qoqR2Z9x7GxWP+DvcXHIk8qbEpMywGh2CGZAtKNTbiIqNEOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791183660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8GpCXbgxTXQQ/an97TVLktTYRZa6hOGYGwXxEsVmW2Q=;
	b=XSybNQNGGd/8gaUA4X6aBcsMH5gpGpNVE20DNTcDmKzYqCotHBOGNCRvyOVrVGDYvlIe
	 Bdkjy3vSPvhhdIusSKqUEbxG66DzDe50vqFyoAdJT/wjyLLBqZNzBdWnV9/9BEh0gMhP1
	 PeJKqMu14Q3JgAPr+f+3LKcsLU3x6B/aFjjo9RhwKmnFMIDjqJ9WA1FIC/5cXEoT7ycLM
	 0cEsemT7Yq52pZZxM44T1b5CIHgJrLOasx/7t5Gq8xJy4TwZknLaPL+Du7s+6g3/9JyTF
	 zDyCmwEGj2tQjKPmLO66Q+VU7DYqV0W4BZt7J6OMiEuZoP34enkH1oo8YqQ0CfcgUuQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791183660;
	bh=8GpCXbgxTXQQ/an97TVLktTYRZa6hOGYGwXxEsVmW2Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oX9IQ0peXBo2ZbGBSucSIg+ZvcRILBNw15/WkFbDiIXiMeynMwwun9JPYEAFXz6qp
	 F/FVtyXWovOxtXAzSnWDf/Eac5/tlgov4op8UTs+RIwg+vuOIbFAYRe4qNhx32ug7K
	 RgLs2Amiqnb+Wh6U/bAZfHMk9V7kNpDio1Ph/KRLGN/xwpdonYZa0aH/YJUGkUpdOb
	 YfRneL2Ud0ePRfEaTKUgbMIKwEgBPPw0GhZJthQHr1md1s62ykbMshLhb9x7/KNRuO
	 OpPbB13iKnjRDLvfoLomNvAmAJSigUFb70I0AWurGqGlgIeW49kKlmHm1o77P6L92x
	 hjHAOgoemnH7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EEAF4055A;
	Mon,  5 Oct 2026 07:01:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 343CD75
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25BAB8086C
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lyp5uyI-V5uV for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 06:58:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CE5EA807EB
Authentication-Results: smtp1.osuosl.org; arc=none
 smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791183512;
 b=pPGNeFMAYpm4a3/VeZkDsinDHv4Npxj0eiunfNhSFOcrYIfh7sJOgWWe9H1M840R/iEi
 J18HYV3AVt0ZyDnDEVGLtokODemT5knIe+bzJzWAbWZF9gyJTtNVM8NHbA7s3tfK9Xdpx
 oUYHcaS2YOXz1KCEKc3WzOQ2yq11yElSGiIGODnHK2j6bOeh3BHYqFFOPhrFcs5yUi8nd
 k7ORLFvKF6LDRYO2aJhT9nkdiGWvinntt9PX0Q7l2yAAJqWSwNF0hpPdEhqTOHcrePVOQ
 XgYypT9KzqTWxHy7fobUctOkwluzV3mfzbXoHDoBvHwh0g9x+P5r9x/1Yw2I0JpwMxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791183512;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=khS92wHJsFhonUvPHsYHawV0msYDuLet8tpXrEjAKww=;
 b=M/q9vCJVwMIiMPw6j7CB/rnp0mGOlqnxEDNyPGd5/M2PH5d3dG5Sryx+d7kaZhvr8aLL
 VXsYRyXl5GojJCWIGqI/uGgpMgYNrDL27nmcZgn7Bmny7fcfnFthFPW8YYQ4NVwq7k1KK
 7jwG2ubKbPTXEWQAuiOSeSpgdHjfXCZkrBsXAG//QimoxLvPvCOGgWo2U9jBdBQLnPWOn
 FwXoPH6/xDl6adEpPxE+a29C3tbOtH1A5JV2DhVY/ajzWjpbl5U2mxtuak2MyM1zuBbpf
 gFx5xXvDeMzABMnQdpjxU3RmdC2tRSGtpMC2Xzgrlcbxax+NFpKGFRe2FGEXZMlv1gg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=gQSVF0Du; 
 arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com;
 envelope-from=paul.elder@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=gQSVF0Du
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE5EA807EB
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:30 +0000 (UTC)
Received: from neptunite.hamster-moth.ts.net (unknown
 [IPv6:2400:2411:160:2f00:2485:b713:3a55:e2db])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6648573;
 Mon,  5 Oct 2026 08:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1791183392;
 bh=pmWFOgPy/UsVgPkhlyG+i8DhsZc1ieHqjfNC2j0hUWs=;
 h=From:To:Cc:Subject:Date:From;
 b=gQSVF0DuU3qH+A/zmhfvfveDJgsEiQn4yZys5q/5HLzQUzrM3fGQQ1RHYgNWyhgCi
 qkCZtqYXelrkCZDknww8c8YdVJinrBr3HuhNoYAOz94MitVKvinOs3dxynp+tmE6DG
 XT2GumrFmdrUtWor2s7RKJxXPWXhtFicZp0VG5Qg=
From: Paul Elder <paul.elder@ideasonboard.com>
To: buildroot@buildroot.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 thomas.petazzoni@bootlin.com
Date: Mon,  5 Oct 2026 15:58:14 +0900
Message-ID: <20261005065818.2023521-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] package/kmsxx: Add support for pykms
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

This series adds support for pykms in kmsxx. This enables the python
bindings for kmsxx.

The first patch adds support for pykms as a separate build config
option, and the second patchs adds a couple utils to be built.

The patch in v1 updating the package to upstream has been merged
already, and the remaining patch has been split into to in v2 as
strictly they do different things. Dependencies have been fixed in v2.

Paul Elder (2):
  package/kmsxx: Add option for pykms
  package/kmsxx: Add kmsprint and kmstest to extra utils

 package/kmsxx/Config.in | 7 +++++++
 package/kmsxx/kmsxx.mk  | 9 +++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
