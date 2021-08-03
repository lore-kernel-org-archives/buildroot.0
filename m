Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F91C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:55:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 435DA60EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 435DA60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 075A9402DA;
	Tue,  3 Aug 2021 13:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ube9ImmwiexW; Tue,  3 Aug 2021 13:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E1A40270;
	Tue,  3 Aug 2021 13:55:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C34D81BF84C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C050C40526
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMV2ff_NPHhQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 13:54:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30FD140448
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 13:54:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c9so5151824wri.8
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5KBROWpl5q0iS1XSnW3W4Rh4AjuweyGFkLlVeszDIQ=;
 b=Y0YwtTMfBTeRXid/5ZDyZiSmjpPDg1XmDyKp/GBnBK94iaa1TsP66BYodoexqQ9ejk
 PJf2YibwcWJ50lKghZTW2ewBQcTkHpVcH2Y8Yq/R06J3gfV+uKbFbarr4qk9Ok0KLe0A
 nLHP2fE4Zil+Yt8F1TGplYpxNzcm94j+u1oazZGg8JwaBZb6Zt+F4bijg+d3B5uYU+aI
 DwaZSKKjnpnl+EDgtW2C/LnvgPNqCz464pgM6ygk6ajsVJeqMM+YF6uElCaW9QFVCYN8
 bh3a7XspOwVMD7JbAE88T4UbXVwFAMextjumwvJJmOJ33o28q+ERS1AYXm/KgBB9yPRh
 zWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5KBROWpl5q0iS1XSnW3W4Rh4AjuweyGFkLlVeszDIQ=;
 b=jvPURYjmLnisoWzEapEGvrATDk1/A3Zig3jmlfclGxYrR8REkf/OsYvpusIfR6C/V4
 Afew7uo45bjgMLyfhzVRcULFPwF/ULtv32IQEoby+U9gYR1caNPYPqWqqJnwrY4/8CWs
 I/os/hfBcgsAf2wNiU+UERt/0IGF5titvEb5cgczjIJRd1Ffs7hvoT7oga6jCgiJs5ss
 0dZl4a8xcjrVhrOq546AGbH5+KZb4eMUe8F/Hr6sTHBiPGDU19eDBc6ixCufR6pix2Dv
 Yu2BIga50k0sePctQjVTI5bOq2dSZue6KS6kqBuH48hnFWr0+UhGi85mi3xHjn/jd9LK
 hPcg==
X-Gm-Message-State: AOAM531L21QR6ydjhLFupSaLKJ6Sp63wMS+oA5CXk+NNgq5WNpD80eAF
 yYhBOcUs/tMocq1IcB/2OORXlKSKdMHXdg==
X-Google-Smtp-Source: ABdhPJwhZwA3a2SyNuy2idnP8dUNi6eJQrk55In3VsQvRTjYh1kNUd1Nd4AaD8bPPP96kBZgqYSVKg==
X-Received: by 2002:adf:f983:: with SMTP id f3mr23026719wrr.69.1627998896231; 
 Tue, 03 Aug 2021 06:54:56 -0700 (PDT)
Received: from kali.home (pop.92-184-97-219.mobile.abo.orange.fr.
 [92.184.97.219])
 by smtp.gmail.com with ESMTPSA id c16sm14530581wru.82.2021.08.03.06.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 06:54:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 15:54:47 +0200
Message-Id: <20210803135447.32589-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libodb-boost: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb-boost/libodb-boost.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
index 679c9d7a38..bac5f1e78f 100644
--- a/package/libodb-boost/libodb-boost.mk
+++ b/package/libodb-boost/libodb-boost.mk
@@ -12,5 +12,6 @@ LIBODB_BOOST_INSTALL_STAGING = YES
 LIBODB_BOOST_LICENSE = GPL-2.0
 LIBODB_BOOST_LICENSE_FILES = LICENSE
 LIBODB_BOOST_DEPENDENCIES = boost libodb
+LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
