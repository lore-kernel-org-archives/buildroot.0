Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C52C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A79D18460C;
	Fri, 12 Jul 2024 19:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgF-CCME6rLV; Fri, 12 Jul 2024 19:09:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEBBA84027
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEBBA84027;
	Fri, 12 Jul 2024 19:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3151BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B647605D1
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-KkuwwowEhx for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBB28605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB28605C2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBB28605C2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:09:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-367b6e5ffbfso1337480f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720811364; x=1721416164;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HvHDW34iikF+h4AmETB4WikLBo7MNtMTAZ6AhI9raUs=;
 b=l6zdoiEWBn03gH2cuOmLlXjLtKuKsBKRMQzTendZv4YOdHt+q4c38TeHigMqVUiLnj
 nY66PyogquIvu9mfK8Qy28+VFf1RGeWsTq7aN60UJIhZzFpqOAL7h4yKvyi9pkW9y7lE
 PDWqsEW6jro9QYxJyF665D7apX8Tqi2n4WH/TRymi/lfL+FzgFFQ/+2G1vuuk7i3ZCZ9
 QNB3fGKnqusmgfXKGOhw638uRaFnRTt6KliKcwsTxJNb7SAnYLQ2ThqZQCCQLPNqJ1E9
 YpA0uBqS/gm3xFlooz1kK90eZWBtGE6epUQCAo9WfJDS6y1zKUyT/0ihELp5U4INqb9v
 snJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeOX/b78SUz69OvwCXx+155CKNOcwNrKrGjEGRg89nbzUwxxkHuyGyf1jL7MbQc+V0zG13bpZKhdGXtacyYbmQMpzbjOsVAg==
X-Gm-Message-State: AOJu0YyvGC/s7THaMQtjaYFJ3DFr/rN7pHThfSF4/jICiA/yJmgRKoAe
 pR9f1qay7ktkO1EAYlKCAji6iOPXkBFb1rU3/1BmpRSqoWySHrUOkyk0qUDUH2EJoGdPJ1lUFvA
 JrYM=
X-Google-Smtp-Source: AGHT+IE6rRMk1LKqX3ZWmDn+mbSb5IB8xVtclw+VqqTuZtjU2FS9VJIus73RldOLN9fNMm9ig4WOWA==
X-Received: by 2002:adf:ee0c:0:b0:366:ef03:a8a2 with SMTP id
 ffacd0b85a97d-367cead1e60mr8481541f8f.54.1720811363811; 
 Fri, 12 Jul 2024 12:09:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab111sm10747792f8f.97.2024.07.12.12.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:09:23 -0700 (PDT)
Message-ID: <cdbb074b-4480-4a10-809a-b15030dc0a18@mind.be>
Date: Fri, 12 Jul 2024 21:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230822192315.8180-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20230822192315.8180-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720811364; x=1721416164; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HvHDW34iikF+h4AmETB4WikLBo7MNtMTAZ6AhI9raUs=;
 b=Nx24Vw+G+Zd46+Hahd6oWHbPA/X+3vEI+JIREuXHyVTowB9i8FOzbKxeM6QyvnDrr8
 jLbxoBsCOp+Bao//TmPKonIgBy6mxUnNRj2D19AOOfg5sl2tixu+G0akZxVi/SMhIf4n
 HJbOGWyuE/mnfPJI3bCATPnGzbkBJkneGTncJuI+ydw2vsw5AtHB3iGsN4SDRE40lxqw
 vdf68YteqcdoQShVjmAPGTzd/pEkPs6gaGaGFNzTPeyAXJjC/EMBgANJtCNYH6yTEh3U
 7OCgolUKhLVtFGuI5H+TNa0i16Nk6veQHGZMeiCcQwJiyS+9zaI72RP+c8KaXL2bXqo8
 WzMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Nx24Vw+G
Subject: Re: [Buildroot] [PATCH next 1/1] package/kexec: fix link error when
 BR2_OPTIMIZE_0=y
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



On 22/08/2023 21:23, Julien Olivain wrote:
> When BR2_OPTIMIZE_0, -O0 is passed in compiler CFLAGS. This means no
> code optimization will be performed.
> 
> kexec code uses a trick to detect unaligned accesses at link time
> which needs at least dead-code-removal to work. See
> put/get_unaligned() macros in kexec/kexec.h. This code was re-enabled
> in upstream commit [1].
> 
> This commit sets at least -O1 (which include the sufficient
> dead-code-removal) when BR2_OPTIMIZE_0=y, to fix those issues.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/8f8/8f8532f1dfbd71e52c51c00118934af9fa45e7cb
> - http://autobuild.buildroot.org/results/528/528fd7baf9b0ad5549d22ec8e0623c5fa1f2d117
> - http://autobuild.buildroot.org/results/499/499115439680adfb4b40042468e5bbb65d91ce6c
> - ...and many others
> 
> [1] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=0723defb5308ac7fce296f8b596bff4df6803f01
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested on branch next at commit bfa4a7c with commands:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_kexec
>      ...
>      OK
> ---
>   package/kexec/kexec.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> index 562b09012b..6c7a6778ae 100644
> --- a/package/kexec/kexec.mk
> +++ b/package/kexec/kexec.mk
> @@ -16,6 +16,14 @@ KEXEC_SELINUX_MODULES = kdump
>   # Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
>   KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
>   
> +# kexec requires at least -O1 optimization level. Its code uses a
> +# trick to detect unaligned accesses at link time which needs at least
> +# dead-code-removal to work. See put/get_unaligned() macros in
> +# kexec/kexec.h
> +ifeq ($(BR2_OPTIMIZE_0),y)
> +KEXEC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
> +endif
> +
>   ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
>   KEXEC_CONF_OPTS += --with-zlib
>   KEXEC_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
