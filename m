Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356DFC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C2060C51
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7C2060C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFBF403BF;
	Sat,  7 Aug 2021 18:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtZBKUaMtIHO; Sat,  7 Aug 2021 18:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1A0D40337;
	Sat,  7 Aug 2021 18:10:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1E81BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9985540330
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akEWpJup1akV for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:10:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CACA540204
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:10:53 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id x14so3133981edr.12
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 11:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=57b5FbVDhE/wHib9kGQvo/yHURAb2HW9irA8m+lcUb4=;
 b=j/h8dzsopMmjYZssnjd/tMHWatEKy3gDUCOp+N/fmMc+aiNFtiDuvvKKQ89rqXTkla
 x6klvd5uf35aogpjIbkC4IfHjc5Vn/Tb/Mq9seU72+6EVdvLZ5glJarrVpTBXxjyZTnh
 CFcwdXhlsoiV85STw8al0Pn5mzpLWlv8SBBw42lyt2SicajnZS3Xo6p0zwP1Y6NLKxio
 A65ffL7/Wjko5bMqHvcWFIgtm32lck851Nexb681PcbTlZB3YkFViSlPoFmF6YZ22xsd
 oisdCpdeq4oPHaIZSTpzV0Ltd5zjVP7Ual9ApCe/qv5QIWoDYb8/ekymOuFGIGpCzqKb
 5wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=57b5FbVDhE/wHib9kGQvo/yHURAb2HW9irA8m+lcUb4=;
 b=dYLr0UmHQ/SlqX0DxJsogGuZrmFHDIMqkAAIx31F9rk9xuY1ieO1idyCEnGk4WrK3B
 1et3ywfzjJFveGOtjb+mCrGEX9UaCkoyyk5LT3F0GPKvk4MCsUQ6FjzNXjDCxM66ck4H
 27besOd9BCvr9bZrObSS9tF+CvOWLWw9Tz8+zNuoj5E3JWpWsd9sAU+4FuM24Q/aWak7
 uFGHJyuj4vBzYxOJ7/6Qb0La1Y3nPNQK/FZ/MaBfBbiL/ZOCXZsE16NmILV/ktj9acyp
 1ZoyEpYfL7qpPa3YerYlRyNq0lZszHF82tGvuwVtGu2JBa1yx2vHCgS0PHWP47NQSSdn
 qEDA==
X-Gm-Message-State: AOAM532+4sdoVA1RNJNtxjkam4s6Hj/Qsv1qdp/FVNHREB+9mlcsscTy
 X9HbULaAsXWElOgXr4KgJilCM8ZZQ3a0ow==
X-Google-Smtp-Source: ABdhPJxhWViF3k+INA/QxYBrzLd7Lw+q2roevQlt+k3g88ThB1bYbKoPAhZyeSFHCgnolhvBFWAE3Q==
X-Received: by 2002:a05:6402:60b:: with SMTP id
 n11mr20776210edv.235.1628359851860; 
 Sat, 07 Aug 2021 11:10:51 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id da14sm2631325edb.89.2021.08.07.11.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 11:10:51 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQmY-0004dN-Ji; Sat, 07 Aug 2021 20:10:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801131659.3589489-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 20:10:50 +0200
In-Reply-To: <20210801131659.3589489-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 15:16:59 +0200")
Message-ID: <87pmupdt1x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 4.8.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - [High] OCSP verification issue when response is for a certificate with
 >   no relation to the chain in question BUT that response contains the
 >   NoCheck extension which effectively disables ALL verification of that
 >   one cert.
 > - [Low] OCSP request/response verification issue. In the case that the
 >   serial number in the OCSP request differs from the serial number in
 >   the OCSP response the error from the comparison was not resulting in a
 >   failed verification.
 > - [Low] CVE-2021-24116: Side-Channel cache look up vulnerability in
 >   base64 PEM decoding for versions of wolfSSL 4.5.0 and earlier.
 >   Versions 4.6.0 and up contain a fix and do not need to be updated for
 >   this report.

 > https://github.com/wolfSSL/wolfssl/blob/v4.8.1-stable/ChangeLog.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
