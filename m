Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A21BC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9A140903;
	Thu, 25 Jul 2024 10:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGAtXPopxhv9; Thu, 25 Jul 2024 10:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0163F40905
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0163F40905;
	Thu, 25 Jul 2024 10:32:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24A141BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201D64057B
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2yaUohFUuXg for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B8FF40576
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B8FF40576
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B8FF40576
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:32:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-428035c0bb2so4477425e9.1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 03:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721903543; x=1722508343;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O1xOnzQKZn9vm5NiR1RK37pqFnTan3LJRdGs7zrN17s=;
 b=wpG71W0HpLBJTR0Cr/eevzzuyVqhyXgAt/um6emOYyD0siHHPATkxT0uy4Ckmk5Cmp
 4gLubvldFHTj1LVL1yS3wfmquGN+cq8+1IuoPTKRbVS4S/ef0KFuuFnF3za6BX3x+UTL
 dBZg60ZiTCCssd/4VlSRHeSGfLmi2pTCj3+kammTeXqYKkLoGv/ly6VUF2hbyUcs7+B1
 0nDLHNHG6hM886Oz5X7v4AYfwHd4BJ1bmc5B+ph1t4RuZQu2cAlSnpk0hfp9Sgdk42tI
 jciuuv6JHbNft5d9fxJhP+twRQVM94GyqhhjyYQBToioXaWCHeH2wTiZvRu6FDfcRAIh
 A1bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVcPa2vwLspmIsZ/ZSmaHUac2yE9/poP+kOkVqikGohMKcXjBv0Z3WgdQfpfe/vVa1ZrsCiK5WFR5/Pl0kD9vboLd6KNL7mg==
X-Gm-Message-State: AOJu0YzsldGdhq93cH7xYvuFEd7f9OkSkbhDI3yNHR38r4idp+4xnn3E
 4ckKilrJ3arFy4CaVEQg2dH+9G2bO76VJSmnMKvusbyO0jjgT65Qbv8MavuvqSIPVg==
X-Google-Smtp-Source: AGHT+IF8U1jbevPkaY1MDhuX2WWB8fBh0iEmpPEGXf8U3zJa9chpShxWkS3aOxnaOe9aO5Xns99apg==
X-Received: by 2002:adf:eaca:0:b0:367:8e57:8 with SMTP id
 ffacd0b85a97d-369f66f08a3mr3442130f8f.19.1721903542801; 
 Thu, 25 Jul 2024 03:32:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36861b70sm1732621f8f.102.2024.07.25.03.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 03:32:21 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 12:32:21 +0200
Message-Id: <D2YJV2JX4QK7.30B00P4Y8G1T1@gmail.com>
To: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 <buildroot@buildroot.org>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240725101711.2443524-1-gael.portay@rtone.fr>
 <20240725101711.2443524-2-gael.portay@rtone.fr>
In-Reply-To: <20240725101711.2443524-2-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721903543; x=1722508343; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1xOnzQKZn9vm5NiR1RK37pqFnTan3LJRdGs7zrN17s=;
 b=av0Tx0YLV585Rcv9tGHUbPFIcR91SRCHpFENmjbA7C5y0WypBW5Cbp8WjBeJIYJlU/
 nyBr9ba36AfJNHMrt+qg5N/NN9GxSfW9pyvODWgF9xCyprGYalPVBpIGqpi8wbrPqxBY
 H7piPxOUOOVQAkZMepyCg8QWxGNZi91WtV6fNMzeX79Gp8h7c3Prt/0lN3znw20gUZ1e
 YXoT5auyMIqA6GtmEq5653QcKy70VJry1j0q+7S5bwl0cMsAExscxqW4+QsNOvsbqU8+
 8343v4JHSUZYhdaKCdZ9IBtAuTeOeIDHRi2a+2+tgs8z+ZPHiYY0HSLK7Ht6xFNM7q7L
 w8pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=av0Tx0YL
Subject: Re: [Buildroot] [PATCH v2 1/2] package/rpi-utils: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Thu Jul 25, 2024 at 12:17 PM CEST, =?UTF-8?q?Ga=C3=ABl=20PORTAY?= wrote:
> +comment "rpi-utils needs a glibc or musl toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC

Hum, the depends on is wrong.

Thomas, I will wait for the bootlin toolchain rebuilt and re-run
utils/test-pkg to check for new errors.

Sorry.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
