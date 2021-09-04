Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AA4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:58:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC1960F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BC1960F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A8B606EB;
	Sat,  4 Sep 2021 19:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tQJ29Xjk68c; Sat,  4 Sep 2021 19:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48E0860646;
	Sat,  4 Sep 2021 19:58:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2531BF31B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 740B160646
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCMoyzncFU_5 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 19:58:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 849E3605A0
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 19:58:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i21so5033390ejd.2
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=dhEZd4s9l+cskhvsnYnzL4vkAbMdwNXthxLP6QLPcFM=;
 b=HPI4F/c+RsuPTlSC/ceYAACmqXL/CxMd8XwSAEQgs3z7ftm0m0F9WD2zdJ6I/crBHv
 HIVWtB5glwCVHXIlQ5DT8Wn6Y2+Ev+MEqqsJMcLmrlR9w7NOi2tmXusdPr8gjkAWcZa8
 u9pj5RELkYEOlOSQXOE9j3LMp1x4uVKX6Zu7upxN70MoMi7WiPKBT42zf5uCwfSHP4eC
 8dHZUd54N0GQ6LkAynUS6Y2FHNa1RPsp7bPqXvj7D8dIDMZnlXOewfRibC11G8H2sM04
 SoBwTe0Pun6oXRjU3yPS8yR73Rm3AdVrwyLJlMPJoyRaWxod6R+Bcd7PuIrlCbbjFZGw
 HPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=dhEZd4s9l+cskhvsnYnzL4vkAbMdwNXthxLP6QLPcFM=;
 b=O6my0F5cWf3JitOKp1aEgfqh4oYRr1Vu1/1pWfFkzFF3HonQfToDt2yU3pWc8EBvXe
 uuVgjczUNfGesG0sGL7MmF95DNTL8vn+drboF0qsTi0tXhYHjYaXMlR9e4xqaigz4fKc
 +2SBrFypYvOScqwjJdSf1XXW/xmGDUqKfpAZmNGi0n1uBFZp4wDBrsJ56A37S2UMSVav
 hcgia363wME1HXqDokElz7FWUoYOUrbZqkFrq17Dr1ib9Z4niiXIVfpEybTqnryKzkTk
 RJru+I292l+KgOvUAHCi8gh/cEKhfOpnm2FzrtX95/OaK33G5qiLO/3RULPGbaSEJQOt
 LlYQ==
X-Gm-Message-State: AOAM531zqu531/c0Z1M2IPyBHMmaCsJevFtrqKZ4LTjqQdt9jEna1sFZ
 bRHhEbtv/wfUrxWMnDbp0CV8aUPt7nk=
X-Google-Smtp-Source: ABdhPJybTpXO6ey78kSB3YA+EOeB6sJZp9KssROvRkedp7DWza3wGL/o4s3guD6yVkrDV4Bq+Gav3Q==
X-Received: by 2002:a17:906:9911:: with SMTP id
 zl17mr5670164ejb.287.1630785512674; 
 Sat, 04 Sep 2021 12:58:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d19sm1449207ejj.122.2021.09.04.12.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 12:58:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMbo7-0003f1-Fo; Sat, 04 Sep 2021 21:58:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210807152847.225678-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 21:58:31 +0200
In-Reply-To: <20210807152847.225678-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Aug 2021 17:28:47 +0200")
Message-ID: <87bl58p0yg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bullet: fix musl build
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on musl raised since bump to version
 > 3.0.9 in commit 28b4947ed8f53c4edfbf8fef9304dc76480c01ca:

 > In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
 >                  from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
 >                  from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
 >                  from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
 > /tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
 > /tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
 >    97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
 >       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
