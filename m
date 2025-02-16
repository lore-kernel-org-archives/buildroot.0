Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C98C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 14:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9943A40F4E;
	Sun, 16 Feb 2025 14:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK4Uzs8MkrYV; Sun, 16 Feb 2025 14:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EBEC411CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EBEC411CE;
	Sun, 16 Feb 2025 14:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34030DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B85E41231
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GHZVklHVAWV for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 14:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD6A540F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD6A540F4E
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD6A540F4E
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:36:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dbf65c0c4fso601352a12.0
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 06:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739716574; x=1740321374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPeHQsLaSVPfe6Bpfjk2z/GKEinGeP00vCiBH8bspNY=;
 b=bx0kkSjgKZvisfuxi0Z9Ekp6cbMkKAfwngXQJ1hILdO4bCmuBIg5PfpLBL6BWQD/Ur
 6ZjL9HjUKr1ed2bnlRgndQDQGF2lEmh+tcZBw5+hY+vq/ZQJOHkCzz7tC6V+BRYng6Gl
 y9Zfo6TaX9P3l0GCX/gMkqMGwxU/ItAQFPi5dMuUIXQIu6nTBLDep2tQjA1YFY+z19yh
 9mJVSa814l/YO3bHHQTXQUc8upVrb2/bI1mRN6l5xoh+sMrbnS0n3dd6DYB1Nb4y1PJd
 ztiQCqJtZjJaajz5Nvgf7ksyf2yalBUQRZy0CcUIY+ejSnkCXeMjVUOSynxLLQOZSKDp
 29sw==
X-Gm-Message-State: AOJu0Yz/4i7bzAHnfs7w7ZSlsD3848DPBlSUdtphPSs15V8+jyt/hmIe
 P3rxdAIm4S728ivF/X907UZzZsixeXChuBiUxYkhhrQAGcjjKSMK1aqq1w==
X-Gm-Gg: ASbGncsSD8FQQke0LdpKDE+BZNr0zPGB5JYmBDyNb7GhTJRb3+cKvoDQDEnn/IaZBRG
 8YsnehlhSyT9akgQfHrTYYVApIKvMY8FYYM28uCuhm0Awcz3gLqLC8kLQPrYQNlkGNixvQckIY8
 NHAqQE44YcHfl6s9xUIr2fTAV+Xskc91o5p/4tHXZv8P9ywiquGXKrbURQuAyf9R7JuvnATimts
 99GKt53Dt2Zaqivk6Jw+wg5NeNhHuOn84eIZ+f9Uli0SD8OuxfUmP/BhPZWPbNk8NTo+TTFZkT4
 /vw=
X-Google-Smtp-Source: AGHT+IEQhYRsm1K+y16GTHEtM6TmIJhkAiDhyLjlZXkCcM1RmpBe3NPqrmAKhFioQxkuMQA4ERc/4A==
X-Received: by 2002:a17:907:3f9a:b0:ab6:d660:c84a with SMTP id
 a640c23a62f3a-abb70ab8c2dmr249955366b.4.1739716573542; 
 Sun, 16 Feb 2025 06:36:13 -0800 (PST)
Received: from skbuf ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376bccsm714417766b.116.2025.02.16.06.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 06:36:12 -0800 (PST)
Date: Sun, 16 Feb 2025 16:36:10 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Message-ID: <20250216143610.irsdhj3m6jxdkbmv@skbuf>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-4-olteanv@gmail.com>
 <6c30c95e-e76d-45a3-959c-02c9873d5660@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c30c95e-e76d-45a3-959c-02c9873d5660@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739716574; x=1740321374; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hPeHQsLaSVPfe6Bpfjk2z/GKEinGeP00vCiBH8bspNY=;
 b=MI2YDlLa6SgmHO9D1bz7Vun89K9GV/Q2Gu/EbJfoVDCEn5LjUZmr1nh6p/SQ8aOF2w
 jC1KIQBY03SML2AwYd8G+TdPser/YylVa+ykzlc/DP0O0utLtIa7etaIaER3NczsI6Ji
 6JGmPftzSHjiEv/5QOD4zeCXDIe54A02fQANZktpzbYDwmwXpnL8os89JpIfD+Ksdx+H
 s0MklxUKB0tRFQtfvCeL2J08xELqVtxTMRobGWNLGu5Q65aaMjT82fBJpE0Yo2dcujVJ
 mwzZKaNzb53LPxKkADfY3Z90NF8rOaf2LVqyxn9QTaRVGs93IV6/JWi3BsEKokF6od9f
 1qWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MI2YDlLa
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qoriq-mc-binary: new
 package
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

