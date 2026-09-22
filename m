Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2206AC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 13:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE33D60674;
	Tue, 22 Sep 2026 13:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGOzcAHd517b; Tue, 22 Sep 2026 13:26:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DEBF16069E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790083615;
	b=o+Ap/Lf58Fxxgqm9f1GAuqTSaMv9e5yB2wSH73HmceIvax87u0GKld+n7fjpBI1COUmh
	 gK94g02wBkxjPCs+gujSnCY7zjwIUZ1teEcPuhAqz+Nsbz4oBVxCUKKxNX2bOw7VSmecK
	 P3rjKIyq9K+u5U8eU62gFOfvP8jN0cgC8x6S800CkEbd0ZSn4WMIIF4qOQs5O2C+PUxAi
	 g82ijEDDGQNXm55wJPREJHadn0OmX0S0QOzps6K8OvZF40/qvHUAytHwf9caVPIvxTgeQ
	 PAaEIoDOfUdzYmDgfHs2NKfLKADlgLvFsEAGRppbyitc+ZF3hUVj/OpTjyLW8PBx48g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790083615;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HOaCJXpFNCmTPlJTtPpQCWc4oYh+rFgXONJFEw8gEb0=;
	b=ACcCKNmmuYen8ro3HPqNTpDsA2P7ZhynQUGRBKGbdw6EyFppVGlChrwzXVm5j+InH+zO
	 RFa/Ic+Ji93Kb3Wkr0fBKTq6qpmyt8g0hn2JDHmnhm0d1wtUvVDtTAoLiGl62Gu6zYLFc
	 IQL/gR7K4Mh0kiBaOFhmBZd2nQXOt5xSjcXkgVDNUp+aWWkFM+/pdk+LFGaqZf0BCOfTG
	 dKtIhGI4K2g/P/DNFNmXKzhlE5QKeeCuXYCjBe+WEznQKG9Tb7xbJIXAV9MTFto/vUs4f
	 abr5yr1vWU2jNgIUlp4PWRsBgRGWtYRfOP+mW7VcVu3KHYjPxkXRWgBwoKw9OXpTxnA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790083615;
	bh=HOaCJXpFNCmTPlJTtPpQCWc4oYh+rFgXONJFEw8gEb0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Gx3coODUK5+y7yTzu4LVby0EG0bIhB0t/EUTxVWunFJ3aiwylAAwrMX0VFGnHFKfY
	 G82yL52fQOXe2Su11JJx5NmRZebMjnAO9j47HYQZbiJSYgaW/nWAxloYUyLCVh/MUa
	 e3yJ3ce4NF9tOl9PB/rmSOT2EgNzVHIKXtQw4WT1+UJATuWISHnFDNg6fMRFkxErln
	 rOyX+2OxC1W7BqVCAZlk4KZg5x5gCVjWHMLngpGFO0rV2FLMZxtuzhKAxiBJfyYQSp
	 94V4YegSKKDbT76o/kiTuCINWy65MurY5KisDcjddz4HiOYMRdOvExTb8VYMm4K8e3
	 A4HneWs439SXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEBF16069E;
	Tue, 22 Sep 2026 13:26:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FB299D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41CA240737
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtHCnjWmWu-H for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 13:26:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 37CC1406FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790083612;
 b=LY1ZRw1z460SOP/D/cFzOXVkROHuvlu2SP0hMOqSW9Kf0wu74SK1AxiU/HYyrzUOYNER
 mw5hdHtJfvteEjkPqd1HbCu47ygdn+e8TVlzTFWFvrfK4DWfpMNXlJEzEe8GL1/KnEcYB
 6tETH0gDkSUt06hub/mkM3T4oYpzjDRPqJ2pm2tZnweIuaTw1Tbxco4vg0q5dTBtyYojo
 CE/tq2cEoqrgH0yKlvnjXTDfXX6mzWn6X+uBpwq5COBWn+SPaghlSmyZypDNa6B0onvpe
 aUFsdaTOHDnPwGt5rjH0L4lNqZ4EtTOYE9YWte1/UTP5R/IcKl0xPGwViqyXrVA8nRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790083612;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=pIEoDLooM8RPrf80E/GzzzFWNDFZE81PRz/bUcyLUrc=;
 b=iXn+7QiE8V252lotAcLsC7oro7zn6D1Vl/sVQvLssQo3Cf3sdgStsocb9+Y8y7u97ssD
 H+kAsFIRyJqPBN5gLHYzDJKICZGT1vE6iRKcs5xv2wGYHrAPRDzRx6Qq3zfFk3OfbUf/A
 /fo3593f4n2uFtbAN1IGo2VGtTq3RZzTuJ0YgJNNFfwBLM247w0ZQYEhoHT/EraHBHXie
 6arm71JOuzWb4XXn1BPHo2jNwmtRC3aOf6cKVEFsB2dMQpesELMxK78QMGuoI1QyUFmyf
 oorl4wLvf/+QlWt/p0akukmCMm6zuERI5+ly+UGd1YeRAWxVbsUVGk6LglH7mYIUuHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=JsN8DzOT; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37CC1406FE
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:51 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c25ef7a3ce9so500689366b.3
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790083610; x=1790688410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pIEoDLooM8RPrf80E/GzzzFWNDFZE81PRz/bUcyLUrc=;
 b=c4KFmb9kf8d+mZ1Sl+cfU0l0v89gIqvTFofXyaGywvux7SyZwko7e9ySLGwnK+O10z
 1jT2LCxLjeNqLkwxmAaLVTfxrUHC2scz+SOcR0qrSvas78quJCxDmZPLoochQPaZ4uyV
 t0K8p5nnn4pr8A9QvurqgTpMRDmrlyx6/Uuc2cKmetCD2D6+Vay+/I30OsRVqZ7kyFXO
 +LHJBwUHV4NFA/7fhmL6x+uA137qKc4pKXDFpT65UK7JBihPQBZWv3Yrn2BqYCXSLI99
 hYxkgsGHZN5pcBHoRCfyQr1jVbiKFRWe/1qVeewfFBy3WoCjSd4S5hhvguvewRhWT4ty
 LjfA==
