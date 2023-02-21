Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D80EC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 13:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F9B82CCA;
	Tue, 21 Feb 2023 13:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F9B82CCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHb5oRIkOM35; Tue, 21 Feb 2023 13:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B74282C38;
	Tue, 21 Feb 2023 13:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B74282C38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 161541BF215
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4E9C82C8F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E9C82C8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhsnbiPQIm6X for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 13:36:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E9D82B94
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2E9D82B94
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 13:36:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j2so4277824wrh.9
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 05:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ieS1fMZRFWUFRVtLd35KozbnDXXMP5s5J4OMditAvs=;
 b=SbPpvHaHNyXA1n5qPj156C+WCFVAOoizvnOZOCBdatovPXq/pRu9s+PsrNpP4uqiND
 6AD1KznAZHpkHeCMDpPIkIG1SWdZv1nGkMnzcJ4eia6yUzjaWyBB5xwaiicGdwhsemuB
 32NB4aHo8cpxr0bbWjR+wLMwo3gI1ilFkWLI9ATNBSuWD4XbncS1Vb6X5rs4PkqcsYbY
 awOc/K3wGDj9Ovv1eBVV2Vzzg9Bj7WH852Cykx01qZwugwOLtmZJBC3XVybdSdQw4M8T
 mArY7y2h0I5iDR7iEy4OtS79jTHF3FoGKbqKn/AIiDevS+RMSvkpniaroYycVZV5j/gS
 BW2Q==
X-Gm-Message-State: AO0yUKV+qkbvHbefiDPk/z2ZU5/E3y0OC3jGlRI1uQHM/ieOJzJeROAZ
 +vF9UzKKqURScCrJZHQDlDNTpnjgewI=
X-Google-Smtp-Source: AK7set+Yx6G0JUWmvJ4Uo2J/wTaQWiFJitPQsv9f/HHw+BfzR6WBI/BmP94693zDdGjTWfAk1s8WvA==
X-Received: by 2002:a05:6000:cd:b0:2c6:e7f2:6e83 with SMTP id
 q13-20020a05600000cd00b002c6e7f26e83mr3400894wrx.42.1676986572757; 
 Tue, 21 Feb 2023 05:36:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003e87ca38443sm52027wmz.36.2023.02.21.05.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 05:36:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 14:36:08 +0100
Message-Id: <20230221133608.966158-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0ieS1fMZRFWUFRVtLd35KozbnDXXMP5s5J4OMditAvs=;
 b=mpnhoEqKNvl77zVN1qbUkenTngpBR5LCLzWVU/lP7pRlyEE973HtmLXI0iO6hU8ohJ
 D0mb3Dqkb4HSJiuTLSifUwDbxzoG79hxpEhFBFpPdwtVo8Cb+WqjJZILWQE8nSjMjZor
 P9UNWDb8HqTDe/qYaeMEOAvnQZ598Sa4K1MWR1d+3WbVYhqThpxPsVFs3daSmFt4PBir
 PUzTpj7rcspT48tFVCkeY4wtzdIbfBQ2R7W+Iyj05MVZ2vzvNsLK/0OTQ5Awsp6vJw+h
 7lYPphrlqiez0mC+S7/2AQgwtKlw2Ajo2nIHLfFI+OVkfAo0252hNR7WVatyo3jOyd60
 Dqvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mpnhoEqK
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require FileHandle perl package for ace
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

ace needs FileHandle module:

Can't locate FileHandle.pm in @INC (you may need to install the FileHandle module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl line 17.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl line 17.

Fixes:
 - http://autobuild.buildroot.org/results/9dee7c09fd7b41d276df0285a0f3dcae1a71f041

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a692856d31..078559f086 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -298,7 +298,7 @@ if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
     required_perl_modules="${required_perl_modules} JSON::PP"
 fi
 
-if grep -q ^BR2_TARGET_SYSLINUX=y $BR2_CONFIG ; then
+if grep -q -E '^BR2_(PACKAGE_ACE|TARGET_SYSLINUX)=y' $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules FileHandle"
 fi
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
