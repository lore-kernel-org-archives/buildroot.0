Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E3DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 01:52:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD14B613A9
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 01:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD14B613A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58B274256E;
	Thu, 30 Sep 2021 01:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVl9x_8aV024; Thu, 30 Sep 2021 01:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5554256B;
	Thu, 30 Sep 2021 01:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 696F11BF36E
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 01:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54632840D2
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 01:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gateworks-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwHBp4SHzyPy for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 01:52:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE7AB840D1
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 01:52:01 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so848181pjb.1
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 18:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=2jWbWoLUuhy+kgkPvPm2ZwlgHke3mnL3Y0HHWz8QYWI=;
 b=76jYwdXeeSuz6UC+Ig5mm1rlqCfPXvFV/nsms2FAdpqnnEonvvaIatg1ZPN/tCc2TQ
 NzD3LGB5+CdqnGMbiHDvaqvwupJ6aJiFISGqZwmKMjAU2xoW04kBviLzJJpZtkcXXff4
 Y0VuztRPTi7Gnw2lcVEbRKi+VgRgLL4I9SZhBixNLT6xcyMR5avde7o729o7U39HKBNh
 A00tPiCz7SDygrPmNeCUwfU/GA8WmOCvSO6ooNqKRKGwU0Y2F1qqxHGhHHDjxuN0ePt9
 whlcw0OVJtqNsbJhJeGKEIEJIKeE/U1+R2EsdlMbVuZMJQlUO3bB3mDFabOkSd2B/3Oy
 U5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2jWbWoLUuhy+kgkPvPm2ZwlgHke3mnL3Y0HHWz8QYWI=;
 b=m4jm8cs9MU2HTgcLSJr6snmskZCK570QZpKORU7Fu7EnXAVoHtM3PDDDI6NpV00jUf
 +QCA3FdusgIRrwGjWEPcyv9z/nE9VHU5awZMlpEfhVoe36gLHoQwrTmcHhAl9WvA+zCX
 tsFrjC0DPD+V21gLpMOnoG9a74IV15QjGMgiiNfUsMv/xllJ5txMnH+Xot/ravDQ4hZf
 iEXJQSZQo7agBnvs1DgJ1fN6Lx9Qht2LHWCilPjg6rWS5LREg4k5ODphEcSvEkbi9Q2P
 MHYXG19S3DrnbiNdVCOrggPeRR974FSHNMBFdbOhMvXu/g/Ho3Zxk7UNaj5YLxyxYfeE
 ALqg==
X-Gm-Message-State: AOAM532HOf0P+/5pr/EneUH5IL96VWG9PuvObNhQi/knI9IDdM8ecJC0
 wmKVhS90e1Oc7LQ12qIVuLwtZEEa9ccPV0qJldY5/1EgzuA=
X-Google-Smtp-Source: ABdhPJwIX99e4eepbVwdR/DF9Ofmc+xvr0O/qgJ9nP+WrHxfG88XGYuQI3YrKFUlcBnqfU60rDMRTp05M+QP3BOfGzo=
X-Received: by 2002:a17:90b:f98:: with SMTP id
 ft24mr3431613pjb.66.1632966720339; 
 Wed, 29 Sep 2021 18:52:00 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 29 Sep 2021 18:51:47 -0700
Message-ID: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] buildroot config for installing kernel and dtbs to
 rootfs?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Greetings,

I see the buildroot has the ability to build dtb's from the kernel
source (BR2_LINUX_KENREL_DTS*) but I haven't seen any configs that
instruct buildroot to copy the dtb's or kernel image to the root
filesystem.

Is there a config for this and if not what do people usually do for this?

Thanks,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
