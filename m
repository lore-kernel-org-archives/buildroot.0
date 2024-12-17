Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A8FE77184
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 22:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4514176F;
	Tue, 17 Dec 2024 22:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVarylGT1kYR; Tue, 17 Dec 2024 22:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D8B41773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D8B41773;
	Tue, 17 Dec 2024 22:21:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55832CE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 22:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 430E484AC5
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 22:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTNgeOk7LqiF for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 22:21:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.42;
 helo=mail-lf1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F12784AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F12784AC4
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F12784AC4
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 22:21:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-540215984f0so6480035e87.1
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734474060; x=1735078860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NtnJVCqU5Ny1xbNFmb3jj/N+zktYg1kNGZivyTKPkb0=;
 b=axtG7hAfVniSwTXSUrC8fWj8PaTKv2IJ4cwHOEZSkWNecjf3QoGHG/BIvgSYNkLCf6
 wZCaEYVx5hhw+wQJKuI9WGETg2Ph1faLTvB6APsV5ccx42isSdo4NsbwNRn9M4gUyE8T
 yoBeLqz9V9e2n7BtaqHPYOLLp2kFOvZTbwNvYbTItghuvGGuh7qSPVA/CaEPE8kMUdWc
 jgw0EpqmzcT0Vg4lKcQgTod9uvdW9eh8ryKqhzb/iDsExtfrN0he1AV2DA5FjH0HDBRm
 MzY+37PHJGiXPJjtPQFXl5H/SC5buhL8z49qs8Rg124piMVd05fwT22JRZHIXBA9KP2L
 xiRg==
X-Gm-Message-State: AOJu0YyJ+IK2EO6ipE5XHGJHQ2SvZ9eHQBNzvNQpe/kX2l4hr5nfg9OH
 dp0n+OHDMQYVK4QEvD5LLyiyTmydeSLU9ZdGD8iLSKYYbs9+7YriAItKrlv9hkc=
X-Gm-Gg: ASbGncv5KesLMKpBdVD2BCSFt0Bf5fTgO6GjksYAhr7l5tmZ1IohUXy/42CqQqsbvkY
 aqWktunCqoFsAo3mgvm4HnxbqreLSYkeGQO8kwLvSFt7qGmQg+Xeyg2Y6iBiTxyHUiq2bQSF1tr
 1fJBtaHxfUexH/An+x4bWioFKH5oRyDCKZzFyw97+B3axM24kGklqhj4YJXp1yM3ZtXewyvSHpy
 wOke+B8WJee2lP5bdGOfz1JnCLy6Xhs+5VhoY1zngUi3+nP84Ua2DyqWRhBRdeek5Z4FZfBep0z
 mUO/MQJFpNe/EgvuKg==
X-Google-Smtp-Source: AGHT+IHPeGakE6MSarpg0w0cZpEr/cDJRkfASUbVWrLl1/BYqGL0hLXXAqkNJPdqCLnTa1OyvveoGg==
X-Received: by 2002:a05:6512:3a90:b0:540:2257:22ab with SMTP id
 2adb3069b0e04-541e6750aabmr178020e87.27.1734474059448; 
 Tue, 17 Dec 2024 14:20:59 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c138e8sm1276625e87.177.2024.12.17.14.20.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 14:20:59 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so7854688e87.0
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:20:58 -0800 (PST)
X-Received: by 2002:a05:6512:2308:b0:540:3579:e179 with SMTP id
 2adb3069b0e04-541e674024dmr226484e87.1.1734474058704; Tue, 17 Dec 2024
 14:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
 <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
 <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
In-Reply-To: <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 17 Dec 2024 23:20:47 +0100
X-Gmail-Original-Message-ID: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
Message-ID: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v3 2/2] package/webkitgtk: bump to 2.46.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,


Update;

I discovered that dropping "pkgdatadir" in the
package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
fixes the problem.
It's btw the same key that was added years ago by commit
3e74c1312d35866c05813b4690412548eaaff61a.

It fixed this error back then:

Making all in xwayland
make[3]: Entering directory
'/home/buildroot/br5/output/build/xserver_xorg-server-1.19.0/hw/xwayland'
make[3]: *** No rule to make target
'/usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml',
needed by 'relative-pointer-unstable-v1-client-protocol.h'. Stop.

It's the same wayland-protocols that now give me those problems. So I
think that we can just drop "pkgdatadir" from the patch list.


Kr,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
