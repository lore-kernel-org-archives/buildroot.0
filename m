Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480ABCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D766F543;
	Sat, 30 May 2026 12:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q27Tmoo5bjYs; Sat, 30 May 2026 12:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 347016F545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145765;
	bh=zxENo85UqLbK/5azkasnjxTyhtSMQL1xMD3D4cK3RMc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UJNXImI/68ghXa79jkpltvNT7wXWIf4wO9mSkF+Bz9N4ylgr556fIhyvaJRHDA2KW
	 O4cXhkLJU1XarWNdrwLiq9aXrl28wMiDz8oL9WeOcHWs6vJrzjPJWwRnA+c1dPZlES
	 gyVlDZ+D+OkDUCzH/7ddYgoTBaEZfcIIPycz7P3BQg46zikhgdkzH8p1qPoAbg7Sjc
	 u51WLG6FF/Cm+fp6CMWEjeiNqzzzHFpCL2ef19OiXVtcuk1zKIcix24037av/14JD9
	 UwR1YbbaeCcvwpiEFOPRboqFBkwgdUjwTHLKROBTp+cGQz5+bZLKxCwNJazpaPDOmN
	 CZ6ZasTXumvWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347016F545;
	Sat, 30 May 2026 12:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 486BDF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F42440291
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXsI_oE5U6mR for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E74EB407D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E74EB407D9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E74EB407D9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso74617275e9.2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 05:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780145761; x=1780750561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIN//1sXp+tQYveb3i5Ace2/fxUwCzlzoXwF7J3X9Kc=;
 b=DaihjW4q3fwdmNJpjhUgJlTGb+qZaZa1gdZBC3sne3UZMl5zlxeXLghmYVMcPYStJn
 J4VmFYbYmTkelrvoTw+zkjYLdtVtrMkEDyuNYrnB5DxDgLrhcqT6lEYEKR3hew5tLFVr
 vIYRddnR/vnb0yYzPT4mOw1s0C5bTrqt/Ld5HFnTtL0ZenE5RcRUkDF9CZ1VERPzmIca
 q2TbfcnNajLsSMpZM6QU6qVsIhnb2GbI+fPZKu9h8WrnxWit3gCWZXr8dxq8V+kKNb8P
 Aw3HZeKe7KYi1Ocmvn5Bo1/WYA9iGA64coq6l1ZC5RljeUQnb78Mgp6C8FQsSlOJT+/L
 y5jg==
X-Gm-Message-State: AOJu0YxI3LqRrk15PtcjDk4deIG+4EOr1fjAwxakkwn0onL+vCZlieND
 1Dp5DEJO5LvH5XOEGuHcZVjfG+bQS9/ZS1zV861jTirQISu38E6p1qMuDOoJj4pK1rPYlmIdBum
 aLSK2
X-Gm-Gg: Acq92OG9r/bP2RI9w32/v/yGa5C9udERCq3TJ1MqE1IPLmewxH62fIJCbN04TFm3Y54
 vAHBQhF4HsrMDvPLjseXD1eujB5EaeTjHxCCjtzmPqR5P4rJL8eosBcY3OlGeqGIjz8BibqZXQA
 8Ha+CarziUELcNcWDHohznfJ+ZxGEffj5HQn3IjuI+Xo3UQm8B2uWWaYgedFJT4hI3h1yNiX0w2
 a483tG9YOKgtcLBq42aHATM/eyywqcjrj8I+8Jf2VBEtbY2VkKOMazxH32wi+B0hwusUy7DMoHW
 yzYlknsv8eVHt0WcEreZrndN3Qm8gTvlvwobBc2YrzSYjsIyACumMq3ySZEF12gCpYuTHXryPaz
 6S7HFIIqQLZUpmOQ83xwnofIiips9bZhMWG5fmNyS6vgzAmnvwMDs6vhBdQcRdzUnuWwnRdLRnW
 IGjxgZ+HZuJs+zj/ZjfsP8a2xR6A6iP5n7SfXaCSyb9aS5J4bzLCkfDWJBAjv3sZyD8DI3DHQzm
 7ECKQALV3otNpNp2/0NSYy3EXg1G9ZNhJL66cl/Y1JEOWV3OOF3U8C+gy/DgzoqMbqTKo3IZpe/
 UY+QF2UoNvgbj+7+CzSaFg/QdLcvvorMB9z7aGog4LI=
X-Received: by 2002:a05:600c:5306:b0:490:a455:f882 with SMTP id
 5b1f17b1804b1-490a455f915mr45582955e9.24.1780145760318; 
 Sat, 30 May 2026 05:56:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c0b862dsm34510515e9.15.2026.05.30.05.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 05:55:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 May 2026 14:55:56 +0200
Message-ID: <20260530125556.3957719-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780145761; x=1780750561;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cIN//1sXp+tQYveb3i5Ace2/fxUwCzlzoXwF7J3X9Kc=;
 b=n6FNEbwQvXq6j5ZS3+D/U58IzTH1aM8j81uVqsVG+KQs50+XgfjLjgtQ18pL5914Uh
 JbfoA9kEa0YW9ELhiddGPoZMtfI9ovI7Set5e81KszbdaLNHtz9M9p3gErIzQj+zt7Qa
 mzw/1wuy4oNqUVshcrbT7X2t/Qsy108BLbois=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=n6FNEbwQ
Subject: [Buildroot] [PATCH v2 1/1] package/babeld: disable for musl
 toolchains
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

Building babeld with a musl toolchain fails with:
  ld: read-only segment has dynamic relocations

This happens because babeld uses text relocations (textrels), which
are not supported by the musl dynamic loader and would cause a
runtime crash (segmentation fault).

Since Buildroot passes '-ztext' to detect these unsafe relocations
at build time, disable babeld entirely for musl configurations.

Fixes:
https://autobuild.buildroot.org/results/c75643713fd5f27fe063c226630680d26a8b9487/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- Drop the initial approach of filtering LDFLAGS
- Disable the package entirely for MUSL toolchains since it requires textrels

 package/babeld/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/babeld/Config.in b/package/babeld/Config.in
index 80d27082306f..a39da7a8af07 100644
--- a/package/babeld/Config.in
+++ b/package/babeld/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_BABELD
 	bool "babeld"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Babel is a loop-avoiding distance-vector routing protocol for
 	  IPv6 and IPv4 with fast convergence properties.
 
 	  https://www.irif.fr/~jch/software/babel/
+
+comment "babeld needs a uClibc or glibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
