Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD0DC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 14:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FA5740929;
	Tue, 13 Feb 2024 14:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMXzsETO2wFd; Tue, 13 Feb 2024 14:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C67414C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45C67414C1;
	Tue, 13 Feb 2024 14:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219ED1BF354
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 14:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EADD40709
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 14:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJXtbVW76hGy for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 14:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E0D6406FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E0D6406FD
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E0D6406FD
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 14:31:29 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5116063585aso5595008e87.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 06:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707834687; x=1708439487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L4XWIGAnq0enfEgw5jqM/yXKHBDR359TSc/aQ1PeMqc=;
 b=QU15BnXTyccPPoxiXiaCQmPZjMCrSz1XSBT7YgTrNZdGxuoSE6BxUKecmzErf1W8MW
 8E3GvBksk24PBft6iJ7MavU+SPmI7+GiNvr/3IpqnA/3TtwhWQTwZY598UWGXrr+YO11
 E1x0dCi3kAj7zYIihRVQejXR5z7Ue5D0yLP61Gj8M7pPI7eB3Bskw4tK+ZHSLiyeoAeb
 6EHjxHlRNuO4xlgHNW6zVnGQntmEO1vznP0nt3hmeCQESGmiu6Wa51XKp3ssyUoCMX2n
 Qz7ZxZPL8Z6SVOSpds0uhlG0tOTu69Yyy6BWi6y1uWQJ03pkpcTQG0dhCh6CVE0KmlpU
 JfKw==
X-Gm-Message-State: AOJu0Yyxn/0EvnzCD4a3K+rH8Kyi8X6dvcM2SJL2vxx4U0nK+wMN9Ie4
 FqOWs89KacIfS3ksd/SyM6hYYXeSq9TkxFohZ+XBJ26qX1w/965yNFDJvO95
X-Google-Smtp-Source: AGHT+IFaZN/nmi2V/ohmbfEVBEkfvY8ldu2qz2twL+OY2KrJSkCZlajp9hAszvi/eyPWlgsgwvUYrg==
X-Received: by 2002:a19:ee09:0:b0:511:494b:c483 with SMTP id
 g9-20020a19ee09000000b00511494bc483mr5785889lfb.31.1707834686916; 
 Tue, 13 Feb 2024 06:31:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQduk0+Mm7FSDNgv+3Fve4DWf0SN1AZAjV5XOdCKADkUohzZlLx7dxAHhJkeI7hLtuTqaw7Nuwi0sAveKEhlB5Q77SlFD51oW+KGaIhFcdZtMBeC40gvHtLlGu8soDD7mGOHJih+T9WlWAxgPILto+FyToLenkyNJlEAYQmA2kgR0=
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 i11-20020a1709061ccb00b00a385b3dd2d3sm1326247ejh.182.2024.02.13.06.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 06:31:26 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 15:30:25 +0100
Message-Id: <20240213143025.274988-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1707834687; x=1708439487; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L4XWIGAnq0enfEgw5jqM/yXKHBDR359TSc/aQ1PeMqc=;
 b=ikz4PXHj/TSHzXEcOXoP85E0RZwJPfk+n5xHgm8AmYUGH5ybMkhTi37uf2eIaqOMY4
 N0tilU0XkjIGcBz99WUQmqgXMNAUPQHjmYKOxdmmw3vOQRYQ3cQ95Vs2BfeMmwgOi5/Z
 RESnyZaWHMm2qnxSAwiyG6KjFJfChU5i9PtIVXFg2gc/kNuDW6qLBAnkEdfJ5vTBNUr2
 qLTF5XBFWBcwgT3rXCgjuszEt9TNFDutbUh3kewzUwfiidQUDavmUsPEv81RokID5S21
 MQnvziUdWN+5kH9QwIV8fIyI56RpNOduQ580YEoidmxYJYmfw6Q1iYJoUAQXB/G4ZrfY
 b9WQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ikz4PXHj
Subject: [Buildroot] [PATCH v2] Create a .gitignore file in the CANONICAL_O
 directory
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This .gitignore file ignores all files in an output directory and
hence doesn't change the git status.

The .gitignore file will be only created if $(O) is a subfolder of
$(TOPDIR).

Remove "/output" entry from the main .gitignore file as it is already
handled by this general approach.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
    - create .gitignore only if $(O) is a subfolder of $(TOPDIR) (Yann
      E. MORIN)

 .gitignore | 1 -
 Makefile   | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..14b7ca5040 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,3 @@
-/output
 /dl
 /.auto.deps
 /.config.cmd
diff --git a/Makefile b/Makefile
index ac625152c6..71764ce1fa 100644
--- a/Makefile
+++ b/Makefile
@@ -65,6 +65,13 @@ endif

 CANONICAL_CURDIR = $(realpath $(CURDIR))

+# Create a default .gitignore file that ignores everything and doesn't make git
+# repository "dirty". Perform this action only if $(O) is a subfolder of
+# $(TOPDIR).
+ifeq ($(realpath $(dir $(CANONICAL_O))),$(CANONICAL_CURDIR))
+$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
+endif
+
 REQ_UMASK = 0022

 # Make sure O= is passed (with its absolute canonical path) everywhere the
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
