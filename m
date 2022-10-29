Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8609C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 17:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37B81404F1;
	Sat, 29 Oct 2022 17:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B81404F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kU_SkDToqahZ; Sat, 29 Oct 2022 17:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4479A404EC;
	Sat, 29 Oct 2022 17:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4479A404EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 743791BF867
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C5A960671
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C5A960671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajhBC27zv7bZ for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 17:00:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4623E60709
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4623E60709
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 17:00:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so1003459wmp.5
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 10:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2c7308q3gHirsc+00O9di0sS+uReAyJb1iayq6KvsME=;
 b=YEXs1vC96SUtuMzw1q+zrfAaM0sVMi9peufwJCToa5Lawe/ON/hQpG5+qlMw8dmG8V
 yOCn1dK/LerDTXZ6PLnTRmTXiSZJis8osXXW2NlLXf5TbkaLGm957wdWVorgVZD+QyLZ
 Cx7k0ghJoUlEni8Lw+6kw2+SJJ5X+rIo75Bb+aYpYmUExJMMUxu4D4WnMU5dztFwc56R
 MViC8ewpFRItI4flSmkmIjgPFYqRjIIxoxRjUPG9UpifRvZbI5wdbrlZMh06bs9a3018
 g0XvR5snG3Nxd/xNmk6bUCDc4M35Yvojcw8ILPwD+8RD6TBcBGPoyNnMb1LcxTWba1g4
 mX8g==
X-Gm-Message-State: ACrzQf2t2l9xFHbgUleVCFrKu9ZztI10CXMgjlVXyPaY73Bu2Q6gpCNu
 snwknBmRZL2EJ+V/jRkFD/MQQFFZBqI=
X-Google-Smtp-Source: AMsMyM5bV10iWHXtlkDdrHmzTt7yZG3/udKQvBa529ze0kWkIBLgkOr+fhBlUsCRmAZ9pOLIiMtEmw==
X-Received: by 2002:a05:600c:3488:b0:3c6:cf4d:472b with SMTP id
 a8-20020a05600c348800b003c6cf4d472bmr2885794wmq.73.1667062835147; 
 Sat, 29 Oct 2022 10:00:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b00228a6ce17b4sm2076606wry.37.2022.10.29.10.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 10:00:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 19:00:23 +0200
Message-Id: <20221029170023.219493-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221029170023.219493-1-fontaine.fabrice@gmail.com>
References: <20221029170023.219493-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2c7308q3gHirsc+00O9di0sS+uReAyJb1iayq6KvsME=;
 b=qPuqdyK0aeE4bVdcI9wn8nQrzXiODnKggdU5U/oOC+IjMTe975u+gv/zlI/ugUp/R0
 iMKB3oCNJ9GCUjDW0eQZQT11gztNbum08fV0bgUHeAibPwocx1VQI7wf7Nr5e810UBjl
 7My0H3YL4BJ/8qfn/G0LK54zLXyiywY2vJLTD7IIEhSU1D/YHtfEDfHb+DbMBlXsXoMT
 aGtOFsNpPU1ddtiGIbkMvkb8tmPdYqpBXMSGdZTqMFgtz1wqjdY+cTSS6WitLZfKrq0a
 YpdhrYgrHzVxzdNzyDexLoXgOXO8Ixoal/HQd0cacm6MUQqAq0o5qeH6vK1iy294Okb9
 d8nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qPuqdyK0
Subject: [Buildroot] [PATCH 2/2] package/f2fs-tools: fix build with lz4 1.9.4
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of lz4 to version
1.9.4 in commit 1f54af8c4f814bfc0993756b82575ad581ce5318:

compress.c: In function 'lz4_compress_init':
compress.c:36:42: error: 'LZ4_STREAMSIZE_U64' undeclared (first use in this function); did you mean 'LZ4_STREAMSIZE'?
   36 | #define LZ4_STREAMSIZE                  (LZ4_STREAMSIZE_U64 * sizeof(long long))
      |                                          ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ca8b6646322a4cb911fad5fb9cb38046743609bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...s-tools-fix-build-error-on-lz4-1-9-4.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch

diff --git a/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch b/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
new file mode 100644
index 0000000000..b43def6bb7
--- /dev/null
+++ b/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
@@ -0,0 +1,34 @@
+From 19f77c6f6277a274434d6d8883f50e7955c6a8db Mon Sep 17 00:00:00 2001
+From: Jaegeuk Kim <jaegeuk@kernel.org>
+Date: Mon, 29 Aug 2022 11:03:35 -0700
+Subject: f2fs-tools: fix build error on lz4-1.9.4
+
+LZ4_STREAMSIZE_U64 is undefined in new lz4 lib.
+
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+[Retrieved from:
+https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=19f77c6f6277a274434d6d8883f50e7955c6a8db]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ fsck/compress.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/fsck/compress.c b/fsck/compress.c
+index b413492..b15f0a4 100644
+--- a/fsck/compress.c
++++ b/fsck/compress.c
+@@ -32,10 +32,7 @@
+ #ifdef HAVE_LIBLZ4
+ #define LZ4_MEMORY_USAGE		14
+ #define LZ4_MAX_INPUT_SIZE		0x7E000000 /* 2 113 929 216 bytes */
+-#ifndef LZ4_STREAMSIZE
+-#define LZ4_STREAMSIZE			(LZ4_STREAMSIZE_U64 * sizeof(long long))
+-#endif
+-#define LZ4_MEM_COMPRESS		LZ4_STREAMSIZE
++#define LZ4_MEM_COMPRESS		sizeof(LZ4_stream_t)
+ #define LZ4_ACCELERATION_DEFAULT	1
+ #define LZ4_WORK_SIZE			ALIGN_UP(LZ4_MEM_COMPRESS, 8)
+ #endif
+-- 
+cgit 
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
