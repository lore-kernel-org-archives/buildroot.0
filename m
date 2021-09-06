Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF96CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:37:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC8460E52
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DC8460E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E8D60800;
	Mon,  6 Sep 2021 15:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpwlVDqudRoM; Mon,  6 Sep 2021 15:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85F060705;
	Mon,  6 Sep 2021 15:36:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF511BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B24D60705
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIR-zEFXrtvl for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:36:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72A0560618
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:36:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id e21so14160943ejz.12
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 08:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=fi6HhADqv0aG+qDDEfl5aASK6c+fsh68PZwidgGGKL8=;
 b=VQQI4Du2imCikQSDhBzOJ88f67SwLdtisWRD0kL5PuzDffx/bBlN1bnTbh/a9RJ+Jm
 w0Tx8Nvl3XbuHHU8lQGbVrM4nSY9MQGXa7i5ElBAChIv3x/kXlbiZJbHHKvXiuLFKFJv
 7j6msDZhLqAXxt9T2dQysyR+jGc+3g4ZDeFGKq0+cTOBjhq/GRVwUg7IaH16/en/iJyS
 JoqWuaSxBuK84ApGUo82NEWlcZMBA4UAtk2ch0UxTh4Q1b08NAIZulan/R0qjgAySu2v
 POHIti17I4WitrAACNEvNFcUIZSFULxBCsJgIeu1+R+QrwX/yvv9/Amt9iZVYEYpmhHn
 VH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=fi6HhADqv0aG+qDDEfl5aASK6c+fsh68PZwidgGGKL8=;
 b=ShFSjgzwzIquRddk4vLdI28Q2MIaj67QqqDBMgBiYPvlobEtvosTJV5lLTPanno9bK
 QxGX1BGd2aWnLbqWcuz5LYRmH3unai07gP8I5PHO+kwLWlhQfkHC6t1CW3wVfESkqEiS
 4bAzJyNr+V7AZsusra/HXyteDPJNdLj2Z6/hOkH+tX4JJow7EOhZvQL7rEWBxXf0TROe
 N1d4947B74b9xlVZi/bL/BsjsAzaisPwcTEXZrDW3edJBks0obHwSuVVTx/pnEjfJVBH
 WUeksphveR1U+E8OUGRjrVY4j3JZsQxu4iq7niDQTPZICyBzqoTz9Jbtzu9AsqTjS0r5
 J0eg==
X-Gm-Message-State: AOAM532XtKR6E6gqDYodVxgAB/alFKMBJJSCkpzHh7p8NoHU424Akzv6
 S6WE3akQOyib7E7V0/4uDR4=
X-Google-Smtp-Source: ABdhPJwSlliTXSy3Db1gXmT2ZEkymFnF1wYU1o65bJ/ccV20E8LAfdacYKMQSh6h/kUfVSYPKRdPRA==
X-Received: by 2002:a17:906:4892:: with SMTP id
 v18mr13831830ejq.541.1630942614661; 
 Mon, 06 Sep 2021 08:36:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 rp25sm4139174ejb.13.2021.09.06.08.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:36:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNGg0-0008CQ-VJ; Mon, 06 Sep 2021 17:36:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20210820225341.1131147-1-romain.naour@gmail.com>
Date: Mon, 06 Sep 2021 17:36:52 +0200
In-Reply-To: <20210820225341.1131147-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 21 Aug 2021 00:53:41 +0200")
Message-ID: <87mtopiuln.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Config.in: disable Fortify Source for
 microblaze
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported by Toolchain-builder project [1], the system doesn't
 > boot when Fortify Source is enabled for glibc based toolchain
 > (the init process hang).

 > Also, hardening features may not be wanted or possible for such
 > slow soft-core cpus [2].

 > [1] https://gitlab.com/bootlin/toolchains-builder/-/jobs/1467624500
 > [2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
