Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BF1C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF416812F5;
	Wed,  8 May 2024 21:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4yd2F0wl9fU; Wed,  8 May 2024 21:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F25FD83A42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F25FD83A42;
	Wed,  8 May 2024 21:41:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFEF51BF3D5
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 21:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAC6D83A42
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 21:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxFoOndMUrSl for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 21:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5A32812F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A32812F5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5A32812F5
 for <buildroot@busybox.net>; Wed,  8 May 2024 21:41:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41c7ac71996so1850555e9.3
 for <buildroot@busybox.net>; Wed, 08 May 2024 14:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715204507; x=1715809307;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JiDa90VdezWVlJond549aTkeh5QDfyAEuAjOiYsrK1k=;
 b=kuEkQQGtDyQMnb0BcbvjCW13rWKA0T0n1tVbHuo7s2nNFsmXV1x0WdR1pLtSTcnPuA
 0KHSzUW4IbKnD4boYSkUAJk1gQjQZF5JD0e7HenWjVv0A5ARl7flxc7UclTQkOQ3mQHg
 OAOux+BfZXZPCNG5y0CdvaS+qVlC6MXfiYTPj5OV2PKCjO8IhISCb37BInLZ7wV9CV9z
 07jTjVnEh6SxbkJl1ZWjb8iHY6l6aWnfR4Cf207zQvdNxmYyy74tobxcfjclDLk9cDN7
 yol52/Q+NI2ZGenNFEl7O44VP9FN2k6ml04LBcEmo1IQrxhUa7m9SrtaLN54FYh7d6ri
 YHOw==
X-Gm-Message-State: AOJu0YyfcMr8gHjH3n1A9X7p76wvvdKRgsOig3MpcH2tlqQ9Y8BU4xHz
 kxGXTy/L8d1yMnwjgXgC95xLRizZEh3JpNLNgeyWBdDd7socdpeL
X-Google-Smtp-Source: AGHT+IFqb2pXoYjJplM6Kt3m3xXtsLn2LsZWncy28AjCtajhkox0wHT1zFf4iIsOoxO2iEHyBtw2IQ==
X-Received: by 2002:a05:600c:5128:b0:418:2b26:47a3 with SMTP id
 5b1f17b1804b1-41f71ecb1fcmr32220755e9.32.1715204506682; 
 Wed, 08 May 2024 14:41:46 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87d200c6sm35909685e9.23.2024.05.08.14.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 14:41:46 -0700 (PDT)
Date: Wed, 8 May 2024 23:41:44 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20240508214144.GA223271@pevik>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-7-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506144555.31709-7-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715204507; x=1715809307; darn=busybox.net;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JiDa90VdezWVlJond549aTkeh5QDfyAEuAjOiYsrK1k=;
 b=ZuSNtJsH9qTSfadm+VrGWagWJBoAFeqTX5e+oAJ8Ii4xPGG3FSXjLj3KnD4wdfvdNf
 qpHQS8kNx4xmPLoRlGIM3XuKS3J6CksnmnDiGhSr8g0H75gbdp72mcRNWZz870aHHqB8
 eqLflrqnVzxxtZSrTsPL33TBC5xZl0fH0HyormPAy7zmxBtQmrKGYfXCClYJjmwAuXh4
 vjxZXRMj1CPvzNDK2rvOWivE4hzb8HNNjsEDJ5cT8yPaQJFK0puQV1RRY5tyfn28Y1cH
 RaZdxe2v4cU65Z2dZNSsOntJE+5sf8qJSv+n9GvrcP3bgweo3oL2IazS3OZdCAo7PBXt
 ZYSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZuSNtJsH
Subject: Re: [Buildroot] [PATCH v1 6/8] support/kconfig: bump to
 linux-v6.9-rc5 version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, all,

> - update RAEDME.buildroot (add copy step for kconfig.new, update
>   copy steps for *_shipped files
> - rebased 01-kconfig-kernel-to-buildroot.patch
> - rebased 06-br-build-system-integration.patch
> - updated 10-br-build-system.patch
> - removed 11-use-mktemp-for-lxdialog.patch
>   (no longer applicable)
> - rebased 12-fix-glade-file-path.patch
> - rebased 14-support-out-of-tree-config.patch
> - rebased 16-fix-space-to-de-select-options.patch
> - removed 17-backport-kecho.patch (use complete Kbuild.include instead
>   of backporting single parts)
> - rebased 18-merge-config.sh-create-temporary-files-in-tmp.patch
> - rebased 19-merge_config.sh-add-br2-external-support.patch
> - removed 20-merge_config.sh-Allow-to-define-config-prefix.patch
>   (already upstream included)
> - removed 21-Avoid-false-positive-matches-from-comment-lines.patch
>   (already upstream included)
> - removed 22-kconfig-lxdialog-fix-check-with-GCC14.patch
>   (no longer applicable)
> - new 23-Revert-kconfig-allow-only-config-comment-and-if-insi.patch
>   (revert to re-enable source statement inside of choice, as
>   suggested by Yann E. MORIN, see [1])

Even with applied patch 7th and 8th (and the others applied previously simple
'make defconfig' fails:

buildroot/output/build/buildroot-config/conf: Kconfig file missing
Usage: buildroot/output/build/buildroot-config/conf [options] <kconfig-file>

Generic options:
  -h, --help              Print this message and exit.
  -s, --silent            Do not print log.

Mode options:
  --listnewconfig         List new options
  --helpnewconfig         List new options and help text
  --oldaskconfig          Start a new configuration using a line-oriented program
  --oldconfig             Update a configuration using a provided .config as base
  --syncconfig            Similar to oldconfig but generates configuration in
                          include/{generated/,config/}
  --olddefconfig          Same as oldconfig but sets new symbols to their default value
  --defconfig <file>      New config with default defined in <file>
  --savedefconfig <file>  Save the minimal current configuration to <file>
  --allnoconfig           New config where all options are answered with no
  --allyesconfig          New config where all options are answered with yes
  --allmodconfig          New config where all options are answered with mod
  --alldefconfig          New config with all symbols set to default
  --randconfig            New config with random answer to all options
  --yes2modconfig         Change answers from yes to mod if possible
  --mod2yesconfig         Change answers from mod to yes if possible
  --mod2noconfig          Change answers from mod to no if possible
  (If none of the above is given, --oldaskconfig is the default)
make[1]: *** [Makefile:1018: defconfig] Error 1
make: *** [Makefile:82: _all] Error 2

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
