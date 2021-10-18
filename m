Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6562C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 16:18:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F48D61027
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F48D61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1A0840442;
	Mon, 18 Oct 2021 16:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtwIpiRhECVV; Mon, 18 Oct 2021 16:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECF724020C;
	Mon, 18 Oct 2021 16:18:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29C451BF293
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 16:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19231404EC
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 16:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6Oe5pOnLW1y for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 16:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2034B404D7
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 16:18:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o24so1824022wms.0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 09:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Meu/En0329s1sjy8kqHo4wi8udFPGMjYn3JFDvTHB0=;
 b=emxo3MSlAYffiBkrOz3sqMCb8jRxUrBGnk97xJuG3zdMfphJkid+0ref4pvmsppcEE
 lETGkpTuRMA388rP96PX9bjptXnScz6f9vQRyYoOzC6JM8IsOa6hl2aT5a51L6vucaNn
 IJQtamGrZmHrFUhdNYeGo9CQOaCfB7YOR2Z+ae4A+7USFg0bD/qqQfF52jPUkcBOTgog
 ketwGgJff8I+DCzMtTaSTagOPLAjVyTIznHO91NKLHo46zgxBW2u27+escGFqTI8J9lb
 crX3UhMNEQnPpfBqZhD+npZt51jRuzkVBMS3G3pzA3A1y2MGqnK88YLvKh5kjxTra631
 vnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Meu/En0329s1sjy8kqHo4wi8udFPGMjYn3JFDvTHB0=;
 b=uSChAMA8Y2RQb+ugY12cSy7iXxVGN99Z+Ob/cDdHmPyrJya898vG+9gxJXFN/oQKrC
 cUdUxM6IrzBHrknefzGdQ/KlhgLWGklmNHqicKpWYKo8C639CJMPvM2da2i3Ukg/DbeO
 j1vz5Kiel9Y9KE2FSSHsC/6blcXC0mggvoqsDFhXfCPx4k17ouoDinIcy0Ud/MBPzlTF
 gb3x2dAz213ASvSpx7h7vWE191vpR545jDDmB9Z6y8/d6+OIlk1Axc+ar0Ag3su5P680
 A0pMC/NqC3cSC9Ffo2a8wlyHALcKy4ixWqJwZx2ZiNx+jQzMK5MOOrOa2QGvm8Ns/Ebm
 DGcg==
X-Gm-Message-State: AOAM532AjANMzzqTpQi0V5jscDrtNxVZeMSC77Fdbt3KLDA3SQeWCWV7
 ZLqnGNx1nJOPjQGO8hxxetI6RFvATIM=
X-Google-Smtp-Source: ABdhPJxddXT6UuF3UiADXRL69DTvQz6L4k+t1xzH94PHDH1Cz0dfSEIoFXOmJ7HDAfd+1iQ9/o3mZg==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr45024953wmq.21.1634573880772; 
 Mon, 18 Oct 2021 09:18:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l6sm12965159wmg.10.2021.10.18.09.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:18:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 18:16:28 +0200
Message-Id: <20211018161628.1499728-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hiredis: security bump to version
 1.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-32765: Hiredis is a minimalistic C client library for the
Redis database. In affected versions Hiredis is vulnurable to integer
overflow if provided maliciously crafted or corrupted `RESP` `mult-bulk`
protocol data. When parsing `multi-bulk` (array-like) replies, hiredis
fails to check if `count * sizeof(redisReply*)` can be represented in
`SIZE_MAX`. If it can not, and the `calloc()` call doesn't itself make
this check, it would result in a short allocation and subsequent buffer
overflow.

https://github.com/redis/hiredis/blob/v1.0.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiredis/hiredis.hash | 2 +-
 package/hiredis/hiredis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index fc01d1f60d..a45cf68f99 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2a0b5fe5119ec973a0c1966bfc4bd7ed39dbce1cb6d749064af9121fe971936f  hiredis-1.0.0.tar.gz
+sha256  e0ab696e2f07deb4252dda45b703d09854e53b9703c7d52182ce5a22616c3819  hiredis-1.0.2.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index a166bcc23d..83f0268c2b 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HIREDIS_VERSION_MAJOR = 1.0
-HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
+HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).2
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
