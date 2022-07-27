Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5102AC19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE23F4094B;
	Wed, 27 Jul 2022 07:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE23F4094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3H4B7gmUQVjF; Wed, 27 Jul 2022 07:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A963E40357;
	Wed, 27 Jul 2022 07:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A963E40357
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3521C1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F85760AC4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F85760AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOEuU16FNxvg for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D88AB60AC0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D88AB60AC0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:16:02 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id bb16so19852580oib.11
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 00:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ar6l1wn0CaITe+9wTQDPjHpKlV3bjgB6vE6VewiTbCg=;
 b=ffAe7HbXSMnNc5VXs7zqhfeCCcYUI2WViO2mLacKWgTvM2+X50Bv0yJYreviIfbzPk
 pElcjNarbGQ7X1Cgsz05AeQ7y2/FcTAogC17A1njRy11Yad0qiFI3RpFU3L07yzFvYIs
 spmNdE6wP3kLcn+LyDrDB5WHUbNyELM233PdtadfZ5luVFipUa1bJew+I3YlU/YAYTUo
 g66YRuk8gYex+2Qu94I/bFMBL45TSjAA7fGT0JJhxhRydXAcIeto8pqryvg8QCnHpPYN
 AITR0baOrdZc4rsShc7xCU9Q3z3dPRbXchof1ZAtISOZwTrJfQelp0qrboKbxT4Z9I7C
 rB7g==
X-Gm-Message-State: AJIora+q8gsexwZI9qsq016Vpp9U8grdCbprACsT4nLSG1YcZIXa/jmK
 5NFLvCagDq69fEF1Gu1sbSx6t+khwbSJ7Q==
X-Google-Smtp-Source: AGRyM1sRb3pb5g9/XhNSTs6tFZay6G8nf0berOVyqr1YTw7ZxQpQl8/GA7JuYLeIi0WlQyIOapJ58g==
X-Received: by 2002:a05:6808:2083:b0:33a:6e67:2d2a with SMTP id
 s3-20020a056808208300b0033a6e672d2amr1192847oiw.16.1658906161524; 
 Wed, 27 Jul 2022 00:16:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 s6-20020a0568080b0600b0033a6939436bsm6887439oij.9.2022.07.27.00.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:16:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 01:15:56 -0600
Message-Id: <20220727071557.3434892-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ar6l1wn0CaITe+9wTQDPjHpKlV3bjgB6vE6VewiTbCg=;
 b=h9EOX+mRQcO57FpcuVJtlxdOj0iAZrWhJQ9HfG1f4ZkNpVLvguR+yLjbU2Goz8dNls
 Ij/F4OhZCgpxCcHSox4FldtN1aaU68xVgBOZKtbKgLOkoiw2bFJMnIC6Qo+mmIUN4yEf
 JTsDy+0TleR92TdCX84MTZkPZmyz4lL3IvrIRBqOV+aDkuLMDW5fseXPa3o3pVjS82HK
 FA+Agk4coNqUnbW5kVBaiAvmuUUZCvPj8ybK99+TeWknmaElfx9YDEm8Vh91fNC65dNV
 fEyd8qMokQyKzXFgVde+tqhHX3xEKNxyoBMAukaEtfuLKYRR5XRsvj1SCWKok0TwyDMl
 NhPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h9EOX+mR
Subject: [Buildroot] [PATCH v5 1/2] support/misc/toolchainfile.cmake.in:
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
index 5d2b8695b4..24d2b401f0 100644
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