On Wed, Feb 05, 2025 at 03:45:22PM +0100, Romain Naour wrote:
> > +if BR2_PACKAGE_QORIQ_MC_BINARY
> > +choice
> > +	prompt "QorIQ MC Target"
> > +	help
> > +	  Select the target for the QorIQ MC firmware.
> > +
> > +config BR2_PACKAGE_QORIQ_MC_TARGET_LS1088A
> > +	bool "ls1088a"
> > +
> > +config BR2_PACKAGE_QORIQ_MC_TARGET_LS2080A
> > +	bool "ls2080a"
> > +
> > +config BR2_PACKAGE_QORIQ_MC_TARGET_LS2088A
> > +	bool "ls2088a"
> > +
> > +config BR2_PACKAGE_QORIQ_MC_TARGET_LX2160A
> > +	bool "lx2160a"
> > +
> > +endchoice
> > +
> > +config BR2_QORIQ_MC_PLATFORM
> > +	string
> > +	default "ls1088a" if BR2_PACKAGE_QORIQ_MC_TARGET_LS1088A
> > +	default "ls2080a" if BR2_PACKAGE_QORIQ_MC_TARGET_LS2080A
> > +	default "ls2088a" if BR2_PACKAGE_QORIQ_MC_TARGET_LS2088A
> > +	default "lx2160a" if BR2_PACKAGE_QORIQ_MC_TARGET_LX2160A
> > +
> > +QORIQ_MC_BINARY_VERSION = 10.39.0
> > +QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
> > +QORIQ_MC_BINARY_LICENSE = NXP Binary EULA
> > +QORIQ_MC_BINARY_LICENSE_FILES = LICENSE
> > +QORIQ_MC_BINARY_INSTALL_IMAGES = YES
> > +QORIQ_MC_BINARY_INSTALL_TARGET = NO
> > +
> > +MC_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_PLATFORM))
> > +MC_DIR = $(call qstrip,$(BR2_QORIQ_MC_DIR))
> > +MC_BIN = mc_$(MC_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
> 
> Here the same tool (check-package) require to use "QORIQ_MC_BINARY" as prefix
> for each variable use/defined by this package:
> 
> package/qoriq-mc-binary/qoriq-mc-binary.mk:14: possible typo, variable not
> properly prefixed: MC_PLATFORM -> *QORIQ_MC_BINARY_XXXX*
> (https://nightly.buildroot.org/#_tips_and_tricks)
> package/qoriq-mc-binary/qoriq-mc-binary.mk:15: possible typo, variable not
> properly prefixed: MC_DIR -> *QORIQ_MC_BINARY_XXXX*
> (https://nightly.buildroot.org/#_tips_and_tricks)
> package/qoriq-mc-binary/qoriq-mc-binary.mk:16: possible typo, variable not
> properly prefixed: MC_BIN -> *QORIQ_MC_BINARY_XXXX*
> (https://nightly.buildroot.org/#_tips_and_tricks)
> 
> Try with:
> QORIQ_MC_BINARY_MC_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_PLATFORM))
> 
> Same for MC_DIR and MC_BIN.

If I were to replace MC_DIR with QORIQ_MC_BINARY_DIR, it would conflict
with package/pkg-generic.mk's use of $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME).
I guess I don't fundamentally understand the best practices of naming
private Make variables when I don't want them to collide with the build
system's use, and the "tips and tricks" link didn't really cover that.
I'd guess you'd recommend renaming "QORIQ_MC_BINARY_DIR" to
"QORIQ_MC_BINARY_DIRECTORY" and just "knowing" that the latter is not a
variable used by the build system?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
