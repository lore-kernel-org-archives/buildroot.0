Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299C6C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 17:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90A3B40182;
	Tue, 26 Dec 2023 17:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90A3B40182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_0Ue_A-CNPx; Tue, 26 Dec 2023 17:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9077F40930;
	Tue, 26 Dec 2023 17:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9077F40930
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 779D21BF3E1
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C82E402DE
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C82E402DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNmUo46sO1P2 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 17:33:54 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30052402BA
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 17:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30052402BA
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3368ac0f74dso3913965f8f.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 09:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703612031; x=1704216831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hDpCdAUJHqZORtK31GlTi6xW0n+l/P226BcVejwWr+Q=;
 b=sI1TAwD2o2anozV5lALVsUO4AgFXp5Va+aIVLA7eNCkv94Tf1TeA66oEzj9ioBB9ZQ
 KYB02iPHhfim2ZHjDNKmuxrmarzkoohIwly/eg4cheR8PW0qlQv6WRB0PoWYB5ZJI3VG
 RhKrxL1j3k5WTDpwkrIq0VJMZXlRBNi3Ru5cufARZC9IZVffVNajgeoZKMz2zpHx68Yo
 Iz6jta/vz3V3gXfkBnpKqVlRun3T8XYtgTiZLi3IIbktbSzVTQ+a8o30PFnmJxEcgBLS
 Woala7n+usbieJQo1fIQbVOyS1FjOP95uGu5r9i41vXn2nfCjdudSj+Qpuv06WTI4FkP
 rHKA==
X-Gm-Message-State: AOJu0Yy1uHVHry4uk+zCDPrCZGF/sLBuFT35PO5yCD/uanLFR+7G75By
 lziDrkbfdJ/7p/o/gIsiAsMFP/YHcYI=
X-Google-Smtp-Source: AGHT+IEjmjaqgHAkxWTr3YIbF6TTfOj4ZBeF7F8TOPy+GRP0e/bAtXz9rv69EGz09ZAH+/RrpJo4/g==
X-Received: by 2002:a5d:6b88:0:b0:336:7045:6918 with SMTP id
 n8-20020a5d6b88000000b0033670456918mr4301717wrx.134.1703612030939; 
 Tue, 26 Dec 2023 09:33:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c10-20020adffb0a000000b00336d21e40f7sm3006880wrr.103.2023.12.26.09.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 09:33:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 18:33:49 +0100
Message-ID: <20231226173349.941794-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703612031; x=1704216831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hDpCdAUJHqZORtK31GlTi6xW0n+l/P226BcVejwWr+Q=;
 b=cbPwvCj2BuWG5+c4OsqUGFTUZrXme3VWXmNcPsWG7hHJq9OgHr81C+Jef5MTqbDAsE
 qfb+T5WJtmw2SQ84wqKbnY/6gJClmfS6SVjTMnMXVDOBynjhNm2fQvPu60QIjriaJAQ5
 2bzB82qM42FhPvqntUmhdwP+r8UyAmH3xy4NW5BJAaL5W3C8hne4WBrOVCrwo5HG26Fu
 zybykylHUYmHlFcrvxlwqTeSyYo3516EEWFOiRnuvDunwWBeOHisINqKGrJGNbGf/2SB
 HGtEL/HIxofF19Kk+bt6RGoFNW0jOJcT4zUX7T8Ne2HOTEV60RkltFKZwwZOFyOC8oDE
 /Liw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cbPwvCj2
Subject: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to
 version 3.5.1
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

Fix potential NULL deference errors.

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.1
https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index 6f7064c6eb..c3e6ebefe5 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  418c7d87e8359355d150bdde6784612cd2ebd48ec87765852169e289d9de67e6  ksmbd-tools-3.4.9.tar.gz
+sha256  ab377b3044c48382303f3f7ec95f2e1a17592c774d70b2a11f32952099dbb214  ksmbd-tools-3.5.1.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index c758c17bf2..c56c6e10bb 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.9
+KSMBD_TOOLS_VERSION = 3.5.1
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
