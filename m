Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60D1CC6B34
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 07:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6033A60830;
	Thu, 15 Oct 2026 07:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfikQE1ZLgU9; Thu, 15 Oct 2026 07:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2CFF607E2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792050755;
	b=ASoZFJAGQw8nfyoDFBzwGexpYa9s8sGkcAkO1+6YuQYBDpVg0CEZZOvFk5J//pKnCUa8
	 ZVd3zgq7NCAzanmBWT8aPtefFLx2bxFceNvlNGlvGyWg2DyXu1PJLRn0q9fO2MZkG7tXR
	 Wl0LrHAtMy/setoks5P1s7qK6OJpSRZEH1vQlD2m8jHmoNiJAv1N48rEZWHn2CDZ3Cuwv
	 tyZ7FbhVN/6xyu3xXi5n8kG6KtuYBQvWvIrmUUPVArjWvBABtNNROyE8ctbZQ7O5YRHhY
	 XcTyi/d1cZx3srLhzmzhJuL/w8y79/gaqPIE29EE0uHXtR4uXkqJu2v9oichKEzUz/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792050755;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4tUAryrHjt7qetK1S5rbnJfPMG1ra3ZzOINH33EDmRo=;
	b=J1Z5o0Rsw7rOyv9UlyVD27kXc+GHj6SbjZ/1Ngea3KWQW4VGuu3OOFX8vCFl2DMEfAI1
	 5ctjzmQ4ZVbBgkRfwrLzLWTBFcp3JkW/rd3e8E0AeHuTm9Yenh3yH5g47NfU1o8c6enLO
	 92RlBfedqVzxbsm22wQ0ww4hP8t1t6nhTTqWpp7fwCNf6bl39i02DE2KymqSwf2LtXhdh
	 O/Bzj3M54Xp5eweG46GoDb4QppWzjqu0ihbIJIMaWe9DNXbLnlpSErazzIniJz1Qm+a+C
	 crvyTIDKlYT50HP1TnDFOtjp548n57ie5oo9KjG5s3slRb88M/9xl6XSoGB05KrMsHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792050755;
	bh=4tUAryrHjt7qetK1S5rbnJfPMG1ra3ZzOINH33EDmRo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ejkb9VlJqO1cFHV5JHIjSq3yJ6ZdDlVtBfGQpyRGwJ9J+equfVsJ2J8VaGO3mtVPE
	 pjngkRJescjhFYcBCzEi/F4I9s5jClUJezyw6qC0+Zo5Fsy7BDRsKEi8L6Fxcqg4+H
	 tpQQMh3tEPK87gAgIKe3TM6u9tKx/JX7Lsce3gU9U9lUpGSQ5kjLgms7YGuoT2V+b7
	 RsgLrlPe61wzi/h1uNbc4hCv8BvBY/+VO37zRcbD/N6z5/PZUEwNvJzUHHZHGHUWLD
	 mDYOTZxahfA2L1oWPBbAT6kDx8YfWdwsi0kKE7LgXpgEJry613vjwjAcNY2VeB1EAJ
	 9IlMsi0ek7ohQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2CFF607E2;
	Thu, 15 Oct 2026 07:52:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC6CB769
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA9C54009C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcTz6yjlal-U for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 07:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0D4624037B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792050754;
 b=V6f8MhOjhrCgFIUaEouip0XaPLkdgJpLRfSue/eGAuPncGV5nWfd3KMC10kGbY9EKsIa
 SIfonsSj8PYvYfM4QwA0uKDMKV+s7h1ajqw4IBDRBzdv+H2gBbJCQASJh/ZTbgMN1O1v0
 tfb9W64ACPj7koxtvYRrCT4vgJTdCyXFq92TOC5LwyFs48ttfKk0K2LriHw8UAVymGQLO
 hbhifUNS68/orbP/GbMv3rQrQ/Gc7Mc5HodhAIgIgOHczFzEPrmkXVBMWHD0HUzFcN5Yc
 BzXiT8MHpaizUhdHOd8xYxmEfYu7S7aPxClOyssDMyH/0hfmuTjyYQNEN3q8p7uxdRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792050754;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4wqDd431nYDrN3jGerlD3fhmvfPc67Vp+dBLAQ68IbQ=;
 b=ADR5KwXu991Bh/CvRwzRoCc8MsFm+xbmopKQgO5OLeeRLVRpKR2hTGK8dDV5R9gij4xj
 bTVHYHuHaDCryszXFlb34agYPNVf1BUFxrTCM+rziVCGbLUHbkK2AneEYR1ilYbSQ+Uqv
 UICwAts3LdnEucBUYzUly2p3xnWsAyC9FShB0RqTGRSZjPhcbP7riE1PSOFdq3aEm66Vw
 QMohPB4nkXSRtpP3TIDn9yhuozGVG8DKIjsBuzfJfawPrf9d72yPl/4We5w6RVHY/vLo/
 Rg6lz/dKq/ifx0TKCFaz2EdMRiGAUpVIsUnV7y9Y/tp57NjNnOtHWyNadeJe3BnSnYQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D4624037B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88C4095BD9; Thu, 15 Oct 2026 07:51:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 09:51:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db192575e0fc2c9e155477b1cbb6d6001d0b0a83
X-Git-Newrev: 751131d6cf210aa2c0d4622d4546f0970e137e0d
X-Patchwork-Hint: ignore
Message-Id: <20261015075113.88C4095BD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/sponsors.html: re-add Armadeus
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/751131d6cf210aa2c0d4622d4546f0970e137e0d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

They have sponsored again the Buildroot Association for 2026. Thanks a
lot Armadeus!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 955f18269a..5e27166b77 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -175,6 +175,23 @@
             </div>
           </div>
 	</div>
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="sponsor-title">
+		<a href="https://www.armadeus.com">
+		  <img class="img-responsive" src="images/armadeus-systems-logo.png"/>
+		</a>
+	      </div>
+	      <div class="sponsor-body">
+		<a href="https://www.armadeus.com">Armadeus</a> is
+		financially sponsoring
+		the <a href="/association.html">Buildroot
+		Association</a> in 2026.
+	      </div>
+	    </div>
+	  </div>
+	</div>
 	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
