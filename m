Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77870FF8861
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 09:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283EE802E1;
	Mon, 27 Apr 2026 09:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKSqESXTFsC0; Mon, 27 Apr 2026 09:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1899785520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777282786;
	bh=Epkn7rQb7ykMQjy/iAsLmDbLiTL7so7MXhKAZS4WIa0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZD4a1O0uvWsefY4kW12q3R7wdxT+X7H/z6Skxqnv8BRc/tCi7+BHfLvD6z5SYyEH9
	 xFnZQTflWyssSEo6O3attQUkxssA2MDd5XksRKuW9GBMkLW+FW2JWdMwBOcgIkE1iG
	 MhU6a9/NGO3Q7BQERnd/IwPaI4ceYNwBQuR/1r1TDhe2KI8VLnR2CIpGlDjuXtiPb4
	 3C5PWFAafl1Yu3Fk5pDF9yzQU3y5i33AHDd8GOf9tee4F4l6hfAdAiDSk1J2Sj39AS
	 vQIvJKc+gpOFOgGVv20Amx/NA8zNueK+tg4GaAWNn4j6SKO557pYYH+iDlOKqKKSLr
	 YIpfxT5TGscgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1899785520;
	Mon, 27 Apr 2026 09:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDE581B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 09:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFA384056B
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 09:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-V3-YMJasdb for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 09:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B01540210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B01540210
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B01540210
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 09:39:41 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E519A2C82961;
 Mon, 27 Apr 2026 11:39:38 +0200 (CEST)
Message-ID: <fbbd09b2-5279-4c1a-9379-8b2204b7332a@bubu1.eu>
Date: Mon, 27 Apr 2026 11:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260425121200.810180-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260425121200.810180-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777282779; bh=kYigLIL8KcuaoYnAEhNKx9jGKI95YOAQnTbqRRHTh8M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=t0ZsER2B/tHRBlWD0OGjvc/ab24LO/dAquvta/WDHbxhtIh3pPZv85t7MEj1fBOil
 O8FV/EbBkAQjNMAZEGnl9JEE/7MKe1CqA4meFZNkFCt2XzPNsWt3znEw0IIjQGIacB
 zhWz37NVOAkX9AjmdQmjpSPxQLGkSjsFC1uRjjldhpzahu6VNFzTv0hgSZMtvA1eYk
 Zye88bdG78/v6zCZPVKhbkM8kQISUulJmfOUWt8Z2sy6RlBFJyUEvsZyMy7gz6qW5y
 gnv4+ht6if5fvvYwAS52lMhufJWm5MGp2gd4whUGjUCkEmjq3a+XOi6VpvHrHPTqlT
 k4Z0CODn6ZcQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=t0ZsER2B
Subject: Re: [Buildroot] [PATCH 1/1] package/python3/Config.in.host: remove
 select on BR2_PACKAGE_HOST_OPENSSL
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 4/25/26 14:12, Fiona Klute via buildroot wrote:
> There is no such option, and according to the commit history never
> was. If BR2_PACKAGE_HOST_PYTHON3_SSL=y the build adds host-openssl to
> HOST_PYTHON3_DEPENDENCIES directly.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
