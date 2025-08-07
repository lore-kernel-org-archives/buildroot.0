Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54B4C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5B940595;
	Thu,  7 Aug 2025 18:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-JiBttcVm6c; Thu,  7 Aug 2025 18:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEA1040596
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEA1040596;
	Thu,  7 Aug 2025 18:24:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A354C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 854696063E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmJQuEMSvMeN for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D75F605F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D75F605F0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D75F605F0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-458bdde7dedso9868105e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591062; x=1755195862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZTVn27gtukBIZoOlWAKJFfjpkLvpPs5jBhWFOTo/pk=;
 b=wPPGpyQWnQ7Ols5bjs3C7mnZSh+0FBFHgHHo+OudL9VPRVHE3hcQP78gEEfxz8UlVu
 AujUL6drVJ7rRG2yfBOZZFB6FZCPesNk/eQnQORfoTaI284zfW5PjM8njK2O5l5xJb6e
 r9gxfdIsy3kMUe2O5qWfg6nHZbgNkHubTWTakHnHMqHLc0o2ZY/klpDvsaMKeKt/CaHK
 YfV1ruyNU/XFfdmAuBy80w3FsmuDr7N8bpZ62qskp0mFa1DQHRI7/fq/rIVy32GFaKUO
 o7yQb7VX+hzJ7QOJuyry1KQooRZtnHQ5tL7ZKT865g2AGfmar1qDUao34QF9jhtClSTv
 YI8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn5QEA4Gwqpal7W6ZHk6UIVaEKistQuQ+fdW9BK4lBavanko/j92jLSDhdMFfF3bLJJxMka+e7EU4=@buildroot.org
X-Gm-Message-State: AOJu0Yy8ABrfd8gdZSljX4SDkVbDOvMr2arEe3uKTNBZe+aNAcFMh0Y9
 hOa4HzU5atPThNZRsdRuEXl7ZFPfCMYCPbIQrUbLzkb/A0NFQS8kPrye4HZ0x0NafBg=
X-Gm-Gg: ASbGncsr6HZ4sd/5tmAQK7k0tByazQUllIlvBpW0WhY1GLA/CmtNSPfOZRrRNM7w35d
 8nwHge0bAlNqSKfpiz88Afvl1TS/08pBSkqI9F2bPKrFF1XrNidyVE4Q5L2eqON839tUshdcWwS
 2DNDgRbGzWM2xcvUOinZxl1EIPRiL1LurbmW+reEBK4ElJrGkGZ29W1P00DaQUTzLUzfF2nbmNt
 TIDx38ONOfruD4Lq3j8uXZzvvnUsHtsu7fBDB8l8PP2KTelV1ydJCgqtOGnwda0FTtq60KrB9DR
 yILrENCtOe+f1sy0BkhEs5uvGy0AYEIfnCB2UFV2DuVQBZ6mvXho+2U8fTXXuWGfVnxnSBCnPDD
 l+nFDYToc4QhbGA==
X-Google-Smtp-Source: AGHT+IGREqJhhwPIXP8mBRm60XvoIbddovZaTYbHL32CUht4Lz8wtIBEHmbAON0CmboccWU192TZJw==
X-Received: by 2002:a05:600c:4f81:b0:450:d386:1afb with SMTP id
 5b1f17b1804b1-459f4eb18bcmr200075e9.9.1754591061750; 
 Thu, 07 Aug 2025 11:24:21 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dd85f423sm164804065e9.18.2025.08.07.11.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:21 -0700 (PDT)
To: Markus Mayer <mmayer@broadcom.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot Mailing List <buildroot@buildroot.org>
Date: Thu,  7 Aug 2025 20:24:20 +0200
Message-ID: <20250807182420.725070-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722004829.1101836-1-mmayer@broadcom.com>
References: <20250722004829.1101836-1-mmayer@broadcom.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591062; x=1755195862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZTVn27gtukBIZoOlWAKJFfjpkLvpPs5jBhWFOTo/pk=;
 b=Q5ykk4HXyyDao8BR72syDjl7IoRoyTJy77M0W5Uh7oyNe3RaWcuNa4FSqkiw5lWZXu
 Fhlq0y23cGWcEl+sYFfLxxqVqYJ+NuUFZg5byJHbWOARqvC7Xt6kPmkF5nSsH3erCsSK
 24baG+/++SLKEp1nycYHy4IpEul/pnaZHRJUmURhBGdRCwNyUd3wVuQGXcmPIQiqJYKd
 DXwWRPezr0UM/wzubRNQ72HWPEcZwRDXIbTzk0CnKZxLCFvGDl9+rBEtEUX668ZCu8I3
 20Mlo/H0C+2Rgaka+E7wIOi/gsIVPk+SiIlxuIGcY92MO/imn0XfIp3ZxCUecRXOuZOA
 w/Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q5ykk4HX
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: fix
 indentation
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> A recent commit introduced a few lines that were indented with spaces
> rather than a tab. Rectify this.
> 
> Fixes: 00b30f887ac2 ("toolchain-wrapper.c: get rid of EXCLUSIVE_ARGS")
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  toolchain/toolchain-wrapper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 9fb96a276a76..5b306190bbef 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -487,14 +487,14 @@ int main(int argc, char **argv)
>  #endif
>  	}
>  
> -        n_args = (cur - args);
> -        if ((n_args + argc) > DEFAULT_MAX_ARGS) {
> +	n_args = (cur - args);
> +	if ((n_args + argc) > DEFAULT_MAX_ARGS) {
>  		args = realloc(args, (n_args + argc) * sizeof(char *));
>  		if (args == NULL) {
>  			perror(__FILE__ ": realloc");
>  			return 2;
>  		}
> -        }
> +	}
>  
>  	/* append forward args and terminating NULL */
>  	memcpy(&args[n_args], &argv[1], sizeof(char *) * argc);
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
