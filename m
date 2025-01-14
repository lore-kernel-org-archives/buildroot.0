Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E44DE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC5E81DCB;
	Tue, 14 Jan 2025 07:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTFoNdcYRzOq; Tue, 14 Jan 2025 07:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C0F81DAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C0F81DAB;
	Tue, 14 Jan 2025 07:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA25B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 585FB81DBF
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGEMVM3iDo-y for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51FFB81DA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51FFB81DA0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51FFB81DA0
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:29:56 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so8840852a12.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839794; x=1737444594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cWR1KZHURTz7Edo2n8ViCtO4UZslYollYwwfdLFcpNQ=;
 b=ns81z3xLgtP1PeRCI46DAvP3GSOL5rY4drWcWsohQHzDwSrTAlO2iUpR9AQ6tkj5iy
 GV5G+Qe1Ui9X0txGT4CHtjygb3Cb2Ut2zYPlFsRMIP7r3YFLk/D7eUgG9xHRB3uuMhUM
 XuJBORCGqdGyEEsacDsHZxiGds5QY4B3pcGPZ8z0Dxy+NzXKwNHssFCRzsW6/8kJgsIy
 hPzdVGcu4YPbZPzR+lD3HXyzy/plIKhOV4UXeuUbdApj+9/21gbWgmR5+p77snTqS7XG
 i5SpbfWagKUCco1j5R2Od6CPxxEvllXo02ttHgEz12OBNhDtNPFKfmhDrIRe2tDVbsxT
 OUwQ==
X-Gm-Message-State: AOJu0YwYszY8qseaiW35Rydr3RbfIKHa/yFzIRKbUpz4sY1iLjuS/yPT
 I3LCCsf2GGPijvImoRV5rybaMQknkDsPa+BWzzyt5P6C5TJDfIodXg8ZrA==
X-Gm-Gg: ASbGncseZ9cHHDR3/v6hZfQ88K01vI8bI/Np5X7OXQoIblIXbBMMRpxFuBXtGJfzO+4
 n712keyZgwNMuSS9Nmki/WRbkYAAEwuFHpLcV32XtCsy7X60zVC3cZoUg4u88f5V0uqi+TtB2w5
 kG9+MJkKd6Q41ejEG1OMKmr+94MXFMxnozGkLgDodlGDDvJdiff7YLyWh6pYYTJr0GYkM7Vn+YS
 OQLv4la5FbNGEHt3ES/gf++HxuBEgWfe0W6/WArMrte3tE+j9fn3gu4pPDWspswVLctMi5u8w==
X-Google-Smtp-Source: AGHT+IF63bAkrbmjm+6q77a1sivq8KFS1tXlugaou0PTCqrYHP5XR7bY80a7DaXLlNj1HmmAxmf/Wg==
X-Received: by 2002:a05:6402:540a:b0:5d0:81f3:18bc with SMTP id
 4fb4d7f45d1cf-5d972e00204mr21275381a12.1.1736839793483; 
 Mon, 13 Jan 2025 23:29:53 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:29:52 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:39 +0100
Message-Id: <20250114072947.284965-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839794; x=1737444594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cWR1KZHURTz7Edo2n8ViCtO4UZslYollYwwfdLFcpNQ=;
 b=CXLTXPSGAOwU3+PCbZ7mzENVE+6nlrVHI6745V/PS2+aOwFs07yMc/o5AMvIh9CXwz
 bfPYqrJZsqhbIDpgSS+QK+WJqCUQyDk8TN2qZ8iS8Cnd8RJerWYc2b+CIzkflbjuFFXI
 RXXgv6jZwEoc2x3ojINHpHbgpeED7C7LNCcp68oFfGmQNV74H3S5Q/XIolfCpB6HKfPX
 P0PIOm1pmyhJ9P0cVzvV2d4wkFITii9g+ivLL6JGXwtZcd/CsSsvflkcUMLyzGde5C/X
 KllTSRcJuJU74Er2VC4r1IhkvCRjXNFGRMKaau2IsnXF9bkXPwXECEP4gRiyMb/Qps+i
 9qfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CXLTXPSG
Subject: [Buildroot] [PATCH v5 0/9] netopeer2 package update
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

This series contains the netopeer2 package update with the corresponding
dependencies: libyang, libnetconf2, sysrepo.

This series must be applied together due to API breaking changes.

Also minimal tests for sysrepo and netopeer2 are included in the series.

Heiko Thiery (9):
  package/libyang: add patch to solve issue with older cmake version
  package/libyang: bump to version 3.4.2
  package/libnetconf2: bump to version 3.5.1
  package/sysrepo: fix shellcheck warnings of init script
  package/sysrepo: bump to version 2.11.7
  package/netopeer2: fix shellcheck warnings
  package/netopeer2: bump to version 2.2.31
  support/testing/tests/package/test_sysrepo.py: add new test
  support/testing/tests/package/test_netopeer2.py: add new test

 .checkpackageignore                           |  2 -
 DEVELOPERS                                    |  2 +
 package/libnetconf2/Config.in                 |  1 +
 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            | 22 ++++------
 ...UseCompat.cmake-fix-list-REMOVE_ITEM.patch | 34 ++++++++++++++++
 package/libyang/libyang.hash                  |  4 +-
 package/libyang/libyang.mk                    |  2 +-
 package/netopeer2/Config.in                   | 17 +++++++-
 .../{S52netopeer2 => S52netopeer2-server}     |  2 +-
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                | 13 ++++--
 package/sysrepo/Config.in                     | 18 +++++++++
 package/sysrepo/S51sysrepo-plugind            |  3 +-
 package/sysrepo/sysrepo.hash                  |  2 +-
 package/sysrepo/sysrepo.mk                    |  5 ++-
 .../testing/tests/package/test_netopeer2.py   | 40 +++++++++++++++++++
 support/testing/tests/package/test_sysrepo.py | 25 ++++++++++++
 18 files changed, 165 insertions(+), 31 deletions(-)
 create mode 100644 package/libyang/0001-CMCMakeModules-UseCompat.cmake-fix-list-REMOVE_ITEM.patch
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)
 create mode 100644 support/testing/tests/package/test_netopeer2.py
 create mode 100644 support/testing/tests/package/test_sysrepo.py

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
