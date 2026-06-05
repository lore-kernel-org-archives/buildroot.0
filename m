Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A339CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D266760BB2;
	Fri,  5 Jun 2026 12:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeMQGl96NgY1; Fri,  5 Jun 2026 12:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E506461044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663795;
	bh=elUQTuc0mvn0ITwMztj5qBhb5KWX/yDD/8gB6rOcwG0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BZVFK5qFrkMVBbu+hh37YJoyqNHCgallnSH3w7wETMxuEzQcPUpPYJCBUQ3HshEcP
	 /OlapMDbxBMNRDghsTS3OUfm5eay+1EKOntTpjIvo5D9NaATsz8/16vhBYFyE5Gxpk
	 rc3Q13ZCv2xg8WpAEC3Ag0EpiGFXQ52C3b1lytfp8OikG+FteTPkL0ooWw617AC6jb
	 6zcbNI4eqyF8mR9S1Y65s2mZVpGOkwEXto1c4KJPEhBg3oIm87hwiYVTtVoZzxyS5M
	 /ivqJmbAfs6PklAzdWSPM6wEe0UO5lmAaZi0X+4m6qnDBI3/ndA8nzZPDygHGBVe9M
	 Qwg3/D+K0Td7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E506461044;
	Fri,  5 Jun 2026 12:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21998388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0734982741
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GcO7LgdJZvQ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C77282735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C77282735
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C77282735
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490bb83a3f6so16003815e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663790; x=1781268590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i2GaUyntatNXe1XmqgLBFMQ3vw7Yb1ONVoa0tOl/e/U=;
 b=Pa+uviLy8CW94WzdkFXWn1/DDsgjOZELxKjas+UELOUify+GtDma/fMVYRGCRlC0xj
 YgpVxbmvTESHKiESEokap3m0McSFcz9V7QnFpyi5kB1v6y2Zq6H3kIHEak4nZYPKvibY
 k+CxQDuBuSB9AJCgCILLpv7/tpbyZF8mxyZ9DYGplmJZjB/X0eBn5enLcnG+808gYjMH
 8qCRFwVGEKmc07Cf66a+eMRLEk5+FxuhU3AmNBZh42ExhjKX1WWChbRRK71lXl1p8DVO
 joU8WljPulLLnDh25Cym8K1GN8pMDDcE2hl8HOCZ4DeCqxpeZWRYSmGqWhAYsI9VBNzW
 xcwA==
X-Gm-Message-State: AOJu0YyQpNn5nTEATzxcOBxciAg4EuFrLx+LnHT7MyT24dsFQsa7fuqv
 ydpeJucq56OS/Mb1JrFw/w9aCbv4ovMitKfJtlnIQTo43NwW2VPAnV4wZtPK4bVrhWI=
X-Gm-Gg: Acq92OG4uspA3cYno1G6CVqOPloM6R0gQ/0gENpVikbVztYyzXvvTN489oeYIk73V1d
 bob8DX/NLIwF/HAr2cJu70925hy1c/YWM1ElowgHyXesfHxO1+mR0I2NHUix0d2OgzAofg1DUvO
 40cM5Qr+d4c0NjRJy9oEnRYc+drgCnf+5cjTVfDx/X/QivY9e3nmeQGY2DWeFEsQRi/fC32Y+H2
 FopD2nzSjsKDumMp3yklSEflJgjp9P6DifIp/9hgRiVzvlywCWt1tXmDgyxWdZ7Cwro0GOrr1LM
 Bxn7NU6gDv0NX9nsyR39s4sD4tf6Zrqm1AP9bFYsikCqCCqG+PK0TU3Vje1j+I+mPdlouZEzm5L
 zRTNtNxo5XFKaD6qzzgcuxTok/AM3KdbukB1dujImEnPmG/+QID8zXwuxqH7mMSX5Uz0Undjcnw
 dq7oZ+OmOvDFCKnF17E6X3/7jx8g==
