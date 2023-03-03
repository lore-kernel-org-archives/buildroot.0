Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D747C678D4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 07:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020FE41A62;
	Fri,  3 Mar 2023 07:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020FE41A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHCNp6sljq8T; Fri,  3 Mar 2023 07:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE3341B3B;
	Fri,  3 Mar 2023 07:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE3341B3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 046E91BF3FC
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D37F680E64
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D37F680E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 282WDDmI3i6B for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 07:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B7580E53
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16B7580E53
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:48:34 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id p6so1944268plf.0
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neM4FagnOgoeSxNa9ehrLwrbrd0Nj8jKs3kPRGRbtl4=;
 b=MnHV2Z0onNaYFesCi3GElQNtcwJLk/pnc3Wj3yaF8Dnmdk4jIusoEnbwzBCOq7ANay
 imh/0TG7I4KFQJscIC2ad9bYge8kFRiMMhyJrcny9kBkE0mALSxFUgeVkU35H8vHsDj0
 xB28L1M42PiSdgLO4W8c8DjMMiAX/6SlEVLLs/Nb0YBMF71rTI9jZdWcZ4iyfOxXhZC3
 435gBR6HQpySKmHHqaRpeDHnAZIKCGInizt8W9cTumuTVBkddzYVJsTOAw0gA6SmrDCg
 +vWbn1dTnvfoFM0MtcowlRwwsZOSuPYgx4/ROM3LkAr27z1bddCBxh6Y5SK7qpa3+L5Y
 ID0A==
X-Gm-Message-State: AO0yUKURah0DUqHS5F/HHivhC3IvBQWPw9j84bEhBVyNs9510k375Cp5
 ILfq/dgw7/CAhalZ0wNuZvnSP2oGV+XZsfAs
X-Google-Smtp-Source: AK7set8ZbMGlXT+ZcZoELxizqQw6B6DwgRjBFhRwzOYGkGfp30pIdIJii2k0/naAM/I8KyVvr1B5Aw==
X-Received: by 2002:a05:6a20:3d0c:b0:bc:f45f:ecf7 with SMTP id
 y12-20020a056a203d0c00b000bcf45fecf7mr1699221pzi.2.1677829712918; 
 Thu, 02 Mar 2023 23:48:32 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j19-20020aa783d3000000b0058bf2ae9694sm909544pfn.156.2023.03.02.23.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 23:48:32 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 23:48:29 -0800
Message-Id: <20230303074829.2139881-1-christian@paral.in>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821cu: switch to version
 20210916
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The author of the 8821cu repository has requested that we switch to a newer
major version of the driver located at 8821cu-20210916:

https://github.com/morrownr/8821cu-20210118/pull/93#issuecomment-1452675897

Switch to that new repository.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index efb9871472..543cb2b057 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09b9fb4160003502d564d0d0d85d6f19b8b6d1627d1a339b3ddfca6a948d84fb  rtl8821cu-86cc5ceb7c28b9b997838e1c796847f6c395c382.tar.gz
+sha256  501ec3d653def7786fcd6d05643e6be26455a882e6721d2ef6055330435ddb04  rtl8821cu-66ef382e8edd498e1fe60213ca87a90a5fd87399.tar.gz
 sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 97f50d9633..5ee747013e 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
-RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
+RTL8821CU_VERSION = 66ef382e8edd498e1fe60213ca87a90a5fd87399
+RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
