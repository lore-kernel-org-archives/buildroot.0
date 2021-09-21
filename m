Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E64C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:21:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC5C61166
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCC5C61166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B84286137E;
	Tue, 21 Sep 2021 19:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kl1auyPpRU2R; Tue, 21 Sep 2021 19:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B2C607E3;
	Tue, 21 Sep 2021 19:21:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C02121BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD0FD406DF
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syz6EUD5rZk1 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:20:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1933406D2
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:20:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g8so448378edt.7
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JSfEkWxDu/9Awnxgy9dsHqh/TpJS3f8oXiUXRnUMXaA=;
 b=EvU+GItjxUZN0jA29HTVPbT7K23wcdSzWsHZIKna6Xqf/fExMmBUEkbb6gcPcKlJg5
 ehXHD2cqC4NXb5LFjsqpM/R/kEuSItaWNE+MRNS+gVKPn/m13oSNyTKO18j8hty2ar9b
 ooogcCrdw0GoN1FGiC0dWz5RK00JVojNnHi/82hW7YbGUfrYwcxwu81l+1V40dpELwcC
 wK2CUDxBShszvMC9t7Yc5EiIn5TD0BMcDXXl2LNUuA/nfG93zZ+sj2anoP1K3U1787/n
 YQ0u78dy3eSvyynINa9+DsRr3ordRtW6e0YKOMBMYKun23WSu+5Tp4WFcfITTKAu1ak6
 mCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JSfEkWxDu/9Awnxgy9dsHqh/TpJS3f8oXiUXRnUMXaA=;
 b=WqB7lLv0SSva0mCPuzHSaHURNNKe2cd+HboHiugqtDR5eZKhCnAn6oLSoQqdTit43U
 OOXt8TK4VI45v1qPyJ8j2hr6ovnzxBuww8yvxobAZyA+Cy6/VCssno6KxqvBAqh24fSg
 vPISnah4axG/x37Bj9f0t0rEn97R33oaxlDhq0ToqTL+6aJPnQZDv71Udz2uN/Ixdj4E
 qDI6KF47jns4qtvFbEJbuuUOtHusYJ7sz+xIEg66HATTSipjhS3nLqSQSMONMX99AhYh
 WEIWRerj3cucSkwnS8e0BOGlfLKyiIhv718qfAQ10Xq2izHxJhsn833C4xxDs+F+hOvX
 UukQ==
X-Gm-Message-State: AOAM530yitrhnkehYMTml8jFwTb/3XO/4IFcIdC2Pzn27pV/ppUK4TsN
 QF4jdvujB4FXGvlPM7xETedZej/6URyIPw==
X-Google-Smtp-Source: ABdhPJwq/uHG7W0YRdA7qeAPBfjfj5MWPkucwK62fQQCaE5ar/clYmAGFlffXlkhEearQuky/4sXUQ==
X-Received: by 2002:a17:906:39cb:: with SMTP id
 i11mr38096721eje.168.1632252029113; 
 Tue, 21 Sep 2021 12:20:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p19sm7863685ejo.81.2021.09.21.12.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:20:28 -0700 (PDT)
Message-ID: <90eea5ce-a906-50d4-84e9-13e87af369ba@mind.be>
Date: Tue, 21 Sep 2021 21:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20210910185213.2686343-1-m.niestroj@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910185213.2686343-1-m.niestroj@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] package/python-packaging: bump to version
 21.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 20:52, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-packaging/python-packaging.hash | 4 ++--
>   package/python-packaging/python-packaging.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
> index b3145dfee6..0c23a5f71c 100644
> --- a/package/python-packaging/python-packaging.hash
> +++ b/package/python-packaging/python-packaging.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/packaging/json
> -md5  5377308b3ba89f2d78c05e7f485be65d  packaging-20.9.tar.gz
> -sha256  5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5  packaging-20.9.tar.gz
> +md5  240ba5823ed31051a1254e74c9d18d55  packaging-21.0.tar.gz
> +sha256  7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7  packaging-21.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
> diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
> index 5fdf7616cc..6b54d2416d 100644
> --- a/package/python-packaging/python-packaging.mk
> +++ b/package/python-packaging/python-packaging.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PACKAGING_VERSION = 20.9
> +PYTHON_PACKAGING_VERSION = 21.0
>   PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
> -PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/86/3c/bcd09ec5df7123abcf695009221a52f90438d877a2f1499453c6938f5728
> +PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3afd461faecf9955a6501c4999933a48394e90f03cd512aad844
>   PYTHON_PACKAGING_SETUP_TYPE = setuptools
>   PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
>   PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
