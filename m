Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B20C25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 18:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7475081499;
	Mon, 23 Oct 2023 18:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7475081499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QcYDVe734EN; Mon, 23 Oct 2023 18:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4CC38148A;
	Mon, 23 Oct 2023 18:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4CC38148A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBED31BF2FF
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 18:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1B96404C4
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 18:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B96404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OECVJ4ow8R2W for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 18:49:52 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA4B240414
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 18:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA4B240414
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so993843566b.1
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 11:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698086990; x=1698691790;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkQC1PNOgA4yKTSRmcVtqA8oLA4nfSJyct60/ONHalM=;
 b=iUZ8Ed4ZCga+6XGUap5bB10AT5AObAW20fe27LjR4Nld4cOVA/nIm2bhsaHFEEdbjQ
 mlU7Fw5sd10TI3F68jO/2Vh1gj6nN4Htjjrb3qPOIRDyrUal2Z5iWBrvCk2b+4LOGWw3
 9fBz0HYN6f9doZp3qONNzNimYBF992iifVco6dd4IgEGkwGhZCx28MQInVyA5fCtKZ7c
 PMrlCKVgCJUXgTxvWL47Mk7MPkujNm68KwMzCjOlmUARVABbZCnResr7dtnpmYxX4oXz
 yhsYRGJ1w4QLiX/e6ej3HjZM8SnonOrb9tFSQVbfRFS4NoZhJ2Am6QDJwDOinDLEjOS8
 TMfw==
X-Gm-Message-State: AOJu0YxZ1+uUTVwr4iCcvm4U1Xv1I8ZSxsgvIfQs85gqU4nn5psaMM3W
 xIz7pqCE+vQSlkp1ysOh5vGBJQ==
X-Google-Smtp-Source: AGHT+IFiDtgUjEkZMASsg1zH7vv4XtTDzh0FBadX979qgHWwvuqQWG6peD/4DV7RgGr2EdVgEgDPRg==
X-Received: by 2002:a17:907:a08a:b0:9ae:5866:9745 with SMTP id
 hu10-20020a170907a08a00b009ae58669745mr9163857ejc.21.1698086989954; 
 Mon, 23 Oct 2023 11:49:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 xa22-20020a170907b9d600b0099bd1ce18fesm7106221ejc.10.2023.10.23.11.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 11:49:49 -0700 (PDT)
Message-ID: <5fcd7f5f-2c53-3fc2-b0a6-6e02f49b3097@mind.be>
Date: Mon, 23 Oct 2023 20:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Nicolas Formichella <stigpro@outlook.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <DB9P190MB1434D77AD228EDDE0C7C8D59CDD8A@DB9P190MB1434.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P190MB1434D77AD228EDDE0C7C8D59CDD8A@DB9P190MB1434.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1698086990; x=1698691790; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hkQC1PNOgA4yKTSRmcVtqA8oLA4nfSJyct60/ONHalM=;
 b=G24pgL6xkTPtFbHpDm10fKPYtk58px5OGkuATKgBn62vPa+osNjsNIfY9XAryMF8od
 VErPNm3HeIlb1dlYvGEW8jUF0x1ytn0MdOmBhvzF1urntvqzTzdmSAv86Ay43RjWt+ig
 fICybFc1EgT4y1zbrnO4WSCJM5eIh9CjbtS+smeG+yTdgYNkftNFN4NN6fxBXzZfGPJu
 BYXWNX0SvY9YFRTXrm+cTWz1I9OF6XlgK5j4CHxO21c7OOE1IWONb4tWAReyXjAk4GeI
 bM5+uuVigb8MuK8zOIHX0ZW+Dp16uNubq+bCUpm3KG+Kao0DpR8EX/4lx11yC6io2+5J
 +pXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G24pgL6x
Subject: Re: [Buildroot] make GTK Config bug
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/10/2023 19:22, Nicolas Formichella wrote:
> Hello,
> 
> I am sending this to report bugs (being unable to log in to Bugzilla) regarding the GTK config frontend
> 
> 1:
> 
> Unable to launch `make gconfig` even with the mentioned dependencies
> 
> If you run `make gconfig`, it fails every time with the following error[1], digging deeper (mainly with `make V=1 -d gconfig`[2]), it appears to be unable to create the `/output/build/buildroot-config/.tmp_gtkcheck` file required by the next make target
> 
> `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0` and `pkg-config --atleast-version=2.0.0 gtk+-2.0` both succeed, which should trigger the file creation (L1376[2]), but it doesn't
> 
> Creating the file manually works
> 
> Ran on openSUSE Tumbleweed 20231022 in a fully non-root configuration
> 
> [1]: https://paste.opensuse.org/pastes/98fb4a9abb60

  The first line is:

zsh:11: parse error near `echo'

zsh is not going to work. We do every effort to check for this:
- in Makefile:

SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
          else if [ -x /bin/bash ]; then echo /bin/bash; \
          else echo sh; fi; fi)

- in support/dependencies/dependencies.sh:

if   [ -n "${BASH}" ]; then :
elif [ -x /bin/bash ]; then :
elif [ -z "$( sh -c 'echo $BASH' )" ]; then
         echo
         echo "You must install 'bash' on your build machine"
         exit 1
fi


  I expect you have /bin/sh -> zsh, and dependencies.sh doesn't get run until 
_after_ *config is done. So we don't print a proper error.

  If you have any idea how this situation can be approved: patches are welcome!

  But to just solve this issue: install bash.

  Regards,
  Arnout

> [2]: https://paste.opensuse.org/pastes/8bdb46c5b940d
> 
> Regards,
> Nicolas FORMICHELLLA
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
