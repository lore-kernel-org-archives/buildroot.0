Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A597CC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616D260C00;
	Fri,  4 Sep 2026 12:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gmq3L3JD5UO1; Fri,  4 Sep 2026 12:17:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 76EC560BC2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524264;
	b=VeBm2IozpqCL7hcayli8a0Z4Qqk472rlbkHddLZjwplJioqgtuWiE4ymKEUQqv6YYVai
	 2o0sUd2tRX5O5/2gqz59o2vCwP5Pp9Lq1KjV7p+Y/ciBqU/zK0xxpib7NopD0A/TKY9Fh
	 JDfYnifDu5e2BzgwH1HGHo1IwR4m4j35rN1+OOT8/KXp5qL8GGgA1PXJxRXu2NR1VxgxH
	 rNo4c8wHyxTxjCKf1khYsGAR23imB3pGpk3d3qVSCpAUO2WQBG6XNlepuRnQCsmVXulNP
	 qRI6QRz/6PXtGw7PSHapETrL3DRnQnVpjYx9aaTQL4BZNw3XT6aLGSmHZTPgVHooePQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3NkVjfcFLe845/q+6EpBU8fI3K/ZO9JICkwvdUSiop0=;
	b=ni7VFEyLL4f1XnQuG0aUwbFdANnlGFSIMEytE8iMwT7zJNldXBvMqzdJZX9RoZ1paBhs
	 mNfHQYVFz2by0pleE0ZBL9KW9BpztmabG4XRS8KCTP1A98vYlXchUJQQTSgk2SMqqsC3F
	 PomhM+D874k/nYZ5r8TJ+glolvNbPIFuwvNOA1OCb25p0CEXMZWlHeA3VQ26sVNKKUjW9
	 DVhr2pm2Px+B4OrGjJG/7+m995TzR7SlKq5Vpjnh9BzH8f6mZNVCNlgdWJLtVQnwYWdrZ
	 5a8PZ7mdvHNfjzHkkt7lSxDxZNGcC631A9vREUC6qokXro9WP+RptWqzVjMx7Ej+7pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524264;
	bh=3NkVjfcFLe845/q+6EpBU8fI3K/ZO9JICkwvdUSiop0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=poT5RNZNimlQpiSF6XumgUNcD9UPP82eRlZXxThyU8TITjyPZnQSQghsVHuoUrGBf
	 RHGQ67xICxkrtTNVoI5o5UBMOC6NkY806JvVFF7Hm72FOU4nAAbKUH6f/oXtdMyo5e
	 6rNF6QI/k1nDL1tNUQdzCAws6EUplPexhdm28fFl5CWkAHKlw5vxoXs0X5OxlhWice
	 1UOMv7vwpeFT+mABtXGruIbDFS6JQqydjABtruBqlIaEKpXEZo08DZxVcU439WQ2pj
	 xE67QetIQ6sS9ucSTkLP1Wlktdaaldvcf538RZeSfkW5JiLXAeYU3MFf+twgA77p2L
	 1SkOquFdjZftQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EC560BC2;
	Fri,  4 Sep 2026 12:17:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A37F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33D774031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5FxzcRJVrv9 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1AC7740080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524259;
 b=HCijF3tjWjEM7Pxd27CkvDc7AUiTeNmJEJnkiIe98d3NNHjB++3qsGH6q52bUJhKAWLz
 IQhYEDw7CxfBlU4FZ6TZz8dsdN7zl+EFy9R0fM6psVJhFf1VdVtrxEIjdspvzeMxliKLP
 eFjwgqwI8eepmCPMECvMrjZuGbRBxdzthcVJGhTB7GhD40z9Kk2M7GHA2DP6zuHJ9ewg7
 RfEj9XHtijypC34WaFmQ/KCX73T4Ekli5EgJ+1cBFKUEkGFqBMnO9JFvqEysGHp41drJE
 ywA+v2iyZeY1yJvDKB9io3YDANOMy0g1+tE0NdTYRWN4hxhuwgiu+Hmmu+8SgeSnb5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524259;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=7FsYTlpv+Sv1dlCvFzvoNOrUIbNTo4WaG0M3jaM5UNA=;
 b=bx1nVKvr0fJM0tGA1uhduj7TMUnr1XSdLhxlnaAqSJXZ6Ye3ChLhEnBt4+WTHVO60d2+
 RHVnvs0NXcTRXQtx3dcaSux98UfgNdlXeJFuRQPee3LDWvEabf0mKptmsXTghhcPTMgUL
 u0UlOhhZngm86Cp9wipE4crPuhtsFxa/FnTp0FckFate0hHWfepLX3TGztQo2ZmpEIze+
 IVR2I7tu8VZsPOOO4uncgMsZRdCW9N0sly2zInK/Vzx8wR/pFCHdqJMSxLSRzjbKp+pYL
 P1HVntEMION2JbGV/om5cg98dF7SffoYNiFm/3qMs0LxgAWJlyY5rgPTEf9zDCt7yWA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JhaUqUnc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AC7740080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso10386815e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524256; x=1789129056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7FsYTlpv+Sv1dlCvFzvoNOrUIbNTo4WaG0M3jaM5UNA=;
 b=WPxnnFeY05n435Bf3rTUIrGSVyEHUdeZMllLOSy8kJxzoQFdMLoBTRqJtcJemnmIhj
 EELN1OGZGa1qQObyjYg3A8G1ba9IbYRgRwYKyt9adtIcfRsBOI1mur9M+qfpsjfjWzpU
 jtJuuvPeEe6+xE7wWcJASaUS6LWZA4URGUwd5+jn8xt9lX7LAH+myvCK0Pt6u9fj8U0V
 Fw7O5dQ15Bgorm6ZIUlCf90pytb42x+jq0Ic6OhXi5IWOGcHQwFpWQXmR1GACjE7cjy/
 63KpmZLmupja2PY7AqNnjHaw3h9gR84+eqJ0B/eQPyisEPBv0zeWDHOveyCJh83o1Lg9
 Vcdg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzbgvsN92mqlvYdzdR4PPn7fIJ+54AZievCeQkrMCgLiCOCBQzZkObkB9f6I7un/xK7/ODOrd3PEl0=@buildroot.org
