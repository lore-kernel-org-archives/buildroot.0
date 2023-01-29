Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0D4C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 09:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE6F817AB;
	Sun, 29 Jan 2023 09:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE6F817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8a1hW8gHRMr; Sun, 29 Jan 2023 09:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3D181461;
	Sun, 29 Jan 2023 09:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3D181461
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 083B71BF3EB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 09:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2D0441626
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 09:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D0441626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_HJhN33y_2G for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 09:45:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7D1741620
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7D1741620
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 09:45:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so8595845wro.1
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 01:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UCQea1rSwhUCKLMLOwCdiTsLkNw62pz7bHGdkJOTEOM=;
 b=lUy6eBfD1Tnz9Wy7YrPCEJ0uxY+QJORkJdgLUYD3vJEJ793ywR9Axl8Lrmq7+RMQY1
 B5UknnI3P6yM1Op9GelzfRo2JaR14jNXHRQ6JROyXkEuYbj3junFSd8qRa8ZojPhsfTG
 RnLix0DLZji9ZgKY33KgHeu//B7fg8IkYm43AwuhuOqIoU5GZ01SPkhFShQ/KVDVuVqD
 tfsu1w5ZVpSxfpOofb7DkJjR2EoEQ4IVqIGTiEQbs/DZkBE17Ohaipr1lEsWqZaR+qsU
 /8r1pjX+1yyct/jeJwnwEoECPW7axp6Sw3HhySKuqx218NcNfnNuTeWjd3azcl7lwSHr
 I+6g==
X-Gm-Message-State: AFqh2kq3OZxs2mzVulL/9MrjT8mYG0VMDGWI3Ell3CakL8YiRIgd5enN
 /C8bzMpAejj3ifPH4YbG5XWRy1vFgMjv4MRK
X-Google-Smtp-Source: AMrXdXtv/uZWjADI4X+34xCU19zAJ1TqT4W23bKJYrS2kemVRXKVrysMXEf9jDaVRaek+eg2Ylf28A==
X-Received: by 2002:adf:8b45:0:b0:2bd:e8c9:bcd5 with SMTP id
 v5-20020adf8b45000000b002bde8c9bcd5mr37775479wra.61.1674985546441; 
 Sun, 29 Jan 2023 01:45:46 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 d11-20020a05600c3acb00b003db30be4a54sm12634713wms.38.2023.01.29.01.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 01:45:46 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 10:45:29 +0100
Message-Id: <20230129094530.884944-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230129094530.884944-1-thomas.devoogdt@barco.com>
References: <20230129094530.884944-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCQea1rSwhUCKLMLOwCdiTsLkNw62pz7bHGdkJOTEOM=;
 b=mhjm5veglQP5Oo2sTRlbEDRZjgdoP2f94sUzipv0ksIBXo4rnnH3V8HdNLRxgSkwm6
 OoKjzSjhy484Y0dDPeFyqj10AKAlsYDq2dGUgQvaMcC62cpE8Ke1e2kT4N/vGd5vbrRJ
 M7TSu0bV22CLR/i+BIFc5CHYTs94MuIkjoHU9tfmjAkcGIacha5GDftHfvjXlal7arTO
 xcdAMixlpvupBavN1XbqL6Sks1bNr1dQjtuBi3UjolYskKFyP6Cwy3iYIhh490UNnv1M
 lfvU/AFYQlotD7WlgTZc+rg4B70A/2DAybRnizBRowx7o0K5mAmR/ztJw8xdQ9+0M17B
 1Wxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mhjm5veg
Subject: [Buildroot] [PATCH v2 2/3] package/fluent-bit: fix -latomic on
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
v1 --> v2:
 - added package/ prefix to the git message

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
