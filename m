Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E2EC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72FF640D60;
	Sun, 10 Aug 2025 16:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8n0z5Blp8ZYn; Sun, 10 Aug 2025 16:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D1C740ABE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1C740ABE;
	Sun, 10 Aug 2025 16:30:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4714F138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3962881493
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRB6A115X6sn for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A1C780CB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A1C780CB9
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A1C780CB9
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:37 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 5DAEBE001BE;
 Sun, 10 Aug 2025 18:30:33 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Florian Larysch <fl@n621.de>
Date: Sun, 10 Aug 2025 18:30:25 +0200
Message-ID: <20250810163029.19877-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1754843433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ky/Rij2+y0T0n2R2GI+eMExROtq+6F/SmygvGiEnJlo=;
 b=xXP1SOgDiqFzZl1/6nQgu6eP5S+Vk5DIYrxwl+MsTG2+0DFnEcVxNl55sZuLLCTKRtY4df
 vOHvC9yh7Y8YadrqB89JYLizvbu1uV5j9SZH+ga/1D39QikASnCZ8kFCK0meZQiBIbi8Am
 2Z2CFuKi7ryMh1D0Jnc6gPJ2UhUIOPo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=xXP1SOgD
Subject: [Buildroot] [PATCH v2 0/2] fix build issues with modern GCC versions
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

This is a new version of [1] that splits up the GCC 14 and GCC 15
changes as discussed there. I was under the mistaken impression that I
had seen autobuild failures with GCC 15 but that must just have been on
my machine (outside of Buildroot).

Nonetheless, I think it makes sense to also fix the GCC 15 issue now
too.

The version I've submitted to upstream is the combination of both of
them, but I strongly expect that either both or none will get applied -
the project seems to be pretty much abandoned.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20250810150509.13653-1-fl@n621.de/

Florian Larysch (2):
  package/nanocom: fix build with GCC 14
  package/nanocom: fix build with GCC 15

 .../nanocom/0002-fix-build-with-gcc-14.patch  | 19 +++++++++++++++++++
 .../nanocom/0003-fix-build-with-gcc-15.patch  | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 package/nanocom/0002-fix-build-with-gcc-14.patch
 create mode 100644 package/nanocom/0003-fix-build-with-gcc-15.patch

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
