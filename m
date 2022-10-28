Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94976ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3E4A4151E;
	Fri, 28 Oct 2022 16:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E4A4151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SJKyW-sQfgQ; Fri, 28 Oct 2022 16:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F71341516;
	Fri, 28 Oct 2022 16:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F71341516
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21FE31BF299
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F148B81819
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 16:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F148B81819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MgKteDDxvHx for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 16:48:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4989B8174A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4989B8174A
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 16:48:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o4so7373688wrq.6
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 09:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7sBQJQRzogvLdqmNt0kUZZSs1nD6vfDQ7oVfLbi3Kmc=;
 b=wwkC2BTD+Y1tFopDyaXhjeJAa14je4HH2TpQ+L75uNr8nKtubi/Gao7O2E0dBdXJg1
 l/PdhBMrI+gFVKbk3xzrXqwfD/zkbq2+LtzCXIqugPcslFZGdNjzD/l8AQ5DW0vfVdXd
 4rOCxrn8J6R6E4EP7CG5aMkIV7p/nyQUIe7rdBRSJUrC+hL5OTlCxn1Nw6gEk1ammWYQ
 uII09lnbXDtYSRLIAGpzrYgSX7Nk10dUGqdDJseWPfuCa/RkrspgHbN50IzvKHhMmgZF
 z3OWPIIvgN0gEkiGgqYwAOqjiPhE81xCht+bJ5SDnoatTXcpbQjVdgTxG41AjY3BylMI
 4R+w==
X-Gm-Message-State: ACrzQf0lRQMhEnR6Sx60syyo6iCaMRW0ZJo/PfloVEgZ4COxoIiRLEfq
 rRqShDqmWFOoGtuswldsEhRqrJlzSjo=
X-Google-Smtp-Source: AMsMyM4J0CixtVKmDfDKbwrh2+hfqvTULqnn4vh4w1JrmEYUwytCGGV10sOfuEcpa8AuCvdeNpbPBA==
X-Received: by 2002:adf:dd91:0:b0:236:a261:6930 with SMTP id
 x17-20020adfdd91000000b00236a2616930mr143078wrl.551.1666975682988; 
 Fri, 28 Oct 2022 09:48:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b003b3365b38f9sm4575613wmf.10.2022.10.28.09.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:48:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 18:48:00 +0200
Message-Id: <20221028164800.16655-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7sBQJQRzogvLdqmNt0kUZZSs1nD6vfDQ7oVfLbi3Kmc=;
 b=CxuTlKORv4GPyi5YN0usigt81/3MYU5qe6nr4YaBC0gB1aLCTES+DDcp6HasDSFQJo
 pDD4DciMRWozVK1bKVUFutKIaLIIKqpqBTzdxodsPkxNecY4tKs+c1wqHb9/K+OgaxU0
 /qGOQV3O+SV9kFz1Wz1y/cb8GYQ2MDdBNVR7VvuDGg9onAeIt3iElZX2VJlAgITbBvRc
 WME7amVmLJu/cCzo2PcwqfNC8yDjsgCe/BwyPyxBOabwGwSShwJDyuHmldCVtG8B2I9X
 UX4/kR0Znr56qROlbHnlwot490UdTX6rR2EmybOyi62dqnFt4ZKMKjEA3cdmvITCG/qY
 Ai/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CxuTlKOR
Subject: [Buildroot] [PATCH 1/1] package/lz4: fix static build
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

Fix the following static build failure raised since bump to version
1.9.4 in commit 1f54af8c4f814bfc0993756b82575ad581ce5318:

compiling dynamic library 1.9.4
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/crt1.o: in function `_start':
(.text+0x1c): undefined reference to `main'

Fixes:
 - http://autobuild.buildroot.org/results/9187852fb7a869bf5595275d47929632659a4407

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-build-Support-BUILD_SHARED-no.patch  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/lz4/0001-build-Support-BUILD_SHARED-no.patch

diff --git a/package/lz4/0001-build-Support-BUILD_SHARED-no.patch b/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
new file mode 100644
index 0000000000..d2d8639a3b
--- /dev/null
+++ b/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
@@ -0,0 +1,42 @@
+From 5ccbd38277989ae6a728171d59ae03bad6f2f4d5 Mon Sep 17 00:00:00 2001
+From: Fotis Xenakis <foxen@windowslive.com>
+Date: Tue, 13 Sep 2022 20:09:36 +0300
+Subject: [PATCH] build: Support BUILD_SHARED=no
+
+Since e585a438c714652e866a59371b287f52aa4d2dc3, the BUILD_SHARED
+Makefile variable only takes effect for the install target (i.e. the
+shared libraries always built). This restores the original behaviour.
+
+[Retrieved from:
+https://github.com/lz4/lz4/commit/5ccbd38277989ae6a728171d59ae03bad6f2f4d5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index 06503cb2a..ee262c0df 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -112,17 +112,21 @@ liblz4-dll.o: liblz4-dll.rc
+ 	$(WINDRES) -i liblz4-dll.rc -o liblz4-dll.o
+ 
+ $(LIBLZ4): $(SRCFILES) liblz4-dll.o
++ifeq ($(BUILD_SHARED),yes)
+ 	@echo compiling dynamic library $(LIBVER)
+ 	$(CC) $(FLAGS) -DLZ4_DLL_EXPORT=1 -shared $^ -o dll/$@.dll -Wl,--out-implib,dll/$(LIBLZ4_EXP)
++endif
+ 
+ else   # not windows
+ 
+ $(LIBLZ4): $(SRCFILES)
++ifeq ($(BUILD_SHARED),yes)
+ 	@echo compiling dynamic library $(LIBVER)
+ 	$(CC) $(FLAGS) -shared $^ -fPIC -fvisibility=hidden $(SONAME_FLAGS) -o $@
+ 	@echo creating versioned links
+ 	$(LN_SF) $@ liblz4.$(SHARED_EXT_MAJOR)
+ 	$(LN_SF) $@ liblz4.$(SHARED_EXT)
++endif
+ 
+ endif
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
