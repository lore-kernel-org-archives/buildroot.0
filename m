Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889B4C4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 14:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20CF881E82;
	Thu, 17 Nov 2022 14:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20CF881E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmj6Pcmv0f9S; Thu, 17 Nov 2022 14:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D7D81E20;
	Thu, 17 Nov 2022 14:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D7D81E20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05F0A1BF580
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 14:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDE93415E3
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 14:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE93415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfZ0mQd7O40U for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 14:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FECC400D2
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FECC400D2
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 14:04:10 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id b185so1848033pfb.9
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 06:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVy3IIfhJJENCrp4poA/jUp49Pg8ACjvvb2xN1GcpuI=;
 b=emhZ9Q54DoK+fwUf7+njd0EVyYZxLWRcUbF7Aa+UZvx/WzOIIWvQ9AzBJDrB/djqsr
 WT0AR7wXEvG6RBTZgRMkTv//W5hcxLpMgXztwEK4YqK6JkhPuOId17FO5fMhBhn+8p4s
 3dICiPf1AYWW0rcjJC7ArVbauvjzKbBCPdf19eJpPbZQMrLX1h9Vaf6JKB+RRl/fKdRd
 ijr2C94Dvy6XJLGZdiTUOq8W5bwTElJIPK9ZnC9UsWd7Lz+SqFg/ef4XrO1YvVfndYvB
 0iEjeFYoJ+gJyNYMDnIxZ0Q0E7GCggMeWpiN3fwM+NkvMn8bhxkLSdAQ0Gm7VKOh50Ca
 YjHQ==
X-Gm-Message-State: ANoB5pk7Ys44PwbSpdt73mbPZBuZuL/pxs/cOLH4NaFUen8+ovMCZ+3E
 sQES8NMeiB4juKcpZFtDnjwde23F3XAAAgzn
X-Google-Smtp-Source: AA0mqf7W+PoNmGRmIfA/0+Z30O5CgKMzRQyP4TUtDHXAp8j6V3pz+coyQbR0MXut7gMdyXwwZwWkFQ==
X-Received: by 2002:a05:6a00:1696:b0:53e:6656:d829 with SMTP id
 k22-20020a056a00169600b0053e6656d829mr3097380pfc.63.1668693849672; 
 Thu, 17 Nov 2022 06:04:09 -0800 (PST)
Received: from localhost.lan (fp93c05d70.chbd116.ap.nuro.jp. [147.192.93.112])
 by smtp.gmail.com with ESMTPSA id
 n62-20020a622741000000b0056b88187374sm1152955pfn.85.2022.11.17.06.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 06:04:09 -0800 (PST)
From: Yimin Gu <ustcymgu@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 23:03:48 +0900
Message-Id: <20221117140349.27692-1-ustcymgu@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GVy3IIfhJJENCrp4poA/jUp49Pg8ACjvvb2xN1GcpuI=;
 b=ZC1PfTieZWQB69AaJEuga35jIyRYixRkLoe3ZiIJQKq9RMZbX8U6zKGukJDzq6d4r8
 uTJgW19uLkuZdU57nKztNmTtWywm7jMIgFnE/cHmIdgkTyIIVev7WjlIaG9zlwarqnhA
 8eouAZZXoahBeduX6gZ9PdHfWZmVHN4JrxXI4mwh0jEF0yuDSgKL5Lv81b90kDtyClDk
 dppmTgQurR9CQL3XaAKJuNvPPhcxs5/2xmA/IGk/Bn64jT6bg4GmrtOwVgrnvlnX4uMh
 bJb89Hz3e88rO1o0O2hqa+YXKSE9tUCCJAaVVlKKjd/h9ZT6qnNMnCuiwV4n6hBvl8gn
 SPYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZC1PfTie
Subject: [Buildroot] [PATCH 0/1] arch/riscv: RISC-V 32-bit NO MMU support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Yimin Gu <ustcymgu@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Mark Corbin <mark@dibsco.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following patch adds support for 32-bit RISC-V No-MMU build.
Currently for No-MMU RISC-V, only 64-bit is supported. There're no
substancial changes in code but macros and compiling options. Uclibc,
elf2flt, and the kernel need to be patched. 
This is based on damien-lemoal/buildroot which first added 64-bit No-MMU
support, and my earlier porting attempt regymm/buildroot. 
As a lot of FPGA-based RISC-V cores are 32-bit and many of the low ones
are without MMU, this can bring Linux to cores as light as RV32IMA.
For this reason, only the minimum required extensions are enabled in the
buildroot and kernel configurations. 

Yimin Gu (1):
  arch/riscv: RISC-V 32-bit NO MMU support

 arch/Config.in.riscv                          |    2 -
 board/riscv/nommu/patches/linux-headers       |    1 +
 ...imental-RISC-V-32-bit-No-MMU-support.patch | 1355 +++++++++++++++++
 configs/qemu_riscv32_nommu_virt_defconfig     |   19 +
 package/Makefile.in                           |   13 +-
 ...ed-RISC-V-32-bit-compilation-support.patch |   74 +
 .../uclibc/0001-RISC-V-32-bit-support.patch   |  145 ++
 package/uclibc/Config.in                      |    2 +
 8 files changed, 1607 insertions(+), 4 deletions(-)
 create mode 120000 board/riscv/nommu/patches/linux-headers
 create mode 100644 board/riscv/nommu/patches/linux/5.19/0001-Experimental-RISC-V-32-bit-No-MMU-support.patch
 create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig
 create mode 100644 package/elf2flt/0006-Added-RISC-V-32-bit-compilation-support.patch
 create mode 100644 package/uclibc/0001-RISC-V-32-bit-support.patch

-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
