Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C59C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 14:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757AC60F36
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 14:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 757AC60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B9780B2E;
	Fri, 13 Aug 2021 14:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MP0Axtx5Et5n; Fri, 13 Aug 2021 14:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACACE80B85;
	Fri, 13 Aug 2021 14:48:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF90D1BF2B3
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 14:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF52C4053C
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 14:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1XRX65Fbyaz for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 14:47:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76F040521
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 14:47:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q11so13632078wrr.9
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X27e3os2G0vcnWruq4geMXPuMpyjlhJxca/Y6pl5Geg=;
 b=EokvqgubjEzIs4FuzGjdENO90EsUcIlTYaL0hfc1dpzgN+3ticmP6jRBQACo55Xfnf
 DAUHaP6V52JE3RPNqmGi0SvKWI/D39FXeXaIuSiYWEU03JvnfHXM2fnDXuSdDFKxE4cI
 ntrW5DtPzjCpmrXkVdWemKteRHTxpo6AQ1TApI1EM/DLRdvkdzw+bnBUCmtV2I2PQTWb
 aevxAdcZF6JzGDLUrFIgUw7v3rYsnWUQQAEnPq0LzUZoI+bReueglKrCDVtGB202sYp9
 tYbELL7WE/BY9FfPbszEzM229tg0ifSQTCilYnYBj6RDqanUpr8nLUSM8D2jjQDU5Kc+
 zDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X27e3os2G0vcnWruq4geMXPuMpyjlhJxca/Y6pl5Geg=;
 b=tVKXgmw1l1CxHvlA+FUBqUAG88K2VCiFE1qa3+Q8enwfXvgicC2O6RH/OuwwSL5GOb
 SWML2OJP3YDlt5Mj160/szU7H7CGWoQSp1R00ZZ6gJjbpt0owIPAkmDFzqxtmefBu90m
 cl4BReDqdCiKLsuFSXrKhX+swF5k/Wk2s//7XehWcBuR3j1TyYyElM6tqqQlArj4J12N
 1mwKMVWEdyvqz+gxIylfPRXbUrLkH1Md9OSf6H08uE0XtJRiP/2HOZElOAmh5XVsn3qY
 ScG+UiHLSFAWlm1j4sxpWUL5AaMKzAFhrYiUy5luGlEZlqNyOPn3XRaChs+RV+r1YlYR
 +KDg==
X-Gm-Message-State: AOAM531lNipBW1D5hJtHtUuV1MNotW0u1WN06Taml4BJd/EIxo8MVVBa
 8xQlafMkLtlIlp/II52exMkIGs/riyhNtA==
X-Google-Smtp-Source: ABdhPJwfD4rsWCqJ7SvBIiZhLmDypVP8pS08/rCifj0/tgMgjZk3icpl8yeonHJd4a620qw2bpl+8g==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr2233071wrs.216.1628866073870; 
 Fri, 13 Aug 2021 07:47:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id k17sm1815791wmj.0.2021.08.13.07.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 07:47:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 16:47:22 +0200
Message-Id: <20210813144722.3156647-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with samba
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with samba raised since commit
49f6b2f39ee23e3e53c0b001894644734b8338b6:

 Compiling targeted policy.31
 env LD_LIBRARY_PATH="/tmp/instance-5/output-1/host/lib:/tmp/instance-5/output-1/host/usr/lib" /tmp/instance-5/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
 policy/modules/services/samba.te:399:ERROR 'type crack_db_t is not within scope' at token ';' on line 360232:
 	allow smbd_t crack_db_t:dir { getattr search open };
 #line 399
 checkpolicy:  error(s) encountered while parsing configuration

Fixes:
 - http://autobuild.buildroot.org/results/ab7098948d1920e42fa587e07f0513f23ba7fc74

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ervices-samba.te-make-crack-optional.patch | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch

diff --git a/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch b/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch
new file mode 100644
index 0000000000..f5cc356aeb
--- /dev/null
+++ b/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch
@@ -0,0 +1,82 @@
+From 7c58f2508efc115dea03e18e1fa611ebf81f6ee6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Aug 2021 11:12:01 +0200
+Subject: [PATCH] policy/modules/services/samba.te: make crack optional
+
+Make crack optional to avoid the following build failure:
+
+ Compiling targeted policy.31
+ env LD_LIBRARY_PATH="/tmp/instance-5/output-1/host/lib:/tmp/instance-5/output-1/host/usr/lib" /tmp/instance-5/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
+ policy/modules/services/samba.te:399:ERROR 'type crack_db_t is not within scope' at token ';' on line 360232:
+ 	allow smbd_t crack_db_t:dir { getattr search open };
+ #line 399
+ checkpolicy:  error(s) encountered while parsing configuration
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ab7098948d1920e42fa587e07f0513f23ba7fc74
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ policy/modules/services/samba.te | 32 ++++++++++++++++++--------------
+ 1 file changed, 18 insertions(+), 14 deletions(-)
+
+diff --git a/policy/modules/services/samba.te b/policy/modules/services/samba.te
+index 9d4665ae6..6c37625a9 100644
+--- a/policy/modules/services/samba.te
++++ b/policy/modules/services/samba.te
+@@ -396,8 +396,6 @@ userdom_signal_all_users(smbd_t)
+ userdom_home_filetrans_user_home_dir(smbd_t)
+ userdom_user_home_dir_filetrans_user_home_content(smbd_t, { dir file lnk_file sock_file fifo_file })
+ 
+-usermanage_read_crack_db(smbd_t)
+-
+ ifdef(`hide_broken_symptoms',`
+ 	files_dontaudit_getattr_default_dirs(smbd_t)
+ 	files_dontaudit_getattr_boot_dirs(smbd_t)
+@@ -413,18 +411,6 @@ tunable_policy(`samba_create_home_dirs',`
+ 	userdom_create_user_home_dirs(smbd_t)
+ ')
+ 
+-tunable_policy(`samba_domain_controller',`
+-	gen_require(`
+-		class passwd passwd;
+-	')
+-
+-	usermanage_domtrans_passwd(smbd_t)
+-	usermanage_kill_passwd(smbd_t)
+-	usermanage_domtrans_useradd(smbd_t)
+-	usermanage_domtrans_groupadd(smbd_t)
+-	allow smbd_t self:passwd passwd;
+-')
+-
+ tunable_policy(`samba_enable_home_dirs',`
+ 	userdom_manage_user_home_content_dirs(smbd_t)
+ 	userdom_manage_user_home_content_files(smbd_t)
+@@ -505,6 +491,24 @@ optional_policy(`
+ 	seutil_sigchld_newrole(smbd_t)
+ ')
+ 
++optional_policy(`
++	usermanage_read_crack_db(smbd_t)
++')
++
++optional_policy(`
++	tunable_policy(`samba_domain_controller',`
++		gen_require(`
++			class passwd passwd;
++		')
++
++		usermanage_domtrans_passwd(smbd_t)
++		usermanage_kill_passwd(smbd_t)
++		usermanage_domtrans_useradd(smbd_t)
++		usermanage_domtrans_groupadd(smbd_t)
++		allow smbd_t self:passwd passwd;
++	')
++')
++
+ ########################################
+ #
+ # Nmbd Local policy
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
