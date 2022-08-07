Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37229C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 07:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A93A540486;
	Sun,  7 Aug 2022 07:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A93A540486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oX0RDHTbAjyn; Sun,  7 Aug 2022 07:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C32EC40120;
	Sun,  7 Aug 2022 07:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C32EC40120
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAB0F1BF29A
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 07:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B23B083F8D
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 07:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B23B083F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOGZCIg6jXxe for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 07:31:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B4383F52
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1B4383F52
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 07:31:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j15so7666069wrr.2
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 00:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Iz26IHY8kF+8tFA4McpE4aHY71OMmO0EEC5vt7nRnTs=;
 b=YdlciGU0NZ3Qflx2HMxfKYEAZrfQtKgIHc+1326PUB38C882FukOJHrTsyojxSejXA
 /WjVqR/vufqczgNBqa/Z0ZO0Kji92HYX2SsnSuONK1PwlvRw7H9lhUJQ5kkPh+n07qpF
 qfXvBq3OHLF8wmBePHOZfLZRzgZoMGaYzuqrY4zLDe7FHVcPyUCavAHx/Oq567uUEnbK
 36Jkdn1yKxjNY4LFvNcmARXxaBImvjMbVbQqoImx45ibdfE3v+DIZH3pAqRPJB5s8u0M
 1eJ1BijO20ty20HwzQtXBfsBAQmZtBvJtAoEiiMnuPgQeQ1VxmDBm8M2D8FhknXrwq6b
 JDjg==
X-Gm-Message-State: ACgBeo0NjKVdexDNdLghG07w2+4AxoXt3HziEaqTCk15uOdumW8vg//O
 0aBfCVA8DOsTXNE9o5ihinLdReK8jtI=
X-Google-Smtp-Source: AA6agR6DFRzQjlqyYi+prsO0+FS+QdJpYijh4b0UtwlwJlCVSl6R2Bg2THCdlClzfp6H0/OzxhtAZg==
X-Received: by 2002:a5d:648b:0:b0:222:cb51:a57 with SMTP id
 o11-20020a5d648b000000b00222cb510a57mr453670wri.287.1659857505686; 
 Sun, 07 Aug 2022 00:31:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b003a2d6c623f3sm3276779wms.19.2022.08.07.00.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 00:31:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 11:31:35 +0200
Message-Id: <20220807093135.209053-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Iz26IHY8kF+8tFA4McpE4aHY71OMmO0EEC5vt7nRnTs=;
 b=X3YVtXQnGQdaUM9Ci6y/IcClaQAqQdWQWItpKHzldt3nbVVBmAzQ7JRyeLsmdHhfoe
 RrihyXvVjXtfLGyJES+ylBUbMRRA/fLSW+bTrZ1AkDwhY4i7qqT+F/nUaRqcgKA243TC
 VratG0re4nA1cLlhPAk0LskASCpfylVRiAh7iBRAM1QBmUbJvZf/NqiRl77AvFV3Oe+z
 HhC48hDZHaLqx2U0MNqLCMmeTxbOx6UVjjFT6UaUiXGBCZg/bjiNTF78Dzl5MHYDVWmE
 eAEGpXZcbfC35yXuYMJFdC3+JeK48Z3scvRGhEDsZis4gXM26Hfjz1oF1drnuHoR/Azo
 2H9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X3YVtXQn
Subject: [Buildroot] [PATCH 1/1] package/lapack: fix build without
 BUILD_COMPLEX
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without BUILD_COMPLEX raised since bump
to version 3.10.1 in commit b3e96b1fb0d0a7245cea6921fcdd7986762e5ec1 and
https://github.com/Reference-LAPACK/lapack/commit/bd1fba15d0d6f54891cb822f4ab2e8afd0a3ea4b:

CMake Error at LAPACKE/CMakeLists.txt:38 (message):
  LAPACKE_BUILD_COMPLEX requires BUILD_COMPLEX to be ON

CMake Error at LAPACKE/CMakeLists.txt:38 (message):
  LAPACKE_BUILD_COMPLEX16 requires BUILD_COMPLEX16 to be ON

Fixes:
 - http://autobuild.buildroot.org/results/418d15f734c87a70edf0d670c0548d550e6e70ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lapack/lapack.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 2d069c1c93..3db2797202 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -14,9 +14,17 @@ LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
 
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
-LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
+LAPACK_CONF_OPTS += \
+	-DBUILD_COMPLEX=ON \
+	-DBUILD_COMPLEX16=ON \
+	-DLAPACKE_BUILD_COMPLEX=ON \
+	-DLAPACKE_BUILD_COMPLEX16=ON
 else
-LAPACK_CONF_OPTS += -DBUILD_COMPLEX=OFF -DBUILD_COMPLEX16=OFF
+LAPACK_CONF_OPTS += \
+	-DBUILD_COMPLEX=OFF \
+	-DBUILD_COMPLEX16=OFF \
+	-DLAPACKE_BUILD_COMPLEX=OFF \
+	-DLAPACKE_BUILD_COMPLEX16=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
