Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574D4C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:25:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C0B60F43
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9C0B60F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A630E403C7;
	Thu,  5 Aug 2021 08:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCvvTKLxR6yn; Thu,  5 Aug 2021 08:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090D9403A2;
	Thu,  5 Aug 2021 08:25:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE8F1BF9CB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 024DE4022A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJ6FnNFp9CFS for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:25:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1420400AF
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:25:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n12so5396528wrr.2
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=T0AtHyBQ0M565ERsZeSKwmTq1GTKgAuiiqLLc3fAx1Q=;
 b=UjTffBKBMgIVjWmC+5B+Mz4x4xcY43Rz54Q9lyiBIESsV5d6R1+NW20apO1yuX31ZF
 HDlqfcO9srvK7wkWwujnM4RDJstXXTwtEO4HA4NArls3ficNnyKS8rRwvOBZE2GqpeoD
 r7uBIOChw27YQDc2OlHsiv7YLRgBUhJywyYyKG86PhwhJ5EzcKIP86SMdd4W91IDWden
 kKYv4vmNw1SfCBInzfQgHhyG0qU06zGkPnoMGwP7EmZyosnZRBMlbgFa5121j54QJ1In
 QJIAiO38OHPb2507RT1SIsvNANtp1lED2i+iAk9iPyRMXZOJYNetdEIveln23vMYiYl8
 TyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=T0AtHyBQ0M565ERsZeSKwmTq1GTKgAuiiqLLc3fAx1Q=;
 b=YsRxWcaZSx/HMmA+voxw4RSvWQbmZ0Nh9TKr96f7x81TC8eHX9Km9QURVjhHODxqeJ
 UzbNcPHMFofcLQW1tuUBGpQupbjnEqbO7/qLdOY8mgyL1w2gf9FeiQ5NlD3FpYVzXItO
 8f8M1k3kbfkbFHg0lek8QYvOLxj+2mrMA2m/Q7zBT4Js0HeIQli3YHbsgZzULf+0Sefa
 iX1P6Fq//qFXMyC3UFFEUdlqYiBD7w5oCxCoYQUs2E4Cw3p3tgpYKOammRYTqfYvmnKq
 1TGGxLqVsbT6K9lybRzdlhJgHzhF3zg6MxxbHoab/IpbNUJ59vZqObanSVMnfnJfgyku
 D0Fw==
X-Gm-Message-State: AOAM532v1COg1uixjWwt9nJVhrfXHEdvIkBNNNYyGrOOwZ6dZc2I1X8S
 GVsn+jYGzOVpnz3cp9zJK2Y=
X-Google-Smtp-Source: ABdhPJzE0Vl+QAObqfUV1eMY6iyUX0rd5ywTMJzTuRUSbDFRJEgF+aHC8yyzo/GTqKa3vTDv7ZhxXA==
X-Received: by 2002:adf:a188:: with SMTP id u8mr3762357wru.245.1628151925188; 
 Thu, 05 Aug 2021 01:25:25 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b13sm5098364wrf.86.2021.08.05.01.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:25:24 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBYgt-0006ce-Ot; Thu, 05 Aug 2021 10:25:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210730072323.3645837-1-fontaine.fabrice@gmail.com>
 <87im0kmht5.fsf@dell.be.48ers.dk>
Date: Thu, 05 Aug 2021 10:25:23 +0200
In-Reply-To: <87im0kmht5.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 05 Aug 2021 10:12:06 +0200")
Message-ID: <87bl6cmh70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with
 minidlna
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Fix build failure with minidlna raised since commit
 >> e3c31814adaa3e773c310cd97e28ffea9b980a10

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed to 2021.02.x and 2021.05.x, thanks.

Hmm, on a second thought, perhaps this is all too risky for the stable
branches. I've dropped this and the not-yet-pushed
minidlna/stunnel/openvpn additions.

Sorry about the noise.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
