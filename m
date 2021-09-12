Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29132C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:33:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BFC6103D
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3BFC6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D0C404DB;
	Sun, 12 Sep 2021 20:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxHjGs7fZlYT; Sun, 12 Sep 2021 20:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B0640496;
	Sun, 12 Sep 2021 20:33:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4491BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87FF06077A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVmjBosIGzLx for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D07A60779
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:33:02 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u16so11373166wrn.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pB+aQZn1GWV3hlkvuD2z7VlAJ3l9s6YpJrSvw/hjiXI=;
 b=EAciLyqYKS/MnXHD0OffpBJ9e8phWgq5eDMjqihMlXTfQog0nHoysQnfXJg7CQ2uSi
 jihzO2T90sbOiU2/e51/VErIE9f96sqCV9/4ZjrecLKemVYkMaNiMxapXjurO5Yk5XYR
 7EX/2x2yJg0WjAWLc1WIif2aNqqydULrXYpPfOg6uSPpjcKQccM02BGacb9aoTlAbmJz
 R+i4GVprlUlSvehxbri9swMB/XwRo1tsgI4SSXz2OPu9zpsgv49h0MTC1zOwER8txyNV
 flCTHj6Zu1/fOxLlB3NpZff+bO5JX8dq92xiyU6iZzmV6XYfZHJxuzP21j6FYqhxPm9I
 XY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pB+aQZn1GWV3hlkvuD2z7VlAJ3l9s6YpJrSvw/hjiXI=;
 b=fIVOuv7u9toaNsXbFN/UBY6gYNuzGafw0/q36R5QXFCqyXu53CqZlp62HRGXuNk18Q
 uZA1dLuAdAOHYX4WvD69Bxcan8z92mnkePkLU80HmHJY8JmVHstq9FiiQ3T8QZbPQ5qe
 FQBuPfdXNYuanxrUBVX7E//i8r7Z3ls7lExVxjug1QHlsYA66nAp22n9Tjmmqlx4KCDk
 e/yjZ52KjMxrHVaeiiMimAZukUrm0sjB9mMO+yw/O9sk8562GnPOfORfQV08SL+TjQsX
 yDiHFyTdfMWdpolkxg5e7/KbCqTDmYuui1MUrKGIbFUFRl8u0JZJHXQ/xJkvH6bH5mPp
 DH9Q==
X-Gm-Message-State: AOAM5304gEe6lmZn256US18CKm4MnjxXGb2kovxy5IqZKEi8GqhbFZYP
 Su7oraNe08c21lc7qiWZ5SQSUG8NBes=
X-Google-Smtp-Source: ABdhPJyZ/TdN+rw4jfYBkZt/ZghrEH8/H9WpnjOlQj4c7jOHTYCEKbhfyTxhazn73ZLXXLby9G/m2Q==
X-Received: by 2002:a5d:6750:: with SMTP id l16mr8903686wrw.174.1631478780481; 
 Sun, 12 Sep 2021 13:33:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id e2sm5474872wra.40.2021.09.12.13.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:33:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 22:32:56 +0200
Message-Id: <20210912203256.3016475-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: security bump to version
 4.4.25
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Fix several issues found by Covscan in the testsuite. These include:
  - CWE-170: String not null terminated (STRING_NULL)
  - CWE-188: Reliance on integer endianness (INCOMPATIBLE_CAST)
  - CWE-190: Unintentional integer overflow (OVERFLOW_BEFORE_WIDEN)
  - CWE-569: Wrong sizeof argument (SIZEOF_MISMATCH)
  - CWE-573: Missing varargs init or cleanup (VARARGS)
  - CWE-687: Argument cannot be negative (NEGATIVE_RETURNS)
- Update hash of LICENSING due to files being updated with:
  https://github.com/besser82/libxcrypt/commit/44e9eb57b462cfbaeb085cea0e308511565f4a12
  https://github.com/besser82/libxcrypt/commit/578271c3776a442fa55ac5f5ea83c7dc83ede979

https://github.com/besser82/libxcrypt/blob/v4.4.25/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index bf187413e5..e0b96406cc 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3801f0263a8596b15ec466343fc1fdc4ad4ec7416c51e038a3528fd47f3be01a  libxcrypt-4.4.18.tar.gz
-sha256  f8198fcc4f002bf54512bac2e68e1e3f04af7d105f4f4f98d7d22cb110e04715  LICENSING
+sha256  caea3d032a46c4855ff818637884c7f5719ad228b79387b62ee023c8fbef17b4  libxcrypt-4.4.25.tar.gz
+sha256  3c1ff7a7c9da111853ada463c54b65b42b7b1d3d6592dd527281db0827331d77  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 3cf0555ac0..4627d21b62 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.18
+LIBXCRYPT_VERSION = 4.4.25
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
