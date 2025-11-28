Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5395D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 18:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C658452B;
	Fri, 28 Nov 2025 18:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnroLQpoMGlc; Fri, 28 Nov 2025 18:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755CC845C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 755CC845C1;
	Fri, 28 Nov 2025 18:31:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8CF5708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADE394046B
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4vqnfAOYN3A for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 18:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EF2340426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF2340426
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EF2340426
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1693A4C7625;
 Fri, 28 Nov 2025 19:31:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58620)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vP3FX-0000000033n-2IOr;
 Fri, 28 Nov 2025 18:31:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:31:17 +0100
Message-ID: <20251128183119.3254445-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764354679;
 bh=GXbheWe+ObjlZn1OKwObgfipIswXeFRD5FPHrOrhspU=;
 h=From:To:Cc:Subject:Date:From;
 b=dKxfQ6CVMCXP2euR+8xFRoaYuya4XC5UCCBLWxRFBwzOND2wJkAzWMpLsAwyMySpC
 3oYLufFkswD0uqAFzyGsV79ZHCNl1cWg2uzXA6JqlJYaA9nOC/x8TqBI2Yc5Cr3w9E
 fchaVFpmi+irorcEjnWYPeZ/QLu8+5rigLH8m8nLlBYQMqbAlOuQw4uPpTamQZbz9V
 7Q/QdC+mqm0fuJ1SGdLzTOJjoDuTptJ/reaixxRAc116bZK3b7p9iMF0obyU1oxGey
 6fN3W0iSdH31wLechXryZIZ3I7bw3epYVcYlvNiJGsNTKo0QvtB+HSZzWuYHNP9P7K
 lPSorQ+xXMOnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=dKxfQ6CV
Subject: [Buildroot] [PATCH/next v2 0/2] package/icu: bump version to 78.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

v2 of the series to bump icu to 78.1 does not contain a bump for
xfsprogs anymore.

It turned out that not only the usage of blk_zone.capacity was added to
xfsprogs in version 6.15:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=48ccc2459039309cfbaf358febea53a86f07827c

which in turn was added to kernel 5.9:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=82394db7383d33641f3f565bd79792fb41b1741f

and causes the addition of BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 as
dependency but that bump would add new build errors related to O_TMPFILE
for some toolchains, solving them is beyond my scope.

To fix the current icu-related build error in xfsprogs I sent a
backported upstream patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20251128181401.3252582-1-bernd@kuhls.net/

Regards, Bernd


Bernd Kuhls (2):
  package/python-pyicu: bump version to 2.16
  package/icu: bump version to 78.1

 package/icu/icu.hash                   | 4 ++--
 package/icu/icu.mk                     | 4 ++--
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
