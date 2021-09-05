Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93707C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 16:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A3A60EFD
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 16:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32A3A60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DE180E4E;
	Sun,  5 Sep 2021 16:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMtLoXXEf4yG; Sun,  5 Sep 2021 16:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 249CD80E07;
	Sun,  5 Sep 2021 16:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF2A1BF20F
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 16:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20B7160623
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 16:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqV3PL1I34JD for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 16:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27C69606C8
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 16:59:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so3267196wme.1
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UnqpB1O604ffQ1KaC1jUAM2y+Nf0U6EdDJoCEnQBMJg=;
 b=KN2YtSN4dX88ng+qLQPdYUh+JyQNiVxnVncnwQcnHpxwzH6xgydrCEq1eGD3+murH5
 Cd5gNrpIi+ymLKERBnw15TgqH8mtFlDgNSBIp0zM4+yBoMaCdhQJN+saTV7p7dbdC3+j
 LjZayNWp1dEk9BM1qd6XbcAOTicmqBH3Gw/5P6pfaDOUbbX0fvOSpkV1KdT8GBbEuk2c
 eGm2uswAK/esXzaQbtGZ7ao/W/Ol1/cZfNa1/2qlNfNgohQ2m3M01xCpgRT/kV33srZH
 Zk7OKIwbtTTiN1KXIlgO5uVDWH+kh+Hr7tpFO5YPMHLa6pYF4spupBuHCQ6b+sx6K9lp
 utjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UnqpB1O604ffQ1KaC1jUAM2y+Nf0U6EdDJoCEnQBMJg=;
 b=V33QApFZLdgxnhLwmMiz8hGPee4xFfKOD0N8URI7aYe34NDmxO25p6RoUUsso8+UT+
 77tqbiQs+k9/lxjfDbYcmwEdcnlj8tsB1So/DMH5ev7SMzloRjACbBrayfg2S+wlIbUS
 QNTB70YSgCEZUrl8Ug1kj+piss1A4Iwi/Nd3SKf+YYj1oTQBtQ8jla1J6QE7x2IVJj9M
 RpUBDSlNkAaIbcHrfg7ZOtSojIcsMGgl7HAHoTcOI+6JKdLbho3WVwDGZZZcoy6f8x7r
 O9wIpKM/Y8cuise4h6+UxdnssF4zrdCAlMI2dQUpi68UcalrVgKsEkVW/Oh94DSr6bQH
 xFSA==
X-Gm-Message-State: AOAM531sn8W5MPVDAvYkntleG1TXzHD2FJCtuFKCoTOfXsmYAHHPVL8b
 gBoWpYNAqoKJ1Tia6Lj94Zqi2+TtSczHJQ==
X-Google-Smtp-Source: ABdhPJy6H5w5zKK8HUtvTeBu9sSEC5ZM81yB6wuQoaucHvU3n2T+8y8BEXcmcZAzL5/Fkk/PS97JAw==
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr7765967wmh.186.1630861139112; 
 Sun, 05 Sep 2021 09:58:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id z14sm4898183wmi.24.2021.09.05.09.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 09:58:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 18:58:39 +0200
Message-Id: <20210905165839.1149794-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with wireshark
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with wireshark raised since commit
975ab2fa88a0c94b362499ea8ad99222f335fb45:

 Compiling targeted policy.31
 env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
 policy/modules/apps/wireshark.te:96:ERROR 'unknown type xdg_downloads_t' at token ';' on line 645315:
 #line 96
	allow wireshark_t xdg_downloads_t:dir { getattr search open };
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:79: policy.31] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/dfbc667e0c17072ddab89a03244f572d5234da50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-apps-wireshark.te-make-xdg-optional.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/refpolicy/0006-policy-modules-apps-wireshark.te-make-xdg-optional.patch

diff --git a/package/refpolicy/0006-policy-modules-apps-wireshark.te-make-xdg-optional.patch b/package/refpolicy/0006-policy-modules-apps-wireshark.te-make-xdg-optional.patch
new file mode 100644
index 0000000000..5041a1a881
--- /dev/null
+++ b/package/refpolicy/0006-policy-modules-apps-wireshark.te-make-xdg-optional.patch
@@ -0,0 +1,51 @@
+From d5c571c85567fe191fcc64dfb99b36788f806ceb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 5 Sep 2021 11:06:21 +0200
+Subject: [PATCH] policy/modules/apps/wireshark.te: make xdg optional
+
+Make xdg optional to fix the following build failure:
+
+ Compiling targeted policy.31
+ env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
+ policy/modules/apps/wireshark.te:96:ERROR 'unknown type xdg_downloads_t' at token ';' on line 645315:
+ #line 96
+	allow wireshark_t xdg_downloads_t:dir { getattr search open };
+ checkpolicy:  error(s) encountered while parsing configuration
+ make[1]: *** [Rules.monolithic:79: policy.31] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dfbc667e0c17072ddab89a03244f572d5234da50
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/405]
+---
+ policy/modules/apps/wireshark.te | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/policy/modules/apps/wireshark.te b/policy/modules/apps/wireshark.te
+index d765f9cd2..66e80fca9 100644
+--- a/policy/modules/apps/wireshark.te
++++ b/policy/modules/apps/wireshark.te
+@@ -93,8 +93,6 @@ userdom_use_user_terminals(wireshark_t)
+ 
+ userdom_user_content_access_template(wireshark, wireshark_t)
+ 
+-xdg_read_downloads(wireshark_t)
+-
+ tunable_policy(`use_nfs_home_dirs',`
+ 	fs_manage_nfs_dirs(wireshark_t)
+ 	fs_manage_nfs_files(wireshark_t)
+@@ -116,6 +114,10 @@ optional_policy(`
+ 	userhelper_sigchld(wireshark_t)
+ ')
+ 
++optional_policy(`
++	xdg_read_downloads(wireshark_t)
++')
++
+ optional_policy(`
+ 	xserver_user_x_domain_template(wireshark, wireshark_t, wireshark_tmpfs_t)
+ 	xserver_create_xdm_tmp_sockets(wireshark_t)
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
