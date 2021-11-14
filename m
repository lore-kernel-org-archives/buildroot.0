Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEBBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 23:25:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD54D61183
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 23:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD54D61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6994023F;
	Sun, 14 Nov 2021 23:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwuKq3zSRrWC; Sun, 14 Nov 2021 23:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6EBC4023D;
	Sun, 14 Nov 2021 23:25:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC0E91BF5A8
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 23:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8BF880D2D
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 23:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zJTGxjE4KhG for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 23:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 398EF80D2C
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 23:25:37 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id t13so31041210uad.9
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 15:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EWcRcdenYfFncH/2IrYMw6PQnjQiGUMbez2cSYhzxUs=;
 b=kSY8jlXIiMrKgyP241HJp3owtucCcqZNdaIVZEVMv3o9dHuZPHr4wZWXfLaFOqtkVA
 0yPuh/AA9ZIN8TEUmMplK2nxVARtZoDmVTq46BPSa6bGv/tjwg7vxpz+4pTqT2YsSx2K
 21sD+Fuh3t0QJzLV+TXE86YRaBbbsNKme6YPIXr8hWPkHZ5ZxblrYe2h+AFGFTb2xEMZ
 JBx8RNuczpZN6ibP/5Gz6g73GcQjywUniKO0jr+l6M8NY9MNcJCznGF/4U59TGxupdE6
 6sdyipji3I+dpFqtfLK30Yz6t/AwbtnifjJNoHNabSZs0mN1xGQWnP6pwR1oo4C5jeb2
 jH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EWcRcdenYfFncH/2IrYMw6PQnjQiGUMbez2cSYhzxUs=;
 b=qqzqT1Q8quhbrLspa9GjlXk+T3UmjycnXXtnPmKkS8ifNAfLoygCSPpSUpcylI5EQN
 onTyqOcFVzxw4uIjpH6Bir2VrI0etZ27IOhl6i1x1z9q/qoM9blHV5gFPvTEj5khQctP
 LgmQBbKfIqz3skIqkIWhFqJVrPE8vowhiTDI1EGj51O0A2IT6jf7M63bany7hVU7B8Mx
 EDq8xZftSfTOrd51Gc9eJcCldvQYmsU8RttduOAM2UWN0gm4u8Y91q5Kopgayhy50xwL
 x/lEDID8joNVBQMarLVo2qcSbqGV36pcfn0Ac7UCAol3gxtkXbbraxovpFfTdTq5UI15
 +iPw==
X-Gm-Message-State: AOAM531sgV45y0nxfoDY2oX2PImSMluhOiRjVYa5IZmpmNqhVXDG46U5
 1LC6gyQd0k8N8EZZyieBUK3QzvZZSx4=
X-Google-Smtp-Source: ABdhPJzOmRlP/MqTF+oXyCj82xV5Z0eIr8CJdEbWoZc1JKlUcH1tfptTxYKl7GRhlC1WUkhv+bExvw==
X-Received: by 2002:a67:c181:: with SMTP id h1mr36341328vsj.3.1636932336119;
 Sun, 14 Nov 2021 15:25:36 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id c2sm9646517uab.11.2021.11.14.15.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 15:25:35 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 20:25:25 -0300
Message-Id: <20211114232525.691816-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/atop: ignore already fixed CVE-2011-3618
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://security-tracker.debian.org/tracker/CVE-2011-3618

The patch used by debian
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=622794
has equivalent code merged in upstream:

rawlog.c, changed in 2012, release v2.1
https://github.com/Atoptool/atop/commit/7c17a309ef97a59a8ee1f5a593f48eeac9d46bc8

acctproc.c, changed in 2016, release v2.3.0
https://github.com/Atoptool/atop/commit/2820b1144ce403c7917cd2e09b05e78d2c9dbc07

So ignore the wrong CVE report.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/atop/atop.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 88f292b6b3..8369f639c3 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -11,6 +11,11 @@ ATOP_LICENSE_FILES = COPYING
 ATOP_CPE_ID_VENDOR = atop_project
 ATOP_DEPENDENCIES = ncurses zlib
 
+# Equivalent code for the debian patch was merged in upstream in commits
+# 7c17a309ef97a59a8ee1f5a593f48eeac9d46bc8 (v2.1) and
+# 2820b1144ce403c7917cd2e09b05e78d2c9dbc07 (v2.3.0).
+ATOP_IGNORE_CVES += CVE-2011-3618
+
 ATOP_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
