Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80158C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1751C60E97
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1751C60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12AFD404BC;
	Sun, 29 Aug 2021 02:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 366paZKkznUt; Sun, 29 Aug 2021 02:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E2A404BE;
	Sun, 29 Aug 2021 02:47:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 305AC1BF963
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2020682435
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VACDwQkFmHXt for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF99A81CA0
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:42 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id b200so14681246iof.13
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rL62lx9X1K5XZdNorMSWF/m6UD4C6uWx2MeSohgPFD0=;
 b=X0vV82HAqLTDiY3d1Genn0VCnkokEHoFefpeypxvwoinCnZyRtiwerGFsa6F2nVGfH
 wD9kpadHa3aUrMlzuTnxgDu/qy4iukRrIfQxmvsV+Sz35QFzvV+4RG/1uSv9juucrHM6
 MaCDpUHiyKwdFqlnhUIeV9JoU9MG6kUkCft7PTmp9tBiZM9vvH/DGFOUUENVcfV71dGm
 RmSWDQzv42o6l3bBAj4mkmFBlgQ8ii7k/+g9mU+DqfPTZswcdmLqrZBU+OcwKD48mhH3
 ft0TEOWpiTa+WSQae05ucMwJ7ZTJVyJ2GiVSc7NPqWQIWC4dktFbqG6K64hebmhR0jwY
 V47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rL62lx9X1K5XZdNorMSWF/m6UD4C6uWx2MeSohgPFD0=;
 b=o5dlga8bZNm+Be2r+FMJosbX3LcehqSRBEi1iPwoXamzFbxxWGVe4j2MrY1aupQ3GS
 183l2X2vs9V6lAVSWwS4HVMmswpc3OzOEJaKXlvqi1mnJDPRKHnbrzzK3nbXlRsK+y3/
 acmreCyY+sRJoz2YIlNRaBFOs5SeSVVv8EilKq0dSCiuZC34i8rhDs+GB46ads0lOYTp
 iExw0adzRn2KUxDNvTQT18PMR4frVLEqMQMtxNI2L4J2lIOB2wfmOqF6qsYilgB1gwuT
 HE0Mh80Mz+Q/v18tPrqnHP29ZvFHsdXX1/AsDPhxdfmXzbpTgI/aMR/w/G6k9yKtLFgD
 RFXA==
X-Gm-Message-State: AOAM5325wQYXAtGDCa5RtKhYO/I6Knt/TrBrhD07X9a/5pEIMVfAG3Rl
 O45rsSPK+RRHP5EIntwhdBNJ+BP+l18=
X-Google-Smtp-Source: ABdhPJzYS7aThughpWrB4HLoF42CgRxTFd1qdIKFWlP18Fq+uuPqALcy29RhwWCoJNTrVk0aBamCwQ==
X-Received: by 2002:a5d:8484:: with SMTP id t4mr12874532iom.126.1630205201592; 
 Sat, 28 Aug 2021 19:46:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:25 -0600
Message-Id: <20210829024632.682029-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/8] package/swupdate: let buildroot handle
 stripping
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

In buildroot, stripping for the target is configured and implemented
with the global `BR2_STRIP_strip` option that drive the stripping in
the target-finalize step.

So, we explicitly disable stripping at build time for swupdate.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 402aa0a91f..42008cddd7 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -22,7 +22,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
 # TARGET_CC is used for both.
-SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
+SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 
 # swupdate bundles its own version of mongoose (version 6.16)
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
