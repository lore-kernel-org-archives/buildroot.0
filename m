Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566F5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 20:40:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7AED61106
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 20:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7AED61106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC3B402C9;
	Tue,  7 Sep 2021 20:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyNEs5GOoL1z; Tue,  7 Sep 2021 20:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C55402C6;
	Tue,  7 Sep 2021 20:40:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37231BF332
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 20:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B9680E16
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 20:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qj-2z1eUH5G2 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 20:40:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E281A80E04
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 20:40:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j13so15642836edv.13
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=J2peo485W8d5gOVCUtu3PkAT+Vf1DLgLmAczsD2UvTg=;
 b=RL8uyAadxukmFUCG+GMEx8oEFNOi7X5Aqrd4kn01DyUC2/PD2tSwNRGNS3O4JdAGBi
 Jl2gDLEouhHJk9SrTsXqX5o4s0Fgt49aMQ6X1INhXayo5QQyAkbJGwkg7duxf/eXw7Oh
 itWgboTdgEYMnCgbXJNRGEk8wkNV6DtVnGm247hqb+nx8KnLrVObHEP/zjz+wO5/SKPt
 EaiegxBUjVh9MGsf606gWsASa7srb41CtKZIEXnTWpbfn/G9VywbRRZ80tVyPIfzx2vp
 xh4QeJuzTkiB1uMP9JG+6Q2iYlwIKluzGPRnfwU7lMVIXC1P9UcYLLp+uiNwj3WHzcqq
 /FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=J2peo485W8d5gOVCUtu3PkAT+Vf1DLgLmAczsD2UvTg=;
 b=nlvJ8//XivQzUHoDeoSWAp4R+f+wQZRxr0n+uL7uUyHGYQrfgx+0YyQ6Uu2gidsPTJ
 Mp3l9CEfTpB9hltJCfdzcZnV8P7BIVykw9/OZYkCGwxyON94G/zOrkXVy/fjaAg6tNEA
 CKFhtYJOoHLgrg5GHeinpkhn1YThrB8CgUFwvqAcxckh9J/sW1phhj2BK2pwUu7PaeGS
 RnNdZ6g4uLuUCZVrDsBeEHpdTJHlQkivWaqi/wG2Acgv1q4zm7tWeCsRXy1HnC85JrT6
 kRTr6FLLLpmQoyN9u3RK5FeiIFuv5sEF8r+h3bELYORkhWkPgRyFBQzljw4GbmJyHI9+
 Wg9g==
X-Gm-Message-State: AOAM533BZhHbMnaaYACeDXKTRbQQcIq0XDnsDDb4oFGwQ8FUE/bPJBCA
 8bJPVI7Piz++2IY5E9XcTOMiQlmcx4w=
X-Google-Smtp-Source: ABdhPJzCddP5+Gv42bn6/ZlDeP0E0GcXFZUXFmvikfpo8VNMFLwjfAk3CixJYPJG44sP27+RIAGNnQ==
X-Received: by 2002:a05:6402:c9:: with SMTP id i9mr151839edu.76.1631047207245; 
 Tue, 07 Sep 2021 13:40:07 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id h8sm3938ejj.22.2021.09.07.13.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 13:40:06 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNhsz-00023d-Bo; Tue, 07 Sep 2021 22:40:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210828081330.559994-1-bernd.kuhls@t-online.de>
Date: Tue, 07 Sep 2021 22:40:05 +0200
In-Reply-To: <20210828081330.559994-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 28 Aug 2021 10:13:30 +0200")
Message-ID: <87y288ce6y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.0.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Quoting https://www.php.net/
 > "This is a security fix release."

 > Changelog: https://www.php.net/ChangeLog-8.php#8.0.10

 > CVE-ID were not mentioned in any of the fixed bugs.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

For 2021.02.x and 2021.05.x, I've instead bumped to 7.4.23.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
