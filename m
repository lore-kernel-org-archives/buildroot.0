Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280E5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:56:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D3C9610E5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D3C9610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 063DA80EB1;
	Wed, 13 Oct 2021 18:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kp0EUl_l0COb; Wed, 13 Oct 2021 18:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ABFA80F16;
	Wed, 13 Oct 2021 18:55:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 494FD1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3961C80F7D
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDQ5pAVGL8iO for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:55:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 246A380EB1
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:55:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ec8so14230015edb.6
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m+YSDO9zPoIiv5JPPIpqVLKy8nKgSSROABYugYB6ppA=;
 b=PFYLG4cmEiPKFgYBpErkPLttGo4xc81ZGZgepVR765gAJfVTEIJcWBeMb4H3EsD03k
 ZM+5Qaq0SixCLwxVTKAEng3FR10NMyrpCz+ALy16Y1+dqK9PR0LEV1l74vZH/B6MnAnQ
 Eoozp8leCxDvcLSG63Brw5wFBbnnrtItymBgOLhbe+OHjbvrwxyRfuaduWVN7nGIcI7/
 OucBXvizSzArReJN8lbCbjyW4UKKYOp20POdFYfsujih+rqyj+XeDN8crjUdg1BnTEUC
 9uUSWOtDxNGelb4Wgw07GU+fWMSmOT0Td8RIEKG0Avly2GWGID/IPsCPWgy420/kRi1D
 YbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m+YSDO9zPoIiv5JPPIpqVLKy8nKgSSROABYugYB6ppA=;
 b=AVeoDigeUlA3wGTA2rCyeTKJalKShdCylQDcBA6/tAiKeTrdZiKd+NNTArwG/u3pj8
 miiRiT3C2GoiB8xldoy9SXpL0fMwUioUvTxW4RsFZ/KG0IqBQ7RYNx6VyUvCMaLWXa9h
 ibKsP3hjE3EvEJxRXq4lk2PKNAq7L/xs1kVs7fiAn/4sryAffNc1wR0iwOrpRXMJFhQ8
 XQO6//KFef61JNRqKJnI9QQSzQQUJGS143WymG5ISTSp5uiKxkv7MYEDeILuLL10BLaV
 D4HswUO1n3L+obJPxW9qOsysjajBSF2eo22Bt+3F9GQWIV07m9Ts3V9BefKfwIDvuDzk
 jeNw==
X-Gm-Message-State: AOAM532wDQASCF6L5kxCSIAaZINQsiZAZizufRPvdtESQl0qGe+04Jq4
 fPpq0NKjHctZSvEY7XncSR73gA==
X-Google-Smtp-Source: ABdhPJx1tFrGukxMa0KeWGIeR/Tz+ZVuKyctvxCYa9eKxRIlelilg1vEuf1eaSyb48Oi7/5NYh81xA==
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr1681924edc.38.1634151353205; 
 Wed, 13 Oct 2021 11:55:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z19sm274765ejw.44.2021.10.13.11.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:55:52 -0700 (PDT)
Message-ID: <10553771-3ba8-028a-b7f0-80286d6b9086@mind.be>
Date: Wed, 13 Oct 2021 20:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20211006163337.22905-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006163337.22905-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urwid: depend on python3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 18:33, Asaf Kahlon wrote:
> Although the package claims to support both python2 and python3,
> there are some places which contain python3-only code (mainly
> asyncio-related).
> We can try to tweak some of the files in order to make it work with
> python2, but it doesn't worth the effort since python2 isn't maintained
> for a long time.
> 
> Update the reverse recursive dependencies accordingly.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/356c6b09566c6020dc320eb89da791581571cb7f/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-configshell-fb/Config.in | 4 ++--
>   package/python-urwid/Config.in          | 1 +
>   package/targetcli-fb/Config.in          | 4 ++--
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
> index 90a295fc8d..a0326e9150 100644
> --- a/package/python-configshell-fb/Config.in
> +++ b/package/python-configshell-fb/Config.in
> @@ -1,8 +1,8 @@
>   config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
>   	bool "python-configshell-fb"
> +	depends on BR2_PACKAGE_PYTHON3 # python-urwid
>   	select BR2_PACKAGE_PYTHON_PYPARSING
> -	select BR2_PACKAGE_PYTHON3_READLINE if BR2_PACKAGE_PYTHON3
> -	select BR2_PACKAGE_PYTHON_READLINE if BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON3_READLINE
>   	select BR2_PACKAGE_PYTHON_SIX
>   	select BR2_PACKAGE_PYTHON_URWID
>   	help
> diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
> index f584a9258d..8fd2cac694 100644
> --- a/package/python-urwid/Config.in
> +++ b/package/python-urwid/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_URWID
>   	bool "python-urwid"
> +	depends on BR2_PACAKGE_PYTHON3
>   	help
>   	  Urwid is a console user interface library for Python
>   
> diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
> index 24ff3145f6..04c6a1ac09 100644
> --- a/package/targetcli-fb/Config.in
> +++ b/package/targetcli-fb/Config.in
> @@ -1,9 +1,9 @@
>   comment "targetcli-fb depends on Python"
> -	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
> +	depends on !BR2_PACKAGE_PYTHON3
>   
>   config BR2_PACKAGE_TARGETCLI_FB
>   	bool "targetcli-fb"
> -	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON3 # python-configshell-fb
>   	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
>   	select BR2_PACKAGE_PYTHON_RTSLIB_FB
>   	select BR2_PACKAGE_PYTHON_SIX
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
