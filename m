Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A44C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 10:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B1D60AB0;
	Sat, 10 Dec 2022 10:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B1D60AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQLwS-bbU4K8; Sat, 10 Dec 2022 10:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A250607A4;
	Sat, 10 Dec 2022 10:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A250607A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 525A61BF3AA
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E598174D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E598174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kU-fDo_IKHp for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 10:20:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452788174A
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 452788174A
 for <buildroot@busybox.net>; Sat, 10 Dec 2022 10:20:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id co23so7553488wrb.4
 for <buildroot@busybox.net>; Sat, 10 Dec 2022 02:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RiNnABoFvDDIZwNeVBgYt/LuiDbShMW/NHtwKHpaGUY=;
 b=hFf3EDS0dh7Ttr5usX+yjRMCyN3cOe8HhaKPM9Cp63rPNeL9n0vMkP30uqiEG6wUas
 2qWvzEnldjbylLmeeH5qqIchvho1StcDd5Ntzt4zf67H5u2q9aeONZZ1/Wi5VYYG2Ax9
 DQNIHkq9z5PYgJ2OEnbO8IHlSStf1THzAX03PsEQYXXc/iMDXI7rGRr4EfRbKqCC7HYZ
 Ehjn8DRHSUQ4A6aKFH/uxnNy70Txwm6nzlTzIbp8+PEZWs9jv0UXchXYxKlwX6hILuRm
 4+GVyA3j1tWEZ56JjcunRqJJNXzRbaEa0gyFj7GJ8mFceiaDi9+WIKLxCxvjJzViKXFZ
 n/SQ==
X-Gm-Message-State: ANoB5pmBH3LQWCWTpyt3Ru860lRoO6HRnhu5gM4tcei1CEJFUCoOp6vP
 G/W1qtkInfEz1i0c9ce3SfYKFq65q0Y=
X-Google-Smtp-Source: AA0mqf412+TH9n6gyMsgzCVENrEFRo+p3cUjyk6DDTUWtwdYV2wfksfd1Yefsc/HraB0BacmzKbV/Q==
X-Received: by 2002:a5d:5402:0:b0:242:12cf:fba7 with SMTP id
 g2-20020a5d5402000000b0024212cffba7mr5833165wrv.14.1670667630546; 
 Sat, 10 Dec 2022 02:20:30 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d42d0000000b0023659925b2asm3541308wrr.51.2022.12.10.02.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 02:20:29 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 10 Dec 2022 11:20:22 +0100
Message-Id: <20221210102022.3071346-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RiNnABoFvDDIZwNeVBgYt/LuiDbShMW/NHtwKHpaGUY=;
 b=ja/DCsCOdr+yH5PyaMWjMCDQtdWdaiHZfayYDjUte69ptV26CtAEz1xKO0A2X0vAC5
 Guu/MJ9UX4PBCGFKbJGc/H6xjQngh1U4QBPvwB6+bYXRBafJZ5q2w01J7u4QWdij7c6C
 ExH/9Xq0RLBs3KMrwi66hY0v5Wl7C91YnlN7qMOmtEpvou07Jpxbcs0oljZWkTd/oBeQ
 St7x0qu+l8pNlvn0WycuV0I8CMd7WAdoYUS+77WW75aBymromBXmUHe/rhFz/SQkqGve
 HDwHr6NE3CGS4mLlbbwSDFqwi1SZvmHLO7MBQ9PPAWgoOoSscK/7B1XdukjxKlYM0IHT
 Y5Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ja/DCsCO
Subject: [Buildroot] [PATCH] package/autoconf-archive: bump to version
 2022.09.03
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/autoconf-archive/autoconf-archive.hash | 2 +-
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 79ee5ff68..ff7710dc2 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,4 +1,4 @@
 # Computed locally
-sha256  e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd  autoconf-archive-2021.02.19.tar.xz
+sha256  e07454f00d8cae7907bed42d0747798927809947684d94c37207a4d63a32f423  autoconf-archive-2022.09.03.tar.xz
 sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
 sha256  23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index bd4a09d96..0ffdf61dd 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2021.02.19
+AUTOCONF_ARCHIVE_VERSION = 2022.09.03
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
