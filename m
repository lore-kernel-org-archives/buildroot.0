Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0AEC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 18:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8E04161A;
	Sat, 18 Feb 2023 18:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8E04161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DQAsT4dU2Kv; Sat, 18 Feb 2023 18:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087434159D;
	Sat, 18 Feb 2023 18:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087434159D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DFA91BF3E5
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A8281947
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 18:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A8281947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oO4SSAfidJJu for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 18:02:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5282B8194A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5282B8194A
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 18:02:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s14so832536wru.10
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 10:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4kqe+tLjm+uAKqch0Cechd31EJVndDDWd6aHjMjZQY=;
 b=8H5By34WG/sD31YlLvDnj0pZrNlI1jMnSItIw3f2GY2jB4z3PlRsAyiXSdB5JxvHf5
 uj+imhAi3lRv/F5q5YybzGfal9FlObZz+9uJrGKqSMsWjFtkgHYIy5YjzeqzwUn9K0k3
 FMig80X4uxkJjnUmv+CzJI5mAWcZzQjyOHTiIHOSSdBpqb2+W8gKwqivEXn6j55ATGri
 h82izEuKj1Uak+gIFXnSOxo6euVbJ3Vr5T1AMuks6kUUQhbNIwrc4HXNQP7kMl5V0lRJ
 FmSkYIWSFCG2CA6al+yRVQTAghW3MTbW5FLWVoviIy0AsiEKHkOnA3GoF2rP7x+xDq1Z
 EzWQ==
X-Gm-Message-State: AO0yUKUIskp/nyk0YDdfAFMFb9YzOVgKz8F/ksWI70C3rruD11NsmsHJ
 ycWZkM4YuQ32ev3ZaCszCWQ0dXjkG8A=
X-Google-Smtp-Source: AK7set8oDtYUyhsIjeckpsTPYUIVAu7kBbkttjhBZRXjah91GH22RxDWV39AI2q2qQyGXMxyk+hJew==
X-Received: by 2002:a5d:6386:0:b0:2c5:6173:72a9 with SMTP id
 p6-20020a5d6386000000b002c5617372a9mr2564942wru.24.1676743343220; 
 Sat, 18 Feb 2023 10:02:23 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g18-20020adff3d2000000b002c569acab1esm7393745wrp.73.2023.02.18.10.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 10:02:22 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 19:02:15 +0100
Message-Id: <20230218180215.1077049-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4kqe+tLjm+uAKqch0Cechd31EJVndDDWd6aHjMjZQY=;
 b=DW3Hd6VLpLWDHnVtLd7dDWU4xnJ5SHOffMnmB/TMWpmhX2BM42nwBjiVWIBuZtUDup
 /RSF91801M6c7XSgWtzP677whalxu/OQ5KRSImaQ2ERdWQnlEY/vsb+Sc28B1XHY72BD
 OPcDiW9ZH4HRd7befyxpuWmO5wRsss1k+Vjkd1OCtNUj/S4Sp32gI8LajCdOX740uaON
 hQlDZI62/hqc8d12DF7RD9M3944r196LcFLULY/rjzW4WAQdV4nGDikCi8NpmmPLfeCz
 z9mqK5KhSv7Fpo0q1knNwSJQyF0TT/+3DosWgqtb1VQDgvOSpETzgiZrqpuEK7Wpjziv
 k1sA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DW3Hd6VL
Subject: [Buildroot] [PATCH] package/poke: bump to version 3.0
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See:
http://www.jemarch.net/poke-3.0-relnotes.html

Build tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/782116399

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
test-pkg config:
 BR2_PACKAGE_POKE=y
---
 package/poke/poke.hash | 2 +-
 package/poke/poke.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poke/poke.hash b/package/poke/poke.hash
index 09dc4e8972..e6e436570c 100644
--- a/package/poke/poke.hash
+++ b/package/poke/poke.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  841e285917c6738ce982a6930e30ebeadecfb0655a79d9184f16f876a9fe6e47  poke-2.4.tar.gz
+sha256  79a9b2f33c9f8c327c499afadaeeabfeecf6ad4988924d2c6c6f317e50317add  poke-3.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index d49e628dbf..4a6ff344b2 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POKE_VERSION = 2.4
+POKE_VERSION = 3.0
 POKE_SITE = $(BR2_GNU_MIRROR)/poke
 # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
 POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
