Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868B4C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D4994026A;
	Sun, 24 Mar 2024 16:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkRAq2RQMRZH; Sun, 24 Mar 2024 16:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46670403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46670403A2;
	Sun, 24 Mar 2024 16:53:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A78F1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 284C1403A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhnBQaa9kGe0 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 547014026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 547014026A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 547014026A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:53:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-414859830f2so4298735e9.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299209; x=1711904009;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9WIgH2luaJR7ieNXcW1mA/6K46kDsrPkJwy70pEyhA=;
 b=alpFhTjCFQ7wsUBuj4WDdXRYSlqc6MW3hQwCk8RHMo46ka9OXZ3eQs6PgPymyRusVV
 ES5ObkLq5CCnihIpISRzDvb5dH8YJdmBT+hERuE5cFVtJgM7wVHk4kXrbjVfq3xX/doJ
 YBbXg/OyF3HAn25B2Idl22D0vDhIiZKIfZihBgfIaIrxQc0HCR1XHuyiPJW2W6N8OxSh
 e5gL8gtV/FN/7FNYZK96qjuaEpV0aVf5yYLM7ckel/YVx2hGeDmtw3Erru3pSUKgpiJX
 CQhQfcr3wUo1tBnXzOCyjhhh0q5h/T5UGhSdCEL0Stcoj0IlHQdbW+y4t26mrj73Kt3/
 Z5Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXytvOHPciQ9Aod9Kyua41PIvJoR/lOpCNsB9eKCUnqzRLPWvLSFD0IT2DBWRh2bOT7sbbQv0wY+JKGGcwMcMEP5ms+e1+CSg==
X-Gm-Message-State: AOJu0Yyw7SCHGwKA+B2xps6PiS+MLW/brIU0Cbk+mfK6zw9n0c3122aT
 n2aVQHSGHZL8AnLM2PT3aGnZGtFhZAYQJ0q0h0tLfyaItvDE1lFN7YopL20Abmo=
X-Google-Smtp-Source: AGHT+IEoFfKb1ZRGZ2M1me15FiEj8h0mhTLuPEDL6HyeVMGKZifaJpUrLRK8dXc2yEpehNFCusl5Mg==
X-Received: by 2002:a5d:59ae:0:b0:341:c80f:38f9 with SMTP id
 p14-20020a5d59ae000000b00341c80f38f9mr2257420wrr.66.1711299208983; 
 Sun, 24 Mar 2024 09:53:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 df4-20020a5d5b84000000b0033e7b433498sm7192618wrb.111.2024.03.24.09.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:53:28 -0700 (PDT)
Message-ID: <efc55bce-bb4a-4b10-912c-0e726ea055b3@mind.be>
Date: Sun, 24 Mar 2024 17:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317105326.237292-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317105326.237292-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299209; x=1711904009; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M9WIgH2luaJR7ieNXcW1mA/6K46kDsrPkJwy70pEyhA=;
 b=OJgUR7Ak8zDomLYbRqzSaLYBjwPxy+qdETRBq67OdatAs/OlFl4IjWrxsSTQnmRb/E
 SzELqCKCvT8wEX4CXTA+eELP694VZd1imSvlzjE7NvhsaYZZ+x8+b2vOuUVilNEMLzyl
 H4hDWykKLlCKKbabA2T1o9re6pJpm8ENkFnIyvcK/0BHdU7zYfho8Fe1ZzvPLrqAE16l
 FIOIKEB9MOVAERvF/aTsyhWPHeoDVUrFh4rbgZcU/SaBjcZWrGGRPeMZrrsirOtiTQk+
 LznO39cXTJYLl5NnTD3WVTO96c2wEn44zMwvkj0MA0CP71y5YssDg37u8QUsBZd27huS
 VOtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OJgUR7Ak
Subject: Re: [Buildroot] [PATCH 1/1] package/libunwind: drop autoreconf
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



On 17/03/2024 11:53, Fabrice Fontaine wrote:
> Commit 67d87bf7d255cd05f84fab3e3625e073b5bfccf8 forgot to drop autoreconf
> 
> Fixes: 67d87bf7d255cd05f84fab3e3625e073b5bfccf8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libunwind/libunwind.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
> index d7ddb8f179..15c4e4863f 100644
> --- a/package/libunwind/libunwind.mk
> +++ b/package/libunwind/libunwind.mk
> @@ -10,7 +10,6 @@ LIBUNWIND_INSTALL_STAGING = YES
>   LIBUNWIND_LICENSE_FILES = COPYING
>   LIBUNWIND_LICENSE = MIT
>   LIBUNWIND_CPE_ID_VALID = YES
> -LIBUNWIND_AUTORECONF = YES
>   
>   LIBUNWIND_CONF_OPTS = \
>   	--disable-tests \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
