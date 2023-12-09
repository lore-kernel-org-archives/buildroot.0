Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677ECC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 21:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D243240138;
	Sat,  9 Dec 2023 21:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D243240138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJ6FuLdaffiD; Sat,  9 Dec 2023 21:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFA9740158;
	Sat,  9 Dec 2023 21:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA9740158
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E64BB1BF263
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 21:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE2D821BB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 21:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEE2D821BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wB5cJY8hT2LW for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 21:49:27 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D418B82195
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 21:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D418B82195
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c41b43e1eso4256115e9.1
 for <buildroot@buildroot.org>; Sat, 09 Dec 2023 13:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702158564; x=1702763364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmKrqqYyfuIzqEW8TNpK8uGwlvJJKsBbMHJlkVk4tHU=;
 b=Z2WgwgWzrpmP57CibmL/m9mffLbyChjzrreoVnbbBuv9YpGzAgyaZH3qjGfviUlfXG
 Eiq2EQAJMIf3LvTBE54VidyJKLSxdJHpmk/EjDoUNWFgZLy8mAekUOL/wmZLohlcv9RY
 VYxzoTnFaAFs+1mOgAWApFOQRk1l8OdjftEQmL1HBv0Qlf/nro702xI0jMWG0yrkFGKN
 9DoHT+5DgpMZjWjZ3TbF7XBrMeAyNkL89U2CWuVCnFh4yc6Y9nSHCjnAUkcbogwEt/G3
 Yits0zcjWMxDT8SxTLluozfYbbGYzpxgInVo4XkgVInKzwwctZNPpwk7Uy1T+GNyzyYN
 G/ew==
X-Gm-Message-State: AOJu0Yxx7iwfxNKXYu7UN6KDedmTwgE3tHIgjLGxb9dEojWgc/zw8aBa
 nLshq9zXwuP39g70rourjbrbYaxYszSjsL8rXKMBDw==
X-Google-Smtp-Source: AGHT+IEwHYIVqng58rVjysX/G7nhhhkWHozMlL9RdElB7b+dpz9NOoU4M0lDTI1HiOqyCLDffufnVg==
X-Received: by 2002:a05:600c:1605:b0:40a:5c71:2c3e with SMTP id
 m5-20020a05600c160500b0040a5c712c3emr963536wmn.19.1702158564191; 
 Sat, 09 Dec 2023 13:49:24 -0800 (PST)
Received: from panicking.amarulasolutions.com ([2.198.79.154])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b0040b478da760sm7624669wmq.48.2023.12.09.13.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 13:49:23 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  9 Dec 2023 22:49:18 +0100
Message-Id: <20231209214918.2071047-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702158564; x=1702763364;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zmKrqqYyfuIzqEW8TNpK8uGwlvJJKsBbMHJlkVk4tHU=;
 b=h5JsSZdJHwyQZlPt1q8Z2z5AJxNOm/bG57su30Mz3OvIQo070npMqaeviscjxMnsDN
 VN54ggTakTe5X8LKjhVgacA04ebf/TFclsFvV7sed/26Pb4d/zCdpPFybrHTpDyS/Yo2
 BAPztmBG5ryrSNHRxasIsLjrIPG5EMZoSJieg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=h5JsSZdJ
Subject: [Buildroot] [PATCH V2] package: gdb: Add helping kernel gdb
 functions compilation
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to use all the features of KGDB it's nice to have
the possibility to source the vmlinux-gdb.py file. The
generation of this file depend on CONFIG_GDB_SCRIPTS config
option. Add it in order to use gdb of vmlinux in output directory
including tx-* linux script

gdb-multiarch --tui output/build/<linux dir>/vmlinux
add-auto-load-safe-path output/build/<linux dir>
source output/build/<linux dir>/vmlinux-gdb.py

Linux needs to be compiled with DEBUG_INFO (without restrict
DEBUG_INFO) and kernel cmdline should be modified to wait
of kgdb if needed. As example

kgdboc_earlycon=ns16550a kgdboc=/dev/ttyS2 kgdbwait nokaslr

The test was done on am62x board over serial line. In order
to have it running properly we need to compile the agent-proxy

./output/host/bin/agent-proxy 4440 4441 0 /dev/ttyUSB0 115200

gdb can now having the debugging uart available using:

target remote localhost:4441

the 4440 is used by the console and 4441 is used to debug

[Yann E. MORIN: suggest to change the gdb.mk file instead,
 changing the kernel.mk file. ]

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr> 
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
V1->V2:
	- Yann really help to make it simple and move from
	  a kernel task to an enable configuration to gdb
---
 package/gdb/gdb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 070598b385..0ebeb08dad 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -304,5 +304,9 @@ HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_ADD_SYMLINK
 
 HOST_GDB_POST_INSTALL_HOOKS += gen_gdbinit_file
 
+define HOST_GDB_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GDB_SCRIPTS)
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
