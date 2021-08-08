Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867B7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:57:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC8760FD8
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AC8760FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DACEA40214;
	Sun,  8 Aug 2021 07:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdAlQAffQWFE; Sun,  8 Aug 2021 07:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F3840186;
	Sun,  8 Aug 2021 07:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0196D1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3B7440186
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQ0WKehl00sP for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:57:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3D9040132
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:57:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qk33so23281101ejc.12
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 00:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bFCkgDvO204LdBBHO3DipDkDfmWVzsRELM/MPI5yBSY=;
 b=m7oY9g8l3v6VxmI00mfcdMXpCcY+FWv2V6PoZMaFm6ypyCtN962IRXoI04f5lQGl3Q
 7uJ0F4cL3ekPuPAEzJu6Ipo1Of4VAEVTwgOUAgJpLrDBC+Z03yluwu0ISkRRe551FovP
 iuIBjBjIxy4OXBoUjWGi7k6kpiL5HK+Yr1Uad8sFIhwdZrVwaxzGW8e041D5iPiR3XAW
 l6tKwEIeDEzDaJWyWpDewflVHcSg2EvWMsx1g0hr321ATHc53oA+NXNySVMHMk6lWvFS
 CMDBw0z1+CbIsw/+l/kyWbRMRbfRToHznRE3hn2OpaprtSg1ZVEAKIw7s59K6w+HiYLR
 LIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bFCkgDvO204LdBBHO3DipDkDfmWVzsRELM/MPI5yBSY=;
 b=lhBpGYR5TCZaw1m7wcMn9R0DQbOKFBbXnLxc/kcr1G+Dej7YqWQwi9eZurv0w1rDPo
 DwRe7MmRZN1F2jtlPjHgUA/1nylk2bROTB9Bk9eZwo3L85WnAVA/QPXbBHGNiEE4JVk+
 +Cv/eRL/72MGRZfCzRtImwYD5fNF7DcYd4nYRMbtcgqxu99wSy5QvGW2c4OWpCMpCX2e
 vhaUfedJnmFERZ4B9r97IUhluT/+100U4cAKlEIb96E7+8awQSEZGiOKxbx0Ku9WGww8
 7baDgzd0ggPfGsz5e3kh8VVDuFaOndM7SupvhkGmMLYZSB2g1ZEl30MLtuZlkdaopgto
 IReg==
X-Gm-Message-State: AOAM531lcG1a3/qss5fcpZMNKrTXekMD/aVCp2536z0rK1/z1wdab3PG
 iMP2JFsdEgIcznJYkbZ5thg=
X-Google-Smtp-Source: ABdhPJxDo3IxjDnHY/HsftFKFgXqFf1k2/SRimkONBRAyjBMg6xCHxTUEm634cR0CMV+Cx2Ysk7Tnw==
X-Received: by 2002:a17:906:5045:: with SMTP id
 e5mr17118500ejk.239.1628409465822; 
 Sun, 08 Aug 2021 00:57:45 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id y23sm4685537ejp.115.2021.08.08.00.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 00:57:45 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCdgm-0007OD-Bz; Sun, 08 Aug 2021 09:57:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20210726212334.B7EAE89049@busybox.osuosl.org>
 <874kc2ibaa.fsf@dell.be.48ers.dk> <87r1f5gelr.fsf@tarshish>
Date: Sun, 08 Aug 2021 09:57:44 +0200
In-Reply-To: <87r1f5gelr.fsf@tarshish> (Baruch Siach's message of "Sat, 07 Aug
 2021 23:54:40 +0300")
Message-ID: <87im0gcqrr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/htop: fix sources location
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Fri, Aug 06 2021, Peter Korsgaard wrote:
 >>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
 >> 
 >> > commit:
 >> > https://git.buildroot.net/buildroot/commit/?id=7332bc6eb092a18c506e614fc950c5b697ba1114
 >> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> > Change sources location from bintray to github since bintray doesn't
 >> > work anymore.
 >> > Use commit hash for version instead of git tag to avoid breaking
 >> > existing source caches.
 >> 
 >> > Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
 >> > Cc: Baruch Siach <baruch@tkos.co.il>
 >> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 >> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> 
 >> Committed to 2021.02.x and 2021.05.x, thanks.

 > Not in 2021.05.x as of commit c5adedbc52b5 ("package/irqbalance: use
 > pkg-config to find numa").

Ups, fixed now - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
