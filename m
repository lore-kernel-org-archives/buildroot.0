Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEE4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:37:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4525A60EC0
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4525A60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D72D94011B;
	Sat,  4 Sep 2021 09:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqJNHZ7gFTcG; Sat,  4 Sep 2021 09:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCEE9400BF;
	Sat,  4 Sep 2021 09:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 208211BF836
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17C6883F10
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQNx8EN5Lals for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 09:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E25CD83F0C
 for <buildroot@busybox.net>; Sat,  4 Sep 2021 09:37:41 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n27so2979800eja.5
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=odIDhLIbJmCJcl/gpTIqnG4E43cNBkFYnZRuaa28Gzw=;
 b=jaGGQlDUarpVqI/M1KskQks+T8p5vEh5VVlTDHDrNfd4pkZ/+oaDp6jTLuebQ8wXCY
 hCXdPQPZgh+YGnrkVHpM1ixumZo0p43cq5qTM/pGz/NDr89sIBDqPwIo7hhzJI+3ooR/
 UvX2V6lh1zUK1xOGVeRE00ja2yH1hXAb5QJhyvxt41XQHCBTMq893WOTNbZPyWmA7IC5
 7o96AV1Wajar1DOEj3C+c9SL0/ChyAG453498LUwnx7lDe7q+MooIdhIn/UxOgFGieWP
 degexY+UTLafrZmAzOjuEvBd4MX7jzlcE7JR6NnWxXz9xMfrKY7HdPnf7JH3Quu+ml7j
 /kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=odIDhLIbJmCJcl/gpTIqnG4E43cNBkFYnZRuaa28Gzw=;
 b=JcIf2Tb2crdnrymSibdra9P1BJqld7+hzArCnbzCronRQzUXp/9kGuK8rHf4wH4Y5X
 Cb31w6RPaMNU/iZOoi1kuosKaq9uV4BweUOpN+IJAhgHJygJJY/mTwNziB6pUTRzIrnr
 X2vBphQjrEtHgOqhhR4Rf5YJgWEKZhhi0q77Q3HZpNM3tNxJU52vnbQuD5U7oL9904tm
 Bha/qKoLuoljQt4yH1kzDjqwUOFv0tRY3symdtVcQ7S0U3k+EmN9xnCSQkpnSZ8hnoom
 IVE7lINLW1YDRg1AVdG14SpVLem8JXUwoCnFH2gOnuo0G8echUKTF0xvdXxRiCWSO9V2
 XcTA==
X-Gm-Message-State: AOAM5302vnPK40vU7T6470I7IpqxLstgrvt+lFKcrkWkDfXQQA0J6I/n
 xC6k/YdUBkEKtQikmGlgUjg=
X-Google-Smtp-Source: ABdhPJyg/bg+s93GwOJ445/q8Ok4oyZWzPa/5jMmcfsD+VezvcPuhTcRAZ03J1aj+D7xrl3EK1ftrg==
X-Received: by 2002:a17:907:100c:: with SMTP id
 ox12mr3417018ejb.102.1630748259768; 
 Sat, 04 Sep 2021 02:37:39 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 lu4sm792134ejb.103.2021.09.04.02.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 02:37:39 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMS7F-0004vY-KC; Sat, 04 Sep 2021 11:37:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nevo Hed <nhed+buildroot@starry.com>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
 <095867d2-b750-f9fb-0089-43ca736a891c@benettiengineering.com>
 <CABGDZCm57JZWuSfmma_zdVfvP=O9yiAo5SDe_uQPrmFk8N=gRA@mail.gmail.com>
Date: Sat, 04 Sep 2021 11:37:37 +0200
In-Reply-To: <CABGDZCm57JZWuSfmma_zdVfvP=O9yiAo5SDe_uQPrmFk8N=gRA@mail.gmail.com>
 (Nevo Hed's message of "Fri, 3 Sep 2021 15:38:56 -0400")
Message-ID: <878s0cr89q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] What's wrong with patchwork
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
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Nevo" == Nevo Hed <nhed+buildroot@starry.com> writes:

 > BTW each and every message coming from the mailing list over the past few
 > days seems to be flagged by gmai, even if the sender is within gmail.
 > Trying to guess what gmail is thinking might be an uphill battle but
 > wondering about that list change -
 > Does the mailing list change map to existing DKIM/SPF?

 > [image: image.png]

Hmm, odd. The mail delivery as such has not changed, only the DNS entry
for the lists.buildroot.org mailman web interface and the List-id
header.

I do notice that buildroot.org did not have the same SPF record as
busybox.net, perhaps that is it? I've fixed that now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
