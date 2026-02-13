Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0853EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83155421CE;
	Fri, 13 Feb 2026 19:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82lNRkcwuCE0; Fri, 13 Feb 2026 19:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B24C6421AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011561;
	bh=9tgVTA3Cqk5XC0mnNqDGSR7vM76v+0f9yS2GOKVSV7M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lKQKySYB2vOyrfCNMprqqDRfY4/85uYWNtN7tU5W2kGJMx5jOYQSKORyFkaFcahs3
	 NbqqSK5E3eKgvQpNGINZ9MyblFaTRRNKNzFuQzaD8iix2IVg0EINt5yzZFNFMeyLDt
	 E6y7C0fwX5B5N0ugJWHmEpfbhj/roRRqCSJEa3dQKdghAsoI3z5bCAiVcfCkw9H2kU
	 ZVOAAbmittZ7OgNHNtxQfBccm4zyUHmBPxli88/lTUGDOHFHTSOP2nLEKwgn45KoWs
	 a72vE3FQurUgS8Tr6lmtBvQ+woXN2rbQ9nWlQuwzHpPAY2/61K/nTU3MndCPGBiR14
	 5TJp0HqJfu9qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24C6421AA;
	Fri, 13 Feb 2026 19:39:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A40969
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5847760738
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPdNlc93kvZt for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2CD761612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2CD761612
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2CD761612
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso15276445e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011482; x=1771616282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9QMw/cFnsflY0/EPP8fCbhhaOtkPa2snhtpjkuPtFNI=;
 b=QP64dOnCed4LLVQMYEEE2HgbQrAwAd939G3wzfQqA75SboaViVEKM1VGlLXDIsb3ro
 zyZD/XtyhcleCOURMAyH0VmLPdOuBmwmpYS8NQsNKCVCzHn0r89TmZxCeraAwgkIebW8
 k0QD5q8wFT2AEwFCXkP9OqB5gGMNbiFwVkx+PtX/Kz074cf9ftFFiFYui6G7x3RE514c
 jM5kW5x/FMZieIQ16KdGgaoQcb/alDCECRcqin3W2zyGBTTlxu9g5/1has2Lq+xxpEX7
 hfSJuGLyBCJ5WOW91JrFjPJaNsmdqRgHYq25axEanEVLmta9k/takMqCSHRG+p8xnK9K
 J37w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYBjgWj7DRyjmyaeCOh0B/QxACrbkYqh4Elh+Sccs00G1VitpK8c3Ku34ihvh7Fz7jHUNHN9pfe0o=@buildroot.org
X-Gm-Message-State: AOJu0Yx1g/x/qu1hFcXLWv57rNhoaWj9EdMh+Gsz4T5gIx9G9KTFTskb
 4bSYeDex2GV9xyU81JF/OWNMXhCa9MTpJUfnNpP8l2g3XMVsQPIB+TTPiHzYBwyjJxs=
X-Gm-Gg: AZuq6aJKLoHFRZonPvmgCG/qEzbrUkziGu04MDq0meVyVVDzg9NTzIjf+luqOlEnYiS
 p5MI9hUFtysHYmgmuhiTPwyIdFJ+w28yBzwgrNOhQElMkrI+6VDFaAHTDa+tD4gRy0H8HxtF5qI
 MdyHdp8KsaFH+6pTGvIyLBSb3YKJwitxozOw2kYyy2Jv9mxAm+NdvRn0aUhYPqan+3AFe9pBqKo
 rqHIfib3cSFOT8W5vjtCQKfQLw5ZITFSk9OvGuyvES13gMLaFqPaMzuwhTwBsdzioCEjWihyrWN
 eGbRB0aHsHq7yyzHKKsslvLpvuUM9PFUwJ2g5yeJHrvnmZUzmT+tufy7xDI+FdcR+x0yTTnSvDe
 kGFFC7UnEbUUGivxrywh/cKkYq6QtmowMhIBNpf8GZGt1h5L4qSC6/mYHzfZUmmnoUieylHFkjT
 SgMVyAU0YUqid8sJQ=
X-Received: by 2002:a05:600c:4e45:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-48379bab48bmr7741205e9.16.1771011482543; 
 Fri, 13 Feb 2026 11:38:02 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370ac3564sm66164625e9.5.2026.02.13.11.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:02 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:01 +0100
Message-ID: <20260213193801.41449-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201184137.3595514-1-bernd@kuhls.net>
References: <20260201184137.3595514-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011482; x=1771616282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QMw/cFnsflY0/EPP8fCbhhaOtkPa2snhtpjkuPtFNI=;
 b=hdBangzVtXasOB0skyIwI3hPVCaCIeLynsmzCb3ODKp9xhHeYWIZKgSwq9rcN6khyp
 472RtyVQn3hDRAz4JxXqo2LFb9Vi8AKgO47KlSuhQs4Cx1JRphoi69itHEJMATfOeDwb
 TtWtoEpEd0fSFXyLTHQJPmNK/ZXAlIumXqaCrStVDrdzEpYMnxiycRRI4xE6GOURQLIT
 h3aYEno4PFwjdfmGA8lyIPSAbTyVqXMEkWncuUjEo1tq3N9NHvcCq3y5CuOfuRDGp4eP
 vATJ2gCM5FHy4E3CbNNpq9H7uO8ER2a9pj8sF595BkfpUROmUDS69HFMMMQXy2cWWvyU
 pFfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hdBangzV
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.16.0
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
> https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.16.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/libvpx/libvpx.hash | 2 +-
>  package/libvpx/libvpx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
> index 1082721f1a..33d15fe108 100644
> --- a/package/libvpx/libvpx.hash
> +++ b/package/libvpx/libvpx.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  26fcd3db88045dee380e581862a6ef106f49b74b6396ee95c2993a260b4636aa  libvpx-1.15.2.tar.gz
> +sha256  7a479a3c66b9f5d5542a4c6a1b7d3768a983b1e5c14c60a9396edc9b649e015c  libvpx-1.16.0.tar.gz
>  sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
>  sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
> diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
> index 4f4144f4ff..d6b84ffec3 100644
> --- a/package/libvpx/libvpx.mk
> +++ b/package/libvpx/libvpx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBVPX_VERSION = 1.15.2
> +LIBVPX_VERSION = 1.16.0
>  LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
>  LIBVPX_LICENSE = BSD-3-Clause
>  LIBVPX_LICENSE_FILES = LICENSE PATENTS
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
