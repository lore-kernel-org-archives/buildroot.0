Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A8C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94FD40B5F;
	Tue,  4 Feb 2025 17:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsiLzx-Mflpc; Tue,  4 Feb 2025 17:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D58E4109F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D58E4109F;
	Tue,  4 Feb 2025 17:34:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B4812F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B5A060D53
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoEeIkRJw8yn for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6966260891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6966260891
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6966260891
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:34:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361f796586so69536775e9.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690448; x=1739295248;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ihqb+VaYE3WxZYtLtKuJV01QW997EB3J9hGBL4xsRv0=;
 b=TryEKmrzskYRGQtNyNMkP9abTIiFSkeCIu+mw+2FmwALTnRHRqlPQGCw3rb6hk1Kl4
 TmD0/S0P0vRMNt9Ha/U/uo4HTojO+M2KABUQZj4yE+1VUeKsrS3OdIYeRElAVRbKfY+g
 UB7dXOxW84bfMarDJfiq/z8pN61MDmjH3XbsGuQ3+JDafm6r8X9ah3NQlMLHS1fJfJL9
 9qndlndmDNpd9SIWxbD5TxM0jR6sqxcjJBh2kWdj/UQxfU/mh/2OsBqR/VDKZvU0xkKb
 S5Nk7lqQBXgKIf68UkjPeyBRIujY6FfJ0Qztjl2rA8JqYb7gy2ha9gCKnNg2JOKRhsIZ
 UxOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa211mu33fsDKr2Xetc+/U31CPumD4rxHnuMWK8xuMP0x8ikZRu/13ghQc5WSUGGCqvtBYTQzchD4=@buildroot.org
X-Gm-Message-State: AOJu0YwOLKV8SCf1zZDF2KYOV+zl4k0nYktbVJBG6sIkDP2Ug/dBgG1E
 wIXWgINIWlkLJMLzNU21TNVOnSohTA9CLD1xWazQ9YJwa0p+9ZSqXnkB+m2XP9A=
X-Gm-Gg: ASbGnctVXdzU5ZBe3bVCVWGWZvJ0jKJauZFVl2zhfMyGNVmYshqJ8x/kKPOFTywLldI
 WtWXA2E1sv8DbgR43Ri5nkKtPWc5DoLIypDUB8tQ35hYXWWg9odpn9riAiEjiPDbVUYBXDoQloz
 8khppxJCBR8ZJaggaoYDJ8xSAKBX9W5UXdtxnjsSXk/Yn9Orp1BPGZfY+9v8gQIcrNVzGYXnX0H
 /SYUzB0dth4Y1pufaO8jIQvbsIoY13ckCUKd//L8HSOu0oaRqFBgoFS//WblgbcmzqvXP4rtcGL
 8JLmLF1ulodeQeXPLRbZ66jpvjRbWy6ljrjvlXAv0C12NDw=
X-Google-Smtp-Source: AGHT+IEAc8hp5Ww2TSG0/mNZ5mSWKOVJX+lFvPB6dOKAeP4s1+ZGYAXKGmhtKy/nPLuC1p5IbowCeA==
X-Received: by 2002:a05:600c:4e07:b0:436:e86e:e4ab with SMTP id
 5b1f17b1804b1-438dc4353e7mr287993895e9.30.1738690448367; 
 Tue, 04 Feb 2025 09:34:08 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244f087sm194469795e9.29.2025.02.04.09.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:34:07 -0800 (PST)
Message-ID: <b4c5c341-466e-41b6-a670-c6bd5fce38eb@mind.be>
Date: Tue, 4 Feb 2025 18:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20241105-support-b4-v1-0-2963298c1a58@collins.com>
 <20241105-support-b4-v1-1-2963298c1a58@collins.com>
Content-Language: en-GB
In-Reply-To: <20241105-support-b4-v1-1-2963298c1a58@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738690448; x=1739295248; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ihqb+VaYE3WxZYtLtKuJV01QW997EB3J9hGBL4xsRv0=;
 b=FfrtFbH1Rfciv8rx8/xv61gfnLDlf+TeDz+q5ubpmoPBdQvutKy7qLGzzWvh5b/cUc
 DJZ+pBuEL/XioBUsfb13wz/Tl+MP2No76IW35WPpEOYlihTAdcgbPJom37j2q1qnMEVb
 0YWE6Dv1SA5TBWl2hM6pgSoFD6y3+XtRZWa+qh65PHd91saZuKWmceYKAX/kvbEMv+6G
 WwJKwL8jkH1faDLealoKk5hK+IhoEFE5XkZR43fzCx3vpUH9t3Wqo5A5he0S0xsc90Fm
 KKK+Bc5cdYePr1edc5OFP+VlUFf3z10fvzwJamSDlOz+VZQzpUcetq253hgGWhvDNEEY
 sOOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FfrtFbH1
Subject: Re: [Buildroot] [PATCH 1/2] utils/check-package: support finding
 files from patches
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



On 05/11/2024 15:37, Brandon Maier via buildroot wrote:
[snip]
> +    if flags.patch:
> +        files = patch_modified_files(flags.files)

  I renamed this variable to files_to_check...

> +    else:
> +        files = flags.files
> +
>       if flags.intree_only:
>           # change all paths received to be relative to the base dir
>           base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
> -        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
> +        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in files]
>           # move current dir so the script find the files
>           os.chdir(base_dir)
>       else:
> -        files_to_check = flags.files
> +        files_to_check = files

  ... which allows us to remove the else branch entirely.

  Regards,
  Arnout

>   
>       if len(files_to_check) == 0:
>           print("No files to check style")
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
