Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA293C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5315540C79;
	Thu, 21 Apr 2022 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IgFMZYnBhdRz; Thu, 21 Apr 2022 21:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D53241125;
	Thu, 21 Apr 2022 21:42:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84C8A1BF95C
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72C0141D85
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvZz8m3WsX-f for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:42:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 263C441C5B
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:42:38 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w4so8381701wrg.12
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 14:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tV6lTHII8MENL6svoBugipSyD35PJ432H6XxSyW84TM=;
 b=WEFaAEnCIBLcYCcreI0Y1vIqfuEg9Q/Oi8Yacqe6+DlD97mgulHwWiWu+BJ8CC/kXm
 UyI9ztTSUWuqf7smHcquSZcHtFfFd9Ourr/kJVg7CmDA9ULyH/eWvGauwsdLzmZpBMvq
 Y/tQY84ooA6rXBKoxzNUjRJwzRNAKhIGkxFAjgfxMjv2uTMZGkKl5wnqHArhWteiVIsl
 tYYCv4d4Dnm8PZmWCbAKf80/E9ie6dxB/2ovaJcZzM87NVx9HKGI9Ltxh3mmDEFJ4hhf
 9wAY0ZPJKdFCZHOZRmF3Dcaw2tc/kC3MH7vldAq0SgiM1fEmXsqBHzPjGkTDNRV8UZSv
 CVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tV6lTHII8MENL6svoBugipSyD35PJ432H6XxSyW84TM=;
 b=3cjTUsLQznLw3I1aydQSoJu/pPepQvxFHHPEaoO8QUSxyA3Jk09WPs7vLujxc1xKGZ
 1ay1/UTx3o5qeRqYqw85vkSMt01X6sEbs6WEhTXJN4rnV6mL16btU+hQHSU7ILf57MhS
 BmoD9lK/kOZckYlmDYE6DX0T4g5yu4WxN0Jl46QYXN4WtelvA/06VIuvS7q0k28v1TI/
 kyInjFRKfcl5MFa5VwfxHIH3kaqNKrarZFRkmxlonK8lShQWwCTis6bWCzpatunP7Ecy
 MekX28ZPXfyl2CQo73HWV8riHsoKMXlZUj+7cOm9xfk4Apg5Qoh6uB65eTyG76MYrhv5
 N6uw==
X-Gm-Message-State: AOAM531EqHl1T2Ga8k7Q2cFOGvoMMBvMBEOljNQ7qspXQPQg9rj8UdsS
 zR0le+Glg+e8O0TV1vb+ztIvm/I2UQU=
X-Google-Smtp-Source: ABdhPJw6cFWKiioJ7+s4Pct8Tl5DV0Y/kq2TPaXgE/NPfED8Dw/xsAhxKBUVy6ApibB9NSYUyjUUwQ==
X-Received: by 2002:a5d:4f86:0:b0:20a:b08a:ff8b with SMTP id
 d6-20020a5d4f86000000b0020ab08aff8bmr1155576wru.91.1650577355910; 
 Thu, 21 Apr 2022 14:42:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a5d6ac5000000b00207e90b2869sm140625wrw.91.2022.04.21.14.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:42:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 23:40:30 +0200
Message-Id: <20220421214030.2348966-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/coreutils: drop patch
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

Drop patch as it is not needed since bump to version 9.1 in commit
908caefa91dbf70e7f40c61113f0f1ae2b83230d because gnulib has been updated
with
https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=135414a7f543e4d40ad0a7cbd51885e159a6e0f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 -------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

diff --git a/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
deleted file mode 100644
index 88390a1124..0000000000
--- a/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 1 Apr 2021 07:49:46 +0200
-Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
-
-Fix the following build failure with uclibc < 1.0.35 which is raised
-since the addition of getrandom module in
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=682cc4e678aceff32dea2a84b6e5147bdf5a20a7:
-
-In file included from ./sys/random.h:40,
-                 from getrandom.c:22:
-/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
-   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
-      |                                   ^~~~~~
-/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
-    7 | #include <features.h>
-  +++ |+#include <stddef.h>
-    8 |
-
-This patch is not upstreamable as it is only a workaround for
-uclibc < 1.0.35, upstream uclibc has been patched with
-https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
-
-Fixes:
- - http://autobuild.buildroot.org/results/c69f5c8b8e53ed3de753f0c6d2cdd99497504b49
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/getrandom.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/getrandom.c b/lib/getrandom.c
-index 41212fb32..0ad3f9648 100644
---- a/lib/getrandom.c
-+++ b/lib/getrandom.c
-@@ -19,6 +19,7 @@
- 
- #include <config.h>
- 
-+#include <stddef.h>
- #include <sys/random.h>
- 
- #include <errno.h>
--- 
-2.30.2
-
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
