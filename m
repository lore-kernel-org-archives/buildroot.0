Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3078DCAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C17615C9;
	Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apclxvV-vFPL; Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34D5061526
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D5061526;
	Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85B8212D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7858440066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVxYkHAAS1jn for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 617C7412A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 617C7412A0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 617C7412A0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so1001347f8f.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831420; x=1759436220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHIs+Zla461LvOcTCITsih+VYDKtQyeDmeVd0XqA5A8=;
 b=UmRB9akaGGyLwqZOOjw+BBKey++4bkbSIf+ekOV1UplP8u9tsMy0Q7UuLRyzTgUu6x
 3nkDmjEMdF6R22ZVgx/YMlwY5VCjZZ6oLEnMBrOrFHN8xcXWLkiSbXAJLtFUqoD2vErL
 MoqySWjmY30HEU8+x3iG8FCeI+kSyY9jmalv+RUZ/lNK7mb9J8zfXMunv1wJDuCRYkOh
 oH+w9EXBZhFC3tmDY0lP1czxlFzezI5KFeHL+2/9Uv6l0+yJaTLkSU4whZVJJsOz0NcE
 KssN/DF1NodCqpmBznoWaHJ4bL/v9Zk7S6l9W9eEbE8sajE/tsLUpBVM1RXiRDjwh1Pd
 ZsKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6hUOnm8LmPsDbC5TkmQSLZGm8GwrkPHni34lZ3vP/DimmCkEEXAJ87R9PJUCTLs2UiZ2DQkO0yj8=@buildroot.org
X-Gm-Message-State: AOJu0YwbOgiv8mjba4/6+6mH9Ik0XUQWhCmfMLcU+d10vEcssKC0GBO8
 JMNXisofpVQKd29vY3AUGfWgHFElfY4fl3BbVfhA7+Y1PpD7yUh5h6vT70uxVrRoSt30Co5Hj8F
 7R2mKkMI=
X-Gm-Gg: ASbGncu7j2qBZgL8IqZkNx0AULRRk4pqgNsmTMRly111dcR08/4LXpVc67J219GKWds
 F9GHDeRZDZ4QgSYhRJT04ebhWvPpC8R4p/F0nx0v8Nh19yeuZp7NQXMl6owFuH/jAtunjQsEEPj
 c30uJgcX/bPLJjtrKFRl5uMCrRgSqlGnTVNFAaYHnUQr29N1SeZMQe4gTGnSpkbjoQ7N0lNrchr
 Zmd7L9CMxltzzX7AtMitM3zh8/XnSmUZvu2oyfDYt3u2V6Al+u06+D0zThfcIrcxZzUsTjTHvlv
 nNOE631KxxEQvjiPPePsXLkvb6d4wTZBCbU8pRhLcizbIitnanv9wwkA0mBeS1aEVPvDhMEO44F
 LuuFmExX1NqeTvbDRz8bJyaxclg==
X-Google-Smtp-Source: AGHT+IHFSt1XhzakVvj+OVJMTrq4Htzqkh5u8FZuirVySXLrufgG6XfoTM1KR2iIktrmmHfQquinlg==
X-Received: by 2002:a05:6000:2507:b0:40b:c42e:fe39 with SMTP id
 ffacd0b85a97d-40e4ece625cmr4809398f8f.40.1758831420464; 
 Thu, 25 Sep 2025 13:17:00 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc82f2ff6sm4102880f8f.56.2025.09.25.13.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:00 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:59 +0200
Message-ID: <20250925201659.44286-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920094617.2571648-2-dario.binacchi@amarulasolutions.com>
References: <20250920094617.2571648-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831420; x=1759436220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHIs+Zla461LvOcTCITsih+VYDKtQyeDmeVd0XqA5A8=;
 b=c7Pz9Pb551Wei3eIlRgq8d6ZXkzam54F50KJeuBEZNjR9KXBf/LXykJaulx/wE7B3V
 Gxlgnowf3pSFI4nU4DWAGX/lY/hwpMFAmrgBKm3Z/mKjQ02/4lZveZ0UAnYtG4VrkIam
 +YEHfd4TuF/SB9t9AebOcpJomfgxK/ggU9Ce3sDPlzO5xYLAj4/PwCt1/Edn0wgmRzcJ
 6Fyb/Zk+XP46bz5NbgiUeRf12uvV0J8bjzJnYG5jYmWAFCA720oviFdeCdAUKsfP+IiX
 RskFOWW1G1njSOt6nuBHjzZJg/cEj5SO+4/CY1MNpk4Cw9QTE0x3WN0HIClauApH/r7P
 2ocA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c7Pz9Pb5
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for atf
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
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 16d9ee892bdb..2f2a76334d08 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -805,6 +805,7 @@ F:	configs/stm32f746_disco_sd_defconfig
>  F:	configs/stm32f769_disco_sd_defconfig
>  F:	package/aespipe/
>  F:	package/armadillo/
> +F:	package/atf/
>  F:	package/babeld/
>  F:	package/iana-assignments/
>  F:	package/inih/
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
