Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCDEC021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 01:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DFE406F7;
	Tue, 18 Feb 2025 01:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMgv87iwjDpD; Tue, 18 Feb 2025 01:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C94404BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C94404BD;
	Tue, 18 Feb 2025 01:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF99968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F118406AA
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23kATJJFiL_x for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 01:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C71240569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C71240569
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C71240569
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:52:56 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-84a012f7232so172548439f.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 17:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739843576; x=1740448376;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ls+h8lg1rpqiTrZSK4esdhkqwdDfRAUC8NzLfTjFqVE=;
 b=NkOW70yI0gGRkVimS8C/DoCEXRpDucKBuB9lvdgf/fhqwafICgQ+yNizyqivt/aRsi
 Cp1n/od/OcdZG6yaIW1iS3laT7xvi/UB7psclD4r0akrwxFFzp2adLLbxC/ip1Ni+Teg
 6TqSWINwqN9nkD41Q9B/o6LKhuD+7F/O35rKtXubJh2SfZGh/c9f1kxm0dMkMhKgZPAa
 NO2WInAxvqayt8oIHWaA8WLXZy6t6Pgz8HMNtPIrqzH5CjzZhQeaO1QW0z4MyNcEJTcE
 rCxM5Oq3b2UgmyJbE9mgIzth4qX+x6hs6Dys8ABlC5CBsUBi0FUBgFPvYNv4+75r84Ki
 qlag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB/41feu/9IJeFI9JUBdIuoVVS6YTyA1Ff116uW6eWfMa1Ko3oLEEHPfv538w9smy/Wb/2/osc6r8=@buildroot.org
X-Gm-Message-State: AOJu0YzG5XT6ZdEhdkBruvtZbxS3Hx6Hog3yGz9e68enpvSAAA+Rzpgj
 5/qiMoCQ4seH/e0iZ92kpWQJIMXuobybfjDFTzsycFFWZ1l5FzSk
X-Gm-Gg: ASbGncttRbzEQr1S5O6VJRXzBnX7Xk2Hkb7Lv72X8waV0iUcWWqYF3ULKlXRF+j/riT
 aEmGFYhXdTqUkARqwlaS9s3elMQ0JvIBgX/4uBcAVoorddkB6tHaeGkie3TLncls238TBurxbqU
 7NaqcfBBNhEy/zsV+C8qBvEuXTC6Hg0JN46FvG7z9mLGjYuskwlM4kcuhYjIuM4YfyULEgz5sug
 tYq7IIi56r1oHJ8x+eG6BojM7Kaja4++Zrvf986j+Zil4l60x5C90/ywsdLJb5GbBvwwEXx7J+w
 m5aLRvU2GWOaRXOJZ50h5aqDQzrJPReONVi2sl3m8WBuuGVrLXCT9+C1LFi9jO5vMQ==
X-Google-Smtp-Source: AGHT+IH2utSq2ip61OH5jGFNBYW2XIqwIKdeOnuxrMV6NTWG8QLl6BV6Kga283FAaUi4x3/W45I4dA==
X-Received: by 2002:a92:c7d3:0:b0:3d1:54ce:a8f9 with SMTP id
 e9e14a558f8ab-3d18cd2214dmr135502155ab.10.1739843575800; 
 Mon, 17 Feb 2025 17:52:55 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d18fb66631sm22757385ab.59.2025.02.17.17.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 17:52:55 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 17 Feb 2025 19:52:53 -0600
Message-Id: <D7V72NOXHB0V.3SJ29YLJ8OGSF@gmail.com>
Cc: "Brandon Maier" <brandon.maier@collins.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Akhilesh Nema" <nemaakhilesh@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
In-Reply-To: <20250111063753.769689-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739843576; x=1740448376; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ls+h8lg1rpqiTrZSK4esdhkqwdDfRAUC8NzLfTjFqVE=;
 b=nRp8zIjFK+wmIQZ+K9PzUNHT93CLRdSfCaAnScEgnXAAIEJuQT9nNo2A2TPHhcsOCE
 jZivRWtVYHcbLyf0dgt6m66jZikOz/SiY458n5ozy9wSwFoYxqRE7jysivpb1N08NYAk
 u1EgFz/G5nTwuIXEU1yYXRYKqdrzH8C2APQ4PO6FrsNI74DVMF3qE+UVsN1tFlc+HWgv
 MKUjNeCFRXwlY1AAuyc4oKxPerXMcL+RMD+KsrPwW0NjIRFo55ITvTqAtTS20FF/E466
 EpKBt3Zf2CVmrJvE5nNvzHBBWmuHJVpJz9NghzCjQQKzd8nErBx/K/dnr9nHXBTk8/ji
 iLRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nRp8zIjF
Subject: Re: [Buildroot] [PATCH 1/5] package/qoriq-rcw: bump version to
 lf-6.6.52-2.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat Jan 11, 2025 at 12:37 AM CST, Akhilesh Nema wrote:
> Changelog:
> https://github.com/nxp-qoriq/rcw/compare/lf-6.6.23-2.0.0...lf-6.6.52-2.2.0
>
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

Thanks!

> ---
>  package/qoriq-rcw/qoriq-rcw.hash | 2 +-
>  package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
> index 1f664842f5..b9316582ff 100644
> --- a/package/qoriq-rcw/qoriq-rcw.hash
> +++ b/package/qoriq-rcw/qoriq-rcw.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  52dfb95a3d8e811609dd8a982a5c6f3ba88fac096ea8448a27b571b7c25e3a83  qoriq-rcw-lf-6.6.23-2.0.0.tar.gz
> +sha256  bfb992fcb396894874143257b53d14394ada48df0771f7edb55324fa932bbcdc  qoriq-rcw-lf-6.6.52-2.2.0.tar.gz
>  sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
> diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
> index c6cfe59a56..c536a12373 100644
> --- a/package/qoriq-rcw/qoriq-rcw.mk
> +++ b/package/qoriq-rcw/qoriq-rcw.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -QORIQ_RCW_VERSION = lf-6.6.23-2.0.0
> +QORIQ_RCW_VERSION = lf-6.6.52-2.2.0
>  QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
>  QORIQ_RCW_LICENSE = BSD-3-Clause
>  QORIQ_RCW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
