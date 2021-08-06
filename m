Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1FAC4320E
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 19:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96ED2611F0
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 19:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96ED2611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BEAC400DD;
	Fri,  6 Aug 2021 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id remcHrbBUXsf; Fri,  6 Aug 2021 19:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54B1F40373;
	Fri,  6 Aug 2021 19:53:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7E41BF5AE
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 19:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F1E40373
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 19:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PSTMGeXzC4PW for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 19:53:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A2A4400DD
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 19:53:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id oz16so681681ejc.7
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 12:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=/riLv8ZCZvEe6ZegIgCrtHiQtVfkDGGiBwGAXTCrGxQ=;
 b=ReIg+iAJZ4rcNdrZVYho/BqPSyAPxQG/ba1FymK7BvL3Wf63QWrjlv4FVm8QokyecB
 UfEmTBK4s4WouXwHZRlm2drk2ZdDzghylKg9SHDvmdfoGduW1pwoeYQ/hJobp6nSwrV0
 U61KwP0Hu3C8ToVnO49VoY4aUXxCov7SPd40O061dZfa5DZQRq3mGnPhC4MWzijaw7qo
 Mlaf3T+bwoGnPDcJY9AUbwDr9DQSSsxBN5vomiIhFp9LfyRCBDgugu1RspO/Q/dQYd/t
 d3nHINugQOV5yFKcu62MPkz4olo3Aj3pPYc4py4M9p/QI1D38EYwMDIV/gyYYAO93HEl
 YKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=/riLv8ZCZvEe6ZegIgCrtHiQtVfkDGGiBwGAXTCrGxQ=;
 b=JDpxSq3EJkT8e3bvOHTrqzhbh/N+G1ISW/eM4N49q543WZijNdYoBkc9qOnZRCTxxc
 pkvmhyzOR2gWHFEaXCIHvjJWt6CTYwEapOaUmtnQ6DVUlQixRuD1cMq13ikhr+hXOIkt
 JpZU0BDvLvW+S6xMMBOzR2WkNZlmGhQRGvFSiHYLbL4XbtMEi8JOvpWRUeJ+6DblunZY
 7TeaNKvyPMEahKcuiWtG77038uI5t+KXb620VhT8otZcRaPvINVpCHVjJQpslFqrBm3N
 KMIOR6Lpd6d47kLRsZqucJU89Z8bnN78T2vM45u021fR+0oUKKZqzi1WRDH0yvESPGhY
 79wQ==
X-Gm-Message-State: AOAM533AZePLUCuadJ2IOF81nmJgBErmY085+o9pW1tkQavYfxaFQeAM
 s7D8Pf2Hf4ExxIuGV+CTPVo=
X-Google-Smtp-Source: ABdhPJzRFnSQla7H6CCxHupI75b/nW4jce4+4jpxKAVfGQD4f/HWf1P2qxxhBIgsDpa91VbJWcXJMA==
X-Received: by 2002:a17:906:6011:: with SMTP id
 o17mr11089964ejj.157.1628279621687; 
 Fri, 06 Aug 2021 12:53:41 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id g17sm3120966ejo.117.2021.08.06.12.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 12:53:41 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC5uV-0005tN-8k; Fri, 06 Aug 2021 21:53:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210726205727.1852026-1-fontaine.fabrice@gmail.com>
Date: Fri, 06 Aug 2021 21:53:34 +0200
In-Reply-To: <20210726205727.1852026-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Jul 2021 22:57:27 +0200")
Message-ID: <878s1eic3l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: security bump to
 version 1.18.4
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
Cc: =?utf-8?Q?Andr=C3=A9?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix a denial of service attack against the KDC encrypted challenge
 >   code [CVE-2021-36222].
 > - Fix a memory leak when gss_inquire_cred() is called without a
 >   credential handle.
 > - Update indentation in hash file (two spaces)
 > - Update hash of NOTICE (update in year:
 >   https://github.com/krb5/krb5/commit/9cbfdf65e1718849cb03844d65930e5138e88195)

 > https://web.mit.edu/kerberos/krb5-1.18/krb5-1.18.4.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
