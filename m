Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32B4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:33:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3594C60F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3594C60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D07402BA;
	Sun, 26 Sep 2021 21:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQz8HUmjlKw7; Sun, 26 Sep 2021 21:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFB340312;
	Sun, 26 Sep 2021 21:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93A8C1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DD6D40312
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEAaIgzLvxPJ for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F690402BA
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:32:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b26so12284134edt.0
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7+Pk9GDPX4VNqJsExYQ9TrALn1UIWt+tFCuPGDVA+lM=;
 b=DVr8Em9vZMw/JV2AxiKwn/Q/ynihUtv2PJ3dRcblp0C6p12sDAsSkVjD5aVbYuPq5w
 tXigbeYroEWFuGYfRZgNqRm5Kqbcw5SB5Lb7tsbC8ZXDyg+M+/9x0+/IzBv+bujKU87a
 WOWLziuhRE/hptqht2CEt4nbM/GdPXtMjTodvFH/jRIesZA9krfq2xvLyVqePHvqKK5B
 2KMCf/0UYuekYSbewkGst7UO0RpIbBn/1zdjlveebCOTJi8OpHbodMOvwDUe1efxmjNQ
 M7D7XoOP1WCKwppy/vqcCWIMaClmldaUwsqt7hrIUnIaOsx7j5jpFHEl6Y/2Ee0tRDw2
 KsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7+Pk9GDPX4VNqJsExYQ9TrALn1UIWt+tFCuPGDVA+lM=;
 b=SYHDWwyaisyLMfpiA55bD24zNvnpCU4CksS7ENtDNJJMqogBxAJC0xBAxvxty8sXej
 VY0Ii9HKVYY5acrrgjmgdSQwY6ZXhm038+Nzj5XW1Ny4nQaenlRIi5B50EQszdiq/3GY
 Bh1jO0oYGUB2OvZX0Tk0pL5kYm0sFE7r0zP2DZucHEAPZ4HtuRbKhnruSzvA+M1sCfW1
 2AvNNH5OE/J458cMZ5Lp2vPJsuHdEnCCFIgdPpGl2zXyuODyXVXstV6u6AoMfuE9N2Ji
 hF6+9NLILl3yX7O50QYfoLlc7G0vt84+Ax55i7nOfCCH5ulOe53UBlAc7YZb4ggGE1/h
 l2mA==
X-Gm-Message-State: AOAM5324FTqylA7bsPsW294Ppy67YbhCgW78m3DKyXXhlj2h2HnPNVlX
 xAdc0EldNRuVCltYET7nFWoeRw==
X-Google-Smtp-Source: ABdhPJx91xRpOMraFLXZG3wz+IHjiuJ47zPU31b5Ci2XLIMU3yrsM/Pp+5ktnqnP/60O7sjcl5o1zg==
X-Received: by 2002:a17:907:7704:: with SMTP id
 kw4mr24653677ejc.23.1632691977142; 
 Sun, 26 Sep 2021 14:32:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j6sm7695572ejk.114.2021.09.26.14.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 14:32:56 -0700 (PDT)
Message-ID: <fee5adb3-0cd8-3538-bf3e-d04af8153007@mind.be>
Date: Sun, 26 Sep 2021 23:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210921205112.39176-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210921205112.39176-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH 0/2] use `command -v' instead of `which'
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/09/2021 22:51, Petr Vorel wrote:
> Hi,
> 
> I've tested the patchset on dash as the default shell. But it certainly
> deserve more people to have look and test.

  Well, as the commit message says: it's POSIX so it should be supported by 
everything. which has a much smaller chance of being supported.

> 
> NOTE: If accepted, we might want to use `command -v' also in scripts:
> 
> $ git grep '$(which'
> package/fakedate/fakedate:for date in $(which -a date |tac); do
> package/transmission/S92transmission:DAEMON=$(which $NAME)

  Also:

- remove it from the documentation (adding-packages-asciidoc.txt)
- remove it from docs/manual/prerequisite.txt
- it's still used in package/doc-asciidoc.mk
- package/libxml-parser-perl/libxml-parser-perl.mk
- utils/brmake

  But these two are already applied to master, thanks!

  Regards,
  Arnout

> 
> Kind regards,
> Petr
> 
> Petr Vorel (2):
>    make: support: use `command -v' instead of `which'
>    support/dependencies: don't check for `which'
> 
>   Makefile                                      | 22 +++++++++----------
>   package/Makefile.in                           |  8 +++----
>   support/dependencies/check-host-bison-flex.mk |  4 ++--
>   support/dependencies/check-host-cmake.sh      |  2 +-
>   support/dependencies/check-host-gzip.sh       |  2 +-
>   support/dependencies/check-host-lzip.sh       |  4 ++--
>   support/dependencies/check-host-python3.sh    |  2 +-
>   support/dependencies/check-host-tar.sh        |  4 ++--
>   support/dependencies/check-host-xzcat.sh      |  4 ++--
>   support/dependencies/dependencies.sh          | 18 +++++++--------
>   .../pkg-toolchain-external.mk                 |  2 +-
>   11 files changed, 35 insertions(+), 37 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
