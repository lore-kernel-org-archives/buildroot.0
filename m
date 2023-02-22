Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808BAC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03F6441056;
	Wed, 22 Feb 2023 14:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03F6441056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-v5HmQPEjT1; Wed, 22 Feb 2023 14:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 469404105C;
	Wed, 22 Feb 2023 14:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 469404105C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3C681BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CC3480FB4
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC3480FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7hz4Wx8yWp5 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:38:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 823C280E3B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 823C280E3B
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:38:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id p8so8081303wrt.12
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 06:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbF9JKnFn9yENWsHi4dImVK0xF8VGCLg/8ifiYKd2f0=;
 b=t7HBQQFVC3EFy6Dg6Hvak4GL4E7aoJD3P+8mFOQKq2Q6fI7+EKRsJ3NccD2joUadWX
 Z68KoKZz2Ql/9ELY46VdWbKFb303t/YT5fSKkdpklYHXLMiFYqmrg28QePB1y6OUEhRJ
 173jUCN+WGo7KDt351CByNjlBsqM07eQxpTZVeOP5z6/zCclYvCiCk2jPk7+GSF7yOin
 H9GpW3UhMQZe5fYvSN5GKJiTOZmfwC9N3dxpkYBHZ0tGqZNHwBehxG5pcUkwBEzS2kI6
 n0Yj/ARXHXhaA308PvkRTLWpe18rmgn0iNF0VPGaUsqSkrIWc2EQnUng3YJwR/qDLxFc
 7fRg==
X-Gm-Message-State: AO0yUKXpadsFDcdfrZAI5myhHoaCIsHZfLTaNlsoUl+dpDvmS2nCPTHV
 AiqjfEedC0zcsJ73KxzGBey/5ExwQbY=
X-Google-Smtp-Source: AK7set9PH5lah/gE2x46SmLAyh3br6pEOUIKgSxSbcomaYClPsXYRSebf2elamqWKZvP5wFR1YhJgw==
X-Received: by 2002:adf:ffca:0:b0:2c5:5aef:2759 with SMTP id
 x10-20020adfffca000000b002c55aef2759mr7899251wrs.53.1677076679278; 
 Wed, 22 Feb 2023 06:37:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcc15000000b003dfdeb57027sm7038575wmh.38.2023.02.22.06.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:37:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:37:53 +0100
Message-Id: <20230222143753.1563322-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bbF9JKnFn9yENWsHi4dImVK0xF8VGCLg/8ifiYKd2f0=;
 b=MjCBb6GpQL4YGxmoWUCPzi2B0dR+eG0IH/EOWN80Asr42CwwrfvHMRZZFPPZuUxGzg
 jvVN60s8+UsLiRlKxtjgS3925LaZbnHjoNEslvob7tk6XIinjvoXFE0uFhUNSu4SgV2L
 InUcgZBB3erksiCt079ekYgfDdS2t3wLX8jFVPgVrA7DrhEr8CGpF7a5PdZ0vUvwQAtH
 BxeOci8OaT9gmbSQujs9La1MIu/c1BCnu+ik9rUE6oEVEkvj1ATAjEc/9Wdp8FZ6sKFn
 +bn2Mgx4BkC2i7zv/GnYNSrUUCLJusYN3FJ4gb4ciJZAsVqX5/h0vXrAV+3N7RGK4t3e
 MwYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MjCBb6Gp
Subject: [Buildroot] [PATCH 1/1] package/libev: force arm mode instead of
 Thumb mode
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

Fix the following build failure:

/tmp/ccHc3Awn.s:825: Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/1c597c9da724d6cac06b09b1ecd456a28440a3a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libev/libev.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 9f3c19d46c..cbd5433d76 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -10,6 +10,13 @@ LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
 LIBEV_LICENSE_FILES = LICENSE
 
+# libev has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 # The 'compatibility' event.h header conflicts with libevent
 # It's completely unnecessary for BR packages so remove it
 define LIBEV_DISABLE_EVENT_H_INSTALL
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
