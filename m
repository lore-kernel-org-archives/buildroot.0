Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE05C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC93761100
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC93761100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 908D7823FF;
	Sat, 11 Sep 2021 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsqHJAu6Xfpe; Sat, 11 Sep 2021 21:05:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F93823EB;
	Sat, 11 Sep 2021 21:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF121BF2C0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 197004029A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6seq9tYOpsx for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 21:05:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AA5C40292
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 21:05:32 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id n24so6926299ion.10
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suVocqizP6zg6SLCL3RUkKzsYiCgp6jgF9fVE/J3QWY=;
 b=jf25JKkM6zdj629zgm8cQj5efyWUc/HDpR9smNlx+aE+F2nT8SEje59pAeQJ5q6Ux3
 E5KNGZRi57gDPWBderO1MsB6m3JNwh0Dy7/EP1b+9E3ESCt1f9Y7ltCJEwgRsYWce2e1
 VOSCIGK5S6jOOccf8ImWTMcEh7uzzbXWlta7anHTnWbZXaqxeZq3W/YGUGb8mdSidPdq
 QisM6wq9uszgEHI7798Ob7afQUdi75xXaa+cQSqUb9+TDkM3fZRmym452alIjH0Pd1QK
 CXZX1J56f5LYSFqIzT5BBnFk/dzAXAoWuIcb1ioIiuZlT8oa7PyVRoXLX5jT5WdnDhIB
 5gDA==
X-Gm-Message-State: AOAM533dW2PWyeP6L1EAOt7JjVaLSBm5hBUjO3G7EBd+mAMT7lKmoC+7
 1PR4dEpWxr5HJq4yJTz5QZAo9qfV/s9jp5WoOD9mtnEAZL1NIA==
X-Google-Smtp-Source: ABdhPJzuCCU7vMcenB8raHaHAYO2Ubb5YQEyJGuUzNSYKesT7P8527uSqROLx+TrD6ASen8+l+8DQH0kowp0Ti/5UcM=
X-Received: by 2002:a5e:a813:: with SMTP id c19mr3105783ioa.199.1631394331625; 
 Sat, 11 Sep 2021 14:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210904204025.15457-1-james.d.knight@live.com>
 <DM6PR08MB3993E4A5806B31ECEAEA154AA0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
 <27f80df3-0ef6-8151-7fec-4e88527bf835@mind.be>
In-Reply-To: <27f80df3-0ef6-8151-7fec-4e88527bf835@mind.be>
From: James Knight <james.d.knight@live.com>
Date: Sat, 11 Sep 2021 17:05:22 -0400
Message-ID: <CALAjcgWwEnu0ad7fjGU-j8yegLebg4CTGLo-atUm9f1_QX5x5Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 3/3] package/rpm: introduce rpm2archive
 option
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
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Arnout,

On Sat, Sep 11, 2021 at 4:33 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> Why would you
> not include rpm2archive? If it doesn't take a lot of additional space, there's
> really no need to make it an option.

There was not a specific reason for making this an option other than
providing developers more flexibility in their build process (maybe
shaving the (milli)seconds off a build and lazily avoiding the need to
manually exclude the option from a target, if someone does not want
said executable on a target).

I think the only main advantage from this patch is easily presenting
to a developer why "rpm2archive" may not be available, if they
need/want it.

I would have no problem with removing the option later, if it was
decided that it would be easier (for maintenance/etc.) to move back to
the automatically-build-it-if-libarchieve-is-available approach.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
