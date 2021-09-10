Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E845C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:27:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 946526109F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 946526109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66D5482E9C;
	Fri, 10 Sep 2021 14:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuPMmJalFfPM; Fri, 10 Sep 2021 14:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3EB782DDE;
	Fri, 10 Sep 2021 14:27:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9791BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D84082DDE
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dinHnwtCjYG for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8F6C82D45
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:27:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bq5so4413649lfb.9
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gvFtQfX8sdkhyDybiTA69bXQO/s5sopQ4pkB/mEbF48=;
 b=V3IMiyf0H2GeFjw4iLMs037IT+vpMOACMMzDUDyGXjCW0e9aNMtRaco4sA/+t7eahZ
 q2NOawyH/zl0OQZwEuA95oUvKyvDtH19tJEWh5+jL4zb2MdQD7pwBmVsSHVWv3W7OS/l
 IxC0FeVCp/QUcXlok/zZXNkzqAqfs9wqdV8LLoLnD+oe9tYMJHpzttZvXZ9xkT6YBmTv
 8GLIXKDfQG+yhiXAdsjI/TQ3W8jFfyWxnO2u+CS0MSWjZ+fORx5ooDpFqzjDxkIiV7mB
 UvVnJDQx0sxByZe3/Lh5hbBMWeFWON/WppTXam/Q95yior5c6MPq8GvENA2inky/wVpG
 CMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gvFtQfX8sdkhyDybiTA69bXQO/s5sopQ4pkB/mEbF48=;
 b=cEfK48yMn7rJt6rd7IGEjYihQylDJJ4EzMhYvoJpEPZr6dT+EbHHxEt8bfY/gT+RDk
 kCNvHSga6oLVjgU3uwWGmE2Es2Q8BsGg3JrGi7b8xwpQMwXeW6I3lmY4BQFsuUj1cwWP
 h05KLeKzpWG8GpfXMe/K3UFAEWmi5701qdKs3ThWEVHz4hESHxi0YFlsU6lMuq9kOIlV
 vJxeLzGGXwIXJUose57OyYb+glm0wZpRpNZGW8kU8dsaUdym1OTM5gN2qcz0GG5tIPjw
 nqMwVNmnq3WXCYdg8tS1qxzXqDO2z7x+xKJ+IhDkhc4dQO4O9QEtyjUArD6R7pikClhv
 Lirw==
X-Gm-Message-State: AOAM533izVg+41sSRe11sG5e3+xBFa0mpxIZvvnu5pKe8THji1NYpEDY
 w5nzSoleBkgY8gymuC5aSiIKxk92uz40iNv7xL4=
X-Google-Smtp-Source: ABdhPJxDkczcPJqTTq59bgmTJnXhHBnau/2qbuJFgZ/Lq4fqitoGk03F+kRSnuryqdvWvpvvAa+NHtcjeocHgJGbRBs=
X-Received: by 2002:a19:f701:: with SMTP id z1mr1405373lfe.457.1631284049835; 
 Fri, 10 Sep 2021 07:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-3-heiko.thiery@gmail.com>
In-Reply-To: <20210910140925.28138-3-heiko.thiery@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 10 Sep 2021 11:27:18 -0300
Message-ID: <CAOMZO5DZ8881bwgwKw5GwSWzgNPzVMh-oz6KLCLNw-Sb_TMELQ@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/uboot: copy ATF bl31 binary to
 uboot package dir
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Fri, Sep 10, 2021 at 11:10 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> If the U-Boot image is to be built with binman and the ATF binary is
> used, the file is expected in the toplevel directory.
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

This applies even if the image is built without binman:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
