Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96BC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 13:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBE9406D2;
	Mon, 16 Sep 2024 13:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9XiigpBOxwW; Mon, 16 Sep 2024 13:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61AFF40620
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AFF40620;
	Mon, 16 Sep 2024 13:31:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 726CE1BF488
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 13:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 618F381249
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 13:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJ4V4UuOvk03 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 13:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83EAA81256
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83EAA81256
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83EAA81256
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 13:31:01 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7422D2C88EC9;
 Mon, 16 Sep 2024 15:30:58 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 15:30:57 +0200
Message-Id: <20240916133057.1358143-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1726493458; bh=FwMKnzPae1OT8bX/44Ygqomsk4uKyZTDmq6H4K7WBw0=;
 h=From:To:Cc:Subject:Date;
 b=tl3/Qn3rnn+QeSb6dhFiEABc/qLwOpNiihvYqlwplr1cIrMtVYOoP+e6j1iYivuyf
 HN1OWa26yyrgc8S8brOsno6IwaUwSSUgvGqJv5oiCoWkCfjrUDDNbhzRTmy8vAd58O
 ebTgZatRSWa6z899ClRcQgp94jCUnz3hdMPpgBZHnN8Y4m9ci7SfYr7+7aYhhE1LBA
 0vo1Ytu1Qv0JcGr3zQLVm2hu06b2B/D8zdu4jq2TSfp9N5wik6tblXmkW04HtMnAJn
 LKekWOK3/XMvOn/C4g1PavIstacv6PhCFTjYprc5Y0haBGNaZ5pleaetT7XWTT7zA9
 i/B7Tb/hEXp/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=tl3/Qn3r
Subject: [Buildroot] [PATCH] package/python-sdbus: fix linking on aarch64
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following config snippet fails to build on arm-aarch64. Adding -fPIC
to LDFLAGS fixes this. This has also been discussed upstream [1]
in the past without determining an exact reason/cause.

Error repropduction:

$ cat python-sdbus.config
BR2_INIT_SYSTEMD=y
BR2_PACKAGE_SYSTEMD=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_SDBUS=y

$ ./utils/test-pkg -p python-sdbus -c python-sdbus.config
                    bootlin-armv5-uclibc [1/6]: SKIPPED
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: FAILED

$ tail -20  ~/br-test-pkg/arm-aarch64/logfile
/home/marcus/br-test-pkg/arm-aarch64/host/bin/aarch64-none-linux-gnu-gcc -fno-strict-overflow -Wsign-compare -DNDEBUG -g -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -I/home/marcus/br-test-pkg/arm-aarch64/build/python3-3.12.5/Include -I/home/marcus/br-test-pkg/arm-aarch64/build/python3-3.12.5 -c src/sdbus/sd_bus_internals_interface.c -o build/temp.linux-aarch64-cpython-312/src/sdbus/sd_bus_internals_interface.o -flto
/home/marcus/br-test-pkg/arm-aarch64/host/bin/aarch64-none-linux-gnu-gcc -fno-strict-overflow -Wsign-compare -DNDEBUG -g -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -I/home/marcus/br-test-pkg/arm-aarch64/build/python3-3.12.5/Include -I/home/marcus/br-test-pkg/arm-aarch64/build/python3-3.12.5 -c src/sdbus/sd_bus_internals_message.c -o build/temp.linux-aarch64-cpython-312/src/sdbus/sd_bus_internals_message.o -flto
/home/marcus/br-test-pkg/arm-aarch64/host/bin/aarch64-none-linux-gnu-gcc -shared -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 build/temp.linux-aarch64-cpython-312/src/sdbus/sd_bus_internals.o build/temp.linux-aarch64-cpython-312/src/sdbus/sd_bus_internals_bus.o build/temp.linux-aarch64-cpython-312/src/sdbus/sd_bus_internals_funcs.o build/temp.linux-aarch64-cpython-312/src/sdbus/sd_bus_internals_interface.o build/temp.linux-aarch64-cpython-312/src/sdbus/sd_bus_internals_message.o -L. -o build/lib.linux-aarch64-cpython-312/sdbus/sd_bus_internals.cpython-312-aarch64-linux-gnu.so -lsystemd -flto
/home/marcus/br-test-pkg/arm-aarch64/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.3.1/../../../../aarch64-none-linux-gnu/bin/ld: /tmp/ccMnk9xf.ltrans0.ltrans.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `SdBus_async_callback' which may bind externally can not be used when making a shared object; recompile with -fPIC
/tmp/ccMnk9xf.ltrans0.ltrans.o: in function `SdBus_call_async':
<artificial>:(.text+0x1d50): dangerous relocation: unsupported relocation
/home/marcus/br-test-pkg/arm-aarch64/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.3.1/../../../../aarch64-none-linux-gnu/bin/ld: /tmp/ccMnk9xf.ltrans0.ltrans.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_SdBus_match_signal_instant_callback' which may bind externally can not be used when making a shared object; recompile with -fPIC
/tmp/ccMnk9xf.ltrans0.ltrans.o: in function `SdBus_match_signal_async':
<artificial>:(.text+0x203c): dangerous relocation: unsupported relocation
/home/marcus/br-test-pkg/arm-aarch64/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.3.1/../../../../aarch64-none-linux-gnu/bin/ld: /tmp/ccMnk9xf.ltrans0.ltrans.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_SdBus_signal_callback' which may bind externally can not be used when making a shared object; recompile with -fPIC
<artificial>:(.text+0x2040): dangerous relocation: unsupported relocation
/home/marcus/br-test-pkg/arm-aarch64/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.3.1/../../../../aarch64-none-linux-gnu/bin/ld: /tmp/ccMnk9xf.ltrans0.ltrans.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `SdBus_request_name_callback' which may bind externally can not be used when making a shared object; recompile with -fPIC
/tmp/ccMnk9xf.ltrans0.ltrans.o: in function `SdBus_request_name_async':
<artificial>:(.text+0x2310): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status
error: command '/home/marcus/br-test-pkg/arm-aarch64/host/bin/aarch64-none-linux-gnu-gcc' failed with exit code 1

ERROR Backend subprocess exited when trying to invoke build_wheel
make[1]: *** [package/pkg-generic.mk:289: /home/marcus/br-test-pkg/arm-aarch64/build/python-sdbus-0.12.0/.stamp_built] Error 1
make: *** [Makefile:83: _all] Error 2

[1] https://github.com/python-sdbus/python-sdbus/issues/50

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-sdbus/python-sdbus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 0b3ea37b30..5ed798fbe0 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -12,6 +12,7 @@ PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING
 PYTHON_SDBUS_DEPENDENCIES = systemd
 
+PYTHON_SDBUS_ENV += LDFLAGS=-fPIC
 ifeq ($(BR2_STATIC_LIBS),y)
 PYTHON_SDBUS_ENV += PYTHON_SDBUS_USE_STATIC_LINK=1
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
