Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EAFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:20:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07E860F3A
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D07E860F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D52A4022F;
	Mon, 11 Oct 2021 21:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WAbjyxmKN4C; Mon, 11 Oct 2021 21:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 925B7402DF;
	Mon, 11 Oct 2021 21:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31D001BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2185180ED4
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUWFeC4uFR5Y for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:20:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21E5680ED0
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:20:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g8so72772033edt.7
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Oc/ojQMaqkP+w84m3FCadQUluNfRuN1F/1DaBYBi39c=;
 b=Dx1GuKyBHYd7xuLJsjUZjI3I6b/rUxZv4uNEYAJSF+JWHD4W43ysDLYGGYlSeMLoS8
 3fSC23nVfZPjvf4kKaZXQRN+mUCvsMn3CVmIfI922ex6ycFvJpshqHT9WOZG4UXyXOSq
 qv0UQjNaAE+AwfR2GGP6RGL7a3JSF7jm84pOxBkJKIkvH4OjnNOmv8SATJn8nfpdGDNR
 czcKVG47X6shksh+0CmKZSxZyvUv0F3hEMZ73pz5JwLt3X3Ude8Y3EVF3wpXO9IhqElC
 CGRzA+U7kIXl5z1KK0w7GopuirR2Iq5zA12GzUnAvoVjXX+hNtuF6emJhT5u2dknR/wD
 MXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Oc/ojQMaqkP+w84m3FCadQUluNfRuN1F/1DaBYBi39c=;
 b=D+uMeBuA1ye6gPXD/0itpS6PLNg4QOGOHxvWRXl+bkhwUqPrxx0EXO0F3q7zSxdZPW
 8joWgu+2GKu4N2B5chvNTK3l0s5NIqk3+AX0j10mHFGW79EuyM42SgV0Y/mgKMaAoftx
 GaemjbcUv0KP0CBsd1HdYRNve5iRFbR5KQpHHfX/BkJGamPZflLhqXLHNJAnsG6cdDKQ
 rrdoSDU+w8u/SGbLpqULyGJcW/gzebPPwvWgwB0SJ2MDjdsWmIV2BqTKu+HmJxga/aSM
 mytxn+3WuTR6D18LC/orLFYxuk4V5m3O8igLQ/Fpqff2hHgKQFyVhewbYhsaHhljv6YV
 u8oQ==
X-Gm-Message-State: AOAM530XbeZLuMhh1G+11s75zKG852V8bCE2wdOSIJEvjwSx3GyOLkN+
 gGtmXNacxL2H0OkVihXSQV7Ktw==
X-Google-Smtp-Source: ABdhPJyXu02fc8xo5nBYknGiUaOIli21cG/wLubHbx5E5oUSVx3hcFWvPwTQ5C/CA+k+ZlIQI0j2IA==
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr28346012ejc.413.1633987235419; 
 Mon, 11 Oct 2021 14:20:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id se12sm3938392ejb.88.2021.10.11.14.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:20:35 -0700 (PDT)
Message-ID: <e827ed2d-1380-3f68-60e9-b52955d453d3@mind.be>
Date: Mon, 11 Oct 2021 23:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211001221654.3087199-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211001221654.3087199-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/supervisor: bump to version
 4.2.2
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



On 02/10/2021 00:16, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/Supervisor/supervisor/blob/4.2.2/CHANGES.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/supervisor/supervisor.hash | 6 +++---
>   package/supervisor/supervisor.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
> index 98a03aa1be..f6e9cf97b1 100644
> --- a/package/supervisor/supervisor.hash
> +++ b/package/supervisor/supervisor.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256 2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383  supervisor-4.1.0.tar.gz
> -sha256 7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
> -sha256 4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
> +sha256  5b2b8882ec8a3c3733cce6965cc098b6d80b417f21229ab90b18fe551d619f90  supervisor-4.2.2.tar.gz
> +sha256  7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
> +sha256  4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
> diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
> index 92e8323080..ad34c031e4 100644
> --- a/package/supervisor/supervisor.mk
> +++ b/package/supervisor/supervisor.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -SUPERVISOR_VERSION = 4.1.0
> -SUPERVISOR_SITE = https://files.pythonhosted.org/packages/de/87/ee1ad8fa533a4b5f2c7623f4a2b585d3c1947af7bed8e65bc7772274320e
> +SUPERVISOR_VERSION = 4.2.2
> +SUPERVISOR_SITE = https://files.pythonhosted.org/packages/d3/7f/c780b7471ba0ff4548967a9f7a8b0bfce222c3a496c3dfad0164172222b0
>   SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
>   SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
>   SUPERVISOR_CPE_ID_VENDOR = supervisord
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
