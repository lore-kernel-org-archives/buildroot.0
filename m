Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844D9C433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC83F82B08;
	Sun,  9 Oct 2022 21:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC83F82B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HYYhiV2MeIO; Sun,  9 Oct 2022 21:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7445B82919;
	Sun,  9 Oct 2022 21:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7445B82919
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD07E1BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86A62416C0
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A62416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXlGsMHOK-KE for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 21:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04782408DA
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04782408DA
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 21:06:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso7457184wmq.4
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 14:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XV+5h7AOcxz1UFNwfuRZLjomdTxrrHljSzvGoQfbopw=;
 b=XPG11+iPgPxHMpRiqXZJ3fxfElfAwfnGTt6FlnPuvif9kyDjkCVPcvyBFQJC+t+sdZ
 Qh1xZyKEGWpJcONQtC7Z3CL4JlN7YVasy7Cl54BDWjs+qwuhSMccvaG3h8rHYSfsk69E
 IGoD4TGh+wE0jgvPkI0jqoDeyfMxFfzY9dvFiTdsn3rw2YKGhV7jq/I8tNcd+VtyjWo3
 L5bjNfFsbfqJR+uaCTIbyxJTIRQI+hGZn3ANTcPY/7EYe5JX9fXDV/uD57bVsF3AWFgt
 U/hQmiu3x1HWISOhIkjLDx+4FVYXCmoDw4hQXdEhlwXcwE+lD/0V+wXZTGuefypO2wlo
 puvw==
X-Gm-Message-State: ACrzQf0LS7zsMGHrTZtvltJnAP5P5SAwDgoivEbTxdULNilFyeM4UAYa
 1h3AFpA8S6K0Z0FxAkf9dJx0dSTagqM=
X-Google-Smtp-Source: AMsMyM72JAaTsCt1N8zGD2N0jyfvXOl0TDvOK5yZ3YKFxTsRcBUdmn35ULMijRQWRn4Bj0mSH/nTaA==
X-Received: by 2002:a05:600c:1f0d:b0:3b4:ba4d:272a with SMTP id
 bd13-20020a05600c1f0d00b003b4ba4d272amr10835329wmb.105.1665349575650; 
 Sun, 09 Oct 2022 14:06:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ba1-20020a0560001c0100b002252884cc91sm7420066wrb.43.2022.10.09.14.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 14:06:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:06:13 +0200
Message-Id: <20221009210613.49541-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XV+5h7AOcxz1UFNwfuRZLjomdTxrrHljSzvGoQfbopw=;
 b=eSf8HBZ6HAQvgyzmnw4WnoVI+Yxwv2HFhmQO6Qn0WlskzUDskZCu5S3sK0pWyeuhXW
 VA6Xf48UNX8VdpV9FrCSjbakd+ZhY5fdMts51sNKwfc7sF7QKcwRNdIgNgKu7nMvbVaI
 iv0fnNMuFgRvOLYw8PZ8HII3KXA5wfBSr6pn7UjY/c4P5wayiaySb7Jz411kPwMgi6ZF
 aDwrTMViJNehlv7/iNqmzxGxmkVnalqynKWmDSft22oYopiRRPMeBoCtj6Gome3vx31Z
 briXEkXVyboY8SN+6ld+3wKQf8oWzMvGwndQ6fLpozm0Gy8S+bX+RR3q8pWHOrSsfQlx
 I5qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eSf8HBZ6
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to version
 9.1p1
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

This release contains fixes for three minor memory safety problems.
None are believed to be exploitable, but we report most memory safety
problems as potential security vulnerabilities out of caution.

 * ssh-keyscan(1): fix a one-byte overflow in SSH- banner processing.
   Reported by Qualys

 * ssh-keygen(1): double free() in error path of file hashing step in
   signing/verify code; GHPR333

 * ssh-keysign(8): double-free in error path introduced in openssh-8.9

https://www.openssh.com/txt/release-9.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 4cfdb91484..81cea32d2c 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.0 (base64 encoded)
-sha256  03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a  openssh-9.0p1.tar.gz
+# From https://www.openssh.com/txt/release-9.1 (base64 encoded)
+sha256  19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288  openssh-9.1p1.tar.gz
 # Locally calculated
 sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0e4253fa74..b70e327620 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.0
+OPENSSH_VERSION_MAJOR = 9.1
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
