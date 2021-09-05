Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E16AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 21:23:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0F060E52
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 21:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B0F060E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 228F2606F9;
	Sun,  5 Sep 2021 21:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPcWC0FmNh8x; Sun,  5 Sep 2021 21:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DDC605F0;
	Sun,  5 Sep 2021 21:23:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27FF81BF3FF
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17DB081947
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 21:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QwPN64vvFzQ for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 21:23:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A41281975
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 21:23:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b10so6860673wru.0
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6maUem9ZDA4Nw7DTGMbOJSTitkRDYxyglDiURiFpOXY=;
 b=K7YU3TNDjaquffsE0wbSLsWYVAW6s7aKpdrngJwvfBkWT52VZ/BQU3GtuFQgRfazEJ
 jH880ifs6MPRwK10GPjq+Tq/yZs1iAfpSa4dsyg1rhhN2bKDQfPVZKG5q5iEnNgU6u4v
 MqK/LOFVJ9X1EsVrQsZnohsSioKSaTHIE0PDPAqprp9570EPZSyWujIwFLI5ocxiSs+N
 LhxykjFxXh31OcQA3Xy2uLT9G0dQwImrbscMbCpCDrshJc3OwfF0lTydznsbVr951mjb
 UdKgQp2WJjFtSEENlBFzE5sC6WqMS5K9chP4/OO9i32tnPZB4ATjm2wWqc1HkRKRsLI3
 5NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6maUem9ZDA4Nw7DTGMbOJSTitkRDYxyglDiURiFpOXY=;
 b=bVLuQROQJcO6JPjMXAMxgROCEzb2fn61ddi7gYijlcf21uFnoMs+l6u4nVjfMOVcZR
 8RTV4TUSCHuA090O2SsLbnEUMD7do56TFZmEukImhcxjmb0DTh9uNdcOOwKbv+2nCmgy
 0Dc2WdE73RcWpL8UTvMaOF5plpC26JdFCm0PtTJOAZtoDFo01XZokj0luGb2JmroNiXh
 5XkK1QUO60jJrPvHAZsjad/+uvB2txDoXhv0pd+nWEAq5+m58bELCmbsqoKMbZV0AeBA
 mvCrAZBhnEfYfASaNZnb4q2eMHjJvrwLD7PIlpkk5KcqCN82ZQs4KtfjmyRrGEGTlBvx
 eJrA==
X-Gm-Message-State: AOAM532tlupq96Y0M38g5kWTkZhttnRVsk19S+a3zEFv64qPYccsyb+a
 POc0MnZEurSM062L8Emi5h9jzVWhnn3hJA==
X-Google-Smtp-Source: ABdhPJwAE2RsZCQx63xirrQSrqxQA5aaLeL0PjOPGy1AlnSLvPPUDtmzVxXDuLB2NgwZEBBt0Egqag==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr10000733wrn.66.1630877030125; 
 Sun, 05 Sep 2021 14:23:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id g3sm5361192wrh.94.2021.09.05.14.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 14:23:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 23:23:39 +0200
Message-Id: <20210905212339.1487248-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uhd: needs boost math
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Lots of uhd components (e.g. examples, USRP1, USRP2) needs boost math
(i.e. https://github.com/EttusResearch/uhd/search?q=boost%3A%3Amath)
resulting in build failures since commit
c577eac16eaae515973faf3013da197516bfd391

Fixes:
 - http://autobuild.buildroot.org/results/70f6db101c9d35cdd88da602a863ddf35706fd7d
 - http://autobuild.buildroot.org/results/5b28591b4c4a7ae4cc6d428c42d96db138ef3ee7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uhd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 0d68fda171..248e309dd5 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_UHD
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SERIALIZATION
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
