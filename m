Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F9FC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1D5408A6;
	Tue,  2 Aug 2022 13:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1D5408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1REaX-GqzrQX; Tue,  2 Aug 2022 13:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0688340863;
	Tue,  2 Aug 2022 13:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0688340863
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6EA81BF329
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B8B1408A6
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B8B1408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gak83wCjWhFa for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 13:30:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7D440761
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A7D440761
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 13:30:19 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id m10so10696109qvu.4
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 06:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCBpCxbGt7DnphMRtznCulpiAzZVaC/MRAZoGyOZbeA=;
 b=p+pugLc7qCz9xuNvyMOB0O0cb8jJsya1iv/B1MbQQDcfkgFftYF9DeG0rBBQ9Tuls+
 iTiXfXi1cXZHOvmaducGkEsLlI5XGTlSKWLY2qB682aZ+r396TdnvTaNv0dFpCbj8yjh
 n4unanbOl5dxxZcH2WamLqE9MpKdsC1FAGvalR3hy6G4WO5IZDDrglY88ZcSkLo3wouI
 zjSHq1/LMvFMpn3tN756WC/oyu4GUTPX2NW+m58jft9+3apjVybqpjax0AjUroy+buHq
 /WerFNEcfw/i+fGncLuZHP8LiAs/mpRLP6ikHYlZI+sW7nkprIPtjgV6EaQHrdtF56/Z
 ttlQ==
X-Gm-Message-State: ACgBeo1xp5fBx/0UwXvxYlq8oj1rdiy+FDLgb8z96TTqjy4IL+kmccgB
 cZUDjLWlriV2nb8DG6BRXcIDJCbZrfBVVw==
X-Google-Smtp-Source: AA6agR66oIyC/Kb4Phdxgw4bSjBHxqR9Y14bDYDo01HITkfD9Xp6EjjwTtVnodRqnngL4D9gCCGauw==
X-Received: by 2002:a05:6214:20a5:b0:474:6683:ed78 with SMTP id
 5-20020a05621420a500b004746683ed78mr17922137qvd.11.1659447018239; 
 Tue, 02 Aug 2022 06:30:18 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 t17-20020ac87611000000b003051f450049sm8894638qtq.8.2022.08.02.06.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:30:17 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 09:30:06 -0400
Message-Id: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCBpCxbGt7DnphMRtznCulpiAzZVaC/MRAZoGyOZbeA=;
 b=cHjJgdjJXiQiGdHfmGGlnL0a4wBqnyl6t13oID/tohbqw4LWGnkOSwPotzXuDVoyg5
 7KgIXppfnnDxjoVJz2O7prwJ9SWoXA5NV4WPvXPMVzDPBGO1RT0CbRe1I0FVHSOTgVas
 JKhNkCqeO1NVP+AhZ7cUXLeDWWrc7JQOgbYj97ktOslpPjQoIryX1B8/RKHJCFcUkuEQ
 LWJXjZpVsj5jsvAeMuScMXw5HzagWaqBhcu49Oa88SA95yqvN9nmiBiJnO7N17IChpZi
 mqij1AVbUfaT333R9SD7VfdmDretZGZkF2F21UUsrQonOU7166ntdGzmJw1FZ3g91JD8
 +QzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cHjJgdjJ
Subject: [Buildroot] [PATCH 0/2] Add support for FDPIC binaries on ARM
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series re-introduces support for the FDPIC binary format, which is
now usable on ARM.

The first patch reverts the removal of general FDPIC support, while the
second adds support for FDPIC specifically on ARM.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Ben Wolsieffer (2):
  Revert "arch: drop now useless support for FDPIC"
  arch/arm: add support for FDPIC

 arch/Config.in           | 15 +++++++++++++++
 package/Makefile.in      | 30 +++++++++++++++++++++---------
 package/uclibc/uclibc.mk |  8 ++++++++
 3 files changed, 44 insertions(+), 9 deletions(-)

-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
