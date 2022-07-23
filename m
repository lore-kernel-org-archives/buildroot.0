Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF9DC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B8042459;
	Sat, 23 Jul 2022 19:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B8042459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLglbkalsGwg; Sat, 23 Jul 2022 19:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528BE42456;
	Sat, 23 Jul 2022 19:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 528BE42456
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6FB1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 490E360F48
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 490E360F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrRQg09GYpPT for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:07:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED0E60E62
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ED0E60E62
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:07:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h8so10626977wrw.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xs75NUObx2XDlADNhTk8obT1bKjNg8tiVw4UZo4nGos=;
 b=opW55Mc+0QJWOoN9XXA2C6F/H+NYpz8IcC49JvM7BZCcfe3zuiJtC7nf/GY3U6bLmd
 V/lycdrTGBeMWHyimlzlCSy/kyiEGUM+t4tyhJ5dD/7s9ZGdqiwzVpqHkrlQLlZP05Sd
 n3nMkS2H4Rqsz1MrOrbfTAKORbCCESRukDN/nDiLuHpPiZFfwZMNp/r3nTJnx6Afih4m
 qeBJGVlGfvwdeBbLW2Xxyx/LjxKGoa+mK/icPjtH0RFTBJfs/zygCtILeWcLD2I3cXiB
 RdVHVknH4MPbgxC5iiS8oKWq0qSPtT8KEc0ghommT3Lnxk9BNgVhs2akOuGmWhyXWXC0
 jqsA==
X-Gm-Message-State: AJIora/65/JaWdJUyHOdv1idQ7HEDJiiozLkn7xeRViv4/dl1nDuwxcl
 ezOnLc5fRDeRcFPpUIM0a66mwA==
X-Google-Smtp-Source: AGRyM1vJFz7lvRaE/X27fk6WmOwr4NcMMB+8tPtAuDJhRimOJ7y9Aax1ekex9DFSkPXII9zxa1XSSg==
X-Received: by 2002:a5d:64e1:0:b0:21d:80d0:a09d with SMTP id
 g1-20020a5d64e1000000b0021d80d0a09dmr3522932wri.433.1658603237960; 
 Sat, 23 Jul 2022 12:07:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a056000170700b0021d221daccfsm7516261wrc.78.2022.07.23.12.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:07:17 -0700 (PDT)
Message-ID: <cb2bf696-d239-f1c0-92f4-9b26b48233cc@mind.be>
Date: Sat, 23 Jul 2022 21:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xs75NUObx2XDlADNhTk8obT1bKjNg8tiVw4UZo4nGos=;
 b=cXYaXPiIlKSqjKd+7nCBvgK2ecH0xNvi8b5bumxFKi+T8xU6Jf/AuxgjoByIlb5q0D
 VpcfxwYeM47ZMM6PYmOBW2H7LYEjIVaPSZ6DTHBfEhMOu4yDLWMNwSBvDcWxS8VFO7NZ
 yQT+zUCUuFFGFU0JToS0kftni6uQFX9WlIUSJmoP6wHimaX6rqQ9ZBoQwRlaOQxsXDMw
 iJjCHRHnXW4xZmebDsgCGtXRfCnqLyWe9CGAhDbDEPxpX72vtzWsh3CZsOQ/I5QtCg6G
 rbDttKEAkbtm5k21CputS1gz2QJs1B3SSKle1bSdpoZDRRk/jgThTFQAosuE4rY6vCyC
 Bm8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cXYaXPiI
Subject: Re: [Buildroot] [PATCH 1/4] package/rsyslog: add czmq optional
 dependency
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/06/2022 18:46, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied all 4 to master, thanks.

  Regards,
  Arnout

> ---
>   package/rsyslog/rsyslog.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index 7fdc7316b7..400fc6b99c 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -59,6 +59,13 @@ else
>   RSYSLOG_CONF_OPTS += --disable-imhttp
>   endif
>   
> +ifeq ($(BR2_PACKAGE_CZMQ),y)
> +RSYSLOG_DEPENDENCIES += czmq
> +RSYSLOG_CONF_OPTS += --enable-imczmq --enable-omczmq
> +else
> +RSYSLOG_CONF_OPTS += --disable-imczmq --disable-omczmq
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GNUTLS),y)
>   RSYSLOG_DEPENDENCIES += gnutls
>   RSYSLOG_CONF_OPTS += --enable-gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
