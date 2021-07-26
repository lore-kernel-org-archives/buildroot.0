Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45073C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:36:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0630C6023B
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0630C6023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35C34032B;
	Mon, 26 Jul 2021 22:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyTbHa_3YUsq; Mon, 26 Jul 2021 22:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F0D440331;
	Mon, 26 Jul 2021 22:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A90641BF2FF
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 980B8402B9
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycADYfFoNgMi for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 22:35:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A3B4402AD
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 22:35:18 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.155.191])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 89BrmQHp3nxSq89BrmxN4k; Tue, 27 Jul 2021 00:35:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627338917; bh=PGpuujTfjHV4F0p3nSAfifD+OjpkHWbv8LWLanbCoxU=;
 h=From:To:Subject:Date:MIME-Version;
 b=KLvdxXrOJOxgAikOrgQ6m2XWPP3EUgRJlmXgwCqvkGj+n2Or1J1lrDbh0NccWx3cv
 H/BcYNBdLihle7WOPUbKId8vkUrDk5KOiVD+xfMmchh6dVGo0InlGfsW7stVn82Zwa
 YF+XyCOu7ha9IyBSsEYjelK5zDzbrgJh3hqAa0hMbVK9mBhVMFRrMI9WH2D3b9imWZ
 YlQjehzBTPxPHFX39+j9U5YaonieDJLatAvlfAm9yp3tSLoepBkqagonfGVDe1ZnFU
 dlDF9lIJxICLWHgBzZYwYbshXOmLH0zllHe4WRogxtoOn2e7BfG5k8UMzRikMBUTCQ
 gQgWW/p4P4PMA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 00:34:32 +0200
Message-Id: <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726235656.1df4ddeb@windsurf>
References: <20210726235656.1df4ddeb@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHVypNMhNXrOO9pTC1aqAGpVubaMEdaFAiRkc0fdjCEcZp7L5GD/4xcF4gWz/YjsebLNUZXXIm7pTHehprJFxshzmYPHNIHNYk60udZFd23XPZbVh9Gr
 KHzlhbl9aoKD/WUjer4b0pr7NHtLeSXBOohaoLfOMGclalq167kBbrqyyH9Nv91u+aziWSGlnHAyyUYxFC2KD/Gi1CahSklikYURBUXfbcrN54QcbGCOoGOR
 rU8A7hzYk48Vt60j4eAXpRq025/09928kSqjd4xtVftcg8+6D+BeyYJ/npYxBr4mS2LFbr4LZAhd5bYzY1fL2g4RS4R3vKpFyv5RnzFi2suH4rzNvkq+m96F
 GOuhjQWawLLTrDwwGeccuQOB36aSQbQ3JB88DDVfIrMUNHzZ/NAt+eL6OrCHnTdkzHEYraU1C6mkdRYDXte2mzGlOp+lifJvdVnBt8V7gXPcx78HUhe5QPfU
 LqDUB1h0UGMpo+cj
Subject: [Buildroot] [PATCH v2 0/3] Fix binutils bug 21464 and remove it
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Nosthoff <buildroot@heine.tech>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset fixes binutils bug 21464 and fixes libgeos and protobuf
packages build failure by introducing the gcc option flag -mcmodel.
This is done by adding upstreamed binutils and gcc patches.

Note:
this way buildroot toolchains can be considered bug binutils 21464 free
and the only other OpenRisc toolchain supported is the external Bootlin
one. So this patchset has to be considered valid once Bootlin updates its
OpenRisc by adding binutils and gcc patches that are added with patches in
this patchset.

V1->V2:
* squashed patches [6..9/9] into one resulting into
"toolchain: remove binutils bug 21464" where binutils bug gets removed all
around buildroot. Note that this patch has been sent as v2 alone but it
shouldn't have been since was part of this patchset and before it the
other 2 patches which add -mcmodel=large to libgeos and protobuf must be
applied.

Giulio Benetti (3):
  package/libgeos: fix build failure due to missing -mcmodel=large
  package/protobuf: fix build failure due to missing -mcmodel=large
  toolchain: remove binutils bug 21464

 package/libgeos/Config.in    | 4 +---
 package/libgeos/libgeos.mk   | 4 ++++
 package/postgis/Config.in    | 4 +---
 package/protobuf/Config.in   | 1 -
 package/protobuf/protobuf.mk | 4 ++++
 toolchain/Config.in          | 6 ------
 6 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
