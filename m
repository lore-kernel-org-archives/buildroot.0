Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572B4C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 09:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE34A60E14;
	Thu,  1 Dec 2022 09:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE34A60E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SF-vaJrFdA3X; Thu,  1 Dec 2022 09:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0FB160D88;
	Thu,  1 Dec 2022 09:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0FB160D88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B21FD1BF844
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 09:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C79281FFA
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 09:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C79281FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uZiuVDRwitm for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 09:11:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7F981FF2
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A7F981FF2
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 09:11:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id td2so2668104ejc.5
 for <buildroot@buildroot.org>; Thu, 01 Dec 2022 01:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L+GXBFwD8UMg9QhPINQzMrwEVk2i1KshAbcsvJCKy70=;
 b=oUv3mtx8NocCiDUPh4cRT1s8yycBvxfh3MPrrl96QEZZpfdj9vpML1e08pz6yqtFI9
 Uhb1uH+58rGXgcSUqnwXEaCFGZDw74RcdXqORrRB47EMPeietvB9Ab79qVB9tRhr6WUX
 4WgHLx5LTVFebTueIiGfTvtjNe593Tb/FZH2r8sL6aXVIibzCQQbsooTcvHd2a+HkDJa
 seDXc5K4QVeE4rf2isVQRmS1GEDtQ2uBqcZHHsa5+iQNWga5C38PuI/lOxaDVh5alY84
 GQ6ljm2TxrgpT6c4iVogrTw3gMU+bZUnt3tRZLjaRiWD4OtR4EEccNIKo3+UYGY14Xn/
 nxEg==
X-Gm-Message-State: ANoB5pmTWUh68nwpq0AaKuQLgQsZ+uG+j0ZH0dRm0xTyEO8uS3UcGK4d
 q9Am9tpQ5z5MDfPErokYhHYK53GBjQLiOw==
X-Google-Smtp-Source: AA0mqf6rxv6AjnaPFnfpQ5KS4MO86SS0W+C70kGd/UbiDVr4TkzWdJy5QlgYrfd0urjadjkTW1o7Qg==
X-Received: by 2002:a17:906:ae99:b0:7c0:82d8:243a with SMTP id
 md25-20020a170906ae9900b007c082d8243amr11094591ejb.230.1669885916397; 
 Thu, 01 Dec 2022 01:11:56 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 v1-20020a50a441000000b0046b4e0fae75sm1522877edb.40.2022.12.01.01.11.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:11:55 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id fy37so2612258ejc.11
 for <buildroot@buildroot.org>; Thu, 01 Dec 2022 01:11:55 -0800 (PST)
X-Received: by 2002:a17:906:89a3:b0:78d:408a:4a18 with SMTP id
 gg35-20020a17090689a300b0078d408a4a18mr55676570ejc.261.1669885915210; Thu, 01
 Dec 2022 01:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20221130074444.829636-1-christian@paral.in>
 <877czbczvq.fsf@dell.be.48ers.dk>
In-Reply-To: <877czbczvq.fsf@dell.be.48ers.dk>
Date: Thu, 1 Dec 2022 01:11:43 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q0R9SRWGP=8JyEXXy1PR3ymPYXNXC=VM5xE+a7bgz8dg@mail.gmail.com>
Message-ID: <CA+h8R2q0R9SRWGP=8JyEXXy1PR3ymPYXNXC=VM5xE+a7bgz8dg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L+GXBFwD8UMg9QhPINQzMrwEVk2i1KshAbcsvJCKy70=;
 b=K8+70Bv0DBkDPW7AX625Hw1e++vFGrictxZWGQWrxOlrTxV5zBDDGtA9ylbaGomv0z
 FLIetXzgvmcTHpD2041P3LI1Heiryn328VLJycq8rjHDSB2G+R7rpAae1z7jar2yA4ja
 nCGdVilXdcsTbgGBSGMNCYA1cvEyxtPK6kPxi7MtHm/kekmxSEA/X1PBLdS7wyhiMdSp
 y5P5ifCnmwbWc2NtKepxFbOBetO6Raj5WDzTN3wDy2/vMu6UtYg8AKC8QaV3OLJ0rFns
 /eizL5azTEfeJsu3WjzDB7NXGp6HkLdNjZxlne+mi9nuUSFPNPbuvvb+r70VjZJkEJKX
 c7wQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=K8+70Bv0
Subject: Re: [Buildroot] [PATCH 1/2] package/balena-engine: bump to version
 20.10.21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Thu, Dec 1, 2022 at 12:05 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > https://github.com/balena-os/balena-engine/blob/v20.10.21/CHANGELOG.md
>
> Is this for 2022.11 or 2023.02? I don't right away see anything
> important?

https://github.com/balena-os/balena-engine/compare/v20.10.12...v20.10.22

173 commits and over 5k files changed.

Including an update to the systemd unit used in buildroot:

https://github.com/balena-os/balena-engine/pull/286

Best,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
