Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F58C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AF981F70;
	Sat,  8 Feb 2025 14:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qMRBEkk0shx; Sat,  8 Feb 2025 14:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C24681F5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C24681F5A;
	Sat,  8 Feb 2025 14:02:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3900B1BD
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DCD281EE4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNQQoCTM7jtQ for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:02:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E66681EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E66681EC4
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E66681EC4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:02:02 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5dcd09af4f9so6265960a12.0
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739023320; x=1739628120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCc03R8seZWRwarDIItmApYgVabMYxhe3PrGMnezbpY=;
 b=aIcSvBpd4zHtmCYykJFEvmeS5b8c3YK/45fud+3O+WI6Z+v79vXB7RVar5ICZtTM7a
 gU9i7mLG+TOC/QdHlvZetxda+7ONYCBahwhDGtM/9tmGLCTZVDHZ/vT7DQEelOKA2Ti8
 QbmVLZm9FwzNoEhhUemy9X9gp4A9q8yemjrJJAVuekYuvYF33loLjXOZ3y+kVfynzqqM
 n+YOXnimjgjcSgE/iuXjXhNxW/Lx1bz6HlWaqP4CF7J7CzGZf5vqAXKNsaPTGfezinDF
 JFdyfHoqSY105bttRiroBBAsQYveDdqfumk9cMMk7DV8xnNsdHIVKfdBtFHkZ1LtrOHN
 TI1Q==
X-Gm-Message-State: AOJu0YzNRySOyLy3bNoB+lgV1vhMTdTx1G4R6a97nsmo8cNAZhSZjTjO
 +y7flF1HrcCXbKtFjM5WNykO59jk89f2KYGz0vscUg7KrCh066qP9V3h
X-Gm-Gg: ASbGncvOnDaVsQY7u2+pj8N6YFKX2A16t90RV0cwYfiGw1FCoZtXkia2SYXz5eZq0oX
 qLue1h7YwSrMP6k3/EZ0826oQCQvNd3rBlgdupZYmr5bYKjAOBO3TCw+5I1DuJBv5I5RJXsSUEy
 eOhU8m86UuqHVE4Zh5GsVtM4RB/Ehi0wg3AjjMCsuChWFdXOzH/ha0FPrbyX5BZcuJcI85c46Kk
 NL0nQpABLyrtvhN6rx4QyS5rlE+5sgg0Nt03eNDN0IbrhAO316hTP8CWCq5QPnWJCqSpnqGXgvT
 ZjUGTANTb5HBd71mhZZ3VqH+vq1Vl3nl+tE0
X-Google-Smtp-Source: AGHT+IE4EvAI4xSCUpXbsL7e222g0qpx0NilLAyMbuhuXDSRATDzTtQrhHFvEp2tPcYm/94VhkI3Cw==
X-Received: by 2002:a05:6402:2746:b0:5dc:72e1:63f5 with SMTP id
 4fb4d7f45d1cf-5de450046acmr8866098a12.12.1739023319501; 
 Sat, 08 Feb 2025 06:01:59 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a319:a1e0:eb00:a818:bb9d:4f29:5204])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de52712538sm2135774a12.49.2025.02.08.06.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:01:58 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: romain.naour@openwide.fr,
	romain.naour@smile.fr
Date: Sat,  8 Feb 2025 15:01:29 +0100
Message-ID: <20250208140129.166061-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241208134004.143901-1-shirokovalexs@gmail.com>
References: <20241208134004.143901-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739023320; x=1739628120; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCc03R8seZWRwarDIItmApYgVabMYxhe3PrGMnezbpY=;
 b=iE1uUhh0Ibpnne5mSRe8qrBZq07sZfPx5u2Mw7pmi3xKNuusJiWh4EtEnSz65Fu329
 C6Pmh1/SL6LxM2ILWHB1UFNZ9Ppy9OQaQsGBxVNm6wn1nDilUZ5wuUplk6UAIC8+gyUl
 /yFw4COSesvSnPv3B7mOHExL+SStAQLNQ94AwhW4mrhmtX88uhupFN8HcFwGE+G4R5+f
 KkZ/S01LN2bOKJ33qYCDN5+oafgclWioX7+StztKDbl8zdoGgAJE8Waryk9VUvqpww5N
 zV2/GJBoSPI+6iiRrQrCWrcWSYLAWDdE8I8+GLBsh0WQa7GX6iUMfoU3oY+Oqms/hmUD
 08xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iE1uUhh0
Subject: [Buildroot] [PATCH 1/1] package/rust-coreutils:new package
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

Hello Romain,

Thank you for your answer

> There was a previous attempt last year to introduce uutils-coreutils package
> but Thomas reported some issues on ARM targets [1]. Can you check if they were
> fixed since then?

Sure, I'll take a look at the previous attempt and try to build for ARM targets.
Any specific recommendations on which targets to check?

A few more words about the ARM build: I used 'test-pkg' for a quick test of my
changes

./utils/test-pkg  -p rust-coreutils
                    bootlin-armv5-uclibc [1/6]: SKIPPED
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK
6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

armv7 and aarch64 seem fine. armv5 was skipped, but I can try it as well

> Note: We try to keep the upstream project name to name the Buildroot package

I also had some doubts about the naming :) I'll fix. Thank you.

> Also we should take care when several "coreutils" provider is selected to
> avoid any binaries override.

Agree. But my initial idea here was to add uutils-coreutils in several steps.

The first step is to add a single binary (possibly with a rename, for example,
uu_coreutils). This will allow us to deliver, debug, and compare
uutils-coreutils with other implementations with no or minimal conflicts. This
step is mostly for development, collecting statistics, and improving
uutils-coreutils.

The second step is adding the ability to replace coreutils with
uutils-coreutils. This is a good place to add providers, flags for switching
between single/multi binaries, and so on.

Anyway, it's just my initial idea. If a better one exists, we can discuss it and
consider another solution.

> Can you adopt the patch [1] and address the remaining issues?

Sure. I'll take a look at [1] and the remaining issues.

> Also having a runtime test would be great.

Romain, sorry, I'm not sure I fully understand you. Could you please clarify
what you mean by "having a runtime test"?

Are you referring to running uutils-coreutils on target devices? Or adding the
ability to include unit tests in an image to run on target devices? Or something
else?

Thank you

Best regards,
Alexander
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
