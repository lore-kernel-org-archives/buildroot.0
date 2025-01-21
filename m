Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4B6C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 18:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A86DA84E50;
	Tue, 21 Jan 2025 18:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scy-4CK6pGrL; Tue, 21 Jan 2025 18:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A986484E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A986484E5E;
	Tue, 21 Jan 2025 18:41:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A77C1
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03AB360678
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWkJabDD0kS9 for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 18:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7B3560616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B3560616
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7B3560616
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:41:03 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-306007227d3so60209861fa.0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737484861; x=1738089661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCFK/uko1+9s8iAVrGMr84Bt+JHXm4ViZa4LYwEhJeQ=;
 b=ae8wpUSV0laMKAtoz3H+/lFRnryU8j2AXQc5D1XccX7HWtaEwLZeqQF8NQFYvieS8F
 2ee2R2VebKsmacSewFedydDRLEooNVWDzG2xy/9hY/uXrYBD4pfS7uPMQ39zUOXUiM0P
 t4M4haIB7hegroC1QsHpiZXQ0F3j2XToaw3Ykxtv3Sb7XrF0v3I00/t1q9V8vr+6+5Ma
 29khz1vRte/1UApPAjBDIojxH/NZsoAksiEDQiUQ/S9GDOZSkxziTHfSQEg4cvNBDBMz
 DQuowaTyFmYGqK9KsIKgU9b9p1IPH1zppwOZREiwDyQ1zgVtSovqjsUjUHixczQkFDFp
 sooA==
X-Gm-Message-State: AOJu0Yz9OtybI6vty57qWgRKoOWMLUFjOz35dD6BbkgpT/J5ic+PMC/N
 3HPSDJ2WpDytgqLs2tgWhPdihCpG80HbmQoGgxYUUyc+6YVatnWUC38z6g==
X-Gm-Gg: ASbGnctFA5zSKMxFx7wZFszmTIcUkiAHWGO9v2DyxMmNwRMjrtLYMtLfMBuuzPwatxK
 VOoumsDVP2OAT8XiSRehuB47wg5sWkTOwa13suKeV9BnCtTiyEcUR4Wv/jfEe+8ys/7w0c5RLrQ
 PN10c/Y84xiIyDu0eEdTYQraAvJpWz9cZBcCAJTiExUs5ZtAgMkbwnR7c53KYKBMY/xmTtAMb4A
 PDrXEAAGLDNYmNh64vuvctBHH24zLIDqfEJ1rDQ+St38SZjzEB/3tKnkhxtLQ==
X-Google-Smtp-Source: AGHT+IHcjgUf8VjJChluqvTBGbEc0uo1h0w4D05iobYniNLURlmopYli2l45pnSdfXtdEzuimDhgjg==
X-Received: by 2002:a2e:b8cf:0:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-3072ca9e030mr81399991fa.22.1737484860923; 
 Tue, 21 Jan 2025 10:41:00 -0800 (PST)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307587bbe26sm485591fa.66.2025.01.21.10.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 10:41:00 -0800 (PST)
Date: Tue, 21 Jan 2025 21:40:58 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z4_qOjpdhOtYlxeq@curiosity>
References: <20240826214434.1530363-1-geomatsi@gmail.com>
 <20240826214434.1530363-2-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826214434.1530363-2-geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737484861; x=1738089661; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OCFK/uko1+9s8iAVrGMr84Bt+JHXm4ViZa4LYwEhJeQ=;
 b=kaiBJCeLXrRWTrof8BEDNLtGdIlFJ2W0BYZ+X9zQLmub1v3ytqBmP/XVHJ/EV2Y5GE
 qQo1oH5TrOfK5TCmcqJddcxoWK/8Eddcp9VbIjVlaaH7sgvu7mbU4JUfR+1z8SaRnzKS
 oKhC2485FrT3w4zVCKkaYa0k6N+Z4kNEib97Vn9XoEyai8GR4h6M1KrkdgPDg36IkzYS
 lDxhIFk6JRLFiQpO8YnPVFskotKx1jOlRtKOpxBRaAJF6Rhx0mqw/1+gFJSHzmtQ7oEm
 M9ZuD4G5oCeP4VRMZCVokWfW0PTYJ6MLVpeVBwWMWqW6UqiUm00k4aW8dSE6M373N9U7
 BJbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kaiBJCeL
Subject: Re: [Buildroot] [PATCH v2 1/2] package/linux-tools: perf: add
 explicit option for libbfd support
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

Hi all,

> Before Linux v6.4, libbfd support in perf was opted in by default and
> could be disabled using NO_LIBBFD=1. Starting from Linux v6.4, libbfd
> support in perf is opted out by default and can be enabled with new
> variable BUILD_NONDISTRO=1. For details see the kernel commit [1].
> 
> Linking perf against libbfd library may significantly speed up perf
> report and script commands for data recorded with call-graph information
> based on DWARF format. Without libbfd perf executes a new addr2line
> process for every address it needs to look up. However perf linked
> against libbfd may become undistributable since perf is licenced
> under GPLv2 and binutils libraries are licenced under GPLv3+.
> For more detais see Debian bug report [2].
> 
> This commit adds a new BR2_PACKAGE_LINUX_TOOLS_PERF_LIBBFD option to
> perf to explicitly enable libbfd support when appropriate. Note that
> enabling binutils in the configuration does not implicitly enable libbfd
> support for perf anymore. Also note that if the new option is not
> enabled in the configuration, then the legacy NO_DEMANGLE and NO_LIBBFD
> options will be set for perf in order to explicitly disable libbfd
> support in pre-v6.4 Linux kernels.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dd317df072071903031ab5f91b4823858445c4a0
> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=911815
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/linux-tools/Config.in             | 10 ++++++++++
>  package/linux-tools/linux-tool-perf.mk.in | 15 +++++++++------
>  2 files changed, 19 insertions(+), 6 deletions(-)

Friendly ping. Any thoughs or comments regarding this one ?

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
