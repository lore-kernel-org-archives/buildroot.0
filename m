Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15147C07545
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 18:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0D641737;
	Wed, 25 Oct 2023 18:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D0D641737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id se41KaZtdl9V; Wed, 25 Oct 2023 18:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA9241735;
	Wed, 25 Oct 2023 18:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA9241735
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC2C11BF3DC
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 18:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4F1541735
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 18:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F1541735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08xqzwJmxJr2 for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 18:18:07 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BDC241733
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 18:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BDC241733
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5b8c39a2dceso60822a12.2
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 11:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698257886; x=1698862686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BGrgW8BVPMdOyzfBolznh+HJ5LAB/HsH7bpUOlzASNY=;
 b=VNSDVVJvKW9LZoKjd1RMoPpE1Ofa57saycQ9TIFwm+y/wAmm3aWPEj5ZZsZwoxHOE8
 MN+6WQFQQTJRrHhpOG0G+662ts2FQDr7ZbLGmqBk0YIGqC6LRQ/r0Ris/BFQKj9ktxsc
 DUieA1+QgODo6w24+r3Snef/waOnMc/c1snMt10eBEf5oQm8s5xE9rT7yDQ5Fux8YZb6
 pSgQSD7hvrbF0slRq0QmKIO/g8046ed98DI1qqt8KljYVVfCQ7nEGe03YqAYxvMuGEcM
 tUdbvKjhjNJQCwPyxf+Xi8I5RLm80tr3/HiYxtYoKtHZpNpN/75+yVeKQX2NSlATds1S
 dYcQ==
X-Gm-Message-State: AOJu0Yz8e2fjXU0tAptqXpqIHtJzLaj8fwWBl8GHxL1knXg3Q8GK6kpV
 liZkidRQeNVCq+Xestx0OpeZa1aqZDNZsAZFoGfNdZz4
X-Google-Smtp-Source: AGHT+IFwAgBesWQ/1RGj83WSP3kMLaC8YiKVFAULQkGzUjdqLRmY6iZEhv+DL9pWdIBVoCH+35+KoQ==
X-Received: by 2002:a17:90b:4f46:b0:27d:6dd:fb7e with SMTP id
 pj6-20020a17090b4f4600b0027d06ddfb7emr13956447pjb.17.1698257886168; 
 Wed, 25 Oct 2023 11:18:06 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 30-20020a17090a01de00b002794fe14cabsm226194pjd.12.2023.10.25.11.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 11:18:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 11:18:03 -0700
Message-ID: <20231025181803.40457-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1698257886; x=1698862686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BGrgW8BVPMdOyzfBolznh+HJ5LAB/HsH7bpUOlzASNY=;
 b=EhaDmi+0K9F6BPZ0wCkMrUKlzmGYBl/8gTOgH0BxI7SrhBOSZKdDeMpH8UJr5e2XY4
 Axgazt7Nals6pY8zo/7ItlJO0ioXKdkorJmUDuAqM3UfGoCk86M+TG7uFaLDMAu2UHZO
 ZmhIvBKTYx9fc3DNPWvjldcGgv7lUsXSNLWK9mfX0iSfzTT7ez5iPh7KaWpqC810WD30
 Pee/D0ICJq+gQi8ImajT/G/pIdFYlxWErOwbattBSBrLB7LrcUPNSpthjSbmfeGECX6j
 UaNPlcpFAajZzqMQuumAIeNO//VX3SXUgJHThwiJDyIh/yxFbNYjFrxIPsp9zf14u+Pn
 YgzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=EhaDmi+0
Subject: [Buildroot] [PATCH v1 1/1] package/runc: bump version to v1.1.9
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Stefan Agner <stefan@agner.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfixes and riscv64 support.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 1a68b74ccb..5ffd21a5dd 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f1885d6dfa188f8112328ac2355e5d67346174a2e2e795ec514a972bcbfcc2fa  runc-1.1.7.tar.gz
+sha256  509993674481aad7e14aedfb280e0eb160f3a34c0b77e2e98c4b3c0b1df76894  runc-1.1.9.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 805ff23964..62e117685a 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.7
+RUNC_VERSION = 1.1.9
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
