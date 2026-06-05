Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D62CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24695820EB;
	Fri,  5 Jun 2026 12:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTg7ZnV1AF8V; Fri,  5 Jun 2026 12:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03560820C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663759;
	bh=WpJ6erL3nMo19btW8thRZZe07Gtjltg0NmDGSepnOmk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gqKhxRHXITT+xza1IvAsFUxMb77duKO8Vq5uRRtONa0UkIrXJzPRSLqcagz1i8Obx
	 wH7AftIXGVBv2Cgs2Gwg+DTo/ye08/PZagPdCalvQUMid1dY78aJaeYmnazF8cR0/U
	 AeWPSYOyjA7MAHN1Y7gwUCDVSQQmnwT0pyxQkxIVsdQMVSA94XZXPbHbKWgDxWyST0
	 BDQ/tF+qUeWJ2pndBdsqO76ZuhYyD/10PF0xPfX/fQ/qlj7UH635n4dCzalskzmoke
	 xIAN2xIJAPRA3ejzy7AaTCh+Jr7RiGIi1pWWd5zN87q1SyBcXYoHxVgfwLZdycNDey
	 kn2jLpFiWczWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03560820C8;
	Fri,  5 Jun 2026 12:49:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDF2388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A453760B53
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYcHCtGbIGCB for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 718F960D6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 718F960D6E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 718F960D6E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490afc47455so9296425e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663754; x=1781268554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6VTgaG5r14w69SE/3dwy6n7ZMiRoPgeK0Zott+LWpj8=;
 b=sEMOS0cJk3ueDEkUQa/6mH0lgOPPpPG0boqttFbpFK+6AIf0jgrVtk3iEUOdZ6Y8xK
 A8qX3rQYXS529FIjdNC7X1MfkgZVfRtrYb2MJhZUHw2hELTS/GA5JNEoMuT8aZ3UNg/1
 l+y/GWCk9RxDJhN/lI2DVOLe53f3AgPX/ct6EZgtVGuVCLxLZ5raJ4x/MC9CzZBDplYu
 STWFFYgiviXwQh/heW6mZDAC4llKlJiylgW2AbP/4zRq0/F7yqpdmVUH2A4qDzJV7OA5
 +AagMnfx29EOBlzUb279M7FIEWm8B1ma1winZidOyWhkdulI1BnD+wIeBRPTvjskk0kH
 JDWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4GC7c3u2nwscVOiJcTcitUFWg477lDU4ijti+dy9g+vPyuAneuHwI9QlKccLW9MppnfF6y9wVP64=@buildroot.org
X-Gm-Message-State: AOJu0Yw3Iw5K3nWwELfcv6DzCOuBOHyq/MHwMRxV28nzNQPDtTn6BFO1
 80urT2bCEY30lDTk3WHQzx3kbMGTt//0tdaa/SZ/9wTgaIMGQBgdFetgxvGGwd/YeRs=
X-Gm-Gg: Acq92OGjTl/xTHfQw8Ew0dK4dXsEdPVnCqxzJgG1SwENfo/dsQeIgzuUBCDjcEES2lA
 QDeB+0NW9k5aqGMDVd746NZhi2mvUVkRfoIE+S2kyGR4s33nckku7+sOb5xPRWgSJpK5BqpILrl
 7fb7ZME72zIbmezOQZQ1VPzb58I4FbCNxXg+KpvOj+v8zuqwYmUcdt1toM1BEmXSkpkq2wmpVa0
 lOgs7q7jNJ4I7zj3wokK4yjlQqLpcekKqc9a4Ou8rwiiULOYzRZxnGQQjyb49r1E3LHmahIQUfZ
 tqrjMxWIkeqbKRj4TxipPoYbG7QSfnOOqNMcBeaIYULCVeYOrjiwnmhobatQAnyiXCGB4GibwFE
 +RKhAQmJiL9fDpwE+ZF4lEy0akBHhIkMTvoPxPtHMKOvh42p9EIUNihwVa2LLMfDXSLIquw9D3E
 W44KbTl0TJmly26PMTteMY5ZbTrKDoYquLlnjl
X-Received: by 2002:a05:600c:3b09:b0:490:b446:fb8 with SMTP id
 5b1f17b1804b1-490c25c66d2mr53415645e9.11.1780663754393; 
 Fri, 05 Jun 2026 05:49:14 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3b5b06sm136460415e9.3.2026.06.05.05.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:13 +0200