X-Gm-Message-State: AFuF++lzEVMgEgalp0A36nRogXXcIBJHt/qLaZo9f9jGg+lkRAcg5ZYr
 4miVLxAb8QJcA7r3SGEQWSHCosS0xtm1dn/5Zy8wEgzqAsCjiHx88i2VcApBcDsZMQI=
X-Gm-Gg: AYBFou1w9mJ+qhZz33zCLXEv9k7i2Av1wQEslzc4SjnTSMzO73fOwCLP6EbrM0x3vuE
 woso3PntO5P4qHmLiOavVKgKMS3nTXe71F3RGX2TPUWovyOAzrIkYrf/AjnuWgj4s3DfcMsD9y0
 XmdBmCxNg8noRpRtUU7Tx507zFpn/X+V6CBTlHmCLKA/0rqtQ8+up5pDA8mu/os1zI9t9YcKeHA
 JIDjDXRYWMCC8rlh9b3vlinsHewApCj35g3/Z6lCKlv3gO0aD/1imr1K2V29inqhpxuzz6ene/i
 594CYO5djpyQFXZJWNbDa4lI36FBVj2UEzpQqPDu3s6ge330jWav/yYimS6AohRxUpoh4rcATin
 BnzAZoLTwWJupRrhxpEPTfy8Pjr4GTWdisT2DCZIWBrndGC+h7IH4NaS3kvrih1XrzxZpPQDMZV
 wOuZmyZnNCGkGa3jG5OyXPkCZ1Hgfyw5oT9/B9A8+eL1zbJxKtoBU+lg==
X-Received: by 2002:a05:600c:19d1:b0:49c:fc6e:8cbb with SMTP id
 5b1f17b1804b1-49cfc6e8e05mr32664415e9.31.1788524256568; 
 Fri, 04 Sep 2026 05:17:36 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7710aa5sm66397115e9.7.2026.09.04.05.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:36 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:35 +0200
Message-ID: <20260904121735.403964-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826152732.3556127-3-romain.naour@smile.fr>
References: <20260826152732.3556127-3-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/python-gobject: bump to 3.56
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
> This version bump is required following the glib security version bump
> to 2.88.3 [1] to fix a runtime issue due to GLib-2.0 backward
> compatibility removal [2].
> 
> We prefer updating python-gobject to 3.56 stable release instead of
> backporting complex commits from 3.55.x unstable release [3].
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)
> 
> [1] e313a2d2590af689eb1f79e55b5a488154400da1
> [2] https://gitlab.gnome.org/GNOME/glib/-/commit/e02603d44dd71fa7bcb07a1c5d64c5a91d3e93af
> [3] https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310
> 
> Runtime tested with TestGst1Python and TestFirewalld{Systemd,SysVInit}.
> 
> Cc: Fiona Klute <fiona.klute@gmx.de>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.05.x. Thanks

> ---
>  package/python-gobject/python-gobject.hash | 4 ++--
>  package/python-gobject/python-gobject.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
> index 191b74b1e6..6b26e289e7 100644
> --- a/package/python-gobject/python-gobject.hash
> +++ b/package/python-gobject/python-gobject.hash
> @@ -1,3 +1,3 @@
> -# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.5.sha256sum
> -sha256  b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585  pygobject-3.54.5.tar.gz
> +# from https://download.gnome.org/sources/pygobject/3.56/pygobject-3.56.3.sha256sum
> +sha256  12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6  pygobject-3.56.3.tar.gz
>  sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
> diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
> index 9386b6fed8..310cde24a7 100644
> --- a/package/python-gobject/python-gobject.mk
> +++ b/package/python-gobject/python-gobject.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_GOBJECT_VERSION_MAJOR = 3.54
> -PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).5
> +PYTHON_GOBJECT_VERSION_MAJOR = 3.56
> +PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
>  PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
>  PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
>  PYTHON_GOBJECT_LICENSE = LGPL-2.1+
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
