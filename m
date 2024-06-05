Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5412BC27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F41144042C;
	Wed,  5 Jun 2024 21:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vPIot86CSHg; Wed,  5 Jun 2024 21:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F5AE405F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F5AE405F5;
	Wed,  5 Jun 2024 21:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6D41BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CD1A60EE2
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcDTlvp-xG3j for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26D416060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D416060D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26D416060D
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:28:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-35e5c6600f0so234250f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717622883; x=1718227683;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y/H6PMCX8g2C9/EJRtZx4NfLt2T2tg6WxdYCcKr9y+E=;
 b=k6V/0bXbp591SxEHJD0vjg+Z4CDDoodAF33qW9hAJqwb00or+ps3y6aacKXcJms1go
 Z0RMw2+s4fWOG6NtWMy8SLHzWUSdlneBW6JJdPaFtbPViq0bmQZBT1rw+crDN5LMwdLd
 7wTrHPmt023oIz1oWECmFmXaI1tiM7Hputyv82pFyEfNGZ3n7gRR3BXgzTfraN37/nXu
 f9PbkiK8kQY3j44RVX6nNuztuNmYw/TCSoO5BnSl1ajrOJXvDBeXtAD35bZhZ6ENivDX
 U7T/5eACPGjrN1fO6/FMwe3B98GDHSKbatjVaBU4qj/3jmbeMr8a2c89XQATYuoVQBhC
 A2Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEQ5pJeLV6LFueXDei3nOapo1u0usKiWpENAIOpeptViltph1dgojIgfLhTPoJLhjMaTHmyNx881YgGItV9lE2IKdxsgANkA==
X-Gm-Message-State: AOJu0YwxI3X3lxaVbOfeQC85jHi+t24/rRSRqDqXda1d4lj4E9Dq2SbZ
 jeRLb5FZ0cseMEFOluZs1jNiT+6SAOFkDRlj7SfzEODq974tzjKP2VlsAuHeNW8=
X-Google-Smtp-Source: AGHT+IHuIwvSt8nMlI9Vmkwmg2qvX1fsxPb1CCwcurddcus/zIh42yu5/aiLJ7WnWNOMfVEMYhYmCw==
X-Received: by 2002:a05:6000:1f8c:b0:35e:5b61:23b8 with SMTP id
 ffacd0b85a97d-35e85feecf2mr3598785f8f.34.1717622882923; 
 Wed, 05 Jun 2024 14:28:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d9364sm15682388f8f.53.2024.06.05.14.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:28:02 -0700 (PDT)
Message-ID: <0cc82bbc-5acc-472f-9b0e-50df6a2d9ec3@mind.be>
Date: Wed, 5 Jun 2024 23:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <7e8ebad019c026217778280a99c9ade2d9970893.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <7e8ebad019c026217778280a99c9ade2d9970893.1717609998.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717622883; x=1718227683; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y/H6PMCX8g2C9/EJRtZx4NfLt2T2tg6WxdYCcKr9y+E=;
 b=Z7mKcs//n8AGwSQXB7/aFQ/FRGn1BssEDG4UD16brJnHbrWLzaQ4edCH1P+7IfvNA5
 oSQe4yUc2t0AxOkjCGXAU0/qjMcE8KEdv5xTK+HlWdRnewsKeNxP3+7CpiIiQXs1XOIZ
 aABSEVzK7ksf+lE+0GRD/Rw0E5u+cCfLn7tYGZPUTUyO0MMhMr58cog2/NyG0blASR6B
 JvPgfRqRkTYzOHsblflOrj80ht6fjYDrXqx0VJTDn7xYTJ4gjFd4VvnkkvgJiVEyPFgH
 McNVKe6bX+C/ywGAKLyD/8ZNgO79OAh3sFZccJLltc5q57jqLMuOzqvJZV4CcNTgcl9j
 NDsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z7mKcs//
Subject: Re: [Buildroot] [PATCH 04/10 v2] package/flutter-engine: use
 appropriate TAR
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 19:53, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/flutter-engine/flutter-engine.mk | 1 +
>   package/flutter-engine/gen-tarball       | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> index d9c2b3dee5..9fb63094ef 100644
> --- a/package/flutter-engine/flutter-engine.mk
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -176,6 +176,7 @@ endif
>   
>   # Generate a tarball if one does not already exist.
>   define FLUTTER_ENGINE_GENERATE_TARBALL
> +	TAR=$(TAR) \

  I've taken the liberty to change this to TAR="$(TAR)". I don't know if
make TAR="tar --some-extra-option" is supported everywhere, but it doesn't hurt 
to not break it here :-)

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

>   	PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
>   	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
>   	PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
> diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
> index 2d2117b9be..23b121d1f9 100755
> --- a/package/flutter-engine/gen-tarball
> +++ b/package/flutter-engine/gen-tarball
> @@ -70,7 +70,7 @@ gen_tarball() {
>       # - it insists on having a full git repositoy, with .git et al., which means
>       #   we can't generate a reproducible archive anyway.
>       # So we jsut create a plain tarball.
> -    tar -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
> +    ${TAR} -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
>       mv "${TARBALL_NAME}" "${TARBALL_DL_PATH}"
>   }
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
