Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CA3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 02:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EBA41A6B;
	Sat,  2 Apr 2022 02:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUBNR6MlU4iW; Sat,  2 Apr 2022 02:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6121F41A4C;
	Sat,  2 Apr 2022 02:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACDFC1BF263
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 02:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9379408DD
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 02:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uS9CReVoAqSb for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 02:31:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18CBD40160
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 02:31:42 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id p22so5245825iod.2
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 19:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MmJbAB4bTN6+eynfu3s1GD7c1Pla74jKKVTz5D63N70=;
 b=Kguv++i6GZo+N0Cm/K2wPYqUu3a+8lydySl/PtqQP+hFMQpC8E5xxagnlyNWZWqkXE
 fYTzaZrnjuiFKKhu62lntnb/geVfRmthpclT40MjALRqiLZgz7Rk2liJImYNBgvdILTo
 3yociHFGL/kPRvYxoW4AaplKi3z8e1KT+FNOg6gdepOVKiY8Le5J4AicLMdOf6SHNsZW
 G8JYr7SEmfD+7KYV1QCqTDuBz833D2XTz2fKdIlK/7p7FFM5T8+ZH5yHX1k4JCu9fp+W
 x+PNxz9uINw2XAOH79MFSk/GoJfHkRx9rql091KNHQuSzJsT9mvZMBN8r+Ys/VZ1d3M+
 v22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MmJbAB4bTN6+eynfu3s1GD7c1Pla74jKKVTz5D63N70=;
 b=Av4ld88UwhwBX28OqRLQLfkb9R4VB/38MxgPziZhPgiPhGgdUat26T+bK6Ps0fvgnG
 1SKH+MYtioMQqWV/271lX17/h13z7cyOfC6hem0CMYXRzBUlqgT4ah1zC8wCRG1ct0wX
 hQ9IqPsC+Wwiey5z0RnE0ueJHWLidXog73LDLRAdN0549po0Nw0k61Dcru8cqO6YRgee
 NV2bWjjuXaMjr7VyemRMavdzambkgMRBsPa/3b2rs2W6HgrvJxBmMg+noDi86R732q0a
 h1sx2sDUo40wt0eg09FhyoOafYBVniY6S5nlmqyeKNHl0yWGcJVO8IYYrDQ8FPzjmv4I
 CnoQ==
X-Gm-Message-State: AOAM530ZVu7KMqqPOjicgOTKAPK/BbtH4b4/ZjY/6Wb72BYBQwtxGX/x
 bfe9uXB9gfSS4IbmBQmPqbHV2ugbzASYsQ==
X-Google-Smtp-Source: ABdhPJx8337THMEwuw7MsyrxrUXDeODaTcLj7mlRiaLfBdnV73BOhJbm1i2gyn9zrOZs25vgc9ZMcg==
X-Received: by 2002:a05:6638:3588:b0:323:bf36:4624 with SMTP id
 v8-20020a056638358800b00323bf364624mr2049941jal.8.1648866701036; 
 Fri, 01 Apr 2022 19:31:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i15-20020a056e02152f00b002c7fb986a1dsm2268823ilu.34.2022.04.01.19.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 19:31:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 20:31:35 -0600
Message-Id: <20220402023135.428789-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] toolchain-external-custom: ensure
 BR2_TOOLCHAIN_EXTERNAL_URL is set
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../toolchain-external-custom/toolchain-external-custom.mk   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk b/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
index c4ae6125ef..a5e42c09d7 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
+++ b/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
@@ -10,6 +10,11 @@ TOOLCHAIN_EXTERNAL_CUSTOM_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERN
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),y)
 # We can't check hashes for custom downloaded toolchains
 BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+ifeq ($(TOOLCHAIN_EXTERNAL_CUSTOM_SOURCE),)
+$(error No external toolchain url set, check your BR2_TOOLCHAIN_EXTERNAL_URL setting)
+endif
+endif
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
