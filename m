Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50D7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:54:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D4560F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51D4560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274C5801CC;
	Mon, 25 Oct 2021 18:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCKAb0rPPNhN; Mon, 25 Oct 2021 18:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E74E80D4C;
	Mon, 25 Oct 2021 18:54:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 577771BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 545D2403DF
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OislgNKA5xTN for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:54:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A79844025D
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:54:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r12so3616156edt.6
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QK8RBIoWZOKICfElbixAQYPTO6kRVNW7Lc6rjxYUtxU=;
 b=cKipxhcDM05+HMJtS3BLujUP3JRZvWEGnwpcdKYxO6w3adP/4NqfDG2vZcAzMgdWTP
 yxyUJu2t7VJKW3ExNDIcMon6syO5qkKBtuIvweC52frbPn4zSPUP3m4okwWRSk47vFxK
 cyYY5FZQ3Fh+w4SMBrwlUofAuh3qvmAR0STHnh87ClNtyiatc4zrIcbHwUiDqTbgO1we
 kfksIvX9wnipms293KRphiYWsZYLV96EJGvJWAAbzoTdohEkDxASxpCDxIUQnUeAqPn5
 FRx/H/EAs54OG7RFyQhqcFgngBhC6rtM0YWcmQvgy81I3RLzqneQldgODmS+aIvcMP56
 jXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QK8RBIoWZOKICfElbixAQYPTO6kRVNW7Lc6rjxYUtxU=;
 b=kRu/jd32cA5XbGXQT8/uPlLRxO9BmMw+ZUS9K8/nlEtqunPI0GmEbj/hbQkuwYXdmI
 Q55+Oev8Ta1BKnDydhl/xVXmimjsDgZBrOaYK6F6FN9eevz+3zwkzmaEpK8Kl4SZwX23
 KthKZjoeC6Vt5hMvqlHyo/c7c8OTtu1E2ep74yaRTZ+WmQu8IIrZ5IfyCtQ6ptyMF2/l
 oLjh+lYHd4+0IZXiKD9tnHbKFir6YbY+Dq+8eIN/36MwBKaktEJkxwandXyoUtgkA55g
 ke0Y/e7NpPxGVwH/7+YzgXAOLJYgAuszpLAszREXk/AyXHMqi6uXECzEoyeDcg2n7UMq
 zjUg==
X-Gm-Message-State: AOAM531aULf0LRLn5MH5MM96oJw7auWHaCIjS0iHLMKjlrA9vHL1l44U
 MWBNPba1AcSp8/AnC5GakF8aCZYLkBoAQ8w0
X-Google-Smtp-Source: ABdhPJynz6FdFIyCWZNKdeXcJoFKEsUFxZxBaibjikA8OpzlG0KFQ7LQkoDZ9N5m9RHoB1yqL0bQkg==
X-Received: by 2002:a05:6402:1499:: with SMTP id
 e25mr9339691edv.263.1635188091966; 
 Mon, 25 Oct 2021 11:54:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p26sm9317825edu.57.2021.10.25.11.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:54:51 -0700 (PDT)
Message-ID: <e6e11e53-15ac-3756-3aa9-e1f71d4021c8@mind.be>
Date: Mon, 25 Oct 2021 20:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211013204146.1882135-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211013204146.1882135-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urwid: fix typo
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/10/2021 22:41, Fabrice Fontaine wrote:
> Fix the following build failure raised since commit
> 1c10095945b2b9a0168e2a8f98a5c6a396b2c0cd:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_URWID
>    Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACAKGE_PYTHON3
>    Selected by [y]:
>    - BR2_PACKAGE_PYTHON_CONFIGSHELL_FB [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]
> 
> Fixes:
>   - No autobuilder failures
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-urwid/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
> index 8fd2cac694..c141e8c0bd 100644
> --- a/package/python-urwid/Config.in
> +++ b/package/python-urwid/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_PYTHON_URWID
>   	bool "python-urwid"
> -	depends on BR2_PACAKGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON3
>   	help
>   	  Urwid is a console user interface library for Python
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
