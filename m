Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5C3C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A815809F5;
	Tue,  4 Feb 2025 14:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQRfXKL0eSwY; Tue,  4 Feb 2025 14:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E3380ACA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E3380ACA;
	Tue,  4 Feb 2025 14:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E9A4185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23B834091F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PaOSQcosJBu for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAB48408A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB48408A5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAB48408A5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:43:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so56630505e9.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 06:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738680231; x=1739285031;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G+Q+FWsDGFu22cpQOXO0IrzM8cLqfvKjCm8WJ61XFCM=;
 b=hthgTWESROY7NpKF5yrQFGU8izZgf5pGcsiegRlTo7Ohvx/MN7Y7AaGOjUG3M9fbdc
 qkbaHvMRJEAARxqipFiL+HibABSWkRgUp9gl/ihlBzQbiiRpcZkNtOjZp93YeN33g4su
 /k91fTfNTU+bZA2cVMqBtXrQjJMdo85faXtXMcA0jxuXh1UEB/bqejEMR2T6yqEjbOq8
 +Esjs/Y60rU9WIM6OwOWK1ivtqlvfKPMdIoG6BUT9lj1zS3R5qq5mcK9XpedYeMDyhjW
 /JelLFwMRS536JfXE/pJ7iP9CeXFdjnnSzZOQsNY+FrbAtkicHktCOGTht6QPtWugAx0
 65Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRemnw9RyRlAl80vJiQQu0NjgHM7yFG98fIJT/joM43nP/qbF5pY0Ml9vf3XXn8p0ZhLlVtzSfegQ=@buildroot.org
X-Gm-Message-State: AOJu0YwLmSM8o/k4qk1cvmR2A1bTaVeX/yYK4/bxG85ANgDZ1gFOlSrF
 c/D4MSGzuJjYUGpjy34Drpc6qWv9IQoytysU7B+OWZWQZttS5WgSpC9gXgDtDkE=
X-Gm-Gg: ASbGnctgLvhGRtr//N8fgm6oAgRIpXoT1mS3NFDh55Ro2FUA12kbYWQVYGWjMdRFdvH
 R3sPKR17tf/l+f932YisDnmMc3FPQOGGiqHED/iUU7Nqu/Qi1nwsT+YmMSZUjDs/BMcPd7bk52k
 +ZmiwWVQmwt/HQQ0zjhkYHKphLw5n2uzOSoUUSRdoO8s8Zvi2ZZW1pUWjmQPz5Wot01DC1t0/rU
 t6JdRz4UiFsrIiQmwYE9z7Cze1c2jKSRZ2gjKUHFjcZsXzCjHkaBQSUmA9cqDGHZTW0GpAXMP3C
 m82moGjFyAjq/j/gTCnIM8HQv5N3fbcbwENuOZScd6t+2dM=
X-Google-Smtp-Source: AGHT+IHeeBErZTyQnGYAxaPoooBEbEL0PEtOTstalj6pqyv47JGI3KxfLx48eRSlaSp+GoqYy0myjA==
X-Received: by 2002:a5d:588e:0:b0:385:f16d:48b4 with SMTP id
 ffacd0b85a97d-38c5209715fmr23823111f8f.40.1738680230766; 
 Tue, 04 Feb 2025 06:43:50 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f492sm190958235e9.38.2025.02.04.06.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:43:50 -0800 (PST)
Message-ID: <64b537a9-b41b-43b6-b1b0-14416d24e45a@mind.be>
Date: Tue, 4 Feb 2025 15:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>, buildroot@buildroot.org
References: <20241101120733.4136790-1-dungeonlords789@naver.com>
Content-Language: en-GB
In-Reply-To: <20241101120733.4136790-1-dungeonlords789@naver.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738680231; x=1739285031; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G+Q+FWsDGFu22cpQOXO0IrzM8cLqfvKjCm8WJ61XFCM=;
 b=ZGEVF+AxADxY2uG4Q6WnhIuM7gkfoa+f63UWdYvhSw9qa2N7v1hFoLxig+Jpx1oglT
 dXd9SM47cHA+gj42jP39SwwD/T4FHvWz1euYzL6gahxXAMuBcLb6GCn+xkFY3DIuW3nA
 Pg3JiuH+UaWNNrOG1MgYHlc6DLCnNrNh4Q5b2amif9dv10vRcbcMn9YALJ6ItZQfgDLJ
 LQfQ4J4lHi8VpDQXFVulmbOPrjHGt3pWMaMufwlL4d9eVR1gc+knnNcDhBp8lfz4NKd7
 LpMxfigPwGlQ0dez7W0oB8n7BKvwxNgDg/IxTVd1vMJotF0OBJL4XJrwIItN9+qO+pC2
 tsRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZGEVF+Ax
Subject: Re: [Buildroot] [PATCH 1/1] board/mender: sync with board/pc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/11/2024 13:07, Cherniaev Andrei wrote:
> and fix dd of=sdc because it is very dangerous to have exiting drive in example
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
> ---
>   board/mender/x86_64/readme.txt |  8 ++++----
>   board/pc/readme.txt            | 13 ++++++++-----
>   2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.txt
> index a9755ec58b..01a0254511 100644
> --- a/board/mender/x86_64/readme.txt
> +++ b/board/mender/x86_64/readme.txt
> @@ -11,14 +11,14 @@ Mender UEFI PC sample config
>   
>     $ make
>   
> -2. Write the Pendrive
> +2. Write the image
>   
> -  The build process will create a Pendrive image called disk.img in
> +  The build process will create a all-in-one image called disk.img in
>     output/images.
>   
>     Write the image to a pendrive:
>   
> -  $ dd if=output/images/disk.img of=/dev/${pendrive}; sync
> +  $ dd if=output/images/disk.img of=/dev/sdX; sync
>   
>     Once the process is complete, insert it into the target PC and boot.
>   
> @@ -66,4 +66,4 @@ particular needs, as this option changes the mender artifact name.
>   Using mender
>   ========================
>   Please read the mender documentation at:
> -https://docs.mender.io/2.2/getting-started
> +https://docs.mender.io
> diff --git a/board/pc/readme.txt b/board/pc/readme.txt
> index 41aec50d36..e2ba6769f0 100644
> --- a/board/pc/readme.txt
> +++ b/board/pc/readme.txt
> @@ -17,14 +17,14 @@ Bare PC sample config
>   
>     $ make
>   
> -2. Write the pendrive
> +2. Write the image
>   
> -  The build process will create a pendrive image called sdcard.img in
> +  The build process will create a all-in-one image called disk.img in
>     output/images.
>   
>     Write the image to a pendrive:
>   
> -  $ dd if=output/images/disk.img of=/dev/sdc; sync
> +  $ dd if=output/images/disk.img of=/dev/sdX; sync
>   
>     Once it's done insert it into the target PC and boot.
>   
> @@ -42,8 +42,11 @@ Emulation in qemu (BIOS)
>   1. Edit grub-bios.cfg
>   
>     Since the driver will show up in the virtual machine as /dev/vda,
> -  change board/pc/grub-bios.cfg to use root=/dev/vda2 instead of
> -  root=/dev/sda2. Then rebuild grub2 and the image.
> +  change board/pc/grub-bios.cfg to use root=/dev/vda1 instead of
> +  root=/dev/sda1.
> +1.1. Rebuild grub2 and the image:
> +
> +make grub2-rebuild && make

  I see no advantage to adding the "1.1" section. I just joined that to the same 
line as the preceding one.

  Applied to master, thanks.

  Regards,
  Arnout


>   
>   2. Run the emulation with:
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
