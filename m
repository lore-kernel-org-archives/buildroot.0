Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8F3C54FB9
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 18:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1F442114;
	Fri, 17 Nov 2023 18:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D1F442114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEG51AWNEPhw; Fri, 17 Nov 2023 18:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC4CC41F97;
	Fri, 17 Nov 2023 18:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC4CC41F97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A260C1BF2F2
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 18:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84D9D41174
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 18:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84D9D41174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z90p4H8q4SOY for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 18:32:30 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45175402E6
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 18:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45175402E6
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so3325556a12.1
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 10:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700245947; x=1700850747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WfxIfl1TH22du0bXfRiFLXyts6aVUMyTk3GN9EDRETQ=;
 b=uNt1CsRTtbhtaSSfKQUJ0QnnbiMUIzUipoer7yyNfmpySNhhBA6oZEaTqn3Sd5Fx1J
 4CPEHaENkx20NQjqUG1wQ5A0qvZtX43KccOQnIlUyRHyty2P8iuo+nBtdXqMsdVRnK3W
 TulPDwYoPHG67XxZwX3zZpqtJGVkPcbSpqGn/TyYCEbzfcXq07f/BVBf/TYyHexv2XFQ
 z3NdysNJPsaHHvNgfJVypnbcazw8EcZ/qa53b/RT0FRWPnNxAHsDfIPaM6GJLCsAU/Ck
 Ql74Li2L2vnSMdyc4R59VzVbMhodzA5gc8VwBMdvRxPvqiowwvoKiJ9r79eJNXiubhoI
 ZADQ==
X-Gm-Message-State: AOJu0YwV8Kh5efoff69hGzeMe+Xzvgk4aghJ0MokrkOfxcnlZg5fBP5s
 ut2pJtq1vXui/agHixANBqdHXA6XnNc=
X-Google-Smtp-Source: AGHT+IH7OhNN7y1E9kRpRXpuF3D2Q7YPI+ApqrYBtLPTCJcwe8+xKtOH54xJDHiC6NbvXNaPXTrnKg==
X-Received: by 2002:aa7:dbda:0:b0:53e:3b8f:8ce1 with SMTP id
 v26-20020aa7dbda000000b0053e3b8f8ce1mr15399416edt.23.1700245947261; 
 Fri, 17 Nov 2023 10:32:27 -0800 (PST)
Received: from localhost.localdomain
 (2a02-a46f-1ab1-1-21e7-4eef-92d7-2f2.fixed6.kpn.net.
 [2a02:a46f:1ab1:1:21e7:4eef:92d7:2f2])
 by smtp.gmail.com with ESMTPSA id
 d18-20020aa7d5d2000000b0054554a7bbedsm974267eds.24.2023.11.17.10.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 10:32:26 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 19:32:16 +0100
Message-Id: <20231117183216.79668-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700245947; x=1700850747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WfxIfl1TH22du0bXfRiFLXyts6aVUMyTk3GN9EDRETQ=;
 b=mU5DnTw4l6PsKOsvg9mZ3PhOkx5TDf2/iS1c3FCNwgbC40iWduqo4p69/KPylYcsSq
 Yt6j6W52ETAZojyJdlTEarQkxAMxx2SY2XEgr4xt2chfeiEHcHT0V3L+mgmEXlY+CcL7
 /nVQVMEFZE+xZEvKt6yygF/qAiOxxH6670QWzu7yXkiBU2bsWT19VuWG4YxdTtZvNGOi
 V74XRlJ2eg0vbToAntyip5kC1EX7bcd43er+aiyOA602/wWXxQGivYBjpMkVZNyKPGwk
 oiijVQFx3t7SZsXqOEAC9amXHlys4AtDEcAhvkQHmDJ6lwTKWgz0a0chqWwYVPqdi8e5
 Xf7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mU5DnTw4
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.16.0
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.16.0

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 39923ceb48..64f46759d7 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2dac8aa41433eeaa07c4eabdf557b7e134c3fda9ba9edb8ab57959354856e20c  eza-0.14.0.tar.gz
+sha256  11e6127a615744b52d52d66ebcdf9e5366f62746e8123b3eec00e35a057db988  eza-0.16.0.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index a327de0dcc..b11c1a1e7f 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.14.0
+EZA_VERSION = 0.16.0
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
