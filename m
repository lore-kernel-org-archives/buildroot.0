Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F82C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 049A980DAD;
	Mon, 17 Feb 2025 20:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qydJcAa22fD; Mon, 17 Feb 2025 20:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13BD381FBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BD381FBE;
	Mon, 17 Feb 2025 20:54:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2947DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D6181FBE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JPZ08U500IT for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:54:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F2588209B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2588209B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F2588209B
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:54:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38f2cb1ba55so2652372f8f.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739825657; x=1740430457;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RWBnZazajV5Hz0TgPtXjwTQymrZ7hkISXKOf1Vm3pwA=;
 b=V72hEbUKy6QEn+zzf0zdtjpqqp5Cs5f0qTp0iJEXfRKjAISL7cf8NPfxUPDJXj7MTY
 K5IOOPKb7tuQJLVVZcA5X2aa2HN9TiLBKQq46Wpdxbwtkpf+rlb1cyQf2fR18uBBCJl5
 iXki4cRgq2yEeaOFVxwhlSCycYYv2c80XicmFJxrF5nG+M+Ga3c7SADCfpQU3jq70qCY
 QiU5S1Exms+YJeHbvPoGqYtYnJ+AZ9rNdYtem0znBgrzTOz0C2KZmirtIzK0VEaeUAFH
 sClCkm6RqcugCPzaq05MMSoR3YhGlcrgvFmRAahRrxVzWt9pnIZMsgnXEWWmrGOwKoFg
 D4xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGB5jJvRWUn8VfecpW4uK0H9s3wbRG7tGKVfEV2FlMTV+2b4X6TGiL81qLFE9VuiB3BtdB2D3s6pk=@buildroot.org
X-Gm-Message-State: AOJu0YyENjA2NQ3bpzaqub+/Se1Di8KJE3S6RW74tSj97M0b4HiDV9v0
 2+D6DzuGjoapF8dsICUfGGHb6K+jguEUh/1dSzYJOWjaHpRar0vsJ5ocHDcwQtQ=
X-Gm-Gg: ASbGncufBPVMHIJztpdoU/dFms6mGuyUA1bWPg5HUNCKeAkDyfRWHgvDFek9vDMe7cr
 LC4YeDSmV9ks/q+sqjYMK+I/UpZUn0EV2Oj+B0qIU79QLHnFZjbLCzpIGbAVgrjnzIWh7SnOQHD
 usjdtE+G7TwqMdTWsHkNnphoyLQA6QxbOQJvJwXrlB04LgB3phPR64h5Cj6elgArbLIhOf9u5fQ
 fNPN/GnUM2oHxbUP8FLZGwWF4vctsOwF/Bgtcjk8JpOkAfdmn40ILeTht2RYtHilyZJ12PuD24q
 0E9PqHh7KkPAGDgddpOBWi03CzVjnMAebU0K+Ku8RCczxJbVLW5V+ot40dIhgBtf8MZ68jCPgS5
 U08/1FJsJRJbZbJk8nKmjOXEbhC+d2+YZ7On5prKQBHUxbQ==
X-Google-Smtp-Source: AGHT+IHpDh3DmT9iC+Z49BuUI8Vk1LoRqTh6jTdEIbr56/p/GvSH6JULg128WZWDA/r7NtxXXaSsIQ==
X-Received: by 2002:a5d:584d:0:b0:38f:2a5e:ec5 with SMTP id
 ffacd0b85a97d-38f33f2f341mr7673892f8f.24.1739825657485; 
 Mon, 17 Feb 2025 12:54:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccd2csm13492926f8f.30.2025.02.17.12.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 12:54:16 -0800 (PST)
Message-ID: <d0b96b79-52ad-4893-871a-025127a7e96b@mind.be>
Date: Mon, 17 Feb 2025 21:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
References: <20250216170350.397879-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20250216170350.397879-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739825657; x=1740430457; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RWBnZazajV5Hz0TgPtXjwTQymrZ7hkISXKOf1Vm3pwA=;
 b=YHouxi+GDT9CNMNGp5R4xP9Gcu9mv0FmEjCjVFyXNXI29U4uYcBs4ImVeh304aceMb
 DMTWohD60PZokDYI94ik2OMQrGxvS3pIXjlwJo07OnniKDsGrlR1sEYFxM6XX74XntqP
 s1HMNFptn1UYHduFnP8+ZggbuzNbsX8W3UK+Ia8dl9Bex3LDw3yYjN2VqZ5x2QKgUcw9
 BClc83QV1FY+r9tXYJUSM92VrYQt53xHSlkuFk7wsQ/5d7lVa8HFcncL7t+M6VvxN3lH
 4mHiv1xpDF7f9yUzUjGjcc94KHRc3XL9dbE0uwJ/sL7IppHvuHhxFD0TM3f9AcuOXF3K
 KVdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YHouxi+G
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow explicitly setting
 of docker/podman/...
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



On 16/02/2025 18:03, Yann E. MORIN wrote:
> Currently, our docker-run helper will decide on its own whether it
> should use docker (preferred) or podman (fallback). s introduced in
> 9a629f5129d6 (utils/docker-run: allow running with Podman). In case
> both are installed, it is not possible to exercise the podman case.

  To be honest, if you have both installed, then you probably want to use podman 
because most likely "docker" is just an alias for podman...

> Allow the user to force the one to use, by setting the BR2_DOCKER
> environment variable. If that is set and does not exist, exit with
> an explicit error message (rather than rely on the failure when
> eventually exec-ing the specified command).

  Unfortunately, in commit 8aad67f1575f1d8a9c90ccd70302e9a6823cf794, _someone_ 
already introduced the BR2_DOCKER environment variable in brmake to tell it to 
run 'make' inside the container... Its use is not incompatible, but it means 
that if you set BR2_DOCKER=podman in your .profile, brmake will _always_ run in 
the container...

  Regards,
  Arnout


> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> Cc: Julien Olivain <ju.o@free.fr>
> Cc: Fiona Klute <fiona.klute@gmx.de>
> ---
>   utils/docker-run | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 849df66d54..27c169db72 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -35,7 +35,14 @@ declare -a mountpoints=(
>   # compatibility command.
>   export PODMAN_USERNS="keep-id"
>   
> -if command -v docker >/dev/null; then
> +if [ "${BR2_DOCKER}" ]; then
> +    if command -v "${BR2_DOCKER}" >/dev/null; then
> +        DOCKER="${BR2_DOCKER}"
> +    else
> +        printf 'ERROR: Command "%s" (from env BR2_DOCKER) not found.\n' "${BR2_DOCKER}" >&2
> +        exit 1
> +    fi
> +elif command -v docker >/dev/null; then
>       DOCKER="docker"
>   elif command -v podman >/dev/null; then
>       DOCKER="podman"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
