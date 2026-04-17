Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79BBF436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8798E81951;
	Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RCESUQhTIfe; Fri, 17 Apr 2026 15:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEC9481770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439482;
	bh=yvmEem886CMd3aCiwrG/qoi87e67Z7BWYMxUHziqTlY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RuAXwSFp10Z9iMNAvw5YYn7KVlUEp7OoOLgjoIXoP5q4zlr89K/pwI5Nj6L1s2p81
	 qvoLm8xMtAEzvT26RyfH5nQrFUmV//4MOYsYdDxIDiQxrosfp64IKc8n+yGchclIyV
	 1tL2C1Q2tDL5tx1TxOY9ujAzIEgBSeEvajUQkjRMW9JZcRAtv8Ma+zCSsOQI46ECs3
	 wqx/4SFF/t4cOFwnRRXriJIKoDJRuTXhEVon5yb92ycJmuqXRD1KrSIelRanXc6tIU
	 df35N5i31///J6pYKB27L0FfOeHbOLBZZ+kibxGR4NO22E1TVN/++D6c/shI3UvB22
	 FNyKPIVIHvM2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEC9481770;
	Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E096A259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C71F940DEC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qu7B-CFlRl7S for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1B3F40DEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B3F40DEB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1B3F40DEB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b150559bso6621535e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439477; x=1777044277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=voVlXZwupCiK71bp4JR44jaMzPpDXjy+teOmHafGMxM=;
 b=aO3NfSwXEk2HVEODUqFAgfUwcmK6fnSl1aeWbrPksQNMIw6zevFhPvpw5KoQ1g/fS0
 gR6G9tK+v8zs10mHJo7YHoLi8+KRpeJfR4im0QxZ6QNLvv4LzALJl+E1L8dQbSt6f9Iv
 J4O2mLMv0PAuER3z1PRAPNYA/vw5LB+pdxERVPXmBplz0IVDc2xyVqdFC6uEoWXqo31m
 BAH7LUY8mLgPoaKOtZoV25imeWLfynQ3KhwjZPfAKs1w6Ci3ehPYheyoQzcqrKeHCIrE
 WnMuVET5VxtOlPgLFAnLPOM2NbEqjc9s7XjAu/htOHd+It1B/0wr+P25NxVRpGAuQIF1
 3heg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9bE1+c6sTTHquYXaKRJhnGhtjlOqKI3F3HLkU3B6g7flEIYBvzrtThENPfEZMYeK3MZaREi8xVIVk=@buildroot.org
X-Gm-Message-State: AOJu0Yw3hQRvgbkoCXXBDc6xvlfA3TvTejDlg3VeXbSx3R9AdlC6lfRm
 9lJ66+CmG3D6GtTeu2XPuvDjRdt59S7sqYDDutspgQXYPTcrIsaMz+NDyJhSxa+cp2E=
X-Gm-Gg: AeBDietrpsr5Z+WvDnudxfyPC/u+jncExoLKmYmc5KHvVQ808K7jhiJk+6nv3No/5ov
 Uyn4HZfeGe61GZuyhaz0U+AY2lt9pgngc4L5btPX4Rum6S57XvbhwiKuB4PQHIMpPoo5bRklNP0
 sblhrjQSK0X+Fbw2tl91u2DKWWI1FetusjYraLoGsb0C9oF0SN/ziInu3w8JOBBkbx19kqiVW6O
 il+Dgblcd1DqM7XFusTIEmBd4VcTqLmTPZ8myIUzJ5bcbunnvrf7w1GcaAqjWvEm6jEKVSm9SY/
 xUlbsxpdKk7IZbf90ZxlZ4SojJApKrWsSxTtbcu2dIoHhHZXDJj+4/amCSJZnpiGtba/yLRcwv/
 1UQGj3oxC3lsjhzLOJD4BnRPojEuDejh5aLsXQgZgSTk0qA39rN8D9hDxHR72FcsalkCdJdy7ho
 LzaadJkF/bjWbhu9V6s/cU+Wz7tME=
X-Received: by 2002:a05:600c:a413:b0:486:fe23:1707 with SMTP id
 5b1f17b1804b1-488fb77a812mr36935885e9.20.1776439477519; 
 Fri, 17 Apr 2026 08:24:37 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb74c789sm18612665e9.5.2026.04.17.08.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:36 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:36 +0200
Message-ID: <20260417152436.312789-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250704165437.3687660-1-bernd@kuhls.net>
References: <20250704165437.3687660-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439477; x=1777044277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voVlXZwupCiK71bp4JR44jaMzPpDXjy+teOmHafGMxM=;
 b=NX4WazR9XDhNE2ueZAPiyNbXhzpTuZRvzRWxCnXb4tMH/Z0fc2eKABgzfWgY/CiCEw
 zcxtJfs5B10joGf3Qs4DZ4yXXPKZIVZRZskWXv40Q5RuGvad9iJDImAgYGsIdzoVJ4XL
 Yn8dkk+wfMnzHMagpErKyZ4JzyhFkopj0RGpVBD0QTNx9PqiEx2Xv/svMUQTUC1tpnKz
 zkKaJVux8PVct/WaqPgoRGnvBcWbltTXHqCTGmmvqN/aIgUbV2SYyGKMkrfvMxqbzQ+j
 BdxFG99R6wxmfKun6dlTKas6k08A75r1osyx3JADRFzOJMd+uhZxp0fS31A4v881h7PW
 YvyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NX4WazR9
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.5.1
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
> Fixes CVE-2025-4575:
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 9f8b23005a..1675d72fb2 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
> -sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
> +sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 5e785e1bf0..f3521b3cf3 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.0
> +LIBOPENSSL_VERSION = 3.5.1
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
