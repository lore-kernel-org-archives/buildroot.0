Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94713CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 11:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E21440545;
	Tue,  6 Oct 2026 11:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDfi-aUPi4jS; Tue,  6 Oct 2026 11:07:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2C86540363
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791284871;
	b=fZW8y3nNz3enoeG7H5ErPz7xtsCyerQ/bu8bAx3areRihKnfILDygp87+aktho9hlnd7
	 0kfvUobc/t7Z/r/cl3YnLoe/rFFuGAWWt7pZrWGB/IT9q+fr//2916Ki2D7l5FGDo5Ml0
	 5Rp22HET1qU+KeO2rg7xAqpXAkSxGX3h5d7g7z2Q6iVZOn+o9EPDGfi75hhrq5j6nGWbd
	 zw9TVY0xSMzUfNMW+HN4BaGosQC1lKQZfg6xU+LP7S3QS2kTjIVBgYtOCw7HITD0ipGfJ
	 uak13R3UCplNyPaSpV9tG7tujVRleQE4Kl9uWubi19TEOJN555xSOmgxaFI9LKbLTGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791284871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1N21YcTUABJr90Q3WknHZ3xON0fclIGstw1Ifj2lQP8=;
	b=nLEL4JSoXWGuywg+BGL0KVQ3qo7im3pTjnvf0HhClZnwjIYA4TI64/rf30CUxOj+6aOQ
	 vt+sL2Oa3cnytbKtM3tmF7+/3QzmviDimJ2F3IuqqfuMsuhogTxpapeTcjLlCv/LPLQGo
	 aY2xWgVXCakY6bfmcKOcKCujd/EhYh68b8Te+n0Qyk1hWzMp6xKJ+2nSsN2nAlifyS3tM
	 ktUt5pasJgK84RtnLI4mvEr+mOOF2p83C56+LiucAgoDwhlSIfM13gRM1eaTBZh/CA7Le
	 u4AeObdU+Cq3xwk98J15VjGVOmI12wPeEWG+m724eYB5fHpDAC6wvRzuv/QUv4FwMeg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791284871;
	bh=1N21YcTUABJr90Q3WknHZ3xON0fclIGstw1Ifj2lQP8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Ktp6LAwmoUMOt3RlkrBcruRsCZuHLLNRtZcZr0Z/swOIrRsm26oUUStuLkJe48Jal
	 52WsBoZ1EPRUX5bF1GMojuO5yrwgsnTmI1+hxIfmqFL3cGp34/Hso5GHprEqQTHrzM
	 AV/5BCXxzhYvRxiAyjS6Q894Qn1KazRQ59anue2fqwE1aJkAQWXvzc5SQMJv9mMUFn
	 HrUyENByb+fXFsewTYS2IJe/zD8xpKVY4GW9RU/xQ6FvU/0En2q8UwwamzXYpfoXEj
	 awrJVd+hkKwMcg0Z4UMtlNh166xYe1W/3L5qOo1BCofbSnpaYUkLnNpFUoU83CDBqD
	 PZYoJT5yh4yzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C86540363;
	Tue,  6 Oct 2026 11:07:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC11722B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD71A6072F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r29ASjj7WaMY for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 11:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6BCB460739
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791284838;
 b=Q2E8BKlACppDbgLY3dGbtqOoOuQG5gQD/xmQ2cxr4Qea/BFpNeuU0SjJXvd42yYHlryV
 eZq1ojsJ924/JiJOlLnxOVU3jmo4cTqunl26rToPvBRgkVm80MjBaniQox+h+ibjC+ITE
 ZgrYHmju7mKWKrRzEw/IzVQ4EPQH4Z0gyxrfM7Fz5w1/cb+jrK5WMU4Z8q43zakVhEjNA
 bV64Q5KSNI96Af2sGHQ/BFtzZaH8aq/lNu5RY5hc5mWm2m/GLVv51e6KDUoo72b7B/UXY
 GPEUEi56wo4wOYcFM8bwTsJSyEjWw9sKpLpV3uy+ew7PgOXPPdcZvWc3gLXMZO4zblQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791284838;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=IHAnithlv4T/Yc6b1ASgfMpvC3wvt+pLHCmbCkskF9A=;
 b=RyqQUzbjvZMe8SlaWV0hv7C/VAEW0/Y/WucaLjm38kxrb5qqdy8SB6JNHjqOoObAxX82
 nKOI5P4NEVHrS4FvUk/1q2By3mfpQnTRL6DG3UsxgKgICHRXqOpZmVt407yu2+lWzh99P
 lG+V7143wmQYkXMS3WlGkqe3prScS4SIoyFaddr0DKL2Z1eo9Fo6wAvd5TUaHswt0HEK+
 o6v8673KLltfZaijjY54VTB1pWVxkPNsS2JiEIuQvWaKIyFLkpXP+UI5nrcJ7KC8+NqzQ
 PaQoJ97Ftf5fznrSrCWK24PGF0Gbo5Wl98vVy0Ocp0VOm7UlddmxOKSgxsedK1aUFDw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=TtzRYOdp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BCB460739
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:17 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c2a4e013a44so407058166b.2
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 04:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791284836; x=1791889636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IHAnithlv4T/Yc6b1ASgfMpvC3wvt+pLHCmbCkskF9A=;
 b=cOUi9U/JT2V5tqZ9Gagx+hbv0lNO/OezjXjPplFtNDZbCjUDw6HQ7YfOA3kaSH5euD
 Ey8N5/sRDollC4K1c/rbHbORgCD3FNak7n/236VNzzipjcSB3J5Q+o9b2uxext5O3ocK
 qzTYqbvKWdb4iXb6zfb1ofpCdywRPoqCsFk7aWdM2VAISDQDdOIGukZmsLMnA3QePfac
 c6e0QpKasaWA9JAyr9pXhloD3HNdrnIuzeuoMGvH6yQnN24e7W7WwUHA6FpgDqL/TLLi
 Z+DtS0zQ6glxTeYgl7I1IwjVMbya1jJ/5RVYEBDNNx2m6pLzKDTjRe6moTo8FsXdo8Nh
 vezw==
