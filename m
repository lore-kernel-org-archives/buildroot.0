Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D4184063F;
	Thu, 19 May 2022 14:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SvA4OyYRCs5; Thu, 19 May 2022 14:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FF8F404D1;
	Thu, 19 May 2022 14:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 322851BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FD25415FA
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAoBcUT-TR9F for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CA454162C
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id bg25so2941830wmb.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GOm2iHKwUbo0D4M7e9PWQeUNMlEu8ik+KRelrz24F2A=;
 b=ZgmfWQKSJw1VX05wWtl+M11S5w0zxDjUXlnLdEd809cO3+oWiHHn9X0pbhdeLcUEed
 d+M1qoSD+ItS9H44fWn9mu1PN84kOXoPUWtTzzfw1qwfG9KBhThY3u9/DN6SZHW4WMlY
 laJda472i328IwWnve1H1/5B+u0ZlpqpYycMbMo4nF0Vr0VborPML5jRvGEWbMPG9u6S
 aNYOkB+JK5H8bCuqM/cgoayYW41XhO8gaaC0AafQ67e9HAAManm5w9mXSeTctIshCKlL
 FtdPFamYHPj/V1Em8elbWagc3mNphESquw3p9T4RN4UDG6x1YPlhy9yQgcm0+Ii9UBqE
 iAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GOm2iHKwUbo0D4M7e9PWQeUNMlEu8ik+KRelrz24F2A=;
 b=DTBhKUa4LeA/wQwCZO/oNegjqqQI6DX56BYQKLDrhedl9t0aquSFpmBwhKMpyFDCqY
 Il/KNjEmqrYOsP2n5w6L08HBn61QPZzKCdaVeKkM3/6XnwkvfhHk4Wowry8sI3wphCsR
 v3KKODkmfiZ/c1AES2pSiwHWilBpzdX9m6VCtHwAaBjw0SJSkCWygr24oAK3dbl/O0+M
 dlVwmQk20w9Emcn9aU/S4ypb0gMP7d6Q1xJI32OFThZ0xNL7OBSZu8KWhjSMrS2PRa1O
 Jv3DCRs11SPIaKu+nx2yxFc7Qly3APXYf0/ibmReG12pZS+TV+gzmaAb3/vFcIXmXOeg
 89Ag==
X-Gm-Message-State: AOAM531PqxKTg6xdTcGfK6qQRmlE4KJivwV4EBX8FxGQvx/QYMUkaLba
 pW3LPiYTgcSFVvazFFFO/kGPZ8yA6rE=
X-Google-Smtp-Source: ABdhPJxatWrx4NaxYsU9mw9jYJhEevoZR+ds+gl5tON6ZV7ofTnQOzu5JUnavQ7IVRdFrNospr2cYA==
X-Received: by 2002:a05:600c:3587:b0:397:337e:14c9 with SMTP id
 p7-20020a05600c358700b00397337e14c9mr1744852wmq.63.1652969327205; 
 Thu, 19 May 2022 07:08:47 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:46 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:07 +0200
Message-Id: <20220519140810.1953601-18-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 17/20] package/erlang-p1-stun: bump version
 to 1.0.47
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stun/erlang-p1-stun.hash | 2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index fb56b8f4e6..aef122b4a6 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05d2f31f172883d2301a93cd141e6b930dfdd01e10b6aacf806becc3674973d8  erlang-p1-stun-1.0.39.tar.gz
+sha256  f9b82949b54778a4b766dca5509eef4475e1dbc165a449974dbd0cc54c6f84a2  erlang-p1-stun-1.0.47.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index f762e7f45c..ce117e20b5 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 1.0.39
+ERLANG_P1_STUN_VERSION = 1.0.47
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = Apache-2.0
 ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
