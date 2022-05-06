Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0102C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 17:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E08640546;
	Fri,  6 May 2022 17:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1OCalHN5OpsT; Fri,  6 May 2022 17:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 256E740535;
	Fri,  6 May 2022 17:40:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9EFD1BF42C
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 17:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A56DB83211
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 17:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gateworks-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIcPfb3VYqcd for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 17:40:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B828182925
 for <buildroot@buildroot.org>; Fri,  6 May 2022 17:40:03 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d25so6812982pfo.10
 for <buildroot@buildroot.org>; Fri, 06 May 2022 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IJJnW9olVmLWoDWn4voI+KswshfNshBwYGd8rEcDHPc=;
 b=DcnmlietLc/TcJK2+VexCop46yrLvnGYvPp2niZXhQmK6ilR9tc3TsvJmyL7PZmfg1
 rGy58Gv3XULnj/AJeYns14enhrL9xfzKyfkVk5daSChZUrsnQoyCTLLAcxXSYMvIkSO9
 iZ+cOfeeAVqdzunVjR/NoXx+AaUYBB4DEL7hq7illuUFqiHkVBZqbc0H8lXikTJoFcHq
 SOq3oWHWdDU0FwZDwuvL06U42gul2C/rz6dwq9/2wOal5ZUO/koKTmKuGYIHLhJ6WE0m
 2VF0O49zZ/lSmJI4PIvs3IRHdQfePc0jTDpUf8an9KgOaWcON5OahsKS+9Z8nU9Kh/Xj
 jUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IJJnW9olVmLWoDWn4voI+KswshfNshBwYGd8rEcDHPc=;
 b=7NfEX9Ytdp2b3GGesRQUK42ULHr8C2rWVqW2v977qYe2Pqf7SJtHO/JZeTXCvTTyRY
 GB32F9MtpAHZmtRf4c2Y/Hqg0f7LV7jhtV4LrMXj2pIN/2mazLr8gP6lm9xpUb3aTkOV
 J53g9YE7YstuXEUlCt7q3C0tpkmOj75gU22xBnx3MNpdTZDbZJyt46u8WKTFGocCYM99
 zcfzuWOtCl76PUlsxYc0OJGpOOeecvM8Mr5HjS8pZCghnVYeQK6LNXWOZNnoV8or8QBu
 s7fOu6EzKVgVaoAvTcinYo06pp3LTTloJ4TgBMNX4OocDNvrRi3IyBCpRQKB8Iytdzx0
 7gaw==
X-Gm-Message-State: AOAM531b+WTN2OR9YwDKa/9gxU+uVBqTbNqSpnA2//29NubXqyBVWCCi
 aoHnb1A3Q2LwigeB+aMcpQ72CxdZrHa56jSdtf9NEwoyGramFQ==
X-Google-Smtp-Source: ABdhPJy60C7vPDyXgAEAt/EsgPZ35DOCyGQbKfQ9R29LOxK2gsmJxCJY43Q0QtZJM9njzn6jwY3m1DZe28l+A66e5w8=
X-Received: by 2002:a63:194b:0:b0:3ab:71e5:161 with SMTP id
 11-20020a63194b000000b003ab71e50161mr3536286pgz.115.1651858803055; Fri, 06
 May 2022 10:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
 <878rrfibvx.fsf@tarshish>
In-Reply-To: <878rrfibvx.fsf@tarshish>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 6 May 2022 10:39:51 -0700
Message-ID: <CAJ+vNU3KHR+J0y9o3CVOC+1zA6G3=kQG2G_bQ2PSegFho8c9BA@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] how to get buildroot to update a git repo that has
 changes? (ie building HEAD vs a specific SHA)
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, May 5, 2022 at 8:21 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Tim,
>
> On Thu, May 05 2022, Tim Harvey wrote:
> > Greetings,
> >
> > I use buildroot to build a Linux kernel+ramdisk using:
> > BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > BR2_LINUX_KERNEL_CUSTOM_REPO_URL=<gitrepo>
> > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=<gitbranch>
> >
> > When the upstream branch changes I would like to build that kernel but
> > I find that buildroot caches the repo in dl/linux/.git and doesn't
> > seem to know how to check to see if there are new commits.
> >
> > I realize that this is atypical as typically you want to configure
> > buildroot for a specific package gitsha/tag.
> >
> > How would I go about getting buildroot to update the repo? I don't
> > particularly want to rm dl/linux I want to instead somehow check to
> > see if the repo needs a refresh then refresh it without a massive
> > network download.
>
> Using a branch name for _VERSION is not supported. See the rationale in
> the manual section 18.6.2, note on LIBFOO_VERSION description.
>
>   https://buildroot.org/downloads/manual/manual.html
>
> You might want to consider using OVERRIDE_SRCDIR to make Buildroot build
> your local kernel source tree. See section 8.14.6 in the manual.
>
> Hope this helps,
> baruch

Baruch,

Thanks for the references. I do understand that it is not supported. I
guess I was looking for a few simple lines of shell that would tell me
if the cached repo was out of date so that I could remove it.
# get branch from BR2 config
KERNEL_BRANCH=$(grep BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION .config |
cut -d= -f2 | tr -d \")
# get the HEAD commit from the BR2 cache
KERNEL_HEAD=$(git -C dl/linux/git/ rev-parse $KERNEL_BRANCH)
^^^ but I'm not sure how to check to see what the latest revision is
on the remote branch?

I will look at switching to OVERRIDE_SRCDIR instead.

Best Regards,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
