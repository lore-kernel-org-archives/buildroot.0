Return-Path: <SRS0=WOAM=PR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43085C433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 18:54:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C59260FF2
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 18:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C59260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0FB606EF;
	Fri, 29 Oct 2021 18:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PsY4LQx7Tlb; Fri, 29 Oct 2021 18:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266416064B;
	Fri, 29 Oct 2021 18:54:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E02E1BF3DA
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 18:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CDAA6064B
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 18:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHGQ46VRQWAZ for <buildroot@lists.busybox.net>;
 Fri, 29 Oct 2021 18:54:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BF1260621
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 18:54:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s13so10717818wrb.3
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 11:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=JcEoc3gFg4uM3wS+wga7uAzpodpVXhyuiVe820oLJpU=;
 b=ZTPD/n4cD/uHmuTdsxNEh1hyfDMtPLPSTm46YajnDbXjVitTwQbpaRYYXp/IK+SnSj
 zt0PP4qfKUQVOJ7dQwYHu1iok9AX9KbnenrjlF5LNpRZpjvmOgG3Unn8ymeReP7jVH+w
 lkaLBir95nFK/EEEFgLLyPUn8Ds2l9jjqmzMp+JqMptph/l2AKtleD9HfoVJQijrIf4G
 i6h41qoJdB7/Yn4zmnM0aG0TZeyXIdsKdNsgo1ilkQzuklSGD/fNomvlQSiZIvVN3SgI
 LhFcga6pnvyHzwlxoOXuF40gj0pI+5wp2iNV8cOm4S6IKVIoS3lDy1ogFJr8WYeM+10G
 nJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=JcEoc3gFg4uM3wS+wga7uAzpodpVXhyuiVe820oLJpU=;
 b=SAdcNxeZvv7zA5RMVcQWPIzdNAHTl5EvvXfXYFoPObzVR3OnqI4oOQAvg9t5pH5QUW
 FR4ptOt+Fwx+5/6IpqBSyRQ/hJk8/BQPSQjg4gl8V15bAx8RbH93nZkBu1VZ46AklTFa
 GGiVNCy8uYautORWActDSy4Q9WChhl9RVoFYRRDNq9raWVJ4ylgMl8fs8WJuFxJGt9x4
 qPVi9xNv+rlhhno6tu8ufsOotmIgnzAS+Gz6ACte1SU+/p+7rihziORpqiIAFidZV95s
 3KxL4ywY2yTuQY43627d2DDLeMIzEPJDAlxPfo6JM4SXegp8vRpzJqYb1PCQD4CJp+rz
 gNpQ==
X-Gm-Message-State: AOAM531c6Qw7FKRK6qIGd+1IR6V8CnqH7RWCYGb0JB+I2yRMmdumaDh6
 yfrlSKUCJi+ITqCEHKx0rqY=
X-Google-Smtp-Source: ABdhPJxxOFLU02hjbyPazbFt3AGYAeSnfHKrj3qnqSZXJGks8X6qKhsBrMBNoFMkG779pWle5rRjbQ==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr3434450wrq.139.1635533681529; 
 Fri, 29 Oct 2021 11:54:41 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id a9sm2884287wrt.66.2021.10.29.11.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 11:54:41 -0700 (PDT)
Date: Fri, 29 Oct 2021 20:54:28 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>
Message-ID: <YXxDZA4TIRolot/b@pevik>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
 <20211011220025.7998-3-petr.vorel@gmail.com>
 <20211028145212.36dcb38a@camb691.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028145212.36dcb38a@camb691.localdomain>
Subject: Re: [Buildroot] [RFC PATCH 2/3] make: Drop `type -p ...' fallback
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Cyril,

> On Tue, 12 Oct 2021 00:00:24 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > `command -v' is good enough as it's POSIX.
> > For easier debugging previous problems removed separately.


> On doing some reading[1] I've discovered that this is a minefield.
> Having said that, I'm pretty sure what currently happens isn't
> good either.

> My only concern might be that theres old RHEL (its always RHEL ;))
> systems out there which could break. Some of my coleagues use old RHEL
> VMs for their build machines. I'm going to try and see if I can get
> access but I wouldn't hold up the patch waiting.
Thanks a lot for pointing this out. Which RHEL version do you mean?
Testing it would save me time to install CentOS (if you mean CentOS 6).

> I've given this patch applied with the previous one a test and is
> working fine on my system. I'm wondering if my tested by tag is
> appropriate for the previous patch since I haven't tested it in
> isolation.
Well, if this (i.e. second) patch works previous version should work as well.

> uname -a
> Linux 5.14.12-arch1-1 #1 SMP PREEMPT Wed, 13 Oct 2021 16:58:16
> +0000 x86_64 GNU/Linux

> make --version
> GNU Make 4.3
> Built for x86_64-pc-linux-gnu

> /bin/sh --version
> GNU bash, version 5.1.8(1)-release (x86_64-pc-linux-gnu)

I tested it on similar environment. Tested it also on older distros (Debian
buster (oldstable) and Cent0S 7.

> [1]
> https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then

> Tested-by: Cyril Bur <cyrilbur@gmail.com>
> Reviewed-by: Cyril Bur <cyrilbur@gmail.com>
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

<snip>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
