Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E10E9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296DB61242;
	Thu, 19 Feb 2026 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RA8lw7CQroFU; Thu, 19 Feb 2026 17:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC68061228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522010;
	bh=bIPfXosODM1Gx8Wpa2c8dEHrYgE7a1p7tblHBUxRI54=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MTkHj7aH8VqLFZNRxD7yIMcUBLfImpaVamosRd3CIHh1MmdJK3WVyUARywj5AkmNv
	 NZpxjm45y9aZpBSOek8LeB3FH1j51EGIq2qCRbKpOpaOq6XDkmy61oe7GIGbWHZobj
	 341jLZd4RXepjEyd5puP4tOcJbMcQ081Tnw3/YHimZMfuJRs8fxJ2b3cLS+G+3UowG
	 /Uee/B4wXfan2AFGKoDhwoZOk3WNLGJmM1p7BWK+X7J1y/61fZwzRvefTkqyIVLqOO
	 IL2jNSR7Nnpq+/37BDzmDYVRh3keHpwf40e6E50Qi63CrlHKatVq0eW3WTivPgIsdO
	 Tihy73F4mf8Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC68061228;
	Thu, 19 Feb 2026 17:26:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D30291CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 974E061212
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgCplg_FzJTE for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E53C61179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E53C61179
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E53C61179
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso9663575e9.3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521999; x=1772126799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9+CPA43JmnRuQZv3f8bDDNjXRvXfxoTvJfuYKgEdvwE=;
 b=eI7ezWo0hzGqxKhWkrUxvXj2fk68/22IHrNYY2kCgmrEKTrGF9sDteAlnCuPDNz1Ed
 ZBsvi6F4Wm/OoeIqL9dg1DHvkkqQbwEiJcQE8MVdqtMTqeJ3GA40CLVaVY7rXHIhF9qR
 q7c7vEjcUOmGa5C1mqwEE47QH5zct1pxSjh9sVL+sLjm6pJoXt/oY4vC1GiW7Q4nl4r7
 0ETGlBccPuilR0cvPck8eToOZKlHjUDMqEEK/Rjg54WIxSXmgEqjK0LePYzJLBQffQD0
 n10gWZEMGgGVd7TrLxaWhzHQFdF8mSK0RDDemXT30g3F93RBNvi700RTcXF3OAZGRNhR
 SXVw==
X-Gm-Message-State: AOJu0YxLvVwMbogwtGGeOOZ1sjnmtNjtROQtPzPLiDB7wk0JrCLl6/uw
 uMIADXsEGNstldoHIdyKekouWh0MoQge3h704o+Ko9d1iv1ai78KTU9spP2nvCCvybHkmsePBIH
 8tt3e
X-Gm-Gg: AZuq6aLASbenfPM9qdZfhwwzyId5264IEtdSinHh5By2NwqOHF1fGb9NmGzSiRX0GSW
 7KytAGwv3m6x81ulsMR/TQ4Jk+rfsTdPGY9jnedDtvuIc0xB1GcyCf1mYRbnry08giy4EevUPVA
 9oVE9xtjQovx47M3v9gFlXd4DbmYCuNAkFccDDQyouUQZaAs8eLu4n/2xz7wK+Gul/WotIbZBEg
 fX95OF70RnPtlVOU6oJFHMONqR7AwsttjwDx+b0fmwZfJz4lIeqgrHE13x5jpPlPsQl7ZZaJExO
 5tuMti8bwNfny/ztFmyW8blp2PlkuF3plO3ln4CLeAor7ijFup9Vf/Kl6nT9/hPdIm3PR+zS265
 NzdFNUxLIdl6+Jv5B5JetaY2HWSmameze20gIOD1OsmfUwG2WqDsH1WgLLZL21L8jeO6ULaYDjp
 yTDHFCQdS2CcItfns=
X-Received: by 2002:a05:600c:8b70:b0:47e:e076:c7a5 with SMTP id
 5b1f17b1804b1-48398a52b8dmr94706515e9.11.1771521999003; 
 Thu, 19 Feb 2026 09:26:39 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad0166sm51187284f8f.35.2026.02.19.09.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:38 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:38 +0100
Message-ID: <20260219172638.341169-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213143500.528726-3-thomas.perale@mind.be>
References: <20260213143500.528726-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521999; x=1772126799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+CPA43JmnRuQZv3f8bDDNjXRvXfxoTvJfuYKgEdvwE=;
 b=RTNSu1LJHzgyCUZeN6RkuNGru/IyvhB3lfXwgxA4clFLFAYxJDEGlfx601rFvIwIJL
 j7KfS7ybzwVG6j5PXu0tDjnDzS8HPDP3hlQktleehyGrIOgAWe0lZ7tOaQjoAAFupTzG
 Kjn34jsn58yU4TMAv8jfz3Ojg3ensGsBn7q1GuIZEHhg7j28NdeMgvRWQaUdYnncPOks
 Q5yw6BEeHsMdxTiLN2sAZ+sytE8oAHc2jNeV9KJwsp7sLZkrq2+k1edrYJuN8IyGdlRG
 OV0VvFPKhmc1jcpzsYPCtw6yoQd0sGtNCJXbXuod5nGxwUD6JT6upJ+zrAGCRW1O6yiV
 k4ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RTNSu1LJ
Subject: Re: [Buildroot] [PATCH 3/3] package/frr: update CPE
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
> The CPE `linuxfoundation:free_range_routing` introduced in commit [1]
> has a single CVE associated to it [2].
> 
> By looking at the Debian Security tracker for this package [3], the CVE
> associated are using the `frrouting:frrouting` CPE.
> 
> This commit update the CPE accordingly.
> 
> [1] c4c11c2e1a package/frr: add CPE variables
> [2] https://nvd.nist.gov/vuln/detail/cve-2020-12831
> [3] https://security-tracker.debian.org/tracker/source-package/frr
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/frr/frr.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 4886837245..04282442fb 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -20,8 +20,8 @@ FRR_LICENSE_FILES = \
>  # tools/gcc-plugins/frr-format.[ch] is not enabled by frr's ./configure, so gcc's
>  # GPLv3 does not apply
>  #	doc/licenses/GPL-3.0
> -FRR_CPE_ID_VENDOR = linuxfoundation
> -FRR_CPE_ID_PRODUCT = free_range_routing
> +FRR_CPE_ID_VENDOR = frrouting
> +FRR_CPE_ID_PRODUCT = frrouting
>  FRR_AUTORECONF = YES
>  FRR_INSTALL_STAGING = YES
>  
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
