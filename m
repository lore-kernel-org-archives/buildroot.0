Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64161C87FCF
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 02:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B611041A31;
	Tue,  5 Aug 2025 02:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYhIy2MBTaLC; Tue,  5 Aug 2025 02:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52EE641A36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52EE641A36;
	Tue,  5 Aug 2025 02:59:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 858F3118
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B5C061534
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DimK7yuB-tu5 for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 02:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5841E61533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5841E61533
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5841E61533
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 02:59:34 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4b07cd5019eso11366961cf.3
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 19:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754362773; x=1754967573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4Zt2tJHy4z9j6L/C4WPPXSgOGnSGQuUPMqPiN+Wsd4=;
 b=TrLS7Jz3STn9cqm0d7FFS7qCYL4RzuZWVBIuZcYJxtPHWHzBxBw1g+eDpYaq/wlgSF
 sm5oXx7J8oN8tVu9g5jCDl+vwYb9xxRVnAlueBB/utP9ulLq/Me52PZT2WBUV5MTs5HQ
 ML7KobAedw4/W0XL89/wBUQdpIMPjnH1xhZikSUPN48eydr70ZZjPJTgmP7ZobdMO7RS
 JtHf5iT31x/HXOslQY/4zow2o1slecJ/w4jASHu0jiw0NFApeaDroUGeT2ik4Hsm0cub
 VAUBvWNvuwCgRAe7iTi9U4x5m38zYX9Oyc/YuepIOT2Rd05dvJK6ZBa84XEQNFBTu8Uh
 5EKQ==
X-Gm-Message-State: AOJu0Yzum55TzOBO6tyiJqy4ALhe4ptcKHTJc4gfUhzsTgePonQkxSvB
 X3zJZXr/0nxZA6wOzSy0MzrasEZcq35kCccyiWpUR0lqYkenbUBrnxRvWfqcQw==
X-Gm-Gg: ASbGncvx0Peg9+xwUTaks1Iw15H+b8SUN/U4LEAEeD9XbO/8d5L9MFXFzJRzneQ3Nta
 D7ij5xByhnLBSisDnU+81UtVaO3zKCNQMj6RB/dixQmR5Iu913RT3GkovGKdVCWT/KyyJJlmo/Y
 sZ9+C908myeViMFULVD87FPZo2UL8hgvzN2T2nikzdrYbZmZ3T6B9Qw4RrFs4bra+tLLmTUQbkk
 rxSqFCYehRyz2DHRjpg/c1dvvq1JDU3/3MyqxVHAYmR/45GCBoUrNym8WgeSG2Ih76y3myH1Plf
 j5J2yqBbSCoxgvZlijCF87hJCqWooWiFe28N3EloRGq0rp6o8l/TUqMDZTOuCv+Zhii2AU8RZUz
 BJs9LjIRzkzV+91C6bB4q3neZotHf07XhosqTDvQ1JgmC7Fimd6VZ4rhHEih35teCaWUX5fuHxU
 n7aU2oQg==
X-Google-Smtp-Source: AGHT+IHwzF3D+TuI9lfQ84md0T/QYDI4pNrxf1UY0StlaFSd7trotaFbRv9v+1l/eztACZLeEo8bLg==
X-Received: by 2002:a05:622a:1a94:b0:4b0:6a9f:f2e with SMTP id
 d75a77b69052e-4b06a9f1abdmr81969971cf.3.1754362772705; 
 Mon, 04 Aug 2025 19:59:32 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b06890e821sm21035791cf.26.2025.08.04.19.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 19:59:32 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Date: Mon,  4 Aug 2025 22:59:30 -0400
Message-ID: <20250805025930.315021-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805025930.315021-1-Mr.Bossman075@gmail.com>
References: <20250805025930.315021-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754362773; x=1754967573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4Zt2tJHy4z9j6L/C4WPPXSgOGnSGQuUPMqPiN+Wsd4=;
 b=fecTZOemMNyahu/TJH2ZZHzwQ7kV+/6dXvY5ij2XI10YNs4fIoCW1Kv6xG1LyZ+Cn0
 0u9W6bz9CV9vqJGDeoKd1z7uu4A/W2WVNeYx/V6npg8Mys47y396U+5hwXHFOryeS/Pj
 wrXA3SlHOt2+g0bU7rNpC0MRSaywVZfTp0llSnGlyBu0E7FNXwz45qrLjvy/EVkJ6+bz
 yL5NP7ZgEVyq7+4v2tvgwVUu4Sefx4jnxIyzXYeJfsJrH/ghnGbP7fgBipOUWTzCKTM2
 iVAzW09fHMJYrL2cgwnggh+x15r9gRPKeam5SnYZVKN+583da5DUG/5yEofJI/KS/YhW
 wb6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fecTZOem
Subject: [Buildroot] [PATCH 2/2] package/picotool: Add host-picotool
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

Add a host-picotool package to picotool.
This will allow users to build rpi pico applications on the host system.

Also add cmake as a dependency to target picotool.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 package/picotool/picotool.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index bc76900c07..da81764098 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -6,9 +6,12 @@
 
 PICOTOOL_VERSION = 2.1.1
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
+HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
+HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk2 host-cmake
 PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
-PICOTOOL_DEPENDENCIES = libusb pico-sdk
+PICOTOOL_DEPENDENCIES = libusb pico-sdk2 host-cmake
 PICOTOOL_LICENSE = BSD-3-Clause
 PICOTOOL_LICENSE_FILES = LICENSE.TXT
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
