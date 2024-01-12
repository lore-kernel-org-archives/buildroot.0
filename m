Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59E4C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 19:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4A160ABF;
	Fri, 12 Jan 2024 19:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B4A160ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guicZhJEuFN8; Fri, 12 Jan 2024 19:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF71960A5C;
	Fri, 12 Jan 2024 19:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF71960A5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4CE11BF489
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D54760A5C
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D54760A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DX2x5wqwM8PN for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 19:22:01 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9144E60808
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 19:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9144E60808
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-337874b8164so1709092f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 11:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705087319; x=1705692119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AfZBUNVFUHZ5MKHdEO7aSHwnP04TBG0Dhwx6c9424Sk=;
 b=gH0m2FQh/77U7gZSsnc3quHADK2gL2XNQpoYVO0amRmJ6KNtqDnaqMAuGvw0bU8x24
 b+Axr7SP5ZAoFiT5oupGwxJDyngWRHHI6jqGf45Gq2e+Dp1qZiyaShAkouBoLU+Q0QGh
 zpktxRVZM5lYwUx5Z+3VM7zQSQ2QDw53j7G5gNYpgNzCpTkLmou5EYnL4qUginf2WeTe
 buKnB7B9yxDg2UQ8IeyqR50z/Jq24eIXMqW4xq0xm8jNBWXd8D/N/13yPbPQGpC46Rir
 EZxHjIRUrXGsDOITc8efuvXIoXLlboBdQesqB7Sqb9Nnchvusi2R5PKIUQCmbmCTXMv6
 sd0Q==
X-Gm-Message-State: AOJu0YxiBDoas0E/7yYN5jabpc0Xk2d/2pcmNZHDtbb7oAz6eE6re2vd
 7Py952Rt8y/5GHOaqSib5FiZjuOgXuU=
X-Google-Smtp-Source: AGHT+IGld7rQzZEoCCi+y2PfN3HZhPiS2RymcPeRrJhMjg5zlV0h8qxCR3QCEUHA3Kvt320S0CFK3Q==
X-Received: by 2002:a5d:6450:0:b0:336:7127:5cfe with SMTP id
 d16-20020a5d6450000000b0033671275cfemr1201487wrw.32.1705087318539; 
 Fri, 12 Jan 2024 11:21:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a5d5f52000000b00336c120855dsm4693287wrb.84.2024.01.12.11.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 11:21:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 20:21:54 +0100
Message-ID: <20240112192154.1005937-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705087319; x=1705692119; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AfZBUNVFUHZ5MKHdEO7aSHwnP04TBG0Dhwx6c9424Sk=;
 b=ML+TUP6qmrrR4KhOm55ZfJ9bxPl18NMMJ/LWG12QGkWmMrCwULzLohDnylP7IWZuKo
 HmmecJ60+GX63ZV0/3B3HP16CZEpBUcNhvPdv1i1x5XB27hVAFfpOuHZDsjK4QD0qq04
 5bhVnY/JbWyIem8N+DdbOvLJCaTgyILFBisfAhqT/RqmidCndb13jv5LTejVokeDKP4P
 +8YsNq0LDt14CRi3+otFzM59J4kJXeggPX1W6pBcN6wcGAK1Rp7yPQ62l1y0SnP5UA4P
 ZKirzyURGnSoknsaPIhuVj9V1ewi2SKDL9JfzLzmojwNc/domiRdP/L88V3nycdhwxoH
 fFww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ML+TUP6q
Subject: [Buildroot] [PATCH 1/1] package/elfutils: drop -fpic workaround
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

-fpic workaround is not needed since bump to version 0.166 in commit
794ae61a15f7a36e199b62b2e5224cfc41bdabea and
https://sourceware.org/git/?p=elfutils.git;a=commit;h=133509fa406e0e8d4d0f0632e2ee8c5e32dcb010
https://sourceware.org/git/?p=elfutils.git;a=commit;h=6a20e20ea9f122aea86533d28a688e7bb2812aa1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/elfutils/elfutils.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 24eb168894..d43b545f2f 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -33,11 +33,6 @@ HOST_ELFUTILS_CONF_OPTS = \
 ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
 ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
 
-# sparc64 needs -fPIC instead of -fpic
-ifeq ($(BR2_sparc64),y)
-ELFUTILS_CFLAGS += -fPIC
-endif
-
 ELFUTILS_CONF_ENV += \
 	CFLAGS="$(ELFUTILS_CFLAGS)" \
 	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
