Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DC3CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD28F40518;
	Sun,  7 Apr 2024 10:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCh-dHVZJWBL; Sun,  7 Apr 2024 10:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3FB140520
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FB140520;
	Sun,  7 Apr 2024 10:00:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 086E31BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E991740476
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJnn4UK2K1si for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCC5740432
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCC5740432
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCC5740432
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:00:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-343cd12630aso2113516f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712484015; x=1713088815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZWGxveLgHgdqt6KQqRZxcGMB+JjN+zwAsWfqkj8ScXs=;
 b=AqgXI74f8zLIHQK+4cZRGv4VlrR6NHAww1RELOIAu2S2a19LVYOHoUQjJ23dvti9YU
 VdCDxDl6HNAeBKDA4GLmKrGmzsuu8kvU7XfDh/YZ7jL/YFvrknVs8+wBEQ58DOeBUKka
 DWNKZQd6RQGbbteWwtYw8bOCl3YENYQPIJsodz80rycmeb1FdfLUmQVPlsUJSocm9wYn
 7BKvtjB9OWV5V+Q4BmajA8u8AQy9OPqGg9/2uOCmOGg6jhqM0Y9Qqao8PhUPXR73VcSz
 MVTqwAygWXhWjmH8Goe7nEQ5n7MTtz/GnrTOjYdsSoFG2qJVQpE+agJQ/ggCgRKth26q
 JGFw==
X-Gm-Message-State: AOJu0Yz/X8I8D5AEDASRZF7lovju+VFhSDLTHSW3T78kJsJQjlD+A8UO
 /Q57X0Rh5zHPIluZtsKycpe1op9F8YbvZ6axpDY2lFEllhlilBEWUUT0oBjz
X-Google-Smtp-Source: AGHT+IGA7u1whe7ISa6Eeld+dHs5WF35eYdSMOA460x+EMViH7wsXrwRqixqsVRbeeh0Yl5PH4wiQQ==
X-Received: by 2002:a5d:4003:0:b0:343:c35d:1406 with SMTP id
 n3-20020a5d4003000000b00343c35d1406mr4297810wrp.15.1712484015157; 
 Sun, 07 Apr 2024 03:00:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r12-20020a5d498c000000b00343e8968917sm5845366wrq.1.2024.04.07.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:00:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:00:12 +0200
Message-ID: <20240407100012.595352-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712484015; x=1713088815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWGxveLgHgdqt6KQqRZxcGMB+JjN+zwAsWfqkj8ScXs=;
 b=dlu3wkU+MwiuoJYJm42Yx8HeRP3rMfKAmn7sVAHVGWh4PFnIGMZGzwFG2+/WEyL0Dr
 AiMal7dJ3q5VmAcgi26zrl0h9fsouBapJakfY1j2FIpM4stwXQGmFNZ+EcrH6zDkGh+S
 JG6K4g9sHskirB7+iEJG1w9/9rnqJWPW0essYI7XB2tdGjWnnO7k+y0/Id6GJHm2yWsH
 co8CSPImHDndXX/ZSBxxJf5f3QOPgD0SaFaO94qdXUAW7D4p3nt7aVKsF1gNtug6jDez
 pj4hBdtF9LF9iMC6lnnnF4acjN0n4FT0rEKzlljktFlmaLAkSCQWCtttWtT1etnHdGsY
 XNsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dlu3wkU+
Subject: [Buildroot] [PATCH 1/1] package/quagga: add libxcrypt optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/12.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ../lib/.libs/libzebra.so: undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/984572031cedd124f48b5a5bc5abe6096d22eaf3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quagga/Config.in | 1 +
 package/quagga/quagga.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 9427475d03..9361b6a212 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QUAGGA
 	bool "quagga"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Routing software suite, providing implementations of OSPFv2,
 	  OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 97297baff8..5d8d52263a 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -33,6 +33,10 @@ else
 QUAGGA_CONF_OPTS += --disable-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+QUAGGA_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
 QUAGGA_CONF_OPTS += --enable-protobuf
 QUAGGA_DEPENDENCIES += protobuf-c
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
