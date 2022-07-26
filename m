Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C499C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 04:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D8541A07;
	Tue, 26 Jul 2022 04:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D8541A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5DdCA7iwQLp; Tue, 26 Jul 2022 04:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7582A419E2;
	Tue, 26 Jul 2022 04:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7582A419E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B21D21BF2B1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 04:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ABC340128
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 04:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABC340128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYnXIfeIds1L for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 04:44:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E485D400CB
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E485D400CB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 04:44:33 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id i1so5321175ilk.3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 21:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=azKI47S4jVfmvu1tR8vVIUCPUraeM+J9jKCxYlIthqM=;
 b=5jix3goUItFfdhbZ5pzRV7D67WK/Ou2sMKQ7kD4XZdN9Pba4uYTDww+koTKCFNJHX/
 +j1sY6HtqLg9qCDn2V5G+PMAywGrnYXUnGjxZkuN4VqJZVtzRau8NzvpJoHPRseVRPHg
 /Z+aX1jyjmvmQcEzhN1m2VCAufLnNM2Prpr/9fjvOiOVrgl1SXLfaLp49baO+aTapCUs
 PHdDbq3+82oOmHi0p2n6OkefAPruWpaCdMAh9NIpWMqbB5XBVO34v26/KYZQ/bZ3kVDv
 NB8DBx+V73fzWd01sj0gZtsABRaN4pxdrSym/XDr11RE75FHkhAYV/Ai7qMe15iFWFqk
 qd+A==
X-Gm-Message-State: AJIora849AhcUKYvKIiEkVKT1DOGj46neglFnVbKXF5lRoFh62hrZ+5I
 ZCoSqOCBw9znDz3CiN6B3hVUW4dY+YjMdA==
X-Google-Smtp-Source: AGRyM1tDFNntl+vx51sXHYbGy/aim/w33uPvDFce8D/bfaKy5OAIf/4mMNKhZO+8l/rGVBWxIivIAA==
X-Received: by 2002:a92:d64a:0:b0:2dc:fa9f:7b27 with SMTP id
 x10-20020a92d64a000000b002dcfa9f7b27mr5745820ilp.173.1658810672711; 
 Mon, 25 Jul 2022 21:44:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 d39-20020a0285aa000000b0033f07b375b8sm6303775jai.52.2022.07.25.21.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:44:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 22:44:24 -0600
Message-Id: <20220726044425.72570-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=azKI47S4jVfmvu1tR8vVIUCPUraeM+J9jKCxYlIthqM=;
 b=TS5NG6AElrVreKUu1YDKa1xAQC1nRQPrmU2gCWn/wruxEH2xRCiw/EnZ8VkLdksExl
 um+U8cTWIxkWauu5xCJgfrgGMbJ1NR5J4xleJriiEcDggCnqOgaGZspw3/Wei2dZFpzB
 g2kdiUYNf4hXdOIZCPmZ9K/S8C39IuYDK9b6PXqw0K+eNQiRjS6rcp7Rw+QzYY6vddAp
 hucEnrKUlbKhl1oHUD1vUeHkbJ6QHGpe+YVC94wVHjVuxXd9jsr8m4iUc56+lX4S08AI
 mAa/OMgFBL9KhLmIPKL3u3VRcv3WJgcopi5vot78Z5SLfzKjQFFC0B0UT+kMBlmUq1El
 Hmhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TS5NG6AE
Subject: [Buildroot] [PATCH v4 1/2] support/misc/toolchainfile.cmake.in:
 don't set PKG_CONFIG_SYSROOT_DIR
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This doesn't appear to be required and seems to break for packages
using meson's pkgconfig.relocatable format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 support/misc/toolchainfile.cmake.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 30c0e63bf2..bf1fff4c5a 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -91,7 +91,6 @@ endif()
 if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
   set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
 endif()
-set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
 # This toolchain file can be used both inside and outside Buildroot.
 if(NOT DEFINED CMAKE_C_COMPILER)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
