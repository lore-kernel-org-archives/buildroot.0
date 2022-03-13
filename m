Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE0CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 00:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F298660E8A;
	Sun, 13 Mar 2022 00:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFvAh3BDOZms; Sun, 13 Mar 2022 00:17:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1208560D87;
	Sun, 13 Mar 2022 00:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12E3A1BF969
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 00:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F79581C04
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 00:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSouyclCymgb for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 00:17:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B18081BF4
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 00:17:29 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id i18so6576291vkr.13
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=79BUHIdLavsmKJ5Uc2BZ8JqBFVp0mQNx3Ez+wQjYlVI=;
 b=gfeeOu0W9Z22qNpjpRaCExn9rsBCIJRcI/X4JkBuLUVUCYY3c17F+K2L3t7X7MjZ7o
 Otp9sndgQV3DjwtQ5JF3JGP3qHX0pyxddQRqzg7XoFAif0Nw0OSISBLXCTSgreUdYvxe
 oUpdAo7rl808PLnvq7JSOAt8gz3Hh0ssLvZf/owvqAn0jotpmgxg0wm2QPElexUnMKjG
 EB8ZVooKu/xFO0ynl2J2T21LsM4nrjwiXQ/n68MhZyX05RlKEKEgbX31rj1MYR52Oznf
 7HFq5l1dhmgnJPSYMB7yf5GY0Z9S7tpmLqUgtndoHt0Dwii0M3Vtxn8uBZDcLxHYuzmh
 Yj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79BUHIdLavsmKJ5Uc2BZ8JqBFVp0mQNx3Ez+wQjYlVI=;
 b=1+LBVnfzZIr+dvC96dxYtXYOTYUFUtIDzyicbNfaxds/NXlTA+81qQsoUOGFCe8uGy
 WYUyH7vu64Op+FCMyIpWvMFtOTE6POdkv6tVHJmuMeYUxtCTNsUZYpXds4TYib3BQzY2
 ah6OKHs+kDqim9dPiWyo/A8I+V1m+3HfFSWR4RXlLkRP2bjy/zS5jx2Rxf0rIRRu2+qf
 NjzTYb3g+zqUabiHWcK+8WG9fhx6InndNapBlSeSnskTLhi+0nLrrtiaTJz+76L0bZ+p
 nsOX70dfDgIfITgEKyl3EM4dhcvez6jagObhqIO7B9T9EvVJ7D7mH4uSyemo7t3yAKcU
 bjrw==
X-Gm-Message-State: AOAM533Fk94efWCOhGLbWZKE11yMiHq4jCGNqPcy6x9US/eF/5miYf5P
 W7W2mpguvIB6huHHP+hPHOIebQOJtwXSCg==
X-Google-Smtp-Source: ABdhPJwjyC5W3tyeu+0wPdZZYdyKsyx9Fi4s+TsfrP+Jl+YUxnj2R2bKPaiCWKmlpwtgfz4mq9mhHw==
X-Received: by 2002:a05:6122:1349:b0:337:a780:5d1d with SMTP id
 f9-20020a056122134900b00337a7805d1dmr7626763vkp.13.1647130647872; 
 Sat, 12 Mar 2022 16:17:27 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 g9-20020a67fac9000000b0031e6f70befdsm1707299vsq.12.2022.03.12.16.17.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 16:17:27 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id a186so13418912vsc.3
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:17:26 -0800 (PST)
X-Received: by 2002:a67:f7c1:0:b0:320:d6a4:b96c with SMTP id
 a1-20020a67f7c1000000b00320d6a4b96cmr6797859vsp.7.1647130646546; Sat, 12 Mar
 2022 16:17:26 -0800 (PST)
MIME-Version: 1.0
References: <CA+h8R2rU1EhsLTx38qHG0Q5BrNjBDi43D6rw+Rq3KA7dQAremg@mail.gmail.com>
 <105a4a50-cc20-9286-4121-96847904e5e6@mind.be>
In-Reply-To: <105a4a50-cc20-9286-4121-96847904e5e6@mind.be>
Date: Sat, 12 Mar 2022 16:17:15 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pXZCFbznB7xq2Hx3NYqrzWr7B=4__re-qyiggxsvO-Xw@mail.gmail.com>
Message-ID: <CA+h8R2pXZCFbznB7xq2Hx3NYqrzWr7B=4__re-qyiggxsvO-Xw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] sshd: fails with seccomp issue on arm
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
Cc: Christian Stewart <christian@paral.in>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

hi Arnout,

On Sat, Mar 12, 2022 at 8:07 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> On 12/03/2022 05:55, Christian Stewart via buildroot wrote:
> > I found this relevant issue & patch added to gentoo to fix this:
> >
> > https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1844602.html
> >
> > https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=9cbbc55aee6b2534bbc8d8fe12128c1083ee6850
> >
> > Shall we include this patch in Buildroot as well?
>
>   You mean [1] ?

This is currently the most recent commit on master, and was not
applied yet when I sent the email :)

> > I also ran into a build error with fzero-call-regs, there is a patch
> > to fix that too:
> >
> > https://github.com/gentoo/gentoo/blob/9cbbc55/net-misc/openssh/files/openssh-8.9_p1-fzero-call-used-regs.patch
>
>   As in [2]

Similarly this was applied very recently to master, I was using
2022.02 when sending this note.

So, yes, this is fixed now with those things merged.

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
