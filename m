Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA551C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E4C417C4;
	Fri, 12 Jul 2024 14:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrS3FsbZ8ra8; Fri, 12 Jul 2024 14:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07BED4187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07BED4187C;
	Fri, 12 Jul 2024 14:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 431C31BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F2B140273
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StnNgoAF6RLS for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1AC840185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1AC840185
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1AC840185
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:01:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-367975543a8so1245630f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720792892; x=1721397692;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3/N+qbR3Fdhrx/rqCB8Km5ijcryujRvqgzYaMm+bv9I=;
 b=OwAXX3Npl5VE3cEmG4z3tbrzRJeHOLLqDjZ+AI85gOz8Tk8LWPyhqLAl1iYC6PnRLT
 0LWeYDkqKN1mGHHTaizJZM7obkd1A1nb095DPFxV9Mrn760ffiMijWdJFRa1cSgTl+Yj
 Bxver7W3GVPIAVDpQ6WGHoO71u0XcJYb/HmESP+3hEEy2qdIq4VnR7hrkx4IUniinclk
 x8EhcgADhugfWUV+6hJ3flNRXxyTKj1gIP3cl7c3uN4o3zhbqnHwK9V4kATdezuYc0PO
 moXjU+jAPATxD6sIYp2G6RDKFrX+N2f6IiXDAjf0jlqDoOpMBVgScaAwhUcrf5Dj/QTY
 qyEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNtKo60p/NHVbke3dpfnohWBrYN9juQERr4UNx/gYqYLye7IbGjFKkJH4AmL2zc5/SD+L/cuiZE2Ti3fQyeuUrbeKCxh4NyA==
X-Gm-Message-State: AOJu0YxcrESqTKamz1DYDZ6yginFtUxZBNxqFr5ySglTLVw9b+AEmeLv
 XJeRWB/8olXUeWQaFnTG/gFotuXRhT70KisqGfve1vpgOta68XVru3b60U4de5A=
X-Google-Smtp-Source: AGHT+IFE632dhee/ty8fpC+cToqfARJKuYy+fzZn2cFIP624Cs1MYixAIquxQM9RkWUiBdW0waloqQ==
X-Received: by 2002:a5d:53c3:0:b0:367:8aa3:436f with SMTP id
 ffacd0b85a97d-367cea966b0mr7137664f8f.38.1720792891804; 
 Fri, 12 Jul 2024 07:01:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e039sm10346216f8f.2.2024.07.12.07.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:01:31 -0700 (PDT)
Message-ID: <0a97c3a1-7edb-4401-bb67-b077a98fbda7@mind.be>
Date: Fri, 12 Jul 2024 16:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
 <20240709101841.1145134-5-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20240709101841.1145134-5-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720792892; x=1721397692; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3/N+qbR3Fdhrx/rqCB8Km5ijcryujRvqgzYaMm+bv9I=;
 b=GjcUyQ4Q5VYowbVful2rO0+JJTqLx0iGPNo2rGSx+yjvm826oFm7P/i/m7ecnkY3sa
 nx37S0jYMnM6IADPpJwwzww1UzLh/HLEksNF+k/KeotA9lCsIlr07g9Gx17gwDUZZZP2
 lzREBCtY3rndMQQfIGjamoCmywUsmB8e0zJSzhv7D31DTC6k3//HEm+QPxBJhlw1uLpy
 ZRa2l1hwbCjHoHls/qsBHX+5Qad1XIVP8vvAPAGqsAPNuMcKkSLmx+voJ0WZBbISdLny
 kGsh06suN7Cf08ENHQgHiJPK3xtSQMNjbyM6TZH6tuXayuLYCy3lBOn66snqEPQlnRVJ
 TJHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GjcUyQ4Q
Subject: Re: [Buildroot] [PATCH v3 4/4] package/fail2ban: fix sshd filter
 with OpenSSH 9.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/07/2024 12:18, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The filter needs to consider the new sshd-session binary, patches
> already merged upstream.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

  This also applies to the old version of fail2ban, so it should have been 
before the 1.1.0 bump in the series.

  Applied to master, thanks.

  Peter, this is for backport to the stable branches.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
> * Add this patch to fix the sshd filter with OpenSSH 9.8
> 
>   ...lter-for-openssh-9.8-new-daemon-name.patch | 24 +++++++++++++++++++
>   ...shd.conf-ungroup-unneeded-for-daemon.patch | 24 +++++++++++++++++++
>   2 files changed, 48 insertions(+)
>   create mode 100644 package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
>   create mode 100644 package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
> 
> diff --git a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
> new file mode 100644
> index 0000000000..026cef9693
> --- /dev/null
> +++ b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
> @@ -0,0 +1,24 @@
> +From 2fed408c05ac5206b490368d94599869bd6a056d Mon Sep 17 00:00:00 2001
> +From: Fabian Dellwing <fabian.dellwing@mbconnectline.de>
> +Date: Tue, 2 Jul 2024 07:54:15 +0200
> +Subject: [PATCH] Adjust sshd filter for OpenSSH 9.8 new daemon name
> +
> +Upstream: https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d
> +Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> +---
> + config/filter.d/sshd.conf | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
> +index 1c8a02deb5..a1fd749aed 100644
> +--- a/config/filter.d/sshd.conf
> ++++ b/config/filter.d/sshd.conf
> +@@ -16,7 +16,7 @@ before = common.conf
> +
> + [DEFAULT]
> +
> +-_daemon = sshd
> ++_daemon = (?:sshd(?:-session)?)
> +
> + # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
> + __pref = (?:(?:error|fatal): (?:PAM: )?)?
> diff --git a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
> new file mode 100644
> index 0000000000..597df667f0
> --- /dev/null
> +++ b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
> @@ -0,0 +1,24 @@
> +From 50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a Mon Sep 17 00:00:00 2001
> +From: "Sergey G. Brester" <serg.brester@sebres.de>
> +Date: Wed, 3 Jul 2024 19:35:28 +0200
> +Subject: [PATCH] filter.d/sshd.conf: ungroup (unneeded for _daemon)
> +
> +Upstream: https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a
> +Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> +---
> + config/filter.d/sshd.conf | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
> +index a1fd749aed..3a84b1ba52 100644
> +--- a/config/filter.d/sshd.conf
> ++++ b/config/filter.d/sshd.conf
> +@@ -16,7 +16,7 @@ before = common.conf
> +
> + [DEFAULT]
> +
> +-_daemon = (?:sshd(?:-session)?)
> ++_daemon = sshd(?:-session)?
> +
> + # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
> + __pref = (?:(?:error|fatal): (?:PAM: )?)?
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
