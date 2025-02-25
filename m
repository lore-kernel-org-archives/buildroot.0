Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050ADC021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 13:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0ED140E61;
	Tue, 25 Feb 2025 13:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTo8Y9zLRJ4Z; Tue, 25 Feb 2025 13:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB5440E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB5440E5E;
	Tue, 25 Feb 2025 13:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33AFC2019
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 181E040E5E
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7vn8eCDcefD for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 13:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26BC240E58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26BC240E58
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26BC240E58
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:45:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso35515285e9.2
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 05:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740491153; x=1741095953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LUIZibfJXgJAVYGQKNpk69HDXHtYJk/b+sXYgMEdIqM=;
 b=VJclxEldTt5+4ElAd+sNUoIzCRGdy4qsrAbFNZAuglr5cdUQ96pJYjwAGvpeAZi4vC
 M4wgqAhEGwyP4enXLypQPnsgyarfiybqchGnTI118lsljhJadTN1QOPt1d9C4oHmx8pR
 9GwkxjwpPfyCfnI329fFExNjVe75yuTZNCaWURZYDQXRBKjPTiUwPDd7zgfoM+ranbqn
 dKOCcE9pxBqCpgj0IzdwBrNHtaGQfGNnjKGJRmiyeuHJ0TSnMIo52/GLQpsD66zSw/Q2
 Y9vbbfofpmjiPz0ULv4HlzYOlCrEgdFVsIhO0r8Y+oEk6bEmbACNifVKmBFSp900IUdK
 2PQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1lmd+ZScvii46WlEoIWHz32gT9V5nqRidklKqpG80fRzPt+Gp3XOA4oal8Cd/wa2D9Qc5UTTn63c=@buildroot.org
X-Gm-Message-State: AOJu0YwyVZlX5FtdtMhTA2ZOtgqUFkjZdzqXHQtlCvYC/Ro6CHQ0wfmV
 MWMLhZzmI0mIUma1Gn58sJ+yvC859kKXXVMIpIJnOA5t9GR9I4OH
X-Gm-Gg: ASbGncs28TgdqEPYEBt9x/gn6laPmtwzIQbCj/+mSEC05YWP6fMYVWPFhymm5Bjc/25
 vXlZ49FtXSda3LmbFz5QGQ+6aa3K/7cVaYmTy+isXUs77zG5X9sWFNDYKMt8sH+qASwg3dOqxCx
 FdOQaufuo9KOeMhDMYWRXBCmjQ+RtHdhLPCv3FyPgUzxsMLQlRSjK/+C+iIaNEgCUUkymV264dY
 r0LFIIUw+aElL2dOxni3QVaT6VwXE2Tdy/OeN6Y4n3TLPCIUhkLOAzKhHNAADg9ZjmT17xC4uqX
 uYDbagLSUk5yJXYrgnlifqvJWX+R52uerlVhu/RlA9t0EDcq
X-Google-Smtp-Source: AGHT+IG6glLBSq1xiQrf+j4795DqLYQnWaMlXztpmDNgzTNwkmIC1DVofLUb1CILSZ2nxOamOASQJw==
X-Received: by 2002:a05:600c:1c98:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-439ae21d2abmr179323245e9.30.1740491152742; 
 Tue, 25 Feb 2025 05:45:52 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::f0b8? ([2a02:8070:2483:7e00::f0b8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e78e8sm2327909f8f.79.2025.02.25.05.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:45:52 -0800 (PST)
Message-ID: <2363315a-c8cf-404f-ac02-59cba1dbbd7d@gmail.com>
Date: Tue, 25 Feb 2025 14:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1740345268.git.yann.morin.1998@free.fr>
 <ac0db0d8eca730ce7d8b0763e750e72fe4e3aa1c.1740345268.git.yann.morin.1998@free.fr>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <ac0db0d8eca730ce7d8b0763e750e72fe4e3aa1c.1740345268.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740491153; x=1741095953; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LUIZibfJXgJAVYGQKNpk69HDXHtYJk/b+sXYgMEdIqM=;
 b=AAKcComPr9oewwiG9TwmAx7TTfzgpvn+pTwmMIeyMzKhdRlLY1iKLmaKT4WCPAUUcO
 aTMYuLwC8rEYj9NajpXz79k4Vjya0+GpBSk7K4/vggjTdC87eZzJo8Wq8Xklk2M7SYfT
 go1tI34wQn3Kd8LO/6bNVhoAsNQLNlIkm6yV9zl8t0Mi0SB6O5PWo3yeNADCbPutAjTo
 zrqVtIXShP37yQGS37W6BeBLEAmB4vjplfklxQwrULGf5K/bEg8adU+dsiCwwWHzg9gy
 2lsK4LJ+NqqNqnqtEENCN2e2XM2Dq85cMGahbB2HAoKfH13Kmez3dBnAKFh76OP38SFN
 glSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AAKcComP
Subject: Re: [Buildroot] [PATCH 2/8] package/shadow: install to staging for
 subids
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hello Yann,
the changes looks good.

Regards,
Raphael Pavlidis

On 2/23/25 22:14, Yann E. MORIN wrote:
> When the subids feature is enabled, shadow will install a library and a
> header:
> 
>      $ sort output/build/shadow-4.16.0/.files-list.txt
>      [...]
>      shadow,./lib/libsubid.la
>      shadow,./lib/libsubid.so
>      shadow,./lib/libsubid.so.5
>      shadow,./lib/libsubid.so.5.0.0
>      [...]
>      shadow,./usr/include/shadow/subid.h
>      [...]
> 
> Install to staging in that case.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>   package/shadow/shadow.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> index f0a2b57b4d..2937a9601e 100644
> --- a/package/shadow/shadow.mk
> +++ b/package/shadow/shadow.mk
> @@ -46,6 +46,7 @@ SHADOW_CONF_OPTS += --disable-account-tools-setuid
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
> +SHADOW_INSTALL_STAGING = YES
>   SHADOW_CONF_OPTS += --enable-subordinate-ids
>   define SHADOW_SUBORDINATE_IDS_PERMISSIONS
>   	/usr/bin/newuidmap f 4755 0 0 - - - - -

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
