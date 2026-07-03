Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEB5C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C0BE60DDF;
	Fri,  3 Jul 2026 14:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhDOz9n8h-Hp; Fri,  3 Jul 2026 14:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD16B60AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089138;
	bh=tpDgv7uWvuIWUUkXUdxCDAO9o9rMaU/ZvdxSSc7DKc0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ua+9LqT2Kkh80rEw/F/qAPDMxce4ZHAvoUgO/9klEzZG52LuITqkceNOJHMEOav3n
	 miF0Oyl16EHAHDZ4lxXU5U/sZ8efcuMSaGG4k/GpaJ5Ug8dUT6++ZQZ1dKm9Nn8NZl
	 lh/JaPXPKPQ9vl1IJCFutW2567XfQEn9s9Eo822x2WWPHxBqAjHmmmPsi9pbIhQsgT
	 ByeepoUGd6IdCEOZ5dfaIShQZEZy3uBgXUj5RsukgKUcE3mKa4Q+EBMXAGMU6W1jWe
	 d7tGm54LEoH+UKL55tf6ruqQNaBfPFqSilE7bOwPtiv5SjL6AIlwJrKOnMIb/FvS/Z
	 wDavf1bwSkPLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD16B60AFF;
	Fri,  3 Jul 2026 14:32:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD99B363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF2B44117D
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5g04zM5i-4d4 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11F3541087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11F3541087
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11F3541087
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:15 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-697de23bd7dso826700a12.1
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089133; x=1783693933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=izoXCLPxOl51WrJWH9wSWWlg2T56Rs/Hc+M21Ulma/0=;
 b=YdEOB2Y6v5cCDNiKm1HbJci1sN497avrz49UwJPglCFT8D8/5IezFpzQ3qab+b521Y
 v7iQ8oFjhUZUFINtSya3J8JCnnSH4b9QHIKxxpUpGU8aMFSlDoapY7AJS/Bi55YBKeEt
 1ogZuc76O/KEEabYmx4SjKCWJd1Jl6z5Pwq7X/2lg9irXVJT1Jbs2sOAEri/y6Ee3gew
 nRYp6rpFbDmd4BSVQ6GDAEKoHUziESxi/tGk1p0NkaUyUlBRz4RdTA2jLMtrlluLVfmQ
 oHR4PcrhBO3b4y3DCjutR/Xx9Kuh8zMejzkC4WqCKfVBP7oiI9uKJP7FuUkYQ/TZrAEJ
 hcFw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq6kIdGRCqdhfLQ+K0849/RB0kjFRTau6zTIuSsavdP4MX5xYUp2WisnQaZcn6poSkt1KeqahaxxYA=@buildroot.org
X-Gm-Message-State: AOJu0YwQTC1+V9ct/DH8efubl+yPfgLC+aKfPvgRPRbZlKQI0DVGCyG8
 PY6jsLBlrUPbyrPIUB1nAxbEGTfrXzpl9Uc/oITwebpOosc7yTmhDGKzqZ4+e1aq8lw=
X-Gm-Gg: AfdE7cm69chhP6348YzMGOqBHPKkXmpw+UnpXL4vB3dxWirDftTcLgPRkJubt72cRGl
 SWZ/Wdza1OKxwmukfytAjG0+4Xlipzt+wGMFFdZTALKj57JYqvN/1CuaDe75yT1D1EEDnh2bhVe
 kMfUI/Fvj652mHOd7iLBT9Ziso5x/NxH3GNM/13qqlK4Dque+wZjQvIrSj3GzD5UH4TT+2HQV5s
 hu4yEpvbEmfO1kE46UEIdivnYp5odqL9CsUsVJZY6HzsrCJ/gaf+xlgGSi/T2bVbDD38GSQt58Q
 9umHpmD4Hf8IAe9gzHE5Tb4IV73xBEj2e/h6/v3IhB+Ad7JCnp4LUOf9pyJeOqIRm2JavCWgWB9
 99N+qMoJfkpbE7PwzasGOYgSet8h78tAveNYXu0Klb19mnu9x4FQdIHLdmWbgqY0q7juSBGG+vl
 ZeKx4M
X-Received: by 2002:a17:907:3c96:b0:c12:608a:8ddd with SMTP id
 a640c23a62f3a-c12ae48f18fmr563689966b.20.1783089133292; 
 Fri, 03 Jul 2026 07:32:13 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-698ace17875sm2503826a12.1.2026.07.03.07.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:12 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:11 +0200
Message-ID: <20260703143211.274381-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260410065458.1768122-1-titouan.christophe@mind.be>
References: <20260410065458.1768122-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089133; x=1783693933; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=izoXCLPxOl51WrJWH9wSWWlg2T56Rs/Hc+M21Ulma/0=;
 b=Js8PY8WVhoMjEcTV5s1R6L73ke5wpCaHbRL/qC6cHrg6w4dGkIDCRmR9iMFx9srCjL
 R1y8v4/AzvVw7E8gXkkfEqOk7Urn6iIageJSPAjY67OVjAYpUe3eIie686me/zXsOuy1
 2oocUnqzTVNaj11eBAge0VXpMaWpCRr53hAsQTEBN7IpgSVrO0GGfzM6kps6VKTa6uDL
 l5br7q5eW97qLJI3DLxJW4w/h5d84tod/RZwxHbCxWfjZIPfvAzWUE40nW97MJmOI6Pr
 qZVtxJLQ6k+qnab4QyhVOHMn1U0vXnZoTRPsSG3DHha+J+4pjY9binPUZor2B04HbIQW
 +s0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Js8PY8WV
Subject: Re: [Buildroot] [PATCH] package/cpp-httplib: bump to v0.41.0
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
> See the release notes:
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.41.0
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/cpp-httplib/cpp-httplib.hash | 2 +-
>  package/cpp-httplib/cpp-httplib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
> index eb2b77bcd8..be9967f1e2 100644
> --- a/package/cpp-httplib/cpp-httplib.hash
> +++ b/package/cpp-httplib/cpp-httplib.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  b52ecaebf0f94086c8b3305650412359d920c5267f6d9ce87f883198783af678  cpp-httplib-0.40.0.tar.gz
> +sha256  6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39  cpp-httplib-0.41.0.tar.gz
>  sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index 5cc60565c6..c4a77b869d 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CPP_HTTPLIB_VERSION = 0.40.0
> +CPP_HTTPLIB_VERSION = 0.41.0
>  CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
>  CPP_HTTPLIB_LICENSE = MIT
>  CPP_HTTPLIB_LICENSE_FILES = LICENSE
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