X-Gm-Message-State: AFuF++mPHfrFZDkAW2aHYfrkAxF2ArZxzN6LZb0+1cdUHh8CSEVEMQIV
 k/Zq6RW6z/OKFbuZUb7lR8VibnVNt7a4cLgQ/Q9LG/b0fQIQLBa+uS0vXE+SIw==
X-Gm-Gg: AYBFou3rLt2km4+nHiZEwfx3dHM06J3E8f9ihawb8TPFFFXmMF4TQY5vreuyhv0RqkU
 NtNQqULlp3W+gmg/EcQrb6Gpgwk5e+fzjuFOpJHndpYOcXgMTyQwTqGskiMVOxITo+ba6ABplwZ
 EebD9lIjjbTJB0UZPmU68LvbbfzFiZVSWoAa6KUZvOGmO2Ps7bSYyHrSyj8c5giHydPlRiYQCOs
 3NM/Oyt4svIS0IKOjmDwIATaU2CTxIWOXDMoAyKTe/t/VZRWYUmD51URcybbEM0MCPeJhtfwvs5
 6A4PCmx0SKKaUIyZSjzCS0EqU6gSFOQ4nFEEUgZP7/XOiyOxSeVK6i/AV++JC2e2QWtSWz+EtZj
 Lqw8WoLAprKn+XcIwP7Ne1FxjYNNNheOPLqiP+oHdMamyxA32VoSIgmwN1PyS+OKQzHoujSt3up
 RDz12KLCAg/kW0Toal98o0qoc2suFcT1gQS1C7ebHyPax9iSCQHL1hYaSCpKnGzQakjOBKeclUt
 eCVyQ1CgszzJp+5NlBMc1UpecNFczFdS2CMofg2PtllQzI=
X-Received: by 2002:a17:907:97c1:b0:c2e:2ef8:5585 with SMTP id
 a640c23a62f3a-c2e6eddc802mr871087066b.9.1791284835477; 
 Tue, 06 Oct 2026 04:07:15 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3156ec7b8asm189536066b.25.2026.10.06.04.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 04:07:14 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 13:07:12 +0200
Message-Id: <20261006110714.3242851-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/szip: replace with libaec
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 "Ernesto L . Williams Jr" <realcontrols@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

szip fails to build with GCC >= 15 on non-glibc toolchains, see
https://autobuild.buildroot.org/results/5e400d0e13480c58e8b1b0178bf7e5537dd31751

Instead of keeping it alive with compiler flags, this series replaces
it with libaec. szip has no public repository and its last release
is 2.1.1, while libaec is maintained, BSD licensed, recommended by the
HDF Group, and ships libsz, a drop-in replacement with the same API
(szlib.h) and soname (libsz.so.2). Debian, Fedora, Alpine and Arch
already provide libsz from libaec.

The legacy option for szip selects libaec, so existing configurations
keep a libsz.

This supersedes "[v2] package/szip: fix build with GCC 15":
https://patchwork.buildroot.org/project/buildroot/patch/20260810181422.10955-1-chakrabortyshubham66@gmail.com/

libaec was tested with utils/test-pkg on the default toolchain set
(6 builds, all OK, including noMMU and static).

Yegor Yefremov (2):
  package/libaec: new package
  package/szip: remove package

 Config.in.legacy           |  9 +++++++++
 DEVELOPERS                 |  4 +---
 package/Config.in          |  2 +-
 package/libaec/Config.in   | 10 ++++++++++
 package/libaec/libaec.hash |  3 +++
 package/libaec/libaec.mk   | 19 +++++++++++++++++++
 package/szip/Config.in     | 16 ----------------
 package/szip/szip.hash     |  3 ---
 package/szip/szip.mk       | 13 -------------
 9 files changed, 43 insertions(+), 36 deletions(-)
 create mode 100644 package/libaec/Config.in
 create mode 100644 package/libaec/libaec.hash
 create mode 100644 package/libaec/libaec.mk
 delete mode 100644 package/szip/Config.in
 delete mode 100644 package/szip/szip.hash
 delete mode 100644 package/szip/szip.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
