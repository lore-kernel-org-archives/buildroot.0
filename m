Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08818C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE4F6054F
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAE4F6054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA234049B;
	Mon,  6 Sep 2021 15:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZS22GeEFyzp; Mon,  6 Sep 2021 15:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BF240487;
	Mon,  6 Sep 2021 15:10:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AAC41BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7938380E20
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCTBiOdJQ2uk for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:10:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5687680DEE
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:10:25 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id i21so14115991ejd.2
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=9SvLD/VsGX30Ii1CFGtNzTRnY9fOTnWsLmzwURJnRKE=;
 b=IUPspwcIZ70W3ecFbKmszSizf/JQ0Ol8nMYwX/7j9nuCT8LwguO7M9x24eyuEWWiym
 OOjp2BdAQxUupucdFE0HtDLMeb7ugBWJsWDPL+jyvtEJ+u4Rtr5XeZC5LNQYvxYMVZoW
 sj4RvIMShEJe7J6dESVSh/++N4SM7wST63/UGTw06985Dpj1Ghvz6crKBqxAULaF+vqi
 h+xyBEifDC/04gKm0xcCbVvIXEuMOTWf6ms8/j89yq3fV6uKRCd0bxYH6nbxOhIjxFSl
 dOFDAftHUPUc7k6IpFZRmE3SagZjYkHFleKxlnfK/ar94BoK6fpxmB5vLHE1yOEjsFgz
 cjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=9SvLD/VsGX30Ii1CFGtNzTRnY9fOTnWsLmzwURJnRKE=;
 b=LrqVStnL05iwvnqzsphG8yReYhmubTNe7MgSuRBIRzC9dfz+/bFQsELbQ/J5ZWy3pZ
 n9LEtgA1Oszn4clDgAQ0WrxZJSvE4fThLYNrh6tqlpw6ImaiWAjaP4JqfyEeWUQcmc/E
 LWv5LV3P2VPfA6m/AHRyJnt0dRoPpXesTQWKLooxCfs7jV91EsO7Ny6RihS0EAiMuArV
 tqxL+jQyqy8nDgC6T8Vmmb6AjEwiDUpYjNuvCeED+zamvIueNlhX1AoSOS26WjtE0nU3
 FUlT7Lrrrwd+j3QNKmWYRHU3SIXFS/bK5c0U/Hy2TCan5EBAgiBaZyDSm6btwGFeuQi7
 trng==
X-Gm-Message-State: AOAM531AusTMnWDaQC+JNGS+y/1cP+NYl1gt81jL7ftqi2PSdryS1dWB
 9HAAAfhJzFvwce+JywFapZo=
X-Google-Smtp-Source: ABdhPJz+83sWTYKFvpNfjCpb91HxGlgpRPT39q2fMk+GTu4WQ6Un/VI6s0w7j1LR8dcEZbFMYNG1WQ==
X-Received: by 2002:a17:907:1c8d:: with SMTP id
 nb13mr14455095ejc.155.1630941023565; 
 Mon, 06 Sep 2021 08:10:23 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 u16sm4124447ejy.14.2021.09.06.08.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:10:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNGGM-0007Su-Db; Mon, 06 Sep 2021 17:10:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Matthew Weber via buildroot <buildroot@busybox.net>
References: <20210820124018.23297-1-matthew.weber@collins.com>
Date: Mon, 06 Sep 2021 17:10:22 +0200
In-Reply-To: <20210820124018.23297-1-matthew.weber@collins.com> (Matthew Weber
 via buildroot's message of "Fri, 20 Aug 2021 07:40:18 -0500")
Message-ID: <87r1e1ivtt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: fix powerpc64 PHDR
 seg err
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
Cc: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Matthew" == Matthew Weber via buildroot <buildroot@busybox.net> writes:

 > Upstream comment: "Let's introduce some fake PHDRs
 > to the linker script to get this working again."

 > Fixes:
 > (next) http://autobuild.buildroot.net/results/ae091dbcb155e63c208ce5adb289807cee83e28d/
 > (master) http://autobuild.buildroot.net/results/ef0/ef0b044802c54a697d8bffb28eba08cf9ce44f4c/
 > (2021.02.x) http://autobuild.buildroot.net/results/044/04495aa23ce51c48b9b850890453abded85dc477/
 > (2021.05.x) http://autobuild.buildroot.net/results/0fa/0fa94f1f930aa16cec3bc96e64bc57b460238a0a/

 > [Cherry-picked upstream]
 > 5126732d73aa75a0bc84f898042bfe35640624b8

 > Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
