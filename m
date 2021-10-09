Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C37DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF6760FC3
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBF6760FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ACA24055A;
	Sat,  9 Oct 2021 00:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F__FDvPIHevw; Sat,  9 Oct 2021 00:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9301A4054C;
	Sat,  9 Oct 2021 00:25:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5591C1135
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D50260777
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbQ8AqcLJsIs for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 00:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32C59606A0
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 00:25:35 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id c33so7854414uae.9
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=upFA9k5PRB57wvu0SbVpYsFDZXltLed2Ri8s7/ZEtmE=;
 b=aNCCqpUpIqYFUn2fPCExy5Ft0hjTEKlqZOAkUJrtewcqYwMC2u/rKHdodiIDk4kfY7
 h/zjyBFlcacyA4p5/EOReBOq4Njl3cxpKzoEWh6aCzTqRRAOWNQxjtijhOPMjPDxNyp4
 E4NMidkGHWN++qozRLPLQ1TGzd1ifH2RhFxqWjqzrx4s2ek4ufAv3eH+HUubx5FLi/nm
 wl31L9W/UT0Spw1sxCYJqtVQNgrdvQzD8Xori8/1xjybwpzYdmwaQWXev5uF7VzGOiTm
 Qj9Aqkko7XVoqEmqbdmuv8FSjFK96iU1BpFSFCHF71wUxFwbUdnA86lzcgOppEDau3UU
 pEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=upFA9k5PRB57wvu0SbVpYsFDZXltLed2Ri8s7/ZEtmE=;
 b=PhAz+irSs8lb1BAAo4iEIqkVff7YXWyb+wPo7sJRdcLRGmfm1xcyeCv9/nDCt3cwgS
 7hJSovkCAoy84WXZQinC43Sm5ECZK2msTDZLu9hsM/RaMcxHMo/0y1/JyIvEYkcaY653
 tZpUvtEmTNT0rXXCWNpQn7LxQY3dPPiJEZJOvDsjTNC9oNfTvtygQ8YB3XOUMVZp47KP
 4UMeRxRoBLqXxYUPU468NC3lZr8Al5P+M86KegBHX5JgvNHQK9Jd2X9V4YafkOZFrw6L
 qhvMSQMjeZRK4FfNIDgfyo/O2r5A6lOQqosZVaNOR3RljGHclTdSiEv5FcoRLtDqZeGU
 91qg==
X-Gm-Message-State: AOAM531Yu7SWklsTisPrtjAWisIN5ayx4wbr65UXtN71aerruWLp301U
 n9qAdtj/gw5xIJELMeJxfHpKaoavYKxSag==
X-Google-Smtp-Source: ABdhPJwdftAilfBGJjExdvm4vOaeMaJfeUQ3u5Iqfm9l/yXC13fD0iIjPtDpSeOMLE2JOXu8zDAKvA==
X-Received: by 2002:ab0:538b:: with SMTP id k11mr6835232uaa.131.1633739133918; 
 Fri, 08 Oct 2021 17:25:33 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id a14sm112508uak.8.2021.10.08.17.25.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 17:25:33 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id w13so12372145vsa.2
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 17:25:33 -0700 (PDT)
X-Received: by 2002:a67:d111:: with SMTP id u17mr13782629vsi.37.1633739133367; 
 Fri, 08 Oct 2021 17:25:33 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 8 Oct 2021 17:25:22 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qiU9nxL0mGcgydhNh3AwRthRihaQA8usfMDZiUxc=KDQ@mail.gmail.com>
Message-ID: <CA+h8R2qiU9nxL0mGcgydhNh3AwRthRihaQA8usfMDZiUxc=KDQ@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] Patchwork submitter is wrong?
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I noticed that recently my submissions are being attributed to the
wrong submitter and my name has a 'via Buildroot" suffix.

Any ideas why?

New:

https://patchwork.ozlabs.org/project/buildroot/list/?submitter=82609

Correct: https://patchwork.ozlabs.org/project/buildroot/list/?submitter=66856&state=*

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
