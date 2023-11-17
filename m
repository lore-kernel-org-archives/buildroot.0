Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED7C072A2
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 18:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9936141BAD;
	Fri, 17 Nov 2023 18:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9936141BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIj-nDPn1UNA; Fri, 17 Nov 2023 18:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E351941B4C;
	Fri, 17 Nov 2023 18:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E351941B4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46A0F1BF2F2
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 18:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 202BE41B4C
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 18:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202BE41B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fm4G_q3-0UK2 for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 18:47:46 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1842B41B3F
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 18:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1842B41B3F
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9d216597f64so319104366b.3
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 10:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700246863; x=1700851663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Etf0C7jZLAVuXG2uMChXmNWhvJ/pk+XRkeb+5Zh9pkA=;
 b=TQC4XqdaAzzXXlsN9aAB29ZB/f7KXVimI8zF+GwroK9OEOT+QTMzfxGQ7IVbtvoZ3L
 zEGjoI48cmyinYBZB8ZCae+BG54ypWSqr5oUOFt4Z0uY8uvJppRcCLa9UiLwiIwWNWYu
 y8ilW9RE4ZMuuQ0SMHI8kX7vRyONJqvYvW+Bq12gOyJEZ7JAKIVL/gjvdIU16np3In/m
 9x6qje7Aes7ARncr40TGNqocjUoI8NwBmzIDx/6P3ESjmaet4IvTolOJPCs3crLDHri+
 bYPOzYs6t0K8bdw1Pp1npBaIppYh4DJ1/M+MkZFyqpILBH/m/W41jmJK3gBzgjLANxKi
 j15g==
X-Gm-Message-State: AOJu0YwUmPFNFPToCj7gTF5U6RudLfpH05jB7y1a1xSZIdTAWGGwdj92
 071zBKy9ndzACehSNfaSf52rh3J5C88=
X-Google-Smtp-Source: AGHT+IF+KFFwWE2TLuCzkCeqcbp/q0n3buNMFwJ6xkTzQJPN9wQEerAYiP7G9skE5DjcCYDY6NF0Xg==
X-Received: by 2002:a17:906:3c0f:b0:9c5:844f:a7f4 with SMTP id
 h15-20020a1709063c0f00b009c5844fa7f4mr24580ejg.35.1700246863161; 
 Fri, 17 Nov 2023 10:47:43 -0800 (PST)
Received: from localhost.localdomain
 (2a02-a46f-1ab1-1-21e7-4eef-92d7-2f2.fixed6.kpn.net.
 [2a02:a46f:1ab1:1:21e7:4eef:92d7:2f2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906230d00b0099e12a49c8fsm1060603eja.173.2023.11.17.10.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 10:47:42 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 19:47:34 +0100
Message-Id: <20231117184734.139978-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700246863; x=1700851663; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Etf0C7jZLAVuXG2uMChXmNWhvJ/pk+XRkeb+5Zh9pkA=;
 b=a7J1QlXvyEJmu8y6gQ3cqc0SUqlgsqHLkEWta02BM95XjhSYo5/+DesOBBOvob/UME
 M6kpmGhNaauogcmJm/qKveo1Xrvm1pH3vbaoUxcf4bjJLZaeJt/OXUMY9WpD1NEj3vNO
 9Ywt9mDhD+TpH+u/1TYVm/MpPSo1CZrX9etwikSpHGxr1LX98EvBq24XVpoAOIaQxpE3
 7I+BAt4QDg4HmWJXhXCQqaRdniCZJD1fqZdVdsUc3bhYgAP1H3gI2FB/hSx2hlu0posZ
 YESz5EJwtgGPRhTWeXAg0pE8uMWBI6rJpyIVAFIStkXGsuZlqPCiTgT5gHRqZ9ihVzO1
 WcLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a7J1QlXv
Subject: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.3
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
https://github.com/dalance/procs/releases/tag/v0.14.3

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/procs/procs.hash | 2 +-
 package/procs/procs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 1c2fb5c3d5..19832e3897 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  643b7ba4b769ee9f336d441ecdac779c3d52e5719a15c14bb0acb3609ce1cd99  procs-0.14.0.tar.gz
+sha256  2f9fdbcf7324952e22565ded58148fa40387b5a5f8723996620d6c4588925713  procs-0.14.3.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
index a074ee1311..8567bf3da3 100644
--- a/package/procs/procs.mk
+++ b/package/procs/procs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCS_VERSION = 0.14.0
+PROCS_VERSION = 0.14.3
 PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
 PROCS_LICENSE = MIT
 PROCS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
