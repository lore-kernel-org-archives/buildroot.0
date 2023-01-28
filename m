Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9978BC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 17:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29267416F2;
	Sat, 28 Jan 2023 17:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29267416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Urpnb4sw3eFu; Sat, 28 Jan 2023 17:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C55F41675;
	Sat, 28 Jan 2023 17:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C55F41675
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3961BF215
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 17:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6558A8196E
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 17:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6558A8196E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8ro3f6-cBuJ for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 17:47:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A1F8194C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92A1F8194C
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 17:47:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q5so7694027wrv.0
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 09:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ANxKr1fi2VXQ2REZkSqLwLbeOfVfbMjIGdW1nyuBxVY=;
 b=Rp0RLD7C4Qv/JMrNIB1Pfu3xXZpFd9rldes8SmnQZnVphbtREexdRMhkpUVDqNkWje
 GyiEM5gtrg3JdfHmWwTVOoso7d1ZY6n8n6x5WTjBnAZuXJsLOnRVIp9r0LL6BVkZbh81
 ibsoNKbN78VfuJwWMBzyowaBn3w64yiujQyvdzfIdbyVoPehDpx42jbRvysIPshjGLN7
 UuqDLidRJMWJqMT1Ddj43j3FGWf3IV1ezX7hbZFqkd/gqgg7ykr4fjGSBhmwNhWa3h2G
 mTsAzLNpSuPzCsqxalzYhMHl3484tLMLDdDFGfGwjq3Mxv/Xz5G9RKROCWysqynJZQcq
 9fxg==
X-Gm-Message-State: AO0yUKVyqJWkk12bBufDXLHE4NyhVdwdE3sj0t+qL4vkGyD2+CzZDsPy
 n9OWhm1T2lhRvhK2Z/1xG36UwUIGzxdGiufh
X-Google-Smtp-Source: AK7set+ytTC23hIEUUrWXulGqYRprEzAdi/A2BWrsINg8pMU9KsWn5QlxUunVGbt1RnkiPVof1dWDA==
X-Received: by 2002:adf:f045:0:b0:2bf:b872:cf29 with SMTP id
 t5-20020adff045000000b002bfb872cf29mr12559995wro.2.1674928067432; 
 Sat, 28 Jan 2023 09:47:47 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b002bfb31bda06sm7614644wrl.76.2023.01.28.09.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 09:47:47 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 18:47:30 +0100
Message-Id: <20230128174731.3816982-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128174731.3816982-1-thomas.devoogdt@barco.com>
References: <20230128174731.3816982-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANxKr1fi2VXQ2REZkSqLwLbeOfVfbMjIGdW1nyuBxVY=;
 b=dyjMuzvymzaeedqg3I8yW9mjLJpYz11l81qURRJa1/1W8lf6ZD48Cd9RbDfgo6hvf1
 pxt/1kc/21EzHV8KbQUoscxilYU59ANrG5ZZEyxaZX1dSpFs3/JdU/OPgewVZrZdt4QR
 t3G27UzCondAVWJKpu5kSISB2MaSYi5JEHXRkluIoct4bTyx638T5+9WFT7ocNh/5PK0
 Y+g5OyvmjreCR5x9SN5zqDmN8aYGayuMOzj6qiFKwa9ERzITnqc6BoBdmLKxrTaJkidy
 7pgpEqHCepVDGTs86bk9cAgG919tqS9t1YUawy52ipqUHMEZuzhOI90KzuPAIKVKTXWb
 9Pcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dyjMuzvy
Subject: [Buildroot] [PATCH] fluent-bit: fix -latomic on various platforms
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
