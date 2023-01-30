Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C59C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 12:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAED81A5C;
	Mon, 30 Jan 2023 12:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CAED81A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Clb0f1s9CVTU; Mon, 30 Jan 2023 12:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB6681A6A;
	Mon, 30 Jan 2023 12:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB6681A6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0A9E1BF5A4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B15960F60
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B15960F60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvzj_sNixLxg for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 12:19:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47AD360E90
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47AD360E90
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 12:19:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r2so10857749wrv.7
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 04:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANxKr1fi2VXQ2REZkSqLwLbeOfVfbMjIGdW1nyuBxVY=;
 b=Wz1rv8jS/1GlgTa54+A5nVZQkjPNm7EQtxnckUHGyTsotsmEI6Tz/p0nlkA8686AXm
 nmi3Ymk3RQP1HCih6fLy2kEcOMLwwYOvm+3DgnjkqMEcuaCovdr+oP+Jg/qSqHRqDSpP
 MnQDq05xVNOtOfzD/XgUcjoiHuQPH4OlWDogLEa3UtX3RN+3FEIOTvsgObVRF0uXoIsL
 pvmb2MkHmoH3ifChX+sRhXnw3b6iK5RF2Qa6akmS7Mhu2bPd8HXIhnEgRcVycWq6C9+V
 QQlMJ1kveXtTCUxhUF3WAU6Q2VhOde43Ca22iXq6xEJBbnV6RkxD2EY36RwqRVhuA+xR
 MK2Q==
X-Gm-Message-State: AO0yUKUdFJuJvnrfogPfepo5Az63cpM+prkjDEyJcxiRjl+xgs22X5b9
 Nb1kLC6yQGzsKQiMJDp7GRWAMmZQaeCucw==
X-Google-Smtp-Source: AK7set9G81uMz15GisuEhleMJYO2BcvJqY+MZXQTOqsZcqzeLVWAi/t5qR3hLvULRDvL/RAgtdjvBw==
X-Received: by 2002:a05:6000:1e04:b0:2bf:d8ed:ba32 with SMTP id
 bj4-20020a0560001e0400b002bfd8edba32mr8405845wrb.48.1675081178134; 
 Mon, 30 Jan 2023 04:19:38 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm11618612wri.110.2023.01.30.04.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 04:19:37 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 13:19:29 +0100
Message-Id: <20230130121930.3472747-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230130121930.3472747-1-thomas@devoogdt.com>
References: <20230130121930.3472747-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/3] package/fluent-bit: fix -latomic on
 various platforms
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

/home/thomas/br-test-pkg/bootlin-nios2-glibc/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: /tmp/fluent-bit.6F9rEA.ltrans28.ltrans.o: undefined reference to symbol '__atomic_compare_exchange_8@@LIBATOMIC_1.0'
/home/thomas/br-test-pkg/bootlin-nios2-glibc/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: /home/thomas/br-test-pkg/bootlin-nios2-glibc/host/nios2-buildroot-linux-gnu/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/fluent-bit/fluent-bit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index f7727834dd..c84042a0fa 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -41,6 +41,12 @@ FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
 
+# Uses __atomic_compare_exchange_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
 		$(TARGET_DIR)/etc/init.d/S99fluent-bit
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
