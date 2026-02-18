Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB08E9A03E
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 09:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917A0607B1;
	Wed, 18 Feb 2026 09:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uabv89e4l1Pd; Wed, 18 Feb 2026 09:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A296D60799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771408538;
	bh=y5+Zyq3JrO2pg4gELzk2H+BqcH57AklmQos7J78+V3w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gkRFNyBl+Jaim0ewo0JyToACqakQN5S1Wk4DtfLIkHFCkwqBTzNQ/Y1twE4V9kqGW
	 7rcWZ/oTXZihD1ExeVOtWRR00au3dFiDrdKJa9nal1H3NoK/hw5FJ4UXxXHaVmhXD1
	 sBXMVGLmvYwVQ9Lc56BgiqZZxu3yGAfmEgfnfc/nu+RslVgb1dqabOMSHwC0OpsOyv
	 3Od0M7cpZVwmNDx3KSlh5kWS/V/DsVdjgdLR27tLjEVhSZZ98IjnRcaAFwCLH8Ud94
	 OftGkG1wN2wlb1qDJRHKX0jALN6EV+2zLB2P46gF1JKQYvrwanM2IVOVGaOG5GIf7d
	 YzS7M60Vy1ndA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A296D60799;
	Wed, 18 Feb 2026 09:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CA7235B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0A360799
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkCkhnbYgisY for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 09:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C33406075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C33406075D
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C33406075D
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 09:55:36 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2ad32708177so12539535ad.1
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 01:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771408536; x=1772013336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poJBIiazkFNjonmAhK7RyRK9gp9euuiQaCheK4cl/BI=;
 b=GtBbHRhY5HqHRPb0QKq/LOInCUikSI4a5YSQou9oIjY0AKooq7s0zmaP34gbEK06A1
 hYYUZWhnPXaUCpF+63YLipWx4e0fifRQJdFvlsa4sCigcBp1RHJg0WX8/cZwbBUeT3z/
 s2X0bPxL+Y/GxwqPRfYc2mnQhGyPsf+OUsVIvZromTygLXHC1IXpsV+Z+AvPlYVe7C+k
 BqXfdmH6sgeiaoGkWorPnfzZClqzuyknxzmqTpQH6oZka1kb0SgB7LZlH2NRICfSvFjg
 LMNEUrKS/IagvLC1dAzq49t1zSzh0qIjM2at1jWQDnu6dJNt8nzYpitarFgprIAJND2b
 QgDA==
X-Gm-Message-State: AOJu0Yyl1eIpdksbVJ8Ls62s+rXDtKxUxFE8CJo9x8JWOnA/p3VM7Mpi
 cWt+icJD33+K2yQ9rC8ZHnVwyMm8QmpKqwpKqlIYVEZBgDpq/yN5r3xWrZ00RrpT
X-Gm-Gg: AZuq6aKRIV/UAiRZ/9hBY9H6bmmJcf4dqjDCwdulIXAchpD+dfUXcCSLfnzxCrixGXl
 d1zseQF3gMj98qxR/C94uxyE2cXKy7DLyJg3lki1tPpOVz5gGg02w5kAOASZetCm2PUd6tZCmWW
 1jFHsxBPiITBh9ZHN8Wbf3jhBIRdb2NLSDuqzHRw9Q/6XF5ZruSoJIKEj0O8VHoQCtDrgm12e4L
 bCvkOIjodNMiGGQzL0d9bQqcx9a7sURIOcNva3w5sb9irNHd//6GpiGwQha5mzVsJ1ay/o8P8Wz
 VbJOO3VOmmVK+yVCsc/5EgNWXO2/pJ3P9fWkU4yxRLMkqlq3V/Lg/l8cGRnftjr8GKxEQFLtN2A
 bJORf46iQWXI70hK0WKU3GVUxtNfm0g2GMEvMHC9f1/MP2W3Y8T5u5BhW6JUv7VwOARh4PpRnkz
 rv6WunMDRN9T6Wkuijel0/abv4zPHoq8XUsJU=
X-Received: by 2002:a17:903:1a87:b0:29e:76b8:41e5 with SMTP id
 d9443c01a7336-2ad50f4be5fmr13564365ad.30.1771408535574; 
 Wed, 18 Feb 2026 01:55:35 -0800 (PST)
Received: from fedora ([2409:40e5:11f4:5620:4e1e:6f24:6c18:dcbb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1aaf4b31sm118356385ad.86.2026.02.18.01.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 01:55:35 -0800 (PST)
From: Rick <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Rick <chakrabortyshubham66@gmail.com>
Date: Wed, 18 Feb 2026 15:25:17 +0530
Message-ID: <20260218095517.795634-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771408536; x=1772013336; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=poJBIiazkFNjonmAhK7RyRK9gp9euuiQaCheK4cl/BI=;
 b=icNkNJJtB0SMZDy6D26b4jaYjm0sE6eJJh+sgSiDZU3Zy8mTMnesaNWxLdfYOE5YGd
 VKxdux4Rr1uaPqXwL88ZlTogWaxayjKr0Ig2sK36xpRtcuEGw5/UTgMCZ7nJ+izsv9zK
 xunTvZSHC5kPuA4oEjuwu3FLqFCLG0XyS9taSxQAJDTM/n6RQ3NIRF0BgnoKRqbSN051
 LyzrxVT1FVj+JWaHk7x7Wn/L6JEyY0d3LgWW8CepRcjzkXgvlgHq4EZ0btVNH30+N/qN
 l9EQVRPAkhpZEBOBA4WCK4BieTBIQfA9GMAzjKa6lYFSrfKv5Z7ubMNw7ip8i5QjmaiD
 JpWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=icNkNJJt
Subject: [Buildroot] [PATCH] package/which: fix getopt prototype conflict
 with musl.
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

which 2.23 ships its own getopt.h which uses an old-style 'extern int getopt()'
declaration when not building against glibc (__GNU_LIBRARY__ not defined).
This conflicts with the typed prototype already declared in musl's unistd.h,
causing a build failure. Replace the conditional prototype with an unconditional
typed declaration to match the system header.

Signed-off-by: Rick <chakrabortyshubham66@gmail.com>
---
 package/which/0001-fix-getopt-prototype.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/which/0001-fix-getopt-prototype.patch

diff --git a/package/which/0001-fix-getopt-prototype.patch b/package/which/0001-fix-getopt-prototype.patch
new file mode 100644
index 0000000000..29401b0f53
--- /dev/null
+++ b/package/which/0001-fix-getopt-prototype.patch
@@ -0,0 +1,11 @@
+--- a/getopt.h
++++ b/getopt.h
+@@ -102,7 +102,7 @@
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #else  /* not __GNU_LIBRARY__ */
+-extern int getopt();
++extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long(int argc, char *const *argv, const char *shortopts, const struct option *longopts, int *longind);
+ extern int getopt_long_only(int argc, char *const *argv, const char *shortopts, const struct option *longopts,
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
