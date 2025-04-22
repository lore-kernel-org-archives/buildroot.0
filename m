Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2049C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 06:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C87B60C11;
	Tue, 22 Apr 2025 06:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynUXKdE8WfUq; Tue, 22 Apr 2025 06:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD7960C19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD7960C19;
	Tue, 22 Apr 2025 06:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B71881BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B256381761
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTzMneEnkGnu for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 06:37:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F3F4818C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3F4818C2
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F3F4818C2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:37:10 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-227d6b530d8so47990385ad.3
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 23:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745303830; x=1745908630;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sjPThLoEvP6+bvx5c0gNHE1uBqEG7OfoylxQTLvPQAk=;
 b=dRmyAKzywxls/5lhgkV9UdnI6wknydgc3L45HvCRRf1aGxXMfwqHjMq2Ngkcwd/6ON
 YG997FiAYvtVVoebhBoJQdpx+axnHTNvX8HuduCJkdEvkzye3hSUxNkLXf1cAmJhps4v
 Q6GXpcR3E0/hLBqTAuIVdGiBs6F07A7XRIytM1ySbVvICdtblHzNgFldHoUOsU/i4sJr
 R7QIYPYcRmHEplUlteRgG/59bASwdkMSJOulBEW4BD0IyjhiYYo1OwWbTpLoGNshI6zg
 Sfq+rtmnlYVX9TAGT/yw/74ccngLUTFpP996RR24AQc1eztGbi1Fp0TwHiBQ/MojBQ0w
 TDeA==
X-Gm-Message-State: AOJu0YyuJ/CU1hZxyxa4NM2HBFC6QbEk1eSlLlczZlnYFmjUb8np7jPc
 TMOhkfTW+RwOlPt4wM5OnlcS2ycX+sIl6J+YcS3m+/VwcZvTmJMurqkQaNPeB81Ce2a0Z+EcygN
 x
X-Gm-Gg: ASbGncsRkXv5SNskCWaq7nv2vhAgoNlvhG2rY5fQrSXq/AEQsGYEL6twhwh6oGCkzfz
 6myYSpZ4rwWF2y8bCyGfHfbD3dzYEYjkNIrovupbxA/tstX6F435tOjbW040IHhKyHoYhKP6/30
 7EfRFzOOLvyCGSb58FybkvDy5CxB/Z18AsCPrGbVMFDkq5q6bAtj7acgYPOLmLLi1YSlAKQJK02
 IGdhG6zdsM8mJlVL/hX+S2HBJUZXEQ3cYu8iHOWdjbgvKXu7aOgMzhJ532aBDB7Ker8ZOf5TUbc
 Er4Ui0kq70en7YHSh9qU+QM/geGoBoJqtFc4VwQXpiXgZ7xkcYt1BEam5XAYz0fs42Y=
X-Google-Smtp-Source: AGHT+IHVpgrTXbH1u0drtSBmi2bVyP6b3+Qt30AgbPUmiZRDMHM1I/wM9dmwJJYRLhOjbUSyWnlkxQ==
X-Received: by 2002:a17:903:32cd:b0:223:4537:65b1 with SMTP id
 d9443c01a7336-22c5360c196mr212761425ad.36.1745303830265; 
 Mon, 21 Apr 2025 23:37:10 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50ed1d63sm76966125ad.198.2025.04.21.23.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 23:37:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 21 Apr 2025 23:36:59 -0700
MIME-Version: 1.0
Message-Id: <20250421-fix_linux_tools_parallel-v2-1-301086814e0b@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAAo5B2gC/42NTQqDMBCFryKzbkoyKmpXvUeREGJSB9JEEhss4
 t2beoLyVt/j/eyQTCST4FbtEE2mRMEXwEsFelb+aRhNhQE5trzhA7O0SUf+vck1BJfkoqJyzji
 GNdY9DlrZHqHUl2hK9px+jIVnSmuIn/Mpi5/7x2gWrKgRdTt1ndJW3CPlkMjrqw4vGI/j+AJKY
 w9jwwAAAA==
X-Change-ID: 20250409-fix_linux_tools_parallel-2323829caf82
To: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=JjQizoDIvjSSkOm9TsnQnuZG12Ifr/1AFd3iItEM2BQ=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwa7JZ/x1QMras/Zd9ye2fZvp7vTrM+LHzBq3fd3O2Pw1
 5KfiWllRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABNZforhNzujz2H3n8/nT3t3
 P/TY8uPL7r95UWdW2MJRILpkwsmNRkyMDEfjRA9x3vwSfKr1h5bbhIoElY0PryguC+x/6+02fdq
 juTwA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745303830; x=1745908630;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sjPThLoEvP6+bvx5c0gNHE1uBqEG7OfoylxQTLvPQAk=;
 b=aN+ecOhGBJDMRaIIwU907vUyM3vGs3/WinkP2cD1mSyyqChgI5cTxVCAytRN+bBSYN
 MeEAPyBoUCoqvtjjY4obNViGzeSGhgOMbWhbT08vOLnZm1T0cWrUXd9qZc5+RlKsWlsT
 axi/a+uL9L+9fiuA8GD6GqzEloc+Jc2gzoljx7uVhYyWk2Jn3+9RWbhY5z9B0EMMkoQa
 6cq6D1TJqL2npy5Y6KDhxJLXnSRRFAduoNZyn8007iuY5Te13fCTAtkzRGQa6MABf/TB
 aKnU8/tF9kqLs0VEhys/5uipXZapaIKh3MGJfAI59/1VOAhK3FOEGoTIWq/3tr15qxSq
 Tq8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=aN+ecOhG
Subject: [Buildroot] [PATCH v2] package/linux-tools: Fix parallel compilation
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

linux-tools opportunistically set linux as only a patch dependency. This
unfortunately introduces a race condition in the shared linux scripts
when using PER_PACKAGE_DIRECTORIES and using top level parallelism. The
race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
Permission denied". This happens when the linux package and the
linux-tools package are being compiled in parallel.

The linux-tools currently using fixdep are perf and rtla. When the
timing is correct, perf, rtla, or the kernel Makefile will try to use
fixdep while one of the others is compiling fixed, resulting in fixdep
being briefly not available.

To fix this, set linux as a build dependency instead of a patch
dependency.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
While the timing of this seems like it should very rarely be triggered,
on my build server I hit this issue nearly 100% of the time.
---
Changes in v2:
- Added more details to how/why the race occurs
- Link to v1: https://lore.kernel.org/r/20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com
---
 package/linux-tools/linux-tools.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 81b1fbc17605d6f003558d113143b64b5af6714d..49e73a9ca4eca91afe7474302c13286f6665762d 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -19,8 +19,12 @@
 
 include $(sort $(wildcard package/linux-tools/*.mk.in))
 
-# We only need the kernel to be extracted, not actually built
-LINUX_TOOLS_PATCH_DEPENDENCIES = linux
+# Prevent the kernel from being compiled in parallel with linux-tools. The
+# kernel and some linux-tools (such as perf) use fixdep to manage kconfig
+# dependencies. There is a race condition where the kernel and linux-tools try
+# to build fixdep while the other tries to use fixdep, resulting in the use of
+# fixdep failing.
+LINUX_TOOLS_DEPENDENCIES = linux
 
 # Install Linux kernel tools in the staging directory since some tools
 # may install shared libraries and headers (e.g. cpupower).

---
base-commit: 7336c5fa93a896130511d661f0d42359a046ec9a
change-id: 20250409-fix_linux_tools_parallel-2323829caf82
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
