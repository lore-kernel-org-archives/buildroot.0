Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C8541711;
	Mon,  7 Mar 2022 22:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pR1HnplTZcWY; Mon,  7 Mar 2022 22:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077AB410A3;
	Mon,  7 Mar 2022 22:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1571BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DE4860BA3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39q38_-eQWKF for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:34:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C808660597
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:34:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so309669wmb.5
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JzHm0cmPfUXp453w9/aaIZIYR/IbRVb5QRV+qfHeAI4=;
 b=VOhM5/Rj9xsZ2SW3JbHX3JQe7g4PAX52Uip04DshpzrXQWecYYMDuTQshhG5ThjQd5
 H3ob+UKvjDYTuBnIlKjC3m4ID7mHecIZaRGWzMIiEwS1K/Byp86ykoz2HXfZMGOGp2mu
 0LdMnk4oYgjzwKOpd4IvHaiB7UC8iwGnr3Blbj0o8W8TIMe+4UKKUJtqeZbS1RbyaYXS
 xwFudddbjs3aeC2IJodBSF3A+eraGkN4HwhGbRjmWIx0hQErihpoyVMjgi87iLxsik8h
 yo7MOkn6QEbGEe0W7QymqXkPRtoXes7F1QpQwEsJRalv6sWCcllvq/hSQB46W0QSPQag
 Znnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JzHm0cmPfUXp453w9/aaIZIYR/IbRVb5QRV+qfHeAI4=;
 b=US7pf6qP4qw4k0PTJ4pk2VDei27pDUzt53T4Qo3yqyB7HJqaUliSroibX7RcQ1+2Np
 WaNWmK84gslvLyG4Qn5ERLWXhKSMzhJCF/rAT2OvM8pMsJ6qY3bUxzd7LE5A99/TYBx5
 Z5RfnIeLu0MHl5312KS2Z+IoKly7tkjGHE56E9RdFit+hitoH6Bhtx51dZnrJaYHJ9dz
 omdGMz3bT61MbCTH6wfAPuhVylbDyit/XpPTKY3wP9GP42g+aqSmIClokLfVuP0eX4oX
 tIsAEBCgkfd5hibmqqFUPspapW/T5FrLq7eVyUxlgR76rEzmjapFcnR93S9VjkOtCoTm
 If+g==
X-Gm-Message-State: AOAM533eqqZtYGLG1IMXDHIh/q3BGmpbyfwYWCvw/LC0QRr8E84bQtrn
 PwcTZEc3wpqFlDO769kSqtXYZAdhZcY=
X-Google-Smtp-Source: ABdhPJzd9A+4uGtxS6aTljadmVccrsQi8gG6gWhWuVF/BvYZ0/bNle2WhFvJ9Z/AYOFdBJU8Jh0HTA==
X-Received: by 2002:a05:600c:418a:b0:384:224e:1817 with SMTP id
 p10-20020a05600c418a00b00384224e1817mr907208wmh.123.1646692480728; 
 Mon, 07 Mar 2022 14:34:40 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c22cb00b00382a960b17csm518710wmg.7.2022.03.07.14.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:34:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Mar 2022 23:33:55 +0100
Message-Id: <20220307223355.945328-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/oprofile: drop custom install rules
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

Drop custom install rules which have added since commit
676797d57f33fbe9d5adc81932847154ebd1ce93. Indeed, they result in a
broken installation. Especially, they are trying to "guess" what must
be installed based on BR2_ARCH but oprofile has its own logic. For
example, goldmont microarchitecture files must be installed in i386
directory even if this architecture is 64 bits:
https://sourceforge.net/p/oprofile/oprofile/ci/0ad5a9e6af86a88e1dd41180f45bc48b646eba6a

This will result in the following runtime failure:

oprofile: could not open unit mask description file /usr/share/oprofile//i386/goldmont/unit_masks
Unable to find info for event cpu_clk_unhalted

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14641

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oprofile/oprofile.mk | 41 ------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 85bc4efa9b..265d6ebd18 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -14,51 +14,10 @@ OPROFILE_CONF_OPTS = \
 	--enable-gui=no \
 	--with-kernel=$(STAGING_DIR)/usr
 
-OPROFILE_BINARIES = \
-	utils/ophelp pp/opannotate pp/oparchive pp/opgprof \
-	pp/opreport opjitconv/opjitconv \
-	utils/op-check-perfevents libabi/opimport \
-	pe_counting/ocount pe_profiling/operf
-
-ifeq ($(BR2_i386),y)
-OPROFILE_ARCH = i386
-endif
-ifeq ($(BR2_mipsel),y)
-OPROFILE_ARCH = mips
-endif
-ifeq ($(BR2_powerpc),y)
-OPROFILE_ARCH = ppc
-endif
-ifeq ($(BR2_x86_64),y)
-OPROFILE_ARCH = x86-64
-endif
-ifeq ($(OPROFILE_ARCH),)
-OPROFILE_ARCH = $(BR2_ARCH)
-endif
-
 OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
-ifeq ($(BR2_STATIC_LIBS),)
-define OPROFILE_INSTALL_SHARED_LIBRARY
-	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
-endef
-endif
-
-define OPROFILE_INSTALL_TARGET_CMDS
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib/oprofile
-	if [ -d $(@D)/events/$(OPROFILE_ARCH) ]; then \
-		cp -dpfr $(@D)/events/$(OPROFILE_ARCH) \
-			$(TARGET_DIR)/usr/share/oprofile; \
-	fi
-	$(INSTALL) -m 644 $(@D)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
-	$(INSTALL) -m 755 $(addprefix $(@D)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
-	$(OPROFILE_INSTALL_SHARED_LIBRARY)
-endef
-
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
