Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41E3C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 20:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8040B40895;
	Mon, 21 Apr 2025 20:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umJT02WJBjT7; Mon, 21 Apr 2025 20:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3160405DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3160405DB;
	Mon, 21 Apr 2025 20:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 723DF68
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 581E9405DB
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gU_BdA4KfALw for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 20:31:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A4C84054C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4C84054C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A4C84054C
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:31:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so30434565e9.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745267480; x=1745872280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eAwj1SkALLy0eLmLzzLBgQv//EiII8xwxZF2pkY8EhA=;
 b=L2A417whfBr3B4MgUV+Uzvyp1X9yJ7qLGRTPCyEc/j6ljNxZupfHmcAfpomcX2VBEi
 OfCuMYGUqV9ZrW6Pj0nOC/sfb4XDwEmREwJk4WoxDwarLiZW9WfZHAZ7YyaLk3kVa6/C
 TDrprVUUiYSzVCoLvJcIvwmxkk96Cg8cpopMzEWkiToC1K4IxW7Y+c/PqOguYuDkA3xN
 WSrrGLTKPC+xLTFJDEkOiR0KZxlTuqi5i4GNeqWbEQLe/3uesZOaW323Fk8a60bT/n7e
 hsG+PcUwgRy9qEAXvsoifWdmm99Wx638sOA0AiWaiPQx7iqB+K4s3WC+u0VOlcRalXeI
 drSA==
X-Gm-Message-State: AOJu0Yzsx6mgffXj+gefvG6VIHUNc5KmIDFXV0NdaJzXv0bbbTkbGCVO
 pKsnwyIeTpwMFxG7EvLydisBWutbA2TyykXU2oGcA/VzPP814yPgavgHJw==
X-Gm-Gg: ASbGncs+U3lIojJN5WRAb07wBb2JQ47kOCTfyhtcwBUGRs6WLpegsHWKuwis1H9NvYA
 CXIhpM8b0M1aQSmbsPn/6jBls3YUaVfZgVbJB9fO972Q821cf3MrHPNoQgLT3U18/iBZxUNoXlG
 BssAmiQlgdRxz4ejk5T8TL6QlDztXnZIyNtLrD+ZbYRmJ4PuUvV/uR3taTqu5zU2PhYynGHtWaA
 rDpOeEG0xFooLRHhL1RmM2zTCjN8QYuxQDv9szdqBlQ4NOMAhrP75ID3/9S1+J3RzBKUeWk2lTX
 0PO2pYojC5A93xr3LRdFaUlGEJ1mfVWwcM4F2kVK8LNzKfostcLkeZ4Q8DBidjsuT0g=
X-Google-Smtp-Source: AGHT+IEZWNUianPCiGvOBb9jUzx0OOuNkEIEfZoY//zpZQ6VtYubKlcsfOyiNQjYhiiFNFnGHgNCfA==
X-Received: by 2002:a05:600c:a02:b0:439:9434:4f3b with SMTP id
 5b1f17b1804b1-4406b230453mr99015165e9.8.1745267480391; 
 Mon, 21 Apr 2025 13:31:20 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa493124sm12984266f8f.68.2025.04.21.13.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 13:31:20 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 22:31:06 +0200
Message-ID: <20250421203110.896967-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745267480; x=1745872280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eAwj1SkALLy0eLmLzzLBgQv//EiII8xwxZF2pkY8EhA=;
 b=gYCVUgK/IuP49aTXeRCj+7ALqWlAOLLpy8JU4ctIiEQkcJKW5oBh5M0Oiv+ZvDJK6g
 mZWqmv9ZNv0r36v8DjrNHVwzl7ZGGfPteeXnaFldbFGJoYCHdWD5p44oKoNbqaHjWanR
 PjNEM9FyhIVo6I80Hh+1uy+qekR37/PPnExmeZ1KBBId6mED4ZckEivu8l+64UXuRo2G
 W5WHK/4eeUbUjA4IVkROaHj/mdlZuu9Sb2Wgae3eNkFVTUJtzdre+54emGkeUjmlAqW0
 dndo1ddh4f+oNsD3q1MIKCLJsnb3cOnk5VC8Y7ETJRNOWrpw8RHTJAI6lvzA0BwgqH7j
 7n7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gYCVUgK/
Subject: [Buildroot] [PATCH v2, 1/2] package/iproute2: bump to version 6.14.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Fixed commit message (I'm sorry for the noise).

Build tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK


 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index fad4debeab..d64ff918c6 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  a43aa43338d882b44d01e549f3f105a92ae9feea32a82fae45a88e7a49302819  iproute2-6.13.0.tar.xz
+sha256  a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f  iproute2-6.14.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 016b235469..3faa2235b8 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.13.0
+IPROUTE2_VERSION = 6.14.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
