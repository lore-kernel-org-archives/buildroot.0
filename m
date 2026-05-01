Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C4EFF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 08:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840EF855FA;
	Fri,  1 May 2026 08:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vf3WpWM-qdVy; Fri,  1 May 2026 08:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A43E28558A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777624746;
	bh=fi9J7i3AEgBiIkqQgI8+DzTbEQTb+jWkYy61rm5ZAp0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mf/sOtuv4FKvnV6TavRpz7wj7EVMlJvuI7kJy40qNVX3WNYyMiswdAshKaAFQO/tq
	 x4FueYWligltjffTy4JB6bU2Uj1WIYBp/oWNm99lPaHzMsZKlFkQ8vafGbSzKEqTBC
	 jSu0KbUAy2pRjJ8KXoc3ZUYGLw3LVlwozI8aToKsEOk465NLtWlqAVY570u6Jl8F0k
	 JwZ9q/OXSw18xXNm22EIWR8QF4iMKQBhb00mAwh6QkqxlfHcDZrdpCq+kVb0MzcMMD
	 iFY2Ov4FSI4zXibpCSk0v+YuxzkY6y8BHseapruYrCJKHz0dNXUZoHfv4djiJnODs/
	 zln7XyAHxNkcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43E28558A;
	Fri,  1 May 2026 08:39:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6063127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 08:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABA2541003
 for <buildroot@buildroot.org>; Fri,  1 May 2026 08:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgbP-IApQHWd for <buildroot@buildroot.org>;
 Fri,  1 May 2026 08:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC23840FE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC23840FE9
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC23840FE9
 for <buildroot@buildroot.org>; Fri,  1 May 2026 08:39:04 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:510c:d018:eae4:1043] (unknown
 [IPv6:2a01:e0a:12:eba0:510c:d018:eae4:1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id D69A0C00D2;
 Fri,  1 May 2026 10:39:01 +0200 (CEST)
Message-ID: <a77076f6-51a5-4cbb-8ad1-5c660208e9f7@grenoble.cnrs.fr>
Date: Fri, 1 May 2026 10:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260501062316.1942112-1-bernd@kuhls.net>
 <20260501062316.1942112-11-bernd@kuhls.net>
Content-Language: en-US, fr
In-Reply-To: <20260501062316.1942112-11-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1777624742;
 bh=mUYxygus4Pd7MH/R1NG66QcNDlf9JtVnOfhhCT6tWrk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nE1x6wRCm2hxA/c7D0YD7gAAr3LFx2adzMmLWT/jC0ryWFgadedKNopUt2TnusZ87
 er0NxqvVCZtvGxYU2KkOneaReYbX0I7DDiAbXfZgfbBjYnCgrrwbN1psosJ9TjMl7v
 LLQqD29tcCX6xUOD+hsrRLH1cQn6IQNvUAwd6GIoDcMneX8qrHnaIMDoRhGg/62bS1
 BlVMuLSehbzabNpPtYaU5Q88wT9cN1cDvWg0aHqL+BHwYEvJQrmKoGaPmd+Rs6dP25
 3N12GMYlNk7rfD1JjpM7BUS8R1S3J11TX4MCsENhS2Eoo3LXTC33Svt59UexnUR0RY
 lxH/z7wHGGXgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=nE1x6wRC
Subject: Re: [Buildroot] [PATCH v3 10/21] package/cups-filters: Fix build
 with gcc 16.x
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

On 2026-01-05, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cups-filters/cups-filters.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> index eaad301c6d..2c682b92f3 100644
> --- a/package/cups-filters/cups-filters.mk
> +++ b/package/cups-filters/cups-filters.mk
> @@ -12,6 +12,7 @@ CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
>  
>  # 0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
>  # 0004-Updated-code-to-be-built-with-QPDF-12.x.patch
> +# ax_cxx_compile_stdcxx.m4 needs to be updated for gcc 16.x (C++20)
>  CUPS_FILTERS_AUTORECONF = YES
>  
>  # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch

This looks to me like a patch only adding a comment. Does it really
fix a build error?

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
