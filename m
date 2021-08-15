Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D14C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 15:58:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C66461103
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 15:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C66461103
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61FBC605A4;
	Sun, 15 Aug 2021 15:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCEWm8X6myHN; Sun, 15 Aug 2021 15:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C60605A6;
	Sun, 15 Aug 2021 15:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99E5A1BF3F0
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 15:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 888F3401B4
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 15:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6FDLh4XcJhY for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 15:58:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B50C400AF
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 15:58:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C436B8752E; Sun, 15 Aug 2021 15:58:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 17:58:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eebfba38888209313837bc81a22a4b3bf11ada4
X-Git-Newrev: dc894fca1cd9ba835bb49bf87899d2459e938c00
X-Patchwork-Hint: ignore
Message-Id: <20210815155805.C436B8752E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: fix build with samba
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=dc894fca1cd9ba835bb49bf87899d2459e938c00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...les-services-samba.te-make-crack-optional.patch | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
