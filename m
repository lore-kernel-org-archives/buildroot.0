Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E70BCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 137F561745;
	Thu, 21 Aug 2025 19:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTwJh9IS0IYX; Thu, 21 Aug 2025 19:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C7BA61C5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7BA61C5D;
	Thu, 21 Aug 2025 19:21:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 329361C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 227108472F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pUkXKvkskyS for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D06984725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D06984725
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D06984725
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9d41c1964so639691f8f.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804066; x=1756408866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nx19/DfX5Os1etL9IZsE7WenmuEl1Au+qMPzLa85C8k=;
 b=oT+9t+VNyuIApMq9FB595sQv4KdYjkALuhUVNVWc8piHP6HVaoqTFgkGkW6wzk60kX
 vSu5IH5gblNswxJT0eUR1KED6hFow7a6loPTIzSsvfGP9DEzuIH9WyzRVWkixRnX3dxN
 gsFiW7ZA7iIu5kBFuPu2KJYo9KjaLyZgF4JYfEMedlXl9/UEfkGBu+MwK+IItCQcGKWL
 +ffoZMqv5bk4M+ssiWdI0dI+1Ez4WKzupQzC/qB1mfQSCPhJibIhTlaMgJp5y3OPaWxY
 yRhwoTUjxo9O6lrntwXTBgFWPD3UTdSZc8uBwl7AHenClq5v1u9yocLGLFo9d1wNevHh
 28Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5wDa1qicIotyBfzZh8MwRTapEtbCr/P8ykddMC9QdnvMPEPzDMx9OdEgoVV9FNWMct7CFzQr/8U4=@buildroot.org
X-Gm-Message-State: AOJu0YywUjZvvAbtVItLs4Hzruw81dKnag8Nay8xR9ja9T+bCbgB2189
 h1FI5It+Rmjab5JUqdIP3K2eRokCdn75gHiPlZdw/lhlIMkrkzp4mpOviOap4JHv1W01ZmWFz5u
 0XnEY9Bo=
X-Gm-Gg: ASbGnctXk/qNbzsIbxeO2rN/s8cXBebRb0jtYewRg07Z4ENXkH3lMrmMto6cnx6d7tV
 0dGUKVhrECSZ30hKAy+tgKhOtH27Cv1pZcdMgu6T60tfxiLX/ktkiwDutTc+/iLSeVUymn/ZrOg
 VN7/AfhUfH3diCSXpOyuPIWnkDcA7GZr5BlyEP3epiq/b7/JvV+qdySdJh2n6mKva6D9dWOr1Cr
 JaSOLUWu8Qnxm9h49mdqyYf1oCpmqGsoskrX2pPAny8kvqwdrhmNHtpnb6HQ+4F7OevWH/inAD0
 wtVgvr7NKVyIApHbjics+vOANkoYypXvrZ0qnlEURBbNdWemq/HcyCYNwJb2CNHizzbWE6+jr8v
 eV/NIkGxJDQJT0cudyQz1S+ru
X-Google-Smtp-Source: AGHT+IFVxHVXss8f7NZwDomS2MRk/66WJGnXUtvKdO29keaPzvzkbnV8ndxDk4aTjFlAkN2ATL1EZA==
X-Received: by 2002:a5d:5f53:0:b0:3b9:2960:bf92 with SMTP id
 ffacd0b85a97d-3c5d7ea4c79mr147616f8f.0.1755804065869; 
 Thu, 21 Aug 2025 12:21:05 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43bc6sm12566091f8f.25.2025.08.21.12.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:05 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:05 +0200
Message-ID: <20250821192105.24112-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813212834.59170-1-romain.naour@smile.fr>
References: <20250813212834.59170-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804066; x=1756408866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nx19/DfX5Os1etL9IZsE7WenmuEl1Au+qMPzLa85C8k=;
 b=GDWEd2/DgCcKmUwb5kFoIuAlT+qC6a3NOMHdHygnZ/UR7RttYY9eN6ewU4QpQ4/kED
 AVQp5CJg1H7dmI41pV4KG6GC6ueN1wx6vGJDQ1hfeZW7Ce+Dt+MnHE/R0ozRHFl5HkN4
 ZQzytvOsJiqBTK81IhIOXodha4JN9a2jq9ZgTXSvdRSe5ACRaXuzJQno/aFJXSMq78KI
 exotY5zNjiVxfeYrsZKIXV7NknzBDCKBO+GR5/M8zmEX76UeH3JCGx2kBZxg293RP7w1
 NhVJdOrfl5saXjjI5J22O/7dbh5ORTGW3+GMvofRbTiYUrDQE+Vul3HosCP/Lc7SOBh5
 Mj/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GDWEd2/D
Subject: Re: [Buildroot] [PATCH] package/rt-tests: update URL
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
> The previous version bump 8f52d4183e ("package/rt-tests: bump to
> version 2.8") was using the latest release, so the URL was updated to
> remove the "older" subdirectory.
> 
> The URL was:
> 
>   https://www.kernel.org/pub/linux/utils/rt-tests/rt-tests-2.8.tar.xz
> 
> On the 01/07/2025 a new rt-tests release was published (2.9), so the
> 2.8 archive was moved to "older" subdirectory and once again breaking
> existing packaging downloads.
> 
> The "new" URL is now:
> 
>   https://www.kernel.org/pub/linux/utils/rt-tests/older/rt-tests-2.8.tar.xz
> 
> [1] https://lore.kernel.org/linux-rt-users/20241228114346.6020d6b0@windsurf/
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686708 (TestRtTests)
> 
> Cc: Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/rt-tests/rt-tests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
> index 3c6b6f2276..6c445fde91 100644
> --- a/package/rt-tests/rt-tests.mk
> +++ b/package/rt-tests/rt-tests.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
> +RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests/older
>  RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
>  RT_TESTS_VERSION = 2.8
>  RT_TESTS_LICENSE = GPL-2.0+
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
