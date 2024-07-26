Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65291C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 08:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AAB481FA1;
	Fri, 26 Jul 2024 08:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgiM2J7X_7qe; Fri, 26 Jul 2024 08:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD8D81FA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD8D81FA4;
	Fri, 26 Jul 2024 08:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D58F81BF3B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 08:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C208E81FA4
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 08:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSX1qsmYFmxD for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 08:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADFEB81FA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADFEB81FA1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADFEB81FA1
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 08:53:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so6457715e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 01:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721984036; x=1722588836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=80h05+68FNWC5WW2cZJH06psSA32uYpUfvbIqs8obwQ=;
 b=fizEHjlrRqCNFT+VyxL9VIig6rJSlxBQtNxVpOpvPyHVALewnp4oBQhDjfyW5o36zV
 DgYoMnnZzTEmDUyAd4nHh4FoKW4GuLjMoyMjWra2a1sSNp1yJ2blWp3BD8wXi9xN82Bg
 m8RIVoEiw4xiymdUKGQNLYcBf7SHkU74GBXfYRnJQVQXlwEz5c3OIktOUVOksIMxHQyc
 QhkF4L8w8CGXFMnoYciKjbx/VcffAvHhTpMYxpyKFl4fxpRfTesQ/Jk50E0yBxzARHO/
 1nGBuxyN70lE1YyGokzHCJZlb+19UXry3/8XGGkZsg88omdxK1Sw+6MavJFDUWjcYKKY
 BYEQ==
X-Gm-Message-State: AOJu0YxsnMZjq+kuEEiSj7rwohJ8Q71jSCJ23KZR7JX6FIR5NI/Z5QmJ
 YPBHJPVAkbOmYxU6UwObvhXw5w6llqgqIa1P0641rTzlqYYPfIL4JqfcsA==
X-Google-Smtp-Source: AGHT+IH9FJy+aJdQD9/itj24Z8YUjNU/Y2/BsKvDOyGMMlG2nmkb1+d8Hywran6eOibCNW15kMTHTA==
X-Received: by 2002:adf:ec06:0:b0:367:8909:197b with SMTP id
 ffacd0b85a97d-36b31a7b42cmr4068016f8f.61.1721984035772; 
 Fri, 26 Jul 2024 01:53:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36857fe9sm4553942f8f.70.2024.07.26.01.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 01:53:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 10:53:52 +0200
Message-ID: <20240726085352.1238297-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721984036; x=1722588836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=80h05+68FNWC5WW2cZJH06psSA32uYpUfvbIqs8obwQ=;
 b=SJjvXx8cvf7A0Mp/SxxOHgYeIFjvTFoOZb3PPUoPviefZUOYO/cg8j3lSQbJtg6omZ
 rqr+BdTv0wR7l31o3Ay2ngnjktkFI6I+mOnAZzRGPm0TYOsVr0LkvT3CPJKnNq/9g0lm
 IPjJSf5/nS5dHfpR79yCMJdADh/rEotXggviDi6XrS+UhJLVSE9qOOxstW+tChUoXgt8
 ReERIm/K8Iftz2+89rmVtgTOF1hD2qwsTyNVt63kp17cQeNkp6zSz0G9N5R/a9WAWrfQ
 /pDOFvAkWqMTdlf7zefdbn+4zG+tKrWHKEfGD0T+S+Q2YIM86tb6OZ9GJbTVYcjcwM7M
 0Zfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SJjvXx8c
Subject: [Buildroot] [PATCH 1/1] package/cairo: fix build without NPTL
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

Fix the following build failure without NPTL raised since switch to
meson-package in commit 1fa58814c09a71444f961b61a9a2c399b9163fc2 which
wrongly removed -DCAIRO_NO_MUTEX=1:

In file included from ../src/cairo-mutex-type-private.h:45,
                 from ../src/cairo-scaled-font-private.h:45,
                 from ../src/cairoint.h:415,
                 from ../src/cairo-arc.c:37:
../src/cairo-mutex-impl-private.h:231:3: error: #error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
  231 | # error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
      |   ^~~~~

Fixes: 1fa58814c09a71444f961b61a9a2c399b9163fc2
 - http://autobuild.buildroot.org/results/a123355b6d315d2fcda646d3f1c7b588cba78258

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cairo/cairo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 4ace04ebbe..3cfc182d09 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_m68k_cf),y)
 CAIRO_CFLAGS += -mxgot
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
+CAIRO_CFLAGS += -DCAIRO_NO_MUTEX=1
+endif
+
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
