Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DC2C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 07:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C682460698;
	Mon, 29 Jun 2026 07:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVqPXOEoHRHZ; Mon, 29 Jun 2026 07:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C0560ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782718966;
	bh=8qoVxxBq11x0TNgBaAmSbuxVOAa0hzyFU5Mu2MeNE8M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CsV/3q6jn1+pUugOeaHNUS5oGcLW4KPXFELm98JK0xv746oDDnig0Yq+BC4BvUhBI
	 vxghPPLn7ECwvR18t2W8W1qDKxMBtZjezO22qzSSEO8XED8V4YXspgQpzQQ/eRYpaa
	 7AnAhLH7FlscDHzeGwGGY35s0yV2dXFLcUEbrR43wR58PFWewaQqS/ZIrX4y7MJrgI
	 6BcreRp3qVT3xs4g2s45KPA3cOz9V+5fcCbp0g683/GGbYWdtCHvAoLYHsQxO44+ZZ
	 pT0nHTTfI5yKTUfDfXqP2lmczeIcPP7UhW2KhitvJF4eA41m2KvcxOui8VgHCR1svE
	 Ua5TE7aul3kHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C0560ACF;
	Mon, 29 Jun 2026 07:42:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65ABB264
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF8A816E1
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCqthhFn4axG for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 07:42:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 980178169B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980178169B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 980178169B
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:42:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4926fe5be4bso21903615e9.0
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 00:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782718960; x=1783323760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DdNlAzaWM7417+GwwoRxGpSFUSg24c9/CdA7aA1gT1Q=;
 b=aj7sZpReL0LCeGs9jIAqfabfZNXzH86OF4Om6fF6pzQTQue5mnx/j9BobSTpl/FjND
 OqqN3liVMqR52BovE04pycHnkQ1MmovCTHfpWUNktH1rmqbGuvNXu4B9TewbI0e6RqPy
 VCLwUJ9r7kxwsodChVMdSwsNSg/OFYdbx5bGr1hOf9Gf7XU53dxm7amtWiqjp3u9BWXw
 tJCsm7zK7/bzWaSQDCpYevsfWq6SB5DQEWWqZU/Z1GWUm1N/RmHjSrUrMNUVmNioLwMC
 ZUurRTj0V2uZ352G8Atfs1l/BoLX6wI+p8sALfozt4payh029kDuHdRX6RHcPszRc4OH
 2LIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uIeV/1hPCw5zofbx6USTJMmUir4GpUwF6ISzKvCECx62b9G9BItXlADE7Q+P6EDX6VMf1f/+1qC4=@buildroot.org
X-Gm-Message-State: AOJu0YzgHeSdrELQXtPIe7CAhKbVMAN2mRkp4oh/cdZZ3qaf7uOO2mX9
 AR9R8meJwsxURMS5/1iYp8mqDpbsExSto6oEC1XK0lD/938Ufgn4MaC3TYO/oyk9Xw1COFiB+kq
 n8yDL
X-Gm-Gg: AfdE7cmQhD9fJU8s/tpFMhM+ljzoB7hh3Fe4x3PvFVmfO8B4k5pKwY1Ib4JGXAyN1HX
 J7+GLIli6Mbrzs0j9b5Q5qcZ6VnuP7aUq/qCsATK/6BjP7hVm7aY2q//4GKxqYz89I/oAjNLK/p
 9yZWAFKI0/IJ7TWvwvRETMVTxMpF3zS4WO5rt1SEmrmzXHqqh4RrLboL2cW+yn+XAiFzpk+9uDn
 2EwLztmoXrTW7d3R1CHOP3eHXoCpODpKQ+pbjkrZFFLHXdqiza+b/26cN6EpN4ibiljs2MZtZkw
 ufA3opFP/XVNOkOv8pu4eo/0NDd02yIWv/WO94kR3uVy4h3mA9tEpYEKxylOHtANSmGl4CZWKkG
 jDGEB32R3VWWh37Zik+cpYBqJV3BXtzraMkC0uZZXIJVMP6/GO26b3zN+6R2wOtH+rxkoL/7+ON
 HNrnA3
X-Received: by 2002:a05:600c:310d:b0:493:b646:e90d with SMTP id
 5b1f17b1804b1-493b646e9c1mr1958555e9.36.1782718960125; 
 Mon, 29 Jun 2026 00:42:40 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fc0f32sm294958655e9.3.2026.06.29.00.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 00:42:39 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Jun 2026 09:42:39 +0200
Message-ID: <20260629074239.273485-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260627120452.803450-1-fiona.klute@gmx.de>
References: <20260627120452.803450-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782718960; x=1783323760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdNlAzaWM7417+GwwoRxGpSFUSg24c9/CdA7aA1gT1Q=;
 b=QETJZCBn0vL+lYIun0txAZ4uItpOcWVyuLDifFaEj1xArnvMgMqxHlUkiBToMhWkpE
 M9eoScuSaphTgNZBPOHtfQXhgth5QKYfr96hlQL0Fm+DT4v0ZIFs8VVl/TjeOSPuu8Ta
 Q0z75vFMcth6H3YRJgXqEqiYCZgDH5PUzhZlfQRYsIp0mkRUgSenE5YGU92DtjhKQ6pt
 0iw794kiHR+WPxnCt5rGBN7Bt9WcJ4fTgs/dKRgOEEe0QNga2B+YUL32UC9XC7/IlG5H
 zJPR82g7gtDv0+CSuTYy38SJIrZ3fdtVf9DJ983wHAS6SV4f7lhs+2oHCkEm8KYW40qk
 VczQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QETJZCBn
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: drop unused
 0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
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

Hi Fiona,

In reply of:
> In 11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf the patch was accidentally
> moved into a versioned directory with the wrong version (2.82.0
> instead of 2.82.4) and thus not applied. However, there have been no
> issues reported.
> 
> The patch description mentions being needed to fix build errors in
> package/atk and package/libnice. It was originally added in
> b094f88a4d501101bfba9b65491209e6a0fe0397, and amended for libnice in
> 2c916b400bc608512db790d97df010ca666b6dd2. package/atk was removed in
> 2c3ca7bea1de76163aeef432412eb14551ed0581, because atk has been merged
> into at-spi2-core. Both at-spi2-core and libnice are Meson packages,
> as was atk at the time of its removal.
> 
> Both current packages build with the following configuration (tested
> using utils/test-pkg):
> 
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_GOBJECT_INTROSPECTION=y
> BR2_PACKAGE_LIBNICE=y
> BR2_PACKAGE_AT_SPI2_CORE=y
> 
> Evidently the patch is no longer needed, presumably because the
> correct search path for GIR files is set by other means, and we can
> remove it instead of fixing the version number of the patch directory.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

> ---
> I admit it is a bit unsatisfying that it's unclear exactly *what*
> fixed that search path. Another bit of evidence I have is that when
> working on that libglib2 2.82.x and gobject-introspection 1.82.0
> version bump it was primarily for package/python-gobject, which also
> uses Meson, so it probably was either that bump or a Meson bump at
> some point before.
> 
> TestPythonPy3NetworkmanagerGoi (accessing NM using python-gobject)
> passes with this patch.
> 
> For stable branches it's probably easiest to verify at-spi2-core and
> libnice build using test-pkg and the config snippet above.

It builds on 2025.02.x.

Tested-by: Thomas Perale <thomas.perale@mind.be>

What do you think would be the next steps ?
Do we still need to have a shared patch directory between libglib2 and libglib2
bootstrap ? Only on 2025.02.x since there are not patches on 'master' branch.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
