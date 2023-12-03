Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FF4C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 08:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 348434042B;
	Sun,  3 Dec 2023 08:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 348434042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjqP8YqdEkh7; Sun,  3 Dec 2023 08:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261254044D;
	Sun,  3 Dec 2023 08:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261254044D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3765C1BF292
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 08:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F7A460DC2
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 08:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F7A460DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4JpW0HxIHIF for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 08:02:23 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E23F60AC4
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 08:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E23F60AC4
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so33931655e9.3
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 00:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701590540; x=1702195340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8d+gb8T1+6k/QUDfZKL8/n/Ryc11YFvZY5AJ1c+emKk=;
 b=DZa/ystH9bB8YAmd+8Rp1gNCusKa7RrAek85nXLGWb0PTRXecrmRhkCahj1KvE4SHC
 stqxn1FNiJLf8d8o0PpHDezzpCQO7DftRHbeVp7Uq/NSvXTe4kgZlwdznTfyqmSr1VSB
 gyKok1L1tQhcxnr10uHJQVEjlYI1LceX0yD+x7/1D2kA5vVeJfqN/Hd8MLlu04r6mdtT
 X8SRQH/E/4y4ME1WX2zryT9D/+5vbkdrIhsed+msIx0W03ifZ5CzyX297S7ggatWFqal
 xOVVJEtNDX3tKnTYTJbsFz0f9mb9/l3d2DRimTpSNhCcz/sx6FRT12XX7WayCw41am7y
 IB5Q==
X-Gm-Message-State: AOJu0YzVXlEbozDUCi2c2aVhyvZqLUBCgi/hE804jDWm4eerng3aKIIn
 SNZ0yqXGQCYLoc3fa+FCS9EMjtQhQ8c=
X-Google-Smtp-Source: AGHT+IFX1Vk1P8pp5Ee/YC8L/PojB6Lqcg1/SYQdEVUMxW/UJaImayMPwrubmqCpJf7dU6TqFyv6EA==
X-Received: by 2002:a05:600c:1d95:b0:40b:5e21:bdd7 with SMTP id
 p21-20020a05600c1d9500b0040b5e21bdd7mr1412525wms.102.1701590539918; 
 Sun, 03 Dec 2023 00:02:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0040588d85b3asm14456738wmq.15.2023.12.03.00.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 00:02:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 09:02:14 +0100
Message-ID: <20231203080214.394961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701590540; x=1702195340; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8d+gb8T1+6k/QUDfZKL8/n/Ryc11YFvZY5AJ1c+emKk=;
 b=cA3gdR5qYbmSduyI0Auc0DszdSeAbuk9ewlHToBZFKviwQGQzZvnNuGAo804qJzhYD
 6x+vymkwW2+6lHs2jjkZiL50Y3vyNE77UVt7nSLbfUMJgNoOLV7fnxBuLxxGyVu18VAb
 GpZkmtpx/wV5sMD0hRyqX+r9rfpfuiiNDlD2xznRPLCDPPdjvRaU+J/qrrGco6km4kBK
 BT+vWFOFedj05Vgt5VODngEroZS1qLM5kBPkX/48o2UA6g3kmM6Y0kSWU/iE9KTrHHYd
 zaqhZARq7MV6tmGH6iBGtdplsRKoahrmfGswOAx9jzZeUwUsbVOHXnETfIATRSqhv282
 5ktQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cA3gdR5q
Subject: [Buildroot] [PATCH 1/1] package/libmemcached: link with -latomic
 when needed
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

Fix the following build failure raised since bump to version 1.1.4 in
commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/11.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/aslap.dir/ms_conn.c.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/c8e4e1f9609d1339fe070afe440c63660892600e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmemcached/libmemcached.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index f64ab5ec48..f86cdd3bbf 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -32,4 +32,8 @@ else
 LIBMEMCACHED_CONF_OPTS += -DENABLE_OPENSSL_CRYPTO=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBMEMCACHED_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