X-Gm-Message-State: AFuF++kbRL87VX5EXZGqhnfbn55Vbhwhn5ilTFqEs//W7o8HZEEB4OwL
 BH5qJZtlMoHbwAddxSs5cb9+UJPXWDEz4Ic5iepamDLn4wA2FBAFWfNQz2WFqA==
X-Gm-Gg: AYBFou0/9bHaVrW11bBmpXjJlma5EjbEawz7em/OFceFeMYZC+DT+z4+tQYLTO3DrDZ
 pcduAA+6zZy8O30jw39oUgn4Xwdh5H89iAeRXJNuaTkn8hQC+e+2ii1YzTvWyY2YIvuY37kJAJL
 WxmkZEObjjaYY3r7/21ruBMgM9dRCfjufRw7d4/ptYfjtalY7Cm0ZFxN2dymfOXm51g5ccca5/d
 0RcySuyH1zN80lfulFAyGm9nEatqjhCIaoYs+ukH28VrmXyoRZFlg7g5ZK03kKeCuy9f8nxx8xI
 TL2HjD7AZvkvnUfNshzvn23bJaKx4b2g6/Xjr0azevFboMyFkx4Iau4P6mzRMWyil/SsSv4RdSd
 gTkkT0Kcjx4kQHtLpKadtr78fxMVvN9Op7rFcj6oxDlxdNpK3QFKL5jVBGF5QMLOxR24APCUu1z
 qsfvFEstnzB1WlwjI08ziym5skkVnDf+L0yEBZfjcuA9HKLQjLbEejsOfyzl7g+GBEWdmJg9Dwd
 HgtAKgYkHHC8oMK5/fYwk7LMXmBtdW0vYBWTaAUGOohU+LmLuzCvy+2bw==
X-Received: by 2002:a17:907:3cc9:b0:c26:1649:47aa with SMTP id
 a640c23a62f3a-c2a15aec9e2mr1265869166b.32.1790083609451; 
 Tue, 22 Sep 2026 06:26:49 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a9c5ee0b4sm85021066b.50.2026.09.22.06.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 06:26:48 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 15:26:46 +0200
Message-Id: <20260922132648.3229462-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/iproute2: fix musl/uclibc build
 failure with libtirpc
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

iproute2's configure script enables HAVE_RPC as soon as pkg-config finds
libtirpc, without link-testing anything. misc/ss.c then calls
getrpcbynumber(), which since the libtirpc 1.3.7 bump (commit
3f3d6e43de9b4aac7df8545fd811171256f878d3) is only exported when libtirpc
is configured with --enable-rpcdb. On non-glibc toolchains there is no
libc fallback, so linking ss fails:

  ld: ss.o: in function `init_service_resolver':
  ss.c:(.text+0x2558): undefined reference to `getrpcbynumber'

This is the same problem lsof hit in commit e4d075975f, fixed the same
way here.

While looking at this, it turned out libtirpc was never listed in
IPROUTE2_DEPENDENCIES at all, even though configure probes for it, so
patch 1 adds that missing optional dependency first.

Tested with an aarch64 musl toolchain and BR2_PACKAGE_LIBTIRPC=y: before
the series ss fails to link, after it builds and ss correctly resolves
getrpcbynumber@TIRPC_0.3.0 from libtirpc.

Fixes:
https://autobuild.buildroot.org/results/390b7ed00da20c2349fe069ade4a65404834a484/

Yegor Yefremov (2):
  package/iproute2: add optional dependency on libtirpc
  package/iproute2: fix build failure due to missing
    BR2_PACKAGE_LIBTIRPC_RPCDB

 package/iproute2/Config.in   | 1 +
 package/iproute2/iproute2.mk | 4 ++++
 2 files changed, 5 insertions(+)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
