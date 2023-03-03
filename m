Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1A9C64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 19:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686CD41D39;
	Fri,  3 Mar 2023 19:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686CD41D39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mp8_cxiLJlgW; Fri,  3 Mar 2023 19:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E1D41CF6;
	Fri,  3 Mar 2023 19:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E1D41CF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0F5F1BF3E1
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 19:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99628617B0
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 19:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99628617B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyCwF9a7j_rk for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 19:06:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0931860E28
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0931860E28
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 19:06:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v16so3320011wrn.0
 for <buildroot@buildroot.org>; Fri, 03 Mar 2023 11:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HWuAhMMdCxTt5dJPQ4LW0OJIEzs5pLcdFZylZEZLXTg=;
 b=b0xNKI5PjT6GdH8WkCWcllf/2VstgopZ6li/cm/LpdJEP/Po2z5tg+hIcPwolt3blg
 D2EFu1Y7a/7+lncvVzNreOhuyaFcgsxR4A/jka+33HATqGY8/S3lJdJjuHcorunXHF02
 l1JtQFuY3la6PC3bXQRrg2sUJw4kN1nSyxfQeoguZn3H19mdMk+u5p0J6ZTNvc1mirIG
 umxoVugwVYz0eiba6szmzyza6kDgHz/JxBQaulfSPe26QAMjzlHHcoSX/66/dhOOqTCh
 teEkS5IlVe4DbLq0GSDWjH2tt6Hs7vm3hlvN2+6tVwAVSyI4qX6eN1fUW2tlX6KTc91j
 t0dA==
X-Gm-Message-State: AO0yUKVzHdsd/BZetRmsVifb0rnWnp2uXa2t2cHcNTs2WIbVJyB3Qihv
 4viZXWgiVvQX4LlQLydvczoFcBmSu5U=
X-Google-Smtp-Source: AK7set/HDhYPRWL/cOw+HsBn5Gicgd6j4wkTINYlYLWKYPQ31d0aZGgOBIEz+xz6tbO2fIzomwLnfA==
X-Received: by 2002:adf:e9c2:0:b0:2c7:1d75:b0cc with SMTP id
 l2-20020adfe9c2000000b002c71d75b0ccmr1982744wrn.43.1677870367746; 
 Fri, 03 Mar 2023 11:06:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b002c54fb024b2sm2878232wrj.61.2023.03.03.11.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 11:06:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 20:06:05 +0100
Message-Id: <20230303190605.3528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677870368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HWuAhMMdCxTt5dJPQ4LW0OJIEzs5pLcdFZylZEZLXTg=;
 b=e/26XKdEqIDTmiiziyj4hznUnANzDV/TOy4nTtJHNHmqRBOnkRI11OMLnxO9qijOZi
 /T3UyD9/5GwF/gn7sO++go85jz/7AlDvGeJacW4+2UPkUkNyC4tJ5ckKEBJ05zGddm34
 +4FK3YccMseLEOj1+FIRaNTwyTwmouzAnsehI8tBeWOZzR2KXoZOT4Cy0+m/h0yJytxM
 /9dznMyZzegxT/gDjUZFBxq61aGfroc6oqUQIMgLDPafvEkbUQWQUT38thECzTmQoDwN
 IN51EOYbp9eUW1sTaN27F6T1LbqLTim6mABYVBlfX5Ihs3nxA/8d3nFl4b6PZfFj17Eg
 W5rA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e/26XKdE
Subject: [Buildroot] [PATCH 1/1] package/f2fs-tools: add
 F2FS_TOOLS_CPE_ID_VENDOR
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:f2fs-tools_project:f2fs-tools is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Af2fs-tools_project%3Af2fs-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/f2fs-tools/f2fs-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 60f1004d77..f94244f2ad 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -14,6 +14,7 @@ F2FS_TOOLS_AUTORECONF = YES
 F2FS_TOOLS_INSTALL_STAGING = YES
 F2FS_TOOLS_LICENSE = GPL-2.0
 F2FS_TOOLS_LICENSE_FILES = COPYING
+F2FS_TOOLS_CPE_ID_VENDOR = f2fs-tools_project
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 F2FS_TOOLS_CONF_OPTS += --with-selinux
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
