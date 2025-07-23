Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8D0C83F1A
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 15:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C1E60B6A;
	Wed, 23 Jul 2025 15:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCj8C_Claivd; Wed, 23 Jul 2025 15:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B31A460E5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31A460E5B;
	Wed, 23 Jul 2025 15:16:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1F52DA
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 15:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B33B560B6A
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 15:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ty0zTMH8tG2m for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 15:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBE0E60E5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE0E60E5B
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBE0E60E5B
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 15:16:02 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso532a12.1
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 08:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753283761; x=1753888561;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hbGTgYmhx+s5U3Gw1a7WJu8MSonHpAyr/v1MIbEpkS0=;
 b=vZqwP9au64XblSV4JvvZjIKKTrtNXXubT+9cNO8sek+5N4XspBb8fE7Eyi4Y+rJmUE
 ARGJO/cBW7NjomPeZBxs2WeXENTMCRKzbHVyLtUqYXbMTq1Kk/S/bv77Lk89cSBNn/JN
 RyTg8vc+jJJ9J8swFtvnXkM52rB/Z7xIryp4didkNegD1CnJ34ZYodqj3Gpr5u+MYymB
 bpMlZBwNWRfNTaz4iLvOpxy6DHCDT2gVKMIYQqRZS3ucYbSVG6aqVvWnsLeilRiLCxxG
 gUcLxZCEWwHWdxX5GfWx/F3AjiwRKeVg4UGvS8JtbCUwbd2iM7g6LgNEk7NFkazo7T0i
 yY7A==
X-Gm-Message-State: AOJu0YxVYmjdAzUdZIHfovl4lAdtTOkCbkUreWbs6SGAAinoqStHnAv5
 IfbqDx9g31LuBWAVZfbhgN4po+CZc93ASwI9J1dm93VLQZcUMY+P5oJBCtW4jwsO
X-Gm-Gg: ASbGncsEklWjkftGU4XWe+HLxpsBzMT+i2qJtA73MR/tD3K0F3yi+rS6sn0lLmu8rRL
 Slx+4RjaWhapFlGRoE0o3doNNmSb05gkBgXVNk6ql74n8iYCNSuwMrynqtCELoRcv9gAuwymzd3
 JfmxoOcgXDJmkZzkH/frWJ9bVk71T8X7pm9Z+KMkomVSCj1/FEGVq+u3DIOET1+iU0XvDQkBfga
 yYl8WceQtIPQtmuembOneiyliLdQOf0NUSSScNse5+73uvH6x4ILgl8HN1TpUKATjuyxANTfTrR
 4AcRxJz7nrBtEalgXrY5CMis9hFJbHLcDEOgwYih0FA+f+cxk9lzcobEAcrUgSsu/DTQ9ddgjRm
 axvvN31zGs+Y+a+K9ob0eBLruaCT0b1inXQ9WYGB31lmlIIEEeUt61nD5a9rmGypQzBbEjHWqLm
 46ZDxZuRAs8A2D94QMuDc=
X-Google-Smtp-Source: AGHT+IFD7PDIVUbvTxn6dqZpIZJ7Og6MiRDZ/M1kMVvSbPa9bfbdKHQEUVy6B+mK66yL2E4xxgG8CQ==
X-Received: by 2002:a17:907:7294:b0:aec:65de:5258 with SMTP id
 a640c23a62f3a-af2f64bd1b4mr335417266b.3.1753283760530; 
 Wed, 23 Jul 2025 08:16:00 -0700 (PDT)
Received: from ultra.fritz.box
 (p200300d1973ff600a1ab5b988c9d795d.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:a1ab:5b98:8c9d:795d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d476esm1061880666b.50.2025.07.23.08.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 08:16:00 -0700 (PDT)
Message-ID: <59619ea5bc67adf918a35f865cb1567998641e62.camel@gmail.com>
From: stefan.nickl@gmail.com
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Jul 2025 17:15:59 +0200
In-Reply-To: <CA+R_derRM8KYwv1bvaj7ZayMM=wF6AeSfAvoiidag=Luxhjdiw@mail.gmail.com>
References: <20250719143417.144660-1-Stefan.Nickl@gmail.com>
 <CA+R_derRM8KYwv1bvaj7ZayMM=wF6AeSfAvoiidag=Luxhjdiw@mail.gmail.com>
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753283761; x=1753888561; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hbGTgYmhx+s5U3Gw1a7WJu8MSonHpAyr/v1MIbEpkS0=;
 b=IKr9N1jKjZSDYrAV068GY9vF/zU2PH4YNv4AiyQbxPqwnqYI7DTvjCQO9NCsgemGfv
 ac2IV5vpRUnL69pZ9k5PD2e6i1xVLVHn9RjYpTisP5+AbC+P17kxY1D0RfO2g/jRfhER
 oQB1OsbmsdjC5iUkRG9i6pULQ5wbYutC0FCWiQp9gG77MvJ7ZxlJNpcc628SBl0ecmRi
 R40kfBjvsHLXhbRcifUNyTd6/HU5VDXt9NYq/7E7o7sBNB52vZaxjajJcVLOc9UnchGx
 7vrtCNnxRxy0GlFU37yFv9IEXHZplQdtn18kgO0ry1HN3RqE4FiI8msnHHIh5FlGFBgn
 EcsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IKr9N1jK
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6positioning: New package
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

Hi Roy,
> Good to see more people working on adding Qt 6 packages to buildroot!
Thanks!

> Bernd Kuhls added this package a while back, which I later ported to Qt 6.9.1 here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20250610122924.431830-3-roykollensvendsen@gmail.com/
> 
> If you see any areas of improvements please feel free to build on top of Bernds patch.

About that, my plans were actually a bit different.
I have already prepared an update to 6.8.3 (latest LTS version) that I
wanted to send out as soon as qtpositioning 6.8.1 was merged, plus a
minor bugfix (qt6quick3d missing a BR2_PACKAGE_QT6BASE_CONCURRENT
dependency).

Do you think we could defer skipping to the next non-LTS for a while,
maybe until after 2025.08 is released?

Regards,
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
