Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6209F01819
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 09:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A3ED835DF;
	Fri,  6 Mar 2026 09:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnFmU2my25d2; Fri,  6 Mar 2026 09:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B201083B5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772789718;
	bh=77qDHIfaewu4+jrjvY/36jmPfKhrGlnf+dnIB/6nVaE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UP4miFbQc6z0fIo3p3OS6MHCVBFoafVCTPcRZegRYY+7EdjOxj2TYgzBWgcq3aeTQ
	 y8cVSUwFv7YyBoVqjJByaCxgOWtS+cLD2CHt7BNMqUzDcHQcMWEy4mIKvpNs9c0KzZ
	 axgQaJ+aHmvg54pfgOSRxRe4ZPSvdlJR95J1C+nw4sJAX7e0c8X0s5+oPPEezOjsjc
	 uccXAMC063hnmTlLIuOTdNVT5yQCLbG1ug3n2cLIhH4Ou6cgzrNLUiMzbC2w35+3HB
	 gczlGjCUJXmvKAkIDcTbogkrk1XrFh2x0eo/09iZ54M1wazlejcYntQiIMNsmmccY7
	 6UXA38mzrBjHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B201083B5E;
	Fri,  6 Mar 2026 09:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8475223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF3D683B5E
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5saPAQoRbar for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 09:35:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF03A835DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF03A835DF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF03A835DF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso82380535e9.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 01:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789713; x=1773394513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9c6x1cgQMtpWUlioSI7w6vAnmUNLGXDlTvDCHhP/JSw=;
 b=LvtRDthZAbFQ1WfvQhQP/mIYBfxUEYK6txa3D8fRFKoA5FhOzUe327LdO4XBDBLf4d
 kqTRw2frr/quC3pURswTpoNvSPJg25J9d4d2UDmwFkkYiachsp406I4SA8/V+RSTcNW+
 sGBo26x8naXEWFHJ9vDXl8QOzXULS+F04bAfY6y71aITIWCoOlCGWJNnJo2k8L8b0zE5
 GnGyCuwAKuOVP6fXM8KrYOqrn4KMJMTPTGEFy1cMSYJhyGd5yvZMf5gHpyUhQYfCrt2Q
 Ow4yLbpXDXepVODUhM6MoDgQ/hHQtshyK+uzONkJhip5EZA01Wdni5PrM/skTdnc8WbE
 UONg==
X-Gm-Message-State: AOJu0YxI9XCLTfg9IkGeGU+Vjttg1s0qlnf4074cKbSW9SCC1AjiS4ca
 PRLlBKnz0S+EMbtiRRSM2ysWl7m39ymdiIM1+ne9d2wKgasio+GeoFlCr/tMGkQAcIXcRgvHATC
 xR9titRk=
X-Gm-Gg: ATEYQzyc56D54wq515qrxtcOau8YACQB4pxo25/bbvsydnMJ71q7jFbmyqGF3cXfsN6
 HxAycEWaA7FTM5C/2wHEM38ksJjhxb8/qutmhtGxFc/5Tf2FJOZVr55vTKoj/FI4rDxbbCcSB4E
 zVTU2K9rDjIaJpvvrv/k5UZZL4jxqVtDjCZSwkc7wz0g/dWaSGlzhqcy/fWL+Xex3QOIsfrCDVY
 /yTudy4zs2Vx4fqZ3ZiAgvQh9ZXWdllFuEDbLbDaoqyB3ouEMqn70YnMw1009HjBip06r1JcCfM
 SAzMhwsUYhVXLbwFsaxfzgtEXdv7I+Mkq9+iLz6Hmd2FLpVVe4AiC2rYoK+FHS9/eyQCJsnKAOE
 x4axq4nyyMbpHAw51+NusL07/AD142wZE5Kpj+HKDWee2x9Xz6uDg+rIUzv6W+AA9SX82a8vsOa
 gyG11ZVhL4wbsswqCWvKqbtXz427De0Rz6PyznGy8GqggMredA7Bs8+GodS+Xvkya7XXseUwK7k
 8Ij0PrfCU3vCRPxKwUc
X-Received: by 2002:a05:600c:a10b:b0:480:3bba:1cac with SMTP id
 5b1f17b1804b1-485269188ffmr17011125e9.6.1772789713453; 
 Fri, 06 Mar 2026 01:35:13 -0800 (PST)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276bc6bbsm21227385e9.15.2026.03.06.01.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:35:13 -0800 (PST)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  6 Mar 2026 10:34:45 +0100
Message-ID: <20260306093448.707547-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772789713; x=1773394513; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9c6x1cgQMtpWUlioSI7w6vAnmUNLGXDlTvDCHhP/JSw=;
 b=KACbcYEtwPC1Lx3p2gq63vrYmmxT4J6y/9uE2vj+5kgi6lE7Tox+zbmvBlQQCBtzEZ
 HgWRTHL2nCxxrGjBxm8ApjxmgCjYqVHljSuSEub38uNJHSPVnkUXwKULs9tNSmHk/5ep
 jASXlkBqOD4s2E1WCAnkYj7hRIDW7bvzaXcyU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KACbcYEt
Subject: [Buildroot] [PATCH v1 0/3] configs/khadas_vim3_defconfig: updates
 and fixes
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series updates the Khadas VIM3 configuration to use a modern toolchain and bumps Linux and U-Boot versions.

Dowan Gullient (3):
  configs/khadas_vim3_defconfig: use prebuilt Bootlin toolchain
  configs/khadas_vim3_defconfig: linux bump to 6.18.15
  configs/khadas_vim3_defconfig: u-boot version bump 2026.01

 board/khadas/vim3/patches/linux/linux.hash |  2 ++
 board/khadas/vim3/patches/uboot/uboot.hash |  2 ++
 configs/khadas_vim3_defconfig              | 11 ++++++++---
 3 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 board/khadas/vim3/patches/linux/linux.hash
 create mode 100644 board/khadas/vim3/patches/uboot/uboot.hash

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
