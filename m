Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56923CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 21:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11EAB41BF5;
	Mon, 11 Aug 2025 21:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZGyC4Eos-oA; Mon, 11 Aug 2025 21:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C4E741BF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4E741BF0;
	Mon, 11 Aug 2025 21:47:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C0C5D98
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 21:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B60840EF
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 21:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgfU8N8EvyCg for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 21:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8D60840E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D60840E8
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8D60840E8
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 21:47:46 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6154655c8aeso6757210a12.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948865; x=1755553665;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJvI1e+9VgdeMavDAuxF/MWCdaS1KDmpvLbLAHgcSgA=;
 b=KYJZ5qW7XPFPIV91pYIctkGwmzUoLGoHrfHQi8QqXqNkEZU0L7ERMR27JINt+7QjXY
 eNEz0BKiFDct0k6M31uWVaI3hdygS+YLDBechHlI60o4YP4xrBxpKWmvYu2kVrnoVS8w
 SDEdENWeHtM7+W1Vt970lCWoxJZbGlLf2bzhz/xjYk5N5S89hn12slw4cf9f+19j5rJ8
 PjL6RymQWc34vR/2Rs96aUBFv4aTCLhJGt68xF7+c4pCA4GECOLd6j+sl6wVyS4TRYND
 VobhWDVZyzZ4DDFCp7UMOPFav3E8w4UEijZaBlxaOuSSKfo3cRpGnp+S06chVKzSH1d3
 F35w==
X-Gm-Message-State: AOJu0YzdTibjJ/bDn+eH2YDUhWAJu4dUldAOtYk4UHmkL9S9hxurysNz
 0sQQZIANOSVDTelUvjdmF2YtanoBtrvQhiOi7+TV4tRBNEFdpHD6z9BLb9Mevg==
X-Gm-Gg: ASbGncsCCNJaso5TaJZvO7hho6vr4ovprq4f9obtWed5mXRmX9t8pRvTDE5wNwZEh4v
 fPC1InCDCL/+j+tEEBy6ltNtRN0VepUCyG/yJhUMC6ms4zIKTBKkkYKUb0KK8NL1kwdoPsuWHPv
 c90gSyccLxzyLZlhDe8UWhSx7gDst1vWzUSKvmHydJdzKQVv25g9o13bUNzAAqFVn7R6sE/nveE
 sGhy3t7x2zrHNqZ6V1fLLDs91iRn1Ah2aPun/uYaB4haw2eg4/K/AsYA06sE1ui9pzGGhOUax5U
 WiD5SmxUA3B0mtiqbnj0znvMO0CXtBlawrFXgrADmpzNuqWnemk6TbeWwRqs59MGONEkL4N0Izf
 fZlNhHCwbvsUuhV0qQdA7n5yDmKU=
X-Google-Smtp-Source: AGHT+IGL871PuAYEHl0uPrsF4GWzt133WrSuGSdVSCF11siLPG9TYoPFwO8yDK+I4mBaa1CGtlid9A==
X-Received: by 2002:a50:d68e:0:b0:615:979c:e8b2 with SMTP id
 4fb4d7f45d1cf-6184ec9d71fmr403520a12.29.1754948864558; 
 Mon, 11 Aug 2025 14:47:44 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9113e40sm19095508a12.57.2025.08.11.14.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 14:47:43 -0700 (PDT)
Date: Mon, 11 Aug 2025 23:47:41 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <20250811214741.GA589128@pevik>
References: <20250811120851.543585-1-titouan.christophe@mind.be>
 <20250811120851.543585-2-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811120851.543585-2-titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754948865; x=1755553665; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJvI1e+9VgdeMavDAuxF/MWCdaS1KDmpvLbLAHgcSgA=;
 b=iWmidwfy0Q25NnLxJ4xo4PkBNAXPemIBxEWzZ+bJKj5SlooE1jny6KqL4RlLlBpKxa
 Rm6NfkH2HgRO1AvXbpEZ8vmk3v5VkbtaFidppGgDkFdWNWuBPw+NO6vJIX1qe70aCTKf
 VtmdtkFHkoUAR47dAl6SO8rcINBIpNwCaoAlRehuyZD/9uySZ+qJxi0mJGu3RYFyMnS8
 /0DvfJ6Sr+I+f8ocdIQMuRvOEPQ73/iNBYdW1inE2FWZTVANlpEFtgCMGqQzMQ+Yn7Om
 Ka7A8FzElozYWc6Z4WilFyQrHun8dxAtIuyswkqFCEVJoMNEo2NX4GGKTyhjBhvmdklI
 S1Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iWmidwfy
Subject: Re: [Buildroot] [PATCH 2/2] package/ofono: security bump to v2.18
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

Thanks a lot!

For the patchset:
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
