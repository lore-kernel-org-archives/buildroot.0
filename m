Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1EBD6A22F
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 21:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D2C60683;
	Thu, 14 Nov 2024 21:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eh4S12GPxr4; Thu, 14 Nov 2024 21:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79C0160678
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79C0160678;
	Thu, 14 Nov 2024 21:04:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED65DBF
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E88BE80B6E
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUOyIz6HlBfZ for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 21:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C65980B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C65980B77
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C65980B77
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:04:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso12273655e9.0
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618289; x=1732223089;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VI23hYUoS/6IqpQpdaQZ6zaJmIiXwlx3tikuxRWzn2M=;
 b=RLKI6m6Ecu08aHGeZfs7MQE3SC1EbTATk9G+BIQoX5WuRH3sOsr5hxP1oS9WEZ5CEi
 fQjO0S2t7q0fXyBjt7bOAG7sCOpo2A72fh4nvb7gPdcaswtvaEo8QJsdClmdZhff1XA3
 yf7b2WiX7z3UfUIcCDSYWg7sAcLWJ3I9bdhgnSeMkmaZ0KD3V0EezKpRpl/mssxcAa8Z
 tIwP+TKg79ceuLqjwBAsElggFKKtm9y0wyJA3iySWVzfePGD/ziSzmdhaDPEdW2OG7IT
 /eQc3kn6Do4994Mz3PfC5UjuXTr5+T7x4hNgrq6D2Ox5Vdb9remSESd1vZNJlnF5JqC4
 7FGw==
X-Gm-Message-State: AOJu0YwpGAPM+9oeis66FlV+Si7iQSMLfErjRahjgWowpGW+KluNHjym
 bkIMlN4PTP5lgRdqSNfrs7YKc4QDoVB2yK8BS9UOjwJc8flM48EY
X-Google-Smtp-Source: AGHT+IGHe6e/23MYIWxPW6t4bB1kHtXU6cfpn+jQ0JTNMJN0/8tT8jighxmcFpaXWGC6aw84wmWmtw==
X-Received: by 2002:a05:600c:c8f:b0:42b:ac3d:3abc with SMTP id
 5b1f17b1804b1-432df78f3d1mr1753955e9.24.1731618289263; 
 Thu, 14 Nov 2024 13:04:49 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da2800absm35539715e9.25.2024.11.14.13.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 13:04:48 -0800 (PST)
Date: Thu, 14 Nov 2024 22:04:45 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Anssi Hannula <anssi.hannula@bitwise.fi>
Message-ID: <20241114210445.GA372474@pevik>
References: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731618289; x=1732223089; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VI23hYUoS/6IqpQpdaQZ6zaJmIiXwlx3tikuxRWzn2M=;
 b=k1dEAaqEDM1PvnXdVyyqYrwFzlNxgampdydiSYdRfbZZDWPPDZ6V05tSOEctDPH6xf
 bE5T1M4DrxalSZqZpQ9tx2T1b0GsS8VtazZmlZb2j4HGYsvrQdWeI3eoKHQKfvYg0Ybs
 xf68RidKYCi1dCUrk5yYomVwFzbOiWlHhsU8dabQ+ro9k//ZnUM1iq4pgcznVkt5wlSB
 KpWkHxE0tqEd84JW+0h7F8UdiDOTSqqRl6jkEghRIMzWi9b8ziup1gPU2YIO14ORaA78
 mCZlm+EdoZ1GBPXDuwJyCGzPYkmlHn6d6xzU9uqROsaFjCVCw7M0g+2tvpqzopYdY7iv
 TmQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k1dEAaqE
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix unit
 dependencies without systemd on build host
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Anssi, all,

> nfs-utils configure script uses "systemd-escape" to determine the
> rpc_pipefs mount point unit name in the non-default case.

> If the host build system has no systemd this will silently result in an
> empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".

> Fix that by depending on host-systemd for build.

> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> ---
>  package/nfs-utils/nfs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index b757e3e51d..9ea3bae79d 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -79,7 +79,7 @@ NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP

>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
> -NFS_UTILS_DEPENDENCIES += systemd
> +NFS_UTILS_DEPENDENCIES += systemd host-systemd

Given that majority of the developers use Buildroot with Linux distro with
systemd I'm not happy about all of then need to build host-systemd.

Is there any better solution for this? If not let's fix the problem with
accepting the dependency.

Acked-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

>  else
>  NFS_UTILS_CONF_OPTS += --without-systemd
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
