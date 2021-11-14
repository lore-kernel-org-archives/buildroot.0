Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446CFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:49:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0557E61027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0557E61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6BA3402F6;
	Sun, 14 Nov 2021 14:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bazYb_JvKdXv; Sun, 14 Nov 2021 14:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387CE402DF;
	Sun, 14 Nov 2021 14:49:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB2E21BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A94EC402DF
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1-8zpwyC-zw for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:49:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BAB240124
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:49:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id i12so10868999wmq.4
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDxQoRLGignZkkuUmx3+MTyWbUC0BH6+Q94U30Dfr2E=;
 b=ayh2MhE7cEhPB/NdviN0MpYgt2YwPOfO3+mm5TOo6ZD8MLjwLgkRZ2HrqQNdoJaSCI
 +iOWkYvHzXGWwi3kcJKtUMkJiIUcTZ29pyI1SxFtRG8+yi7++u8tP/A8P/fGTJe4oJcC
 3GaUqE21CzsdoGRev2lKjA1aWKQvsLGowLlwMchnaEyt3rDdMT2dg+Xu81/0VnGxiAtl
 /TNVZNcljsvFzqOCQ7Q+gWeutzQt1KPiEyaQLZUEaj11gtiR6kGAQ9Kz9aRuh7LDDMGB
 PnTFL1hSTyyurq6FQ+2C6W8+BkwXJliZToZoNxDHQrefvndEYrx/cQBG3mGq33dRoieV
 juqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDxQoRLGignZkkuUmx3+MTyWbUC0BH6+Q94U30Dfr2E=;
 b=j/6a1cpcmWjk8eVwO2XUIoDFn4Wci+gLvJOjpGqnxG8hu9rwgs3cN5WWfflK06VOsF
 TEEnTVDaTY+FIz4N8RSzIIvwtdejWvVqmmwsLJQ3utkfE7P9wOK98H5NdL0IIx/qHtQK
 VqdKCU9/SObdeRvYL2Ggoa7GGC/f7kxnw/DHfbHq7XDD7KcYr6+S7HpbbxYJZ7r+//Pg
 m+hU1Vi1vC28qhE5wcjYmoNkkJGwIyw7AREbYvUy79h+NmeAHVUmUfKwEr3Fwvi9rS85
 5g3kVxYKy8Hycog/yg50ToCk3KLKspEVHztbSghEDKfCn4atBbSvZA0zdj1MZOvxbDR8
 yudQ==
X-Gm-Message-State: AOAM531Q7ROUcj6VjDtFnRtbJ0y8Djqs8sqXSJ55y0c0j/nGKiZXsWP/
 Dh38GmV6nZtUQ5+WeO2JyP+TVMdvhj8=
X-Google-Smtp-Source: ABdhPJyGNmQOvGsLGlWRLHtOJlLXOK8fqtLZw0Dk3oqknPyHivzTssm4+NTByY8Uv53jJzJCsGEYBg==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id
 f13mr52637481wmq.7.1636901357536; 
 Sun, 14 Nov 2021 06:49:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q8sm11220302wrx.71.2021.11.14.06.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 06:49:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:47:09 +0100
Message-Id: <20211114144709.1559207-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/janet: fix static build
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

Fix the following static build failure raised since commit
0ddb20c3adba8a9512caa7249cff8b43828c44e8:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc  -o janet janet.p/meson-generated_.._janet.c.o janet.p/src_mainclient_shell.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -Wl,-O1 -Wl,--start-group -latomic -lm -ldl -Wl,--end-group -pthread
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_registered_FDE':
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/host-gcc-final-10.3.0/build/xtensa-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde.c:1043: undefined reference to `dl_iterate_phdr'

Fixes:
 - http://autobuild.buildroot.org/results/d6cd842bd156abe3d77b72a7a108a5233fa19e20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janet/janet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 71e9e08e62..b00f82846c 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -17,7 +17,7 @@ endif
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-JANET_LDFLAGS += -latomic
+JANET_LDFLAGS += $(TARGET_LDFLAGS) -latomic
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
