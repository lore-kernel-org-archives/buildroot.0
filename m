Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86D8C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DBE760F92
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DBE760F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47977402E3;
	Tue,  3 Aug 2021 08:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxM2WMWpFdLg; Tue,  3 Aug 2021 08:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B09E402F1;
	Tue,  3 Aug 2021 08:26:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C67DA1BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0FFF4016B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jO3eOvtOTOpt for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:26:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84BC3400E6
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 08:26:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso1134450wmq.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3/3VJkBJ8Gp1yigwgORce89XBRjLffPaomNZRrtIh0=;
 b=BDGNuUtgaHqTtCF+Y8JFm7J9365vcv7OM/8NMQeVAI3mu56g3zksTvhNpXCxDqpHHW
 KfJ+E0PzSt2Ni8alcGbw0vZukHb+1Jg+/rmakPR/wDyfEIhbTeZtlcnVGa69FIiJJnfQ
 J5vAq5y5uDbWybg1dY9kn5KPvj/q8piT0Ur14kqSSpTsT1CWVomPgBIjaC0/Eb3kz28o
 av6QqXF0lsk+QTXnQ7Vhm0QL85nio4o0UWWBL3UUPLOesVj5Jh/hqHKtP+IhhDP9jtXB
 IRshmBCeRzXhSwRJ5dHm6Byjex7vpCyCpZGKNXmvpLW12QYXR1DvpDgj+3177d3u8pY+
 lutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3/3VJkBJ8Gp1yigwgORce89XBRjLffPaomNZRrtIh0=;
 b=mDzpNpHcNUJcEjcvLmXV9kHeuw3LuyJx2mxHo5XUgbQaRgzVx4VhOb4sYmK06MKVAA
 HQxkNFdz4byK2BVr81uRoK1/JXLB0tmsCbYCa54NGpXs1MXhSXnYozyX64/sIhpxf4wp
 1DvuF/LtyHhj1DS1DHQ1VV9AHo+vA8LhtcR4yY8/oDo8W2eDVuGEiQr7KAClwcm8UNrb
 zBB//fKMVUvbb2R3Lu5BQdyBh6vttqqSxiQ/vGOD0DF5rBuJlczOuxg1CWfAv2qKCnU8
 RcsZegleuTi3sPksKinQXHfWRGhLgjijJg3UZrftME+r087Sk41Y+YcAzKJR6+b0ggDC
 9QgQ==
X-Gm-Message-State: AOAM5318vHOVa6GmpRJl1+fFEMnT8MSsO61bAw5eDl8mv5L5fFTGustp
 vZgzMGAKNKGQZun+eUEL8yk36pQh65cT9g==
X-Google-Smtp-Source: ABdhPJxJuoGhFrBPuf+dqHt4KSgoVuY7H5f28Kn2/7y1ta1zqRehWs2vr35xoYcvObG/ewBvmhsBAw==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr3027301wmc.39.1627979175448; 
 Tue, 03 Aug 2021 01:26:15 -0700 (PDT)
Received: from kali.home (pop.92-184-116-144.mobile.abo.orange.fr.
 [92.184.116.144])
 by smtp.gmail.com with ESMTPSA id q64sm9100388wma.8.2021.08.03.01.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:26:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 10:26:01 +0200
Message-Id: <20210803082601.2457321-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: link with -latomic if
 needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure raised since bump to version 3.4.7 in
commit bb75c4b541fac144b53b63248e235f22ba1d25ad:

/tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ui/qt/CMakeFiles/qtui.dir/sequence_diagram.cpp.o: undefined reference to symbol '__atomic_compare_exchange_4@@LIBATOMIC_1.0'
/tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /tmp/instance-5/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.org/results/6617ee0e0046a0452a1515b89e9c704b1c125ec4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e852083de6..6ee4b20391 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -43,6 +43,10 @@ endef
 
 WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LTO=ON
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
