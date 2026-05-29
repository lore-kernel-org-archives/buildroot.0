Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21321CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3FF615C1;
	Fri, 29 May 2026 08:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zlcdj31qbnlB; Fri, 29 May 2026 08:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC2E615B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043429;
	bh=wbomTgbKEmhX3UlVwHxsGTDL1KcUWxKxXzRFTZ492NA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KJd7gu+hGagufGgxjaMqVGx8s46yFLYzo9c1G74QC4y9xHuyARsT8CuJXzVrWUpxQ
	 kYxY3EULUdBhSKMx4MIlaUrNn8NTJIrk5Wul3wbAf4W0Gf7t8aROvhqRzFOGnFtaQ3
	 cbTqRMI28GVqLoIRn9XKUyerxKuAVgP8VtcehyF2r/nVTf8HQhgPymSBZh6aiPXVM1
	 qb/XdsJk5O0iBd7uN9cVbzT7NqE0ncI7r6FMCF08/wizUFKGplfJ9jE75DLK9ggeJ5
	 GRv0gbC26P0Gzmthp8APFgjx1j9mkDV4fv7gN+SX7KHtUrSaQag2Ue9w9hHl3KcNJl
	 LKC2BvwPndrNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC2E615B6;
	Fri, 29 May 2026 08:30:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E728028E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D57E6842DE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7BZG2H19-Fx for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCAD9842E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCAD9842E8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCAD9842E8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4909def6a21so1451565e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043417; x=1780648217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kGEUv1fmPUL5XxDqVY3jh1LUhZxKqygBM4wU62YLl9Q=;
 b=rLkZLkd4wKCWIoXjj38LEuczAKj28K0r/KUWePom63iyAjyyobMAR/1j9iodtdhH0b
 Y9IOMzXRj9IPjrhKjuvrH+B3+KaxMYWZhcrYssJyra10Lywc7oLY0RSHIuy4YTRWqJSx
 HnQWKY/0lrJolcZobQ7uGhE5WUuUkuX/q/g1o56VNdsbBbRk0lhQs7PUXiF+hH0eIWD/
 3tTBMjebTmiUqcUOn9dQUkVNSdvxTGOQtfERBv+Vf7RzuTwd2HZKzBQ0KvfR4Nv/4GAO
 K74y4odOVFLzMG4REbd/6ImZkp8nu9T2fLGNSkUXGqagMFdfzmuPLFPsvd6MZF4UHBlq
 AkIQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Gr3X8gxI5AwbI59Zj3bA5EFfZ7DqJAGa/nyUT5Kb1nd+S6hHbcpyzEqx1d6apoq94SYvgUZHqens=@buildroot.org
X-Gm-Message-State: AOJu0YwDFe38gLxWZy4218WM9MDL3DJvAuPfnvx7cv6ZIUf3Iu6it2Sx
 ayrhOsYY7BvQvrRCZee1fpsvpvqMHr8FuEi6CYGe5qUAyoWsmKwg61iQAjMjLTBpCvonw46zUVU
 mYi7Y
X-Gm-Gg: Acq92OED66Q+6dBIOf389K0H1hEMUNWOmSWIcmp9ocyyMYNqlFb2mWRCKRpOAnqA+nY
 H8/qvPQSeSToc/6BirjFb9miSQzAtaeMwYsLlse6Tcb/KFPszp39NhIE3mAOHLqPpExk8i11BZ3
 zzEPcSNN0FtZo128LFSpq3OzSTubyTOrYkv0WTiYkDYVXtyZ8FW7oRVd13I1GWGpZlp3tjIJ42s
 pZ9c3qYj1bC9sYYda2CBmxUrs5C/DoD/1696LbtRgTGNkGtFZ9y2T/lM1CXA3mCRcuNCNT7FX9P
 QeZ5IGFn2HjbHZ/CCwRveqQMCsNTDne4DKe2MlA5K3VQ0KpfYzeM8bRf0LolHCJTy5se2e4Q9c8
 1bn5/Lrxd+9OTxJv+GKyvz3aSdzhZvHPGK8oqUiJlekiduBpQaBf+d7XXN8g9wNW0Z72r7CsJce
 LnSUmeN5znZe0+g9nBMVaSSa/XdVWa4o4cM+2Cdz2hT8FLzkDSSjPZwkqNkg==
X-Received: by 2002:a05:600d:848a:b0:490:4e3e:b483 with SMTP id
 5b1f17b1804b1-4909c0aa276mr19451505e9.22.1780043416798; 
 Fri, 29 May 2026 01:30:16 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12f4d0sm9857085e9.34.2026.05.29.01.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:16 +0200
Message-ID: <20260529083016.59267-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512140610.52172-1-bernd@kuhls.net>
References: <20260512140610.52172-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043417; x=1780648217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGEUv1fmPUL5XxDqVY3jh1LUhZxKqygBM4wU62YLl9Q=;
 b=A5opgNP4jyoLl1Ks3QNtsoyAV2OunizAmSRQ5QIP4ZbC2gHaSGH6QfvpanOFIkZn5a
 VLOVlm84lKjSoZgx3a/+2ksOXcIkdB9Cm3sntZ5Ur6lG8GATK6oWIP/TjDO2i+5hNQvr
 VVapPS8cYxYTyOKv8dHRR2z7/rspxJ/E7tbMWJfwWUCJOHE9Oje/Kxcu9wEEDuvzrYrR
 rSm62aT4K3XVwwHH0t9vENLOqIVZwIE7EsHKNBeepVHPAi3z5xyn0vrkQvfzeJDGZgve
 y6ZU3qo2odxm46vlTedxIQlVv3ylSXU40X0nTvhol+UJsYMTSw94RMgj+UNdowZK0t8l
 aQNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A5opgNP4
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump
 version to 1.0.2
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
> https://github.com/uriparser/uriparser/blob/uriparser-1.0.2/ChangeLog
> 
> Fixes CVE-2026-44927 & CVE-2026-44928.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/liburiparser/liburiparser.hash | 4 ++--
>  package/liburiparser/liburiparser.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
> index c18df8eb98..ad5bf40d47 100644
> --- a/package/liburiparser/liburiparser.hash
> +++ b/package/liburiparser/liburiparser.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.1
> -sha256  acd18cfb14d1851705f863f7a625be693fb3971fb85d4996faa21147f0315fcb  uriparser-1.0.1.tar.xz
> +# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.2
> +sha256  7b2496f9622b4b201186a3d159d278605f1fb7262402a10cc1c0824889798b00  uriparser-1.0.2.tar.xz
>  # Locally calculated
>  sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
> diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
> index d8dcc22063..9d1b9a1aac 100644
> --- a/package/liburiparser/liburiparser.mk
> +++ b/package/liburiparser/liburiparser.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBURIPARSER_VERSION = 1.0.1
> +LIBURIPARSER_VERSION = 1.0.2
>  LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
>  LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
>  LIBURIPARSER_LICENSE = BSD-3-Clause
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
