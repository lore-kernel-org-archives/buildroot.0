Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD5BC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:10:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F52E61004
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F52E61004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5E6140337;
	Thu,  5 Aug 2021 11:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0htdjTF4-xo; Thu,  5 Aug 2021 11:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E510F40294;
	Thu,  5 Aug 2021 11:10:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAB151BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A2F583281
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svF6w_FriSrC for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:10:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC3DA82F6C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:10:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h14so5980699wrx.10
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 04:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=wXSSXtaWn0tMagWdU+ayzTUieZ4WfZF/A3JeRiGJwAE=;
 b=qvLXcmNa841kAeNRWrCVdK/xrx8rD7M4glllyR5H1wsKXMa2dEQd410HbxSZbaQfVx
 DJRChZbPmlVf41fIO1no4y/0USKFV5IausYsKBFCP5+XohqsGmFvP5RahZrVc1vSuMp7
 L+T9bzNVzQ1p/WQh45DXVeYWma93oMOaVmOxftaJcNbiMBxnXDF0DlYoorzwpp6VPubq
 CxOu+TzwD+R1uJuz8rsWgfL+emr/7U1++4Gc3CjoOczhgdt6keTYN/7m9XkCPkkf55L3
 AeGqrlslRvFZfZXXYZjv4t367aAyOaAmTS1rIlDPSC62DjhmYg1nBDfGNYXiYn5n2yus
 LMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=wXSSXtaWn0tMagWdU+ayzTUieZ4WfZF/A3JeRiGJwAE=;
 b=KIxFKfi2D1Evu6/93/NM5+al70vSU6sK3AAtaIEJo2/7TWix+Id7buSGpJn8zpZgYo
 fW7Qqo8UjKPXObPthhH8IPlE2Il7kdEnTT8UQM4F/ippFFtQcdvow5CzZE/hkHy0wb+E
 8CSt3h8foJj+8JgBR3c4hV5CD4XwTnWB94wpBc0ymXzgqw+yC4yeiMyMwSjsdWMnx6Ik
 x5ftLIzoucH1rWOeVR2WTwsWz8rDifeSCbk18IPBxNpDkxq1NylWj2cqvSKjSLYUaC5u
 aBMoS/I91yOy53b2fWHLF9aJZfCLJGUM0hFHQcIauQtDhquUfJER53jT+bCXw+plqnFu
 KfCg==
X-Gm-Message-State: AOAM532UpQPD+pVOziw7szzwYeKhevFCabGsv8m0x398+BlIUNwHW4hc
 fC6Fwm3jwXgazZNh3ohZqeQ=
X-Google-Smtp-Source: ABdhPJy79js6pWEVXfs+lnXW7vH/YoX7rpqWVQo4fsnXCA7dyYR6SJV6cC+U7yDrPbqo/RnUbaJgsg==
X-Received: by 2002:a05:6000:189:: with SMTP id
 p9mr4541223wrx.137.1628161808271; 
 Thu, 05 Aug 2021 04:10:08 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n11sm6886088wrs.81.2021.08.05.04.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:10:05 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBbGG-0000wI-Np; Thu, 05 Aug 2021 13:10:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20210608151840.20917-1-patrickdepinguin@gmail.com>
 <20210608151840.20917-2-patrickdepinguin@gmail.com>
Date: Thu, 05 Aug 2021 13:10:04 +0200
In-Reply-To: <20210608151840.20917-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 8 Jun 2021 17:18:37 +0200")
Message-ID: <87wnp0jgfn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv2 1/3] package/gdb: fix gdb 9.2 segfault
 with Python 3.9 support
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > When enabling Python 3 support in gdb 9.2, gdb segfaults at startup.

 > The issue is tracked back to following upstream gdb commit, present since
 > gdb 10.1.

 >     commit c47bae859a5af0d95224d90000df0e529f7c5aa0
 >     Author: Kevin Buettner <kevinb@redhat.com>
 >     Date:   Wed May 27 20:05:40 2020 -0700

 >         Fix Python3.9 related runtime problems
 >         [...]

 > Backport this commit to 9.2 in Buildroot.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