Message-ID: <20260605124913.270520-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260116232717.937891-1-bernd@kuhls.net>
References: <20260116232717.937891-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663754; x=1781268554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VTgaG5r14w69SE/3dwy6n7ZMiRoPgeK0Zott+LWpj8=;
 b=cutk1gJ0B8tl4DSOgn4ZZbr1ikw/NOrUBzPgXzFbEzt0BB5jitiKPO18hYmSkhmBjN
 +klXHKPR8t6WrTXsgveUcVBEviReiFPPhJudsciL4UCadQ7EZeXnRj07g6Hsb51WcI3l
 DKHJ70d3rKrFJXnttBN7ExmJ5vfpPoLUV8taR75Ap3uRXfn6kQk4uZM0Ugy8B+biyqJC
 GQVPra2ayIBKf9fk2Y/03vms5MsrunlWIviF3JxZnBuPmGY3ImYJZRsA1bRC42cH6vB8
 yLSNER/dxjq39zb7RxKLfgwFc0rsOP4aMbZSesrbpTgPYub8gksUoJFzEOZem9912HFM
 SXoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cutk1gJ0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux: optionally add
 libpthread to uuid.pc
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
> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
> util-linux from version 2.40.2 to 2.41.1.
> 
> Upstream release 2.40.3 contains
> https://github.com/util-linux/util-linux/commit/e143539d30fd18afb3ba6d3c6e50a260d4219895
> which unconditionally adds -lpthread to uuid.pc causing build errors for
> other packages using non-threaded toolchains like erofs-utils.
> 
> Fixes:
> https://autobuild.buildroot.net/results/582/5827995db2a805e0c8a04fde8498eff6f28aa6d8/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> v2: patched autoconf files instead of sed'ing uuid.pc (Thomas)
> 
>  ...optionally-add-libpthread-to-uuid.pc.patch | 42 +++++++++++++++++++
>  package/util-linux/util-linux.mk              |  3 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch
> 
> diff --git a/package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch b/package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch
> new file mode 100644
> index 0000000000..1c48d639b6
> --- /dev/null
> +++ b/package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch
> @@ -0,0 +1,42 @@
> +From a06adacd1009174b7ca35f529a2db165f6c1f3aa Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Fri, 16 Jan 2026 23:33:34 +0100
> +Subject: [PATCH] autotools: optionally add libpthread to uuid.pc
> +
> +Fixes https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953
> +
> +Upstream: https://github.com/util-linux/util-linux/pull/3973
> +
> +[Bernd: backported to 2.41.3]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + Makefile.am        | 1 +
> + libuuid/uuid.pc.in | 2 +-
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 01e99701d..cd1d157ce 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -189,6 +189,7 @@ edit_cmd = sed \
> + 	 -e 's|@usrbin_execdir[@]|$(usrbin_execdir)|g' \
> + 	 -e 's|@usrsbin_execdir[@]|$(usrsbin_execdir)|g' \
> + 	 -e 's|@SOCKET_LIBS[@]|$(SOCKET_LIBS)|g' \
> ++	 -e 's|@PTHREAD_LIBS[@]|$(PTHREAD_LIBS)|g' \
> + 	 -e 's|@VERSION[@]|$(VERSION)|g' \
> + 	 -e 's|@ADJTIME_PATH[@]|$(ADJTIME_PATH)|g' \
> + 	 -e 's|@LIBUUID_VERSION[@]|$(LIBUUID_VERSION)|g' \
> +diff --git a/libuuid/uuid.pc.in b/libuuid/uuid.pc.in
> +index 51929fe80..a40dc6644 100644
> +--- a/libuuid/uuid.pc.in
> ++++ b/libuuid/uuid.pc.in
> +@@ -7,5 +7,5 @@ Name: uuid
> + Description: Universally unique id library
> + Version: @LIBUUID_VERSION@
> + Cflags: -I${includedir}/uuid
> +-Libs.private: @SOCKET_LIBS@ -lpthread
> ++Libs.private: @SOCKET_LIBS@ @PTHREAD_LIBS@
> + Libs: -L${libdir} -luuid
> +-- 
> +2.47.3
> +
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index d0a03be404..1cd2364944 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -37,6 +37,9 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
>  
>  UTIL_LINUX_CPE_ID_VENDOR = kernel
>  
> +# 0001-autotools-optionally-add-libpthread-to-uuid.pc.patch
> +UTIL_LINUX_AUTORECONF = YES
> +
>  UTIL_LINUX_INSTALL_STAGING = YES
>  UTIL_LINUX_DEPENDENCIES = \
>  	host-pkgconf \
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
