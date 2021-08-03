Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DE4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:31:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD4C60F46
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECD4C60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF0E40518;
	Tue,  3 Aug 2021 14:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CN2MIQtri7Nz; Tue,  3 Aug 2021 14:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23F2140330;
	Tue,  3 Aug 2021 14:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3DBD1BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEFA8832DB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1CxkQMzkx7V for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:31:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D05183183
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:31:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h13so12084990wrp.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=1BYEwhi91h1mcvzQUQhaeemv4Pf5pMuLzASjCMk+Pn8=;
 b=Fd/m0Skc9nE3Fu8/hZkOLsaaxB2+hCTL8F4vtiZ5LQC7xzzYVrxkKTt7abCQqK/zAN
 V5H+gzY1/m2RNBlmuzz7dCEVkHi7xZbKtirqm7u05sIM7KcZThaQWkqwi78l6x7TcMbr
 mBPGUFT+VjVEhG9wZH4+UcqGVdvjbfJ2x4x1s6/UbDx7YFb0+aGtTfTgya+wfwCkvVVA
 41lkxnKn8E3WyFmgKPoaWNPzGHmWzfPOWKqle1SijDuDnTPjvD6mBHUQLKJu7UbWlNFj
 V13wP/0cMecy3fyNB5BBE9WINYdoXD5GCzd1EetxoHgrVhITDsI4ICQB0LzG4OrbFe3o
 s7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=1BYEwhi91h1mcvzQUQhaeemv4Pf5pMuLzASjCMk+Pn8=;
 b=TDH2CzM+VlA+45yVHlVkQBPqmMjOKoVlWi+l6NcPHM82HTW4wQ5xlV4eGH4/Or/UP/
 KCQrlHdm7/k//cRym8082sgl6aiGo3moZlRZfJQOU865qCEOwLpa6xJMeIANKUz/ObOK
 PfyS5XH9DN2k8/On0GR5141gh/k81oZP+pT78dy3XdAF2vmOjUbxF64OpD+XAUWC2KGf
 sCKJEVHsC4c5a6pxVE5eFdJFFkaFm51Nwj8y9DjuCAmgVMqKZfp6hSdiLA9vHbBXzHd2
 85tPcEgmwKs9+AyvaPz8FbJtS+3tYD2UFOzuiEz2I2hBcBh12Yx3LqnD36Wr2le8YPYB
 Fv5Q==
X-Gm-Message-State: AOAM533hb2SBB7ij0fE2xl81+Wgc/5/Tj64YJB1Di06BNQZuMzV6+jjj
 1px9MaUxeoHZS7L30B6fhrY=
X-Google-Smtp-Source: ABdhPJxUCt7zXq2wvheHQT5YpYbEOYeaWYIpULoIALJJ9aQYCIFweILiJxnYyR7DZl1tchqnDELZhg==
X-Received: by 2002:a5d:54c2:: with SMTP id x2mr24365628wrv.338.1628001059174; 
 Tue, 03 Aug 2021 07:30:59 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id i10sm2674895wmq.21.2021.08.03.07.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:30:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvRZ-00028f-6w; Tue, 03 Aug 2021 16:30:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210716220011.345184-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:30:57 +0200
In-Reply-To: <20210716220011.345184-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 00:00:11 +0200")
Message-ID: <87pmuuwqfy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tools: add
 TPM2_TOOLS_CPE_ID_VENDOR
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:tpm2-tools_project:tpm2-tools is a valid CPE identifier for
 > this package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atpm2-tools_project%3Atpm2-tools

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