X-Received: by 2002:a05:600c:5252:b0:490:5191:6e26 with SMTP id
 5b1f17b1804b1-490c260566emr56858585e9.18.1780663790158; 
 Fri, 05 Jun 2026 05:49:50 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3cc0f8sm155400105e9.8.2026.06.05.05.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:49 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:49 +0200
Message-ID: <20260605124949.271940-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260204131841.282589-3-thomas.perale@mind.be>
References: <20260204131841.282589-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663790; x=1781268590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2GaUyntatNXe1XmqgLBFMQ3vw7Yb1ONVoa0tOl/e/U=;
 b=M4Ud5GZtPbGat3eNcxq5R8757JFsnKZo3cZCC2nP7P+1XzFhI3KGN0C1p3FQ2qKX+R
 ilRMWK19fmxGfKBi7F6pJPKqsWiEVBPgTAFOs1lqH1ecXmldsurzA2U4G56DfQuMLel9
 prixr9RbAM8xiFkxRLlHmfCIn3pzJbgMsn7yRgzf3CEfVsVnPcn00h63+XLPW/+BYQt7
 mmLPQaBGwivMsBaiYirKRscNWoJJrryw0B+3CdjokJtokZdpQq23U122flXTrQUsYqV+
 tHZqhPSfOtcSY/6HXWyac0Dya0CnhDJX/AmJe5fawvm4X7ON8ThLZl+5+uVvERlsHKS7
 ThOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M4Ud5GZt
Subject: Re: [Buildroot] [PATCH 3/4] package/libmad: remove Debian patches
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
> In Buildroot there are multiple way to apply patches on a package [1]
> 
> - Adding `.patch` file in the package directory.
> - Define `<pkg>_PATCH` variable with the location of the patch tar.gz.
>     It used to download Debian patches tarball.
> - Implement custom patching logic with `PRE`/`POST` patches hooks.
> 
> The libmad package is downloading a diff file from the Debian
> mirror with the `<pkg>_PATCH` method [2] and then apply that diff to
> create a directory containing patches. The patches are then applied in
> the `PRE_PATCH_HOOK`.
> 
> The Debian patches were integrated in commit [4], in commit [5] the
> application of the patches was moved to the PRE_PATCH_HOOK.
> The problem is that in the PRE_PATCH step the `_PATCH` downloaded from
> Debian don't exist yet and end up not being applied at all.
> 
> Since this is not used, remove the Debian patches.
> 
> [1] https://buildroot.org/downloads/manual/manual.html#patch-policy
> [2] http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.diff.gz
> [3] 1167d0ff3d docs/manual: mention CVE trailer
> [4] 858df3643f package/libmad: switch to debian to fix CVEs
> [5] b21184a877 package/libmad: update the patches to be applied with fuzz 0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libmad/libmad.mk | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
> index db04d22e92..611f13eb67 100644
> --- a/package/libmad/libmad.mk
> +++ b/package/libmad/libmad.mk
> @@ -5,7 +5,6 @@
>  ################################################################################
>  
>  LIBMAD_VERSION = 0.15.1b
> -LIBMAD_PATCH = libmad_$(LIBMAD_VERSION)-10.diff.gz
>  LIBMAD_SOURCE = libmad_$(LIBMAD_VERSION).orig.tar.gz
>  LIBMAD_SITE = \
>  	http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad
> @@ -13,20 +12,6 @@ LIBMAD_INSTALL_STAGING = YES
>  LIBMAD_LICENSE = GPL-2.0+
>  LIBMAD_LICENSE_FILES = COPYING
>  
> -define LIBMAD_APPLY_DEBIAN_PATCHES
> -	if [ -d $(@D)/debian/patches ]; then \
> -		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.patch; \
> -	fi
> -endef
> -
> -LIBMAD_PRE_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
> -
> -# debian/patches/md_size.diff
> -LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
> -
> -# debian/patches/length-check.patch
> -LIBMAD_IGNORE_CVES += CVE-2017-8374
> -
>  # Force autoreconf to be able to use a more recent libtool script, that
>  # is able to properly behave in the face of a missing C++ compiler.
>  LIBMAD_AUTORECONF = YES
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
