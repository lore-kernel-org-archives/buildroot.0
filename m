Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C2EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 23:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B110260B6A;
	Thu,  5 May 2022 23:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2sI3rwfZOyb; Thu,  5 May 2022 23:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E3560AD7;
	Thu,  5 May 2022 23:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9445D1BF2FC
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 23:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BC014094C
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 23:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gateworks-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0EYI41HHtCx for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 23:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 959C340935
 for <buildroot@buildroot.org>; Thu,  5 May 2022 23:17:13 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id g8so4843358pfh.5
 for <buildroot@buildroot.org>; Thu, 05 May 2022 16:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=s038UParzjaR/V2iuScSr3N9S8QvsFV/H4VVokPawkw=;
 b=HQa4eQlwCYUw6svXnG8Nr381XyjeiP/qir0m54Wg8sPlut7PrWtKpK/Nq4Ls/VHjyc
 4DOQJQ30VElbcw7RirNrXUKYSpT4IzVdMGhzS5w2niUgqjxhMeOkSObUaAfqlVsFwAU5
 xpEntzqUyFQUOOoicWqlT7UGeuOoTmlVcLg3zV015/MxVVjpPCjndePWNwu+x0ttONHy
 1bio19u/41ziboKMHfqsUif/ozVIGNOatpdNbuWQAq6jYSebZ24gL+2L8aaMY1zPAZM3
 jYuB6Ub4hb8xT9lz8yia4QSFJ+Qtgplhmo+nc6xDMKHKPzS3h7N+L7Zr7k+mdQDM5S1l
 vYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s038UParzjaR/V2iuScSr3N9S8QvsFV/H4VVokPawkw=;
 b=1BoYg7sTWyDAO/O8fIvHNMThWRe2zc6qcpNx5cckyM2GXaXkIfNwpnzM+RIadioaWy
 uPG/4+XI0GV/Yyop+za1M+komj5MEPKdqBtmLvlyhe/RYs45Ho6DbvTI87tgh7z1bimN
 36gPIe9PQ79SiYrONlkLHc4aSNH64F+jQPWeIROCpJSMs5OyHwwoRDntikUmfSLqwg6G
 lrK++xVTMp1qL4Gv0kure7Dy0q3jzl+GIRHWjjgisbQtIuIagJJOpYYzSqnM2QRrBw0d
 iCtEP7WFPIDO21dMaE6ckdp6iaj86snDmLlyht0bmr7iph2qhxbiK314jgwh0V2Ngv+W
 6hUQ==
X-Gm-Message-State: AOAM5305s/AVCQQlRjEQeyr6K7FpLlaM7/ILTqt/mPquSjNhUwS8IXle
 7Zvul7IipKaTMmppcwD79ZMcWkQuWF7Ki58VgMQ2IyKPqN8rAg==
X-Google-Smtp-Source: ABdhPJzoLp6aQZ3toPY5USeqX8BV5+8B53zAzNUdjRuwhHXhdpWB5AWRt2sdt2rrb3lCnqEj62q8Y7tHGuIxHxMbufI=
X-Received: by 2002:a63:653:0:b0:3c6:3a11:c1a9 with SMTP id
 80-20020a630653000000b003c63a11c1a9mr387707pgg.440.1651792632410; Thu, 05 May
 2022 16:17:12 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 5 May 2022 16:17:01 -0700
Message-ID: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] how to get buildroot to update a git repo that has
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Greetings,

I use buildroot to build a Linux kernel+ramdisk using:
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL=<gitrepo>
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=<gitbranch>

When the upstream branch changes I would like to build that kernel but
I find that buildroot caches the repo in dl/linux/.git and doesn't
seem to know how to check to see if there are new commits.

I realize that this is atypical as typically you want to configure
buildroot for a specific package gitsha/tag.

How would I go about getting buildroot to update the repo? I don't
particularly want to rm dl/linux I want to instead somehow check to
see if the repo needs a refresh then refresh it without a massive
network download.

Best Regards,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
