Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269B0C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:12:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC27960E96
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC27960E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CFB14019A;
	Sun,  8 Aug 2021 19:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgJuZqKuOMu3; Sun,  8 Aug 2021 19:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B6FF4012D;
	Sun,  8 Aug 2021 19:12:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19BBD1BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B29A82C98
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQ3_BblJJROZ for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:12:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DD0C82C91
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:12:15 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id e19so25011493ejs.9
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=gE+4o4YTYxjqU/GGw/f/iKpkLa0jVDIItL9CadH8QV0=;
 b=iE+9cs7u1+pokNAdvKGWAUWnqjrVJO0dGjyF0JMTubjlKLz104mk1xhDVG1x+epK33
 j8KcM2wHOdOXRbqi44+GFTNxODBP16BEPIhxA6A8hYRe0pKpFbg0IYeuYzzKfXbDNLXY
 s/o8eu9aQZC/0ksPATjW61iQNY7Hc5vMW5/gXvL4Qxaa3XsuXs4MCa56v85uhwTgT+0P
 Jdl5VTNp1Jah50iDHEyfLJPr19wyGLTcY4bFsFXhi9gTqO08Exgcaf9cnw0NxgmYM9yl
 5ykMiAfL+/tqnRiybbAvvIhzRx3ZQx+57+KBrhtnKGbBaxQ11DVH3GcNQBAqC2fGdsS5
 tkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=gE+4o4YTYxjqU/GGw/f/iKpkLa0jVDIItL9CadH8QV0=;
 b=f6bqcmjSUIjMLm8FRR7zoXVnSpHWsus/Tm9epOEvEvuPfYHUDJsx4Eja5Fm1h+7eqy
 7m2GxC+q/3M+KExI4NUly08V40Uum5VrMj1Lyqaf+aPm0l12QG4FOACefXzIZWvHSMfJ
 DnBivAMOWT5P6Pqf9LyE2Ie/HXAZA7exmg78OFNDNkHxYCosV55DIp9CCj0ZQg2zQYaT
 NV1u0AdHtSCVPxgIdRutm5Bhh2ov1VseFQui2ZZDuShvLJ7HHoZt5T4FEM1OHk5vIuD6
 PPIBwbO7LeidGW1+kMB/AoCRP2OjY/57XTbrlhsX5796Wp6OuzNSgKfVSCx0j3PMn+Wf
 h0pA==
X-Gm-Message-State: AOAM533r8qGEj5i+GBEJHqV+h/oq2A3EUddeTjjdHpCIXMZ566WpDoXM
 keyBWWtYxulIsX2EkBKdiELqMW0XTHCRQg==
X-Google-Smtp-Source: ABdhPJyFQ25UgDQFDpaoP1UE1QbARZuxUNi8K8ncawjrqTh1edPh0JQNWmuKiZlqja4BecSgdNxung==
X-Received: by 2002:a17:906:16cb:: with SMTP id
 t11mr18825519ejd.16.1628449933554; 
 Sun, 08 Aug 2021 12:12:13 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id t15sm5201778ejf.119.2021.08.08.12.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:12:12 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoDT-0003NW-OH; Sun, 08 Aug 2021 21:12:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210804204358.1465897-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 21:12:11 +0200
In-Reply-To: <20210804204358.1465897-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 4 Aug 2021 22:43:58 +0200")
Message-ID: <8735rjbvjo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libqmi: add
 gobject-introspection optional dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gobject-introspection is an optional dependency (enabled by default)
 > since version 1.26.0 and
 > https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/2aa0badc79595c92981793d18f05c99485156a6b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
