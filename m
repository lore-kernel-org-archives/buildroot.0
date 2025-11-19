Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B222CF58C2
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 17:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DA8812B8;
	Wed, 19 Nov 2025 17:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DH1YEY3_PZQx; Wed, 19 Nov 2025 17:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DFA2811D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DFA2811D5;
	Wed, 19 Nov 2025 17:44:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C7772A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 17:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B0D18113C
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 17:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlggWl15u0OI for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 17:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FF2C81083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF2C81083
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FF2C81083
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 17:44:32 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-37a2dcc52aeso70729001fa.0
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 09:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763574271; x=1764179071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBwhFn06KgwtBg75IppzPSHSONCkQm4mppvVhu6/9Is=;
 b=JV6BWUfhkJ/MEMWIBthXtMxKICKW4za5JIZq8T9fPOIqdn6U9VYN+CxPkT6Pu8M26+
 Z3FpMabUU9EH8TpGWCyQJAMneOiO6O9BRhbf+WuMK/1gIk4b1Z+/56oQFGwCfnyv146w
 yxe2s9waT1ygUt8d+UjBE61JDwzMpaTaWitioUomSD9DYlMspwbSO3LXewznp2Q0JIrK
 iRWXNfOavYxwTyWkUbO95G6YU3EvBgcVPHc8S4l9Hcn3w39ItgP2BcSh2uR7v5kYULH3
 IeuxI8qSx1SZp1ZGPtWpAYoATt1j6UCwuSwqkVPqdAPVxBjSTv+i6J9gQbdXA8Y7Wqd2
 Bh0A==
X-Gm-Message-State: AOJu0Yw7/Y1wKyghhLZkLgdd6FMbrAP6vFI7dBKkeogsNPTDYc08JOmr
 M+Gycrw4QGFHcGHpswOoiSfPDb4vLqZCcxAF4YuNvkCn3dP5lfYWk1dgF66EOZGOKJeKDNXshlJ
 CbIG22RKHuHp8a9qWBdbAZtPNp6dLi2k=
X-Gm-Gg: ASbGnctEihsPzQ7zOWNZghXPWPLCukn9V7rZK1GsVCt5mMjKed4X1/Q4iis3LHsaJGw
 a/+5IlU4d+12+hy1pJEz1PYLAe0cVtf4RuRBHENSFmGGWlkyDKStsTuqEU1SOvg8ttgDJzpCvbu
 /Svagd9clkNaxhnML5UUF2TIcyZHG30Jtjzbfo7baGMwEpWPcY1QYWXIpe8P1woSIUCaT8MT0zW
 wteie+QALWMSCm1TufA/4kPpiTpQJH4dvFgVpkJIo+IP//zPFdTGwgJCha+WeGPXtkDGlzKwkra
 7fF+j56LqesXi4z64h+7UAGjHSLL98VpIKHJFA==
X-Google-Smtp-Source: AGHT+IE20C7i2xvQ7TTtCYUeXZT9yCQPjWJGMQL1+7RdLhRPVsDhDiAjNOy6/SCTkZY7V1TbSxrmPkif7h0/oY+eLxo=
X-Received: by 2002:a05:651c:4204:b0:36b:9ecc:cb36 with SMTP id
 38308e7fff4ca-37cc67c31efmr619731fa.23.1763574270557; Wed, 19 Nov 2025
 09:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <CADvTj4qKBNEobk78FM1Zxj8n1irVV+LaApwWR=rDcbwf8+2mmg@mail.gmail.com>
 <CADYdroNVCmUqTZB6cZ6r3=pnvARiGrnd6V+FeY3cO4tLFFUCEQ@mail.gmail.com>
 <CADvTj4oCZzy=O+j5Y_xOeQAXUcNe9EzZ96oHG-MQwEuZavXLmw@mail.gmail.com>
 <CADYdroOdjA_Qr87SyZExhpM1WqT4O-ff0MdNvNZfsttxmvNwVg@mail.gmail.com>
In-Reply-To: <CADYdroOdjA_Qr87SyZExhpM1WqT4O-ff0MdNvNZfsttxmvNwVg@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 19 Nov 2025 18:44:19 +0100
X-Gm-Features: AWmQ_bl9JbMJHiRznx6tJ1LQd1VPKIxW21NkPwXN6F52C_woY4WPXo8-tn22YCg
Message-ID: <CADYdroNV1m5yjDbyPqvU6hZAOSSoXgRK9tFZk0ovFwWokOt4fw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763574271; x=1764179071; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nBwhFn06KgwtBg75IppzPSHSONCkQm4mppvVhu6/9Is=;
 b=Wf6b6XcDzQnO/a8Bc7tidPn+uJLu40DqdtE/2G0dgivYyV9ZNRYIpy8fiYGreVglLM
 xX6xc4Wsn2TVkQMrsnsOHKSKFg3/IDtRVKkhNdbi/GQcamYoJdrbQuMBCwnGyWIfYQgg
 U1QeGOcRL0Gz/CuYLWxmDrrfFtC3qJWD3mmPGKVm5RwApTIi7BjSspXgSdUvPmuRctPb
 eUWMzHVU6iqYcTmTLfgj3PMId/mqseZVJscYrZTVym2iRV9jM8UeibwPvC/WwD7Bn5Kl
 cNKCtvoQhPiAWRZQ9QaRHwPZBIJhcaHidP3wmh5q0HUOZQr8HDRkYrn9W/++z0HHTsZP
 7ERw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wf6b6XcD
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

PS. could KCONFIG_ENABLE_OPT do nothing if it finds "# CONFIG_$(OPT)
is not set"?

The biggest issue is that you cant opt-out of the automatic opt-in.

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
