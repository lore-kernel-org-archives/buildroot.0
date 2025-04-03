Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F5BC3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 22:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE6D1820B3;
	Thu,  3 Apr 2025 22:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKHW-8q3wLra; Thu,  3 Apr 2025 22:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28929820D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28929820D6;
	Thu,  3 Apr 2025 22:44:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B3F7119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 22:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84D3A4123E
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 22:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzrOfk-PVTb3 for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 22:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=vassilisamir@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B30814123C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B30814123C
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B30814123C
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 22:44:33 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1bdb7bso2392382a12.0
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 15:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743720271; x=1744325071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dfjH/1tz6bsVpgSUnyPBimGJZpxMOtLcCMA+Dr8rkVw=;
 b=T+EXeG9rJGfXTAGDQL/KhJLsh7FHl5YoCNcma+hdpZbB0h60NKICY11IVWt7luhOql
 JhlQUJSi4JK+EKfej9n4RmKEakfTKKqJRhRayC49F3hIrtHzK+RrccqvsyQ+1zLEn4kS
 7+iWvHSwMXJszrv5amYS41OFj7OSIXiEPgIOeJQc+YHvzs/0WacrsH9IRjrn9JRe0jFj
 sDYFgMFmqnWDgkq3ZqE61ILfOfMZXYEC/3CV5hSAk9Rxhc1Ji8RYCZt/nKRPvzjwdro4
 U/D0PVlGaSqzn7+BNy6gTg9UpLxi0mptRprqsrzY0ZG+jVtfCIvBJv/vTRGVXQZ2jDPy
 Rujg==
X-Gm-Message-State: AOJu0Yx7msEgZAd+pDePVoRESZXU7iqQglEe1OtjvoyO3U1SfagfO6uN
 QaZzf0Te+6UL5i+E3GBd7Wmq3rH5hMsOorrRpuBFUtOvUOpXT1RRL3asiw==
X-Gm-Gg: ASbGncsA8TlgUV+z1Z2+4ODAg1do1TMJJvjFW+yErtt/PCYLL3ti6fvh0KNghAQXWL6
 7SV1NmgYLeKSdHKD09hZzF1Fe1lZ8vW1BAhU8M6DVR+FhmZ5tYGu5SwNeZAQXi3dOa05LO/cvBY
 zge/0WN8x2XGsdAiPrg5kbKlLx7IUduTn/WXivZ1UGr2Nk6YVzXWglAkqAc33FC1JBlE1VRwisd
 iPvRgX+33wz3pwX/qnX7hJYTNDor1j4rE0kiuAi46hWXYJS2bvNE+GLNxn0sLo2hCHJ72Ua8Sy5
 GahTpm15615KRAnbBYJQIqLQhCVauaAwMU4BNJt6R9xESFYjmx+JEzFIng==
X-Google-Smtp-Source: AGHT+IGlddWPE2VpR80+N7A3f67ZT9N2wwsnu4cQ0dVpbP5p8pNigjdIl5e0pHPs1RP2U79XHf+T2g==
X-Received: by 2002:a05:6402:3221:b0:5ec:f753:f1b7 with SMTP id
 4fb4d7f45d1cf-5f0b470649emr672791a12.31.1743720271193; 
 Thu, 03 Apr 2025 15:44:31 -0700 (PDT)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:430c:870d:a43d:651e])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f07baasm1506820a12.37.2025.04.03.15.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 15:44:30 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: buildroot@buildroot.org
Cc: Vasileios Amoiridis <vassilisamir@gmail.com>
Date: Fri,  4 Apr 2025 00:44:17 +0200
Message-ID: <20250403224419.26193-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743720271; x=1744325071; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dfjH/1tz6bsVpgSUnyPBimGJZpxMOtLcCMA+Dr8rkVw=;
 b=IM5gB+BSkc8RtKl8lRiLvFVPjD7Oueiv89VvJBJuKwq8Lwh+x4t1K54xVVEk8lN8La
 rY8nsoTippnhdG+PLqPlmvQVWhY3qvZyXRJwxYPfzyt6X1FPHsF3pygrKPtnGnsTX0L+
 CKhY3y3MVdJc18GyeAkhytuvm4Cyrzd0PAAg8McynvOBehBx51kh47lbg2lnDV6KGP6C
 4ppClzcRm10jOy9p5dY8GzpwJXCmChdp0NmCnB54Z4b33ZYiB9jdP4apLaK9S87U89Xa
 CSTOM/PUqZkkvjO1BacwceG8Vyq7H5syIyBq2KLuvrHFfOImfLElykBphtJSCWsEe1An
 HxnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IM5gB+BS
Subject: [Buildroot] [PATCH v4 1/1] package/linux-tools: use
 PKG_CONFIG_LIBDIR in perf make flags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After commit 440cf77625e300e683ca0edc39fbc4b6f3175feb ("perf:
build: Setup PKG_CONFIG_LIBDIR for cross compilation") in the
Linux Kernel it is needed to add PKG_CONFIG_LIBDIR in the
make flags to avoid warnings from the Kernel, such as:

        Makefile.perf:207: Missing PKG_CONFIG_LIBDIR,
        PKG_CONFIG_PATH and PKG_CONFIG_SYSROOT_DIR for
        cross compilation,
        Makefile.perf:208: set PKG_CONFIG_LIBDIR for using
        Multiarch libs.

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index d67318571a..1526652ce4 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -20,6 +20,7 @@ endif
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
+	PKG_CONFIG_LIBDIR=$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig \
 	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
