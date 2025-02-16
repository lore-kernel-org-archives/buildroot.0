Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60254C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 16:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC55180E86;
	Sun, 16 Feb 2025 16:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNh5YaKi1hPi; Sun, 16 Feb 2025 16:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E506D80E8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E506D80E8D;
	Sun, 16 Feb 2025 16:53:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4BBC72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 16:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D53C380E86
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 16:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytO_Rdotc1li for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 16:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DD9380E8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DD9380E8D
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DD9380E8D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 16:52:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab7098af6fdso46011066b.2
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 08:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739724778; x=1740329578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OoALkLZlTSsdw7AF9uPBRaTvNen8tsiLFDB4BcGfr7I=;
 b=YaeuXjC+zw21Uckz/B4R9rTz5zEgzxz599pZViaw2TTmux6HJv5KZHfS1QFUkucbNj
 hFcJMelBdVfoviRYWRX5ftxrKfG4gmnMjI8XtgaP6lO2Q4RK9BZ4vBo74tn9ni1sYggA
 0PVHYuoOZOv55hoUuA3gvafdYQVc+iMEjONchlo3hrh0OhLY2mJRvxdMpMyvqA4ukCnM
 glrU2PVQpwJ7PhTV2NLBTj1/3mDQX1X2x1RhPVBSpqd4JkodvkAae5FXvhZrn1oAmQQ9
 +wgYPOp31mKfvKRsRqzTaGaKQZE//jBYeMphMTYxm4bOc+RB1eJaq5yfBBmWqCnsrkHU
 ogzw==
X-Gm-Message-State: AOJu0YzUASkxUPtVIo81z5/Lh3fIkLRFLQMKT1tJEcJGO4aVfyZOlBe/
 vx5oDeqFA35yH1hhitZcVTllg8n07BAZEhqygVulsl9CPRVsicBOc9HH/A==
X-Gm-Gg: ASbGnctSO5AmuzGz99RzUde4CwA1eb9yqJvzd7ifThcRmQuE39BczArCG/7w/uY3fcU
 ZlQXALGw9ftvbjxsYgJ0nvnk6JmKQ7mzClsNKsWgr7R08YJG/kJD5HONqzuggu3Qentl7bMRSvA
 wTxfnxUZoofl1Cht8A1qVXMWngpWdTIz7NA8wvPyL7H1RpIfiRIJOHBVoGYns4jxNebu7PF16JS
 TxC6lDhTUExd4lld/To9d72vYJrdyZ3rI7EkPFsdja0evcn8GdSrB53GvkZnSrBROT0GgEmugo/
 8Ic=
X-Google-Smtp-Source: AGHT+IFj3X3Ikf6B6o92Tj91Rrvj2mSQ1293rIodSfDkUK/8VafVyE0PcW2ac5L8c7yXwYITo3sixA==
X-Received: by 2002:a50:cd5b:0:b0:5e0:36c9:7605 with SMTP id
 4fb4d7f45d1cf-5e036c97e26mr1784975a12.0.1739724777662; 
 Sun, 16 Feb 2025 08:52:57 -0800 (PST)
Received: from skbuf ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb86c9320csm217916766b.55.2025.02.16.08.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 08:52:57 -0800 (PST)
Date: Sun, 16 Feb 2025 18:52:54 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>, Vincent Jardin <vjardin@free.fr>
Message-ID: <20250216165254.tbuitjunxsrxxndj@skbuf>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-5-olteanv@gmail.com>
 <efa6291d-82d2-4f5a-9b73-05c1a6cf3e9f@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa6291d-82d2-4f5a-9b73-05c1a6cf3e9f@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739724778; x=1740329578; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OoALkLZlTSsdw7AF9uPBRaTvNen8tsiLFDB4BcGfr7I=;
 b=UCfHhGa0wehkUauDtZeDJdzOzK9iNghxKtWHspchkQ6if1kflBQIS1j4+l1O6pZwfc
 0LWemQ5Ca5jsK4sovNgAhW4Xej2OJROu/sStFbxslp2tFp7B3O+kU36ikh/s8GQFNAeZ
 46uWlLMVetSrpJnr/Q6mbmLl74p2/gvHj6gLfY4jCEpZ31jtDHLtxvWUkqsXVTG6LvRF
 X7SQtupjgVOyQCs6kkFaAXwxzGKy9ZhJyJV+ln2rB/LdpqyJW5HgJVTPYGrDDRbGob26
 74mvGJjIUctNaMHG5KOq9qHBDlVYu+wzFr1wwZTl1/92E0CQstck/4vYiNxIvtuTxtGe
 pKhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UCfHhGa0
Subject: Re: [Buildroot] [PATCH v2 04/11] package/qoriq-mc-utils: new package
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

On Wed, Feb 05, 2025 at 03:59:45PM +0100, Romain Naour wrote:
> > +define QORIQ_MC_UTILS_INSTALL_IMAGES_CMDS
> > +	$(INSTALL) -D $(@D)/config/$(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC)) $(BINARIES_DIR)/dpc.dtb
> > +	$(INSTALL) -D $(@D)/config/$(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL)) $(BINARIES_DIR)/dpl.dtb
> 
> If any of BR2_PACKAGE_QORIQ_MC_UTILS_DPC and BR2_PACKAGE_QORIQ_MC_UTILS_DPL are
> empty of incorect, the install step will fail.

I'm having a hard time trying to understand this.
If the path to these files is wrong, what behavior other than the
install step failing would be expected?

> Can genimage config file used by a specific board can "select" the right binary?

What do you mean by "select" exactly? Select between multiple fixed
options, in a Kconfig sense? (I don't think I could do that) Or just
move the file names from the board defconfig to the genimage config
template? What would be the difference in terms of "if the file name is
wrong, the install step would fail"?

> Doing so, all binaries built by qoriq-mc-utils can endup in a subdirectory of
> $(BINARIES_DIR).

I could do the latter if it is preferable, but as you mention here,
I would have to install all dtb files produced by qoriq-mc-utils to
$(BINARIES_DIR). That *.dtb file copy would have to be done explicitly
by the package's _INSTALL_IMAGES_CMDS rule, because the upstream project
does not provide a "make install" step that I would call. Not to mention,
many files would get copied to $(BINARIES_DIR) that would never be used.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
