Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4A9C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D2C80EC5;
	Tue, 21 Jul 2026 20:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gffvva0iEHIE; Tue, 21 Jul 2026 20:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A011E80EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784666611;
	bh=anXmq2KGgGU9J6/ujdBum5/EK5pk1o86yQEcS7oy/U0=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=VBS5Hu5rNrccg2IkvmUeVNGf3LIZLDU3TYr+f1z3S4kLMRMwkMaPL0TsVlW8ivzY0
	 fae7uUzverzGweKA+1ymAcsxPxeK83fjnKmfh3Bp0MMO+dZtMFyWPF1SszBn8RF80A
	 6heAtOIbqrubuiRiPJy2fS1qRcxow26LaU6dojmyzXuEEuDdWKjCubcYMtPu+Sx2l6
	 H/RbosgnNRvZcfKFNZCMhllP7OTgOlehsObXeU+ZaNH9CFdQuUfQia20Zy96thWUkM
	 X5kH+fcCMbm1A2n0g1P5e84MXkn1YBjswDCMYpWNFw5SXa+zyS+wXSfPyRer/55Lpi
	 I8b2AU3IASkMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A011E80EC8;
	Tue, 21 Jul 2026 20:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBE59E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D5240880
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9UUwei9fGNE for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 016DD40858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 016DD40858
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 016DD40858
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:43:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so4273350f8f.0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 13:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784666607; x=1785271407;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0EyT+NEMqBi+3UlMvaaxdXj2N8SPslK+hkXFSdNGJnU=;
 b=hfyQOGyThX4SgnjLdwaHw4oH6u4jFvO+IvJ2R8QoNq/79Yv1n751mDhFYT6U6w4SXH
 yWJn0j0R+2QxTEwps/ofCMY/saj1aSqFTnHxplydLdxSjfn6sYwV33KkmbF665yUqyQW
 xEs3J4GVTthY8UDUEvAn9s5yIXxPh2GkxG08F8xSy4p/mQaVgRD3Qp/GveEAPthWrTGw
 6I1Gs2NJxxfQ2qUWoOpoVZPEvPMI8yKJUAHsZXazwN5AbR9JE28E1upkatE4SP9fFyWI
 P0ew/mwlZtJSUYFKlsE117xRA8iuhNuTjzZZ2SOMeLQtdwR/8QLw7n16YhxVrLmjZ/kw
 K3dw==
X-Gm-Message-State: AOJu0Yz7mJm2ytvK57pSBsxXaVZQKGhUXKSbsxRn+g762JI0QqKodNq7
 IoYrqOgIn7U64IiZkCuTG8bNrSfo4NNaNcznk4NYCdhLHpDyyo0iYKTd
X-Gm-Gg: AR+sD11oytpKdngwOY5d1rY0tZYLM47D5carb6tbn+am91sVrZsf9/WfXSg719XY1ZQ
 PbFCx0Lo4fPbkmZXQUduMk8LmykrgVwg5dtloxFNXE3vLg9hIW+qWmWjEZiLigp3hHIdhlRL45S
 RV7F5lQmo+vZPLRAdb4BzOXB9lAY7ZwVog3hMxLsIT/GiFCFhRdbFnBvmu9iyar2k0JH7UEFShL
 r5bSb+sqmbCrmq3HDz6hddRbDUMAVnUUqt7lrOJfcCBo4KP78tcFUsKkMw33ItHieUiIpnrlGxE
 Q4lLQ7KZj8mG16h1FNa2rsRD5WoWhY+Bs6QPMjreuEiic8ZA9Qb14gFj8Dz8ksyDREhRn5syNYX
 3bVxI0V2yqlRF/nv0PAt4oarTx2A/mb34F5RhRjE5raX+U8Dw8zBR0sKYcR1PW/FUaETKeC+xWl
 mB7hNKxElP5qyFi5dva7c1Da29LlcP72xNfLnis1E=
X-Received: by 2002:a05:6000:2991:20b0:47f:70f1:a577 with SMTP id
 ffacd0b85a97d-47f70f1a665mr12634386f8f.17.1784666606652; 
 Tue, 21 Jul 2026 13:43:26 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49acesm40122987f8f.6.2026.07.21.13.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 13:43:25 -0700 (PDT)
Date: Tue, 21 Jul 2026 22:43:17 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20260721204317.GB23326@pevik>
References: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784666607; x=1785271407; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0EyT+NEMqBi+3UlMvaaxdXj2N8SPslK+hkXFSdNGJnU=;
 b=WmYNBOQFrZvlcSTi1Y0FNQgDw6PA9XmrJVolYSnZbHhX8aiC8IUi2DYy+CchwoaCh9
 0YuBHNa+zlHNrGsQ4e5SYmtCvlSM4H4sEMnPqA8lFU/3MAac1N+O1kbJ8CL1ux8bwUjl
 Pb89m2KM08BCtFqcN8nIPePy31upIrFj0dsAJsm4M+ZTFCK/HbwzpcL9x0T5nWp8EySW
 G83DATWnRcY1sHYb+534k/om4YOEd1P/z5EjaVjOrVKYaqX2bIL3bDaAgIchbRDiFMat
 tesmmdjoZfYts3ZZ4ckz+duK3bOXDE/70KzdJLx/mHmizpPTz4r28JV0365L+SZ6XeqR
 R4vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WmYNBOQF
Subject: Re: [Buildroot] [PATCH v4 1/3] package/jsoncpp: add host variant
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Chen Pei <cp0613@linux.alibaba.com>, Gao Xiang <hsiangkao@aol.com>,
 Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Bernd Kuhls <bernd@kuhls.net>, Alistair Francis <alistair@alistair23.me>,
 =?iso-8859-2?Q?Jos=E9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Brandon Maier <brandon.maier@collins.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
