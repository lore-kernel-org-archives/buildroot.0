Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F44CD8CA8
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E20D60FE1;
	Thu, 13 Nov 2025 16:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRsBopSmt1sS; Thu, 13 Nov 2025 16:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99AF360797
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99AF360797;
	Thu, 13 Nov 2025 16:41:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D48C0158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 16:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA98B83B99;
 Thu, 13 Nov 2025 16:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5AKZTWy-WHF; Thu, 13 Nov 2025 16:41:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46CF983B98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46CF983B98
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46CF983B98
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 16:41:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so7900785e9.2
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 08:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763052104; x=1763656904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rOlssgzWqXGV+ZB3UmHn2i0C4nqsq0rB2dtyeyhjufg=;
 b=SK2gotFKkky3bbe3URWzRXJ7zeX3QvSvCn7mFKmi18aEUC3srOF4t1QxcqV8j6kUQK
 ngOq9P201pq1SG95FcVUdRlCq/8vDh6JWqGF67A1bZ+2Bt6nxb9vAZgSFCgVb15elUpY
 C1aCrId4j7poSZpqp59rAEkVlAKK3CJ8Gb/kDfHWsto0OHjj6L/91Hbx/XhgyIXPycUh
 y1Ewn9YEGDAQlKjrDyYdh72GJrTwj+VmhHSUAG+yBf8MlSzqWgG0+qNnjcmxdndAn5+u
 JPuuw14dLv0A65ceTd2dHvUwyD0R+/EuFK1sO4jOqWz4FAUHzCzH/zDVOxOAURPohtA3
 5Y1Q==
X-Gm-Message-State: AOJu0YwHWwEgu416WUV4cU1IADtYjglpt+KmyfBbPhqaEHOEhtjYxsOV
 QdZBAvICIhjuoJMNm5t0gmwOUv8d9Iv8eudjlBPUf7+EGCtNnu71ZGI4
X-Gm-Gg: ASbGncub9ksmrvXKccXoc1K8pil83XsJEGsCMnazOVbRVKbvG537mz26uKQNJU6WVy5
 ahipQfyGgKtPChACnJPrHGUnu+0Xbfo3FhoAGCGcOWm9BvHUQj6TEe10mZhI4lrBKSmyUGvwVb0
 XrTsjjvF/srtPQ935nXccwpGtcozMG65sYbR+euQYGW56RaFzRFfP4CHUveLM66pxHjUpevqSSN
 xWQNN05mBjk2bslkQHzrGepeCdhia9SGkyBOC6sH7aRLPk06M1uZu6JQztiYrXjIroIC2HpKVMq
 G+v1wizF6cTYpiFkeZXLtOepP+V65XuJCuJawhfYQWPW+AX+zrjvYuk1M/YRdckLLmM8L6DBfR2
 rQNOOOlN2RQM0DKpsAk9XzYfyOMKdD8qsLN6Ele96P8N4o6cnv/LNc9A+4ybv7w7V4C/vbX4wCw
 UEQjyncIY66flcnWqyoNBEJA==
X-Google-Smtp-Source: AGHT+IG2eks8bLxbngWbFiMo2jFvAbhv/4BXuqYoTCxREZhRhayPU41vb1R6qE/KFwaYp+VC2KkCHA==
X-Received: by 2002:a05:600c:4f4c:b0:477:e66:4077 with SMTP id
 5b1f17b1804b1-4778fea8848mr1306755e9.29.1763052104124; 
 Thu, 13 Nov 2025 08:41:44 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e95327sm95922295e9.12.2025.11.13.08.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 08:41:43 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 13 Nov 2025 17:41:42 +0100
Date: Thu, 13 Nov 2025 17:41:42 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <aRYKRrNl6nALDwmo@landeda>
References: <20251112203227.27573-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251112203227.27573-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763052104; x=1763656904; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rOlssgzWqXGV+ZB3UmHn2i0C4nqsq0rB2dtyeyhjufg=;
 b=kfUNQUGrSjkfCVBWV9NFCgan+24UA9o5MlDX2xufndzG/FFCsLkC8SSebLxM1zv9fj
 rpkVgdPGdroPDxcucHOFWqCzSxB7XAORzJKmdi5NvJETff79AkFaQyXfd4mpjzHMQnjD
 tI/zx7Penoo0S7dEUKx+YzvXgPQ0yIw5b267aCOiZxOzVFR5ziTTi69UyXKvEUDvC7JE
 h4itd0T/qYJBlj3OhbLOZRg2jvNnfL4f+nZIOCiJHhn56iS8XkD7Q5soh1fqwfW9lTMv
 mPta7/rquqb5oY1P+sUTO67PHV7tJOZJLDhfFHEvp98moIpmBpq/EJIRGawHxo1zXbCi
 Ebcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kfUNQUGr
Subject: Re: [Buildroot] [PATCH] docs/manual: fix typo in merged-bin details
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2025-11-12 21:32 +0100, Peter Korsgaard spake thusly:
> Commit 6b53649bfa ("docs/manual: add merged-bin details to customize
> rootfs") added a small typo, fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks!

Regards,
Yann E. MORIN.

> ---
>  docs/manual/customize-rootfs.adoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
> index 5d8bcba778..4d03d04617 100644
> --- a/docs/manual/customize-rootfs.adoc
> +++ b/docs/manual/customize-rootfs.adoc
> @@ -31,7 +31,7 @@ When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
>  Additionally, when +BR2_ROOTFS_MERGED_BIN+ is enabled, then the overlay
>    must not contain the '/usr/sbin' directory, as Buildroot will create
>    it as a symbolic link to '/usr/bin'. In such a situation, should the
> -  overlay have any program, they should be placed in '/usr/bin'.
> +  overlay have any programs, they should be placed in '/usr/bin'.
>  +
>  As shown in xref:customize-dir-structure[], the recommended path for
>    this overlay is +board/<company>/<boardname>/rootfs-overlay+.
> -- 
> 2.39.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
