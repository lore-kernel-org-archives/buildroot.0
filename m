Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC2CC44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D9F60EDB;
	Fri,  3 Jul 2026 14:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gd7y6tcXGYWR; Fri,  3 Jul 2026 14:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B58160EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089179;
	bh=uPdz0CouAlo2Y3zykWKN+uYde/rPpjtWtoo7cPkmdjA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q5laGB+HzJ5nOzctHM/cnQ74lnWbU3tX+LMRNxNaTN9A4oWIdy/cMw0hwXI97z2Qj
	 VN1gRazm+WAL7fbJP/zxEw0nvbl64HL7bVRgBaSbotIe1TOdCPgU8+FQ0rRMnGH2CH
	 ya2iIfjZF1CMr4P44kG4uPbch3U6bGF/YjxsD7uXOcchWhvT27oOyTjOOBhIPne7hd
	 TaaqaQ098CEwvB1+i5MUt3BZFBs5rQCkMVtkeRuMG/9ZbR5zavYrj39XynO5+z6ib5
	 24nvqsmiatmfePoyTHkqoMQduV+m/e4luKY7dRWaaAgy2pIi1FT/05lsNHDOOHNv33
	 r2yIq7ufRzPbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B58160EDE;
	Fri,  3 Jul 2026 14:32:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C1ED363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22A2412D4
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQBAjbwSJB2X for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E89D7412D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89D7412D2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E89D7412D2
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4763b0c1dcdso646011f8f.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089174; x=1783693974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4vbaa7R0ryeydU4nNsvWntci91Db6zbryTORJzZUCn0=;
 b=sugcd7zHp6kJdm7sJB4/gKBAu6woRk1xjAbBl2Z13X+apv0xRszdxZBowOFd8PaMAe
 q+SLK9EtfIOBiKKP0NUzmqUKbHFShkbyHmDbPoj+nxTabJGNoPt4DM73KzM3CH5jxmvP
 oIgYtanDNn2VgkcsYSbpl0MJPnLXfKJ46kS3Uo9ylJYWBdYGKqDfGZQbcV4XpwFwSK0S
 eeTmC8+/m+PJ/bRQh+B3G34tokYbQdvU0RIJ4hSDLOXjnWdWltDDgxUA6RTTNwXmirAO
 UWjU8/gDFusgLPMkg0rWZ5LjkwsnARXmo5HAoIezPc8FW2D4EX/it2XQPDMvdwBAiQUn
 QfXw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KkVZRZ76Ir/Uo1MPfl2CLRtsyMgJzoItC8kwk6GW31TuJFyN5tNjUTMLC1iDzohrt6SHWP+D0fe0=@buildroot.org
X-Gm-Message-State: AOJu0YzgH+Y9zNoKx8OFfoXMRXiKDOM+k6mnVmSUWq7AsxRkfhOqcbry
 y1Yyqp/5f3TGwp4zHMPzlK/foe42XbS1DiQl/j4onIk5+/cg7UhpYvfThoTyeHL14Qc=
X-Gm-Gg: AfdE7ckd9J+1kl+5+46fOBI3lFSo3IrDj+lHl969xbYH/KHDeVhPavSDDUA+1qVLwgS
 LHZCWFKTq/hXBPnIAGZYzKZg8B69XduAYL8tmdUY+d353++eaW4//zrn6I2Xa5d7Y2m9EMzD+Zq
 i+ySpVqGC2ptqxFul3gH55/Hmw0EWGluJPnYBGjUD7cyJQIPYyO67KiISk8jm/Wwao5d2GTiMz3
 mZfMjmtlw2Ov1MnzZ/bqNgIa5cSgQt0Hg/Jb2aCovsCH3X1CEglzyDvmhZufzhMU+gT9hAQNCYf
 qoE75qJX/6zstraEqbkphjDgJVgKsOliOA5/6h9G8bpnj6l88MFYJsAWY6w0WBJKqvcxiRvfbtO
 oC7nqsLUmuGtLqAW58zmlZ3U8XB7SkoCD6t0W/CCKmlbcF47r7ghv0ew1+Za0vSaR51dgr58HfT
 wlLPxd
X-Received: by 2002:a05:600c:154f:b0:493:c845:bc20 with SMTP id
 5b1f17b1804b1-493d0f0793amr1606035e9.4.1783089173766; 
 Fri, 03 Jul 2026 07:32:53 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d607sm73453155e9.2.2026.07.03.07.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:53 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:52 +0200
Message-ID: <20260703143252.275197-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260619172810.3337739-1-bernd@kuhls.net>
References: <20260619172810.3337739-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089174; x=1783693974; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4vbaa7R0ryeydU4nNsvWntci91Db6zbryTORJzZUCn0=;
 b=R2OjJOz1B8b9C10felvq+990UhUHdOhO9Onh/8i+aqvKrt2iyVtA0VaNd5I/o4B/qg
 OOxmnW/pI8ZbxITKl3PvbpnoNS1qEKpWVcL7/uEudxoWWlcQHTSLaaI0KmZGcJcvFMNL
 Gea69LNOilu30q7ueEIpgJFAbUq4s+CmzpKuDmT1hjINYzpkqtkNShYcaPMjWiz2uOUn
 pRqa6N5ia/R8yedD7y2dvbJkhKSbJdUWwNS+KoHeCW1HpAcwibnqhTb3wzz8ZwXK1gbw
 cfOMaeOhUtuwGneiEvB/FxP/0y6uPm+0i9cv4xUgHYDUfklD0IIgFwyv2PHbADJROHOi
 CXrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R2OjJOz1
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.07.1
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
> https://ghostscript.readthedocs.io/en/gs10.07.1/News.html
> "This release addresses a number of potential security issues."
> 
> Renumbered patch which was forgotten during the last version bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/d32cbd8763906d5edae166f4f9020475ba03bc8e
> with the exception of an unrelated build error with the
> bootlin-arcle-hs38-uclibc toolchain.
> 
>  package/ghostscript/{0002-brotli.patch => 0001-brotli.patch} | 0
>  package/ghostscript/ghostscript.hash                         | 4 ++--
>  package/ghostscript/ghostscript.mk                           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/ghostscript/{0002-brotli.patch => 0001-brotli.patch} (100%)
> 
> diff --git a/package/ghostscript/0002-brotli.patch b/package/ghostscript/0001-brotli.patch
> similarity index 100%
> rename from package/ghostscript/0002-brotli.patch
> rename to package/ghostscript/0001-brotli.patch
> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index c2e48b01e6..94017262df 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/SHA512SUMS
> -sha512  1c2a14951223c975a53bd9767c28bd3a6e420c385a5e0d7a60a5ff5b091bc027929c815bf57cddf97611e8d265ece1c219321737f2cabb5646685c6e8cdb85c9  ghostscript-10.07.0.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
> +sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
>  
>  # Hash for license file:
>  sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 23dd3d3860..08e2667981 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GHOSTSCRIPT_VERSION = 10.07.0
> +GHOSTSCRIPT_VERSION = 10.07.1
>  GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
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
