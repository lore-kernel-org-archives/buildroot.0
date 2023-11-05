Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A84CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 09:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 061DC60FFE;
	Sun,  5 Nov 2023 09:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 061DC60FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYXpXZHf9w3f; Sun,  5 Nov 2023 09:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A2060FF9;
	Sun,  5 Nov 2023 09:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29A2060FF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFDF91BF57F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B92FD81FFA
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92FD81FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYwJJKU9CcwH for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 09:27:15 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D94EE81FF6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 09:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94EE81FF6
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc37fb1310so24307365ad.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699176435; x=1699781235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=prA1vRtEpUSlfGqb2xsM6bnMqNFo+WM7HsmNBPWDLD4=;
 b=liXvfnJTbUwCBGz6dKmo8aOznaQ4wA4G64tVp0L/3gp8mp47UPP2Dc/4V31A5EXES8
 /Wsf+0s5uFMFeal2L0XwrmtHeH5PouLlf7yiP/tqhK8U48D/g+vIX/lNvcgM/33F9WVt
 4Y+rzx3JQYhIyYXRTXgajGoDQXq0CeUuuSNPH76QISZcE1yf8b7YyGHlslVXDXq5VgMT
 8GiRIKJEPUAMxiseGyuKp2nTwjh6GPjsDSHCd5V5TqQvag6foxAmbWsk0ZHLA5xXyMAk
 W+HjcJmt+D8lsUr9XndogE09J/EOjjN/QgPfeE3egOfHg3QBYCQ+WBvRWUbWrGy9hbBg
 fv9A==
X-Gm-Message-State: AOJu0YzzWrD7xWo8pjyTodW4B5LPnYByHCoXAuxnI119j656fMzPos/n
 UvFEslRZGcMNOsfzv5r2YCZBoEqJ+eI=
X-Google-Smtp-Source: AGHT+IEZcChDkB9RLbaDNJVW4kefpVtgvl40TQCP0P0E61+Z2Y51BmKHl3ByRA+l9/LgKX18LQ4eiQ==
X-Received: by 2002:a17:903:245:b0:1c5:d8a3:8789 with SMTP id
 j5-20020a170903024500b001c5d8a38789mr25396162plh.4.1699176434833; 
 Sun, 05 Nov 2023 01:27:14 -0800 (PST)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 be1-20020a170902aa0100b001cc3c521affsm3909706plb.300.2023.11.05.01.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:27:14 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id E237F8A40033; Sun,  5 Nov 2023 16:27:10 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Sun,  5 Nov 2023 16:26:55 +0700
Message-ID: <20231105092654.33598-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=bagasdotme@gmail.com;
 h=from:subject; bh=RcOMrKrFvjMqarGowGLefn7Q4FQTagody4HtAtPpe9Y=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhlT3+HufLt4LfPFg1dS0TcV33yzdpphzIOw/++/Z4SZW5
 jcWnfq5qKOUhUGMi0FWTJEleq3sLmPevZfMYhKKYOawMoEMYeDiFICJWFxj+F8WPUH2IAPb3u9L
 16dJXF2jULEyN6zr/XnO7Bmr3LkcRfsZ/ueHSDoET/j4u8ogatov4ar124KTfb40zw+UXTRJKUD
 InQsA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699176435; x=1699781235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=prA1vRtEpUSlfGqb2xsM6bnMqNFo+WM7HsmNBPWDLD4=;
 b=jzw097aBTfDci1WPgkfr/Kp1HVWbNF3ci6pXB2fsxCxE+Cr/f92ohvZ8zDJgpOhghQ
 k9EAI2hetQ4w+DDFBPDA6Mz8G5FgsltgIrRnAdbrMBz/65is8ofjUEydROmOkewtfZNA
 vH/7cfV08H3x3MCTr07675n19stOPmeDAVdwoGxYan+BV+c893C+hZW1ryWqT5ONKt8n
 j5noPYRKF8p7hg5187LscOtehxBp7+ockmqP4glRJTQmwhvxMn9MBoFRuCvk+ZpuCsZ0
 NYkUF8jtTJU489DHI3TvUwsN5NiR+2u+jDM7jFYfO7KaaqN/XjC1kWP/kPSY0QZap13G
 xMNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jzw097aB
Subject: [Buildroot] [PATCH] package/git: bump to version 2.42.1
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fix release bump. For the full release notes, see [1].

Link: https://lore.kernel.org/git/xmqq4ji4m50l.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index d73778ad85..f3f5915c8d 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  3278210e9fd2994b8484dd7e3ddd9ea8b940ef52170cdb606daa94d887c93b0d  git-2.42.0.tar.xz
+sha256  8e46fa96bf35a65625d85fde50391e39bc0620d1bb39afb70b96c4a237a1a4f7  git-2.42.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 853ec256a0..cb49986c43 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.42.0
+GIT_VERSION = 2.42.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: f1a47904b635c3c4c3b5656e58c0c575c1674993
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
