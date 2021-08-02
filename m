Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C640C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 09:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E384610CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 09:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E384610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A92607ED;
	Mon,  2 Aug 2021 09:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqvMcBJOVUod; Mon,  2 Aug 2021 09:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E307606DE;
	Mon,  2 Aug 2021 09:35:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 343261BF4E4
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 09:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EB8483381
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 09:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RrBt1HCO6vl for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 09:35:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35915831EF
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 09:35:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n11so10001693wmd.2
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=41k120ImgnE+JrWoRUn625gUeQXARzYzBqR678Do5lU=;
 b=HuxsuAGcUAzQUoqjw43Zu3xJ4JsfoZcvdbOEVLuMn6TL6Bt/O9Yh1bAfsP+9HJiIrA
 //aLo7bSJrmEg0UyFL2BO9nMe9ReLiaNmZBD65wGZhHFD7PhsGv0pqNvvucMPCuLf84c
 Glai9jG1yLhsa1WU1pCmh+/evCswhptPDH/GZc9YU/S6WP2k9jcWD4xe6+x8KnWn4Rjf
 qgXjUSFw8IW403DyXWkof8cq0f91IRxptsDSPk9ojyDzfyDd9j9Zi/IjRzNrFEqoV6oN
 BPQYnDftPhm5X/0xTiVpGt8LHYyRPDPuO4cty1VaSsLRjPYu6t57PCGnbRBXHgZewWsY
 9eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=41k120ImgnE+JrWoRUn625gUeQXARzYzBqR678Do5lU=;
 b=Jt9caixJM5LxFV70GdwCRypodUhnIGYPVcONS5Sk7+Xgqa0FeTm+5xqQJYcOuOjFVI
 wg8J+fiZ5Z8Nw7RRJsv/cUGVlfRC85K0/t9yckcfGT1Z75QLi2oxr5Jm2rRXtQeMvuBv
 lJ8Es6uL85po25zKUodyRxf2F85QRQ+PDuaLhIPufopgDxDIcpWlPHFpZJSyGCcx4PLv
 wt76lZplKnFdFr0DKN2JeFgUVRwAou2IBsF8atkBFijfwTpl8BLuRwXTe2vjN+fCr/w8
 EnkJM1/33aXHheNwyZwqsOMzz4aCKfP932exwO8o3Pfd9+2nFa5tk9yapv94joHrh6XU
 A/Xg==
X-Gm-Message-State: AOAM530H2qxPceiXGrwTLoRmoMGiQvYtGHnDfpmLdCmI1C9zXlG+XlIh
 cV/cysEIQtdyJrkk5LsCW2++PO6uqbq/tQ==
X-Google-Smtp-Source: ABdhPJxqDdi+BjsWqLrQf3bn/l6o/B2eSQJVxtY86FT53nGVKdfh5QpbH8dEXh1uRS769sYAmkZW5w==
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr1555163wmq.47.1627896908250; 
 Mon, 02 Aug 2021 02:35:08 -0700 (PDT)
Received: from kali.home (pop.92-184-106-71.mobile.abo.orange.fr.
 [92.184.106.71])
 by smtp.gmail.com with ESMTPSA id z20sm9404881wmi.36.2021.08.02.02.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 02:35:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 11:34:58 +0200
Message-Id: <20210802093458.1531166-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with ftp
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

Fix build failure raised since commit
61a47bb1037ac20772f4e0106aab956adffeee12

Fixes:
 - http://autobuild.buildroot.org/results/bde34d81a04b5ea96722dc56249089dce7e65b74

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...es-services-ftp-te-make-ssh-optional.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch

diff --git a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
new file mode 100644
index 0000000000..9269c7aff8
--- /dev/null
+++ b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
@@ -0,0 +1,44 @@
+From f26d4bc1b2a7b781c67891cb3bf4579c6582d630 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 30 Jul 2021 22:40:20 +0200
+Subject: [PATCH] policy/modules/services/ftp.te: make ssh optional
+
+Make ssh optional to avoid the following build failure:
+
+ Compiling targeted policy.30
+ env LD_LIBRARY_PATH="/home/fabrice/buildroot/output/host/lib:/home/fabrice/buildroot/output/host/usr/lib" /home/fabrice/buildroot/output/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
+ policy/modules/services/ftp.te:484:ERROR 'type ssh_home_t is not within scope' at token ';' on line 92051:
+ 	allow sftpd_t ssh_home_t:dir { open read getattr lock search ioctl add_name remove_name write };
+ #line 484
+ checkpolicy:  error(s) encountered while parsing configuration
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ policy/modules/services/ftp.te | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/policy/modules/services/ftp.te b/policy/modules/services/ftp.te
+index 0d84da71cf..5686b22581 100644
+--- a/policy/modules/services/ftp.te
++++ b/policy/modules/services/ftp.te
+@@ -481,10 +481,6 @@ tunable_policy(`sftpd_full_access',`
+ 	files_manage_non_auth_files(sftpd_t)
+ ')
+ 
+-tunable_policy(`sftpd_write_ssh_home',`
+-	ssh_manage_home_files(sftpd_t)
+-')
+-
+ tunable_policy(`use_samba_home_dirs',`
+ 	fs_list_cifs(sftpd_t)
+ 	fs_read_cifs_files(sftpd_t)
+@@ -496,3 +492,9 @@ tunable_policy(`use_nfs_home_dirs',`
+ 	fs_read_nfs_files(sftpd_t)
+ 	fs_read_nfs_symlinks(ftpd_t)
+ ')
++
++optional_policy(`
++	tunable_policy(`sftpd_write_ssh_home',`
++		ssh_manage_home_files(sftpd_t)
++	')
++')
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
