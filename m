Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29765C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A9160F28;
	Thu, 27 Jul 2023 17:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A9160F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWJIOwoD6VZL; Thu, 27 Jul 2023 17:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA9BA60EF4;
	Thu, 27 Jul 2023 17:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA9BA60EF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB1921BF3D6
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 17:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2F5C40385
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 17:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2F5C40385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TyeO5IAb3aN for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 17:51:43 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB9F940347
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 17:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB9F940347
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-348f5193c12so3355555ab.2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690480301; x=1691085101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMu0HvA19LCfN4nNRdiXixrCyY0875yjK8ef9E1jJ7M=;
 b=ZDNRuoqvG6Om6Pr3lH5tJjSuf4fXwh2ytgQfEzc/AmsTU7dTLHaTV0h7R/k/5dnG91
 BPL8Dj7wp+bZtDXnhmQPlKuOy9hQ5qhRq84eDBctTHs430Rlv2bS+eFcxA1QqnVp23pr
 7fLdZVCeXi9rzrIaXHzdJKp6MnAuTnCFwfuqaoP9VCUqdWVPOS5RJUAmtzweKNqoztRR
 nNVXn5SnBo9CMKkLZ1y6MbK+M8VMm8Z6VE1RvJjk7/gjDe9SJyRBaQ1e4yiqrztqQIQ9
 U8F8X7hd4XhFIWx0DszTRzClM+2aGpKrjf/biUYwLygCE2pwXA4GiSAU/WXH6lmtKNcQ
 9tZg==
X-Gm-Message-State: ABy/qLZygePuHPux7WqMpt6g06XmSZhETBTmBiAQ6oF2fdzwYl3Cv2Zb
 lAKLwA7he6AvWQLXMhdzvGn9hnW1zpY=
X-Google-Smtp-Source: APBJJlH+i6ELAGwWwutwYN8JcnE5kiDTllUoXEUemvQ9BNLsD3JxhjS2G2fO5ML9L3KWC29odhuIzg==
X-Received: by 2002:a05:6e02:1190:b0:345:cf9f:abbc with SMTP id
 y16-20020a056e02119000b00345cf9fabbcmr167615ili.7.1690480301091; 
 Thu, 27 Jul 2023 10:51:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 s18-20020a02cf32000000b004290f6c15bfsm557893jar.145.2023.07.27.10.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 10:51:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 11:51:30 -0600
Message-Id: <20230727175130.2076044-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690480301; x=1691085101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JMu0HvA19LCfN4nNRdiXixrCyY0875yjK8ef9E1jJ7M=;
 b=d5+U5ciaZIwZ2CMX8+IBUFeHTjmsjBCbCQFf6Ov4Oc8Yqk3pWFMXr5hetprXFvOCiC
 dOMf5VA3ZIUfvmsgo6hkVdIhvpuezbaU+YbxEgL/O4yia4KbDS9rzAfBHM3odH7f0oVW
 etti7vNj2I0xiqzY/01yy/1LkS9gpeRUOxH8r0/TMI3RuqnJbzbwBR4zLUuNsqg2Y+nI
 V4PF5GSDsGZyT7Jo5wUi0JPOlN1ZGjcDMWlff4KXO1rf7eYDd8vHpR0sZu2+0uDNcrkW
 MxZGk2jt1EWPCmJj5i+PFDqqTc1lYZJoCO55TlvLka4w6vCIyQyHGOfQENo7l3I1H1Jk
 RYSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=d5+U5cia
Subject: [Buildroot] [PATCH 1/1] package/seatd: fix seatd group name
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The seatd service was changed to use the "seat" group in version 0.6.0:
https://git.sr.ht/~kennylevinsen/seatd/commit/5535c2c3b19b42ebfe4c451600059e9418e401a6

In buildroot we updated seatd past version 0.6.0 in commit:
c54f85ca0d2ba7b73c899a27e62c67d3389617b8

However we forgot to fix the group name when doing so.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/seatd/seatd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 96caf63b30..dbe9ac3154 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -33,7 +33,7 @@ ifeq ($(BR2_PACKAGE_SEATD_DAEMON),y)
 SEATD_CONF_OPTS += -Dlibseat-seatd=enabled -Dserver=enabled
 
 define SEATD_USERS
-	- - video -1 - - - - -
+	- - seat -1 - - - - -
 endef
 
 define SEATD_INSTALL_INIT_SYSV
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
