Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E52C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 447E160B31;
	Thu, 22 Aug 2024 10:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvHXXwybGSTK; Thu, 22 Aug 2024 10:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC9260B36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC9260B36;
	Thu, 22 Aug 2024 10:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D93341BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C681340315
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hko22Az9FDHF for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71DA3402F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DA3402F8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71DA3402F8
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:27:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF360240005;
 Thu, 22 Aug 2024 10:27:06 +0000 (UTC)
Date: Thu, 22 Aug 2024 12:27:05 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20240822122705.1beadd88@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724322426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rMxVSl9uFU5ENBbUsfAPbqEd5Yn21g/75lVx8e82jmQ=;
 b=YkwwfkKnlgNkyG/4jPwQ4yYQ444DiMD0Tnx//3RetzLn4WSPU3N+AHNIJ0BYPcVAjJBRLG
 aohg4B43b/rzVH5272iqSncTAUtb+BqWawCo31ZQCH0EghirFl460PlVI/vWXPF2Gs+qRL
 oBqhGlaTMPEDTo17YqmSyFdGqrHXMDtzO44S3gdE99avSpwxIHKc24o0vVCF2o99DEEcK9
 8oyTIyKpdXAg64lrrx3iTdKuCan3llEtisZMzTSFfJoMP5CeGXpo9QfFANGkQ/iSTlaGUV
 8GqtOGo9bvkmMyWMJqGXV04yA+t5of+PVsGsfbm5E1Hiw0Rm1VyUBtXrTgfUOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YkwwfkKn
Subject: [Buildroot] Go/s390 Buildroot issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexander,

I am contacting you as you are taking care of most s390 related topics
in Buildroot, and you enabled Go support on s390 as part of commit
9eaab4e2c56eb154cf146f6658e28dd58bc11f2e 4 years ago.

We're having a build issue of package/tinifier on s390, with what
sounds like an architecture-specific issue:

  http://autobuild.buildroot.net/results/113/113492465107b3bdd1fe11e035902463a7f80717/build-end.log

Could you perhaps have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
