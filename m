Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51B9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 05:59:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5414661167
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 05:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5414661167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0249D4036E;
	Thu,  9 Sep 2021 05:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2qOWcq0Hl2w; Thu,  9 Sep 2021 05:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E81494037F;
	Thu,  9 Sep 2021 05:59:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC1B1BF232
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 05:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3500F4016A
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 05:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMw-9qiFf2q8 for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 05:59:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26274400CB
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 05:59:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id g74so455311wmg.5
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 22:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRJ8OmB/u+Svuhie+JUuouGaHlWuZI74Fqe4qXYWVjI=;
 b=nulFU1Y5JbGB0Ui3481oLs/u7EDX1WmtW+bbcQK1qIQO6lRXgx8i170869UcwaYr6Z
 EiG73dwIX0wONQJGjta0Z9IFtEuAgN3sN5BI6apZkDJBvkXLGjGidrPuRAHfunQCGGdD
 ZS4OPiEdCxHwaHyKSRmqEk3sX8Q6+PGRcZpglu6EutToK6odxPoSxkHDx5Vo43ZXGkBX
 e2LSrkwBIVgnZA5PTKv6QrZ1Z4iGqInrM7FPtlClwgJZT1Xz16Zrs0eGcuOE2VsoiERp
 hPgBz/9ZMCT+FwpLA4c3CYtIKPKidh8xvRpXU+G9lNZZ5slvz3aWObxW4EmcRTWrtr+j
 TFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRJ8OmB/u+Svuhie+JUuouGaHlWuZI74Fqe4qXYWVjI=;
 b=RZrD0CrWWBM7tCRIxq/3lJsOApX96EJdHqM/jB7tfPfuq4itlkA01XWFnlCE+6zmuU
 p/FnxpDTOI+3Y/ofCGgcFFKR6BPrEPyxQ/TZIQpY0cvMnPz7GHB4D9FCwMK8RY2HdQeH
 D7rIgYgE65B0GxJS6hUC5hSAfjS4FDUsTenTF1yHMKomCMggQxRyiBtvRXteqZNn+L87
 ZMG3I6hL8mtpDjzWAhdYvP1j7ca07ziMcAzR3A2h8CEO0qAZSFOG5TN2aQBHDyp6iM8l
 WleDIZ5ABorT0L2OOmq6YREU3/YBIquipsvWCkOMTgg+KESyK+2kPJsI6+0n3Hg9Dj+3
 eMfg==
X-Gm-Message-State: AOAM533ah2dDKnIvQ0rD2RnefuBBOQ84B9LNeZ0wWitjuwHWUNklQClg
 O91VdqhmTnve4l4Z4GUTokmDeZvo00c=
X-Google-Smtp-Source: ABdhPJxr7HqHQZz8n/StzV+gFTa14r8dTbQkjywq7B/bi5nSYfCukemn+822Ise5pX25tMkZrHEUeA==
X-Received: by 2002:a05:600c:1550:: with SMTP id
 f16mr1057624wmg.111.1631167142815; 
 Wed, 08 Sep 2021 22:59:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l15sm700905wrv.84.2021.09.08.22.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 22:59:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 07:57:58 +0200
Message-Id: <20210909055758.1120236-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: bump version to
 2.20210908
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

- Drop upstreamed patches
- Update indentation in hash file (two spaces)
- Fix the following build failure with wireshark raised since commit
  975ab2fa88a0c94b362499ea8ad99222f335fb45 thanks to
  https://github.com/SELinuxProject/refpolicy/commit/d5c571c85567fe191fcc64dfb99b36788f806ceb:

 Compiling targeted policy.31
 env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
 policy/modules/apps/wireshark.te:96:ERROR 'unknown type xdg_downloads_t' at token ';' on line 645315:
 #line 96
	allow wireshark_t xdg_downloads_t:dir { getattr search open };
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:79: policy.31] Error 1

https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20210908

Fixes:
 - http://autobuild.buildroot.org/results/dfbc667e0c17072ddab89a03244f572d5234da50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ervices-minidlna.te-make-xdg-optiona.patch | 52 -------------------
 ...rvices-samba.te-make-crack-optional.patch} |  1 +
 ...-services-cvs.te-make-inetd-optional.patch | 37 -------------
 ...ervices-ifplugd.te-make-netutils-opt.patch | 48 -----------------
 ...es-services-ftp-te-make-ssh-optional.patch | 44 ----------------
 package/refpolicy/refpolicy.hash              |  4 +-
 package/refpolicy/refpolicy.mk                |  4 +-
 7 files changed, 5 insertions(+), 185 deletions(-)
 delete mode 100644 package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
 rename package/refpolicy/{0005-policy-modules-services-samba.te-make-crack-optional.patch => 0001-policy-modules-services-samba.te-make-crack-optional.patch} (97%)
 delete mode 100644 package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
 delete mode 100644 package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
 delete mode 100644 package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch

diff --git a/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch b/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
deleted file mode 100644
index c4e98ad141..0000000000
--- a/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 65c87bdfb1c895934582988f03f1c9c452c1426b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 25 Jul 2021 17:59:15 +0200
-Subject: [PATCH] policy/modules/services/minidlna.te: make xdg optional
-
-Make xdg optional to avoid the following build failure:
-
- Compiling targeted policy.28
- env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-1/output-1/host/lib:/home/buildroot/autobuild/instance-1/output-1/host/usr/lib" /home/buildroot/autobuild/instance-1/output-1/host/usr/bin/checkpolicy -c 28 -U deny -S -O -E policy.conf -o policy.28
- policy/modules/services/minidlna.te:85:ERROR 'unknown type xdg_music_t' at token ';' on line 146109:
- #line 85
-	allow minidlna_t xdg_music_t:dir { getattr search open };
- checkpolicy:  error(s) encountered while parsing configuration
- Rules.monolithic:78: recipe for target 'policy.28' failed
-
-Fixes:
- - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa/build-end.log
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/396]
----
- policy/modules/services/minidlna.te | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/policy/modules/services/minidlna.te b/policy/modules/services/minidlna.te
-index b980d2707..4d87e8ee7 100644
---- a/policy/modules/services/minidlna.te
-+++ b/policy/modules/services/minidlna.te
-@@ -82,10 +82,6 @@ logging_search_logs(minidlna_t)
- miscfiles_read_localization(minidlna_t)
- miscfiles_read_public_files(minidlna_t)
- 
--xdg_read_music(minidlna_t)
--xdg_read_pictures(minidlna_t)
--xdg_read_videos(minidlna_t)
--
- tunable_policy(`minidlna_read_generic_user_content',`
- 	userdom_list_user_tmp(minidlna_t)
- 	userdom_read_user_home_content_files(minidlna_t)
-@@ -101,3 +97,9 @@ tunable_policy(`minidlna_read_generic_user_content',`
- 	userdom_dontaudit_read_user_home_content_files(minidlna_t)
- 	userdom_dontaudit_read_user_tmp_files(minidlna_t)
- ')
-+
-+optional_policy(`
-+	xdg_read_music(minidlna_t)
-+	xdg_read_pictures(minidlna_t)
-+	xdg_read_videos(minidlna_t)
-+')
--- 
-2.30.2
-
diff --git a/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch b/package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
similarity index 97%
rename from package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch
rename to package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
index f5cc356aeb..2dae5d4a76 100644
--- a/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch
+++ b/package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
@@ -16,6 +16,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/ab7098948d1920e42fa587e07f0513f23ba7fc74
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/407]
 ---
  policy/modules/services/samba.te | 32 ++++++++++++++++++--------------
  1 file changed, 18 insertions(+), 14 deletions(-)
diff --git a/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch b/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
deleted file mode 100644
index 298f99c474..0000000000
--- a/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 21b0a5bc50e15e9af7edb3edad9fac0bf03f7028 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 30 Jul 2021 23:11:38 +0200
-Subject: [PATCH] policy/modules/services/cvs.te: make inetd optional
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- policy/modules/services/cvs.te | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/policy/modules/services/cvs.te b/policy/modules/services/cvs.te
-index f2f60556c..61589228f 100644
---- a/policy/modules/services/cvs.te
-+++ b/policy/modules/services/cvs.te
-@@ -15,7 +15,6 @@ gen_tunable(allow_cvs_read_shadow, false)
- 
- type cvs_t;
- type cvs_exec_t;
--inetd_tcp_service_domain(cvs_t, cvs_exec_t)
- init_daemon_domain(cvs_t, cvs_exec_t)
- application_executable_file(cvs_exec_t)
- 
-@@ -98,6 +97,10 @@ tunable_policy(`allow_cvs_read_shadow',`
- 	auth_tunable_read_shadow(cvs_t)
- ')
- 
-+optional_policy(`
-+	inetd_tcp_service_domain(cvs_t, cvs_exec_t)
-+')
-+
- optional_policy(`
- 	kerberos_read_config(cvs_t)
- 	kerberos_read_keytab(cvs_t)
--- 
-2.30.2
-
diff --git a/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch b/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
deleted file mode 100644
index b43354ed2b..0000000000
--- a/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6dcfb6715de75677165221ee5bd8d4db6e4a01a7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 31 Jul 2021 10:58:42 +0200
-Subject: [PATCH] policy/modules/services/ifplugd.te: make netutils
- optional
-
-Make netutils optional to avoid the following build failure:
-
- Compiling targeted policy.30
- env LD_LIBRARY_PATH="/tmp/instance-3/output-1/host/lib:/tmp/instance-3/output-1/host/usr/lib" /tmp/instance-3/output-1/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
- policy/modules/services/ifplugd.te:62:ERROR 'type netutils_exec_t is not within scope' at token ';' on line 73694:
- #line 62
- 	allow ifplugd_t netutils_exec_t:file { getattr open map read execute ioctl };
- checkpolicy:  error(s) encountered while parsing configuration
-
-Fixes:
- - http://autobuild.buildroot.org/results/1e27f5b193d40dfb7c73fbe15d1bef91cb92c27d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- policy/modules/services/ifplugd.te | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/policy/modules/services/ifplugd.te b/policy/modules/services/ifplugd.te
-index f49b147f7..550eecca4 100644
---- a/policy/modules/services/ifplugd.te
-+++ b/policy/modules/services/ifplugd.te
-@@ -59,8 +59,6 @@ logging_send_syslog_msg(ifplugd_t)
- 
- miscfiles_read_localization(ifplugd_t)
- 
--netutils_domtrans(ifplugd_t)
--
- sysnet_domtrans_ifconfig(ifplugd_t)
- sysnet_domtrans_dhcpc(ifplugd_t)
- sysnet_delete_dhcpc_runtime_files(ifplugd_t)
-@@ -70,3 +68,7 @@ sysnet_signal_dhcpc(ifplugd_t)
- optional_policy(`
- 	consoletype_exec(ifplugd_t)
- ')
-+
-+optional_policy(`
-+	netutils_domtrans(ifplugd_t)
-+')
--- 
-2.30.2
-
diff --git a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
deleted file mode 100644
index 9269c7aff8..0000000000
--- a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f26d4bc1b2a7b781c67891cb3bf4579c6582d630 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 30 Jul 2021 22:40:20 +0200
-Subject: [PATCH] policy/modules/services/ftp.te: make ssh optional
-
-Make ssh optional to avoid the following build failure:
-
- Compiling targeted policy.30
- env LD_LIBRARY_PATH="/home/fabrice/buildroot/output/host/lib:/home/fabrice/buildroot/output/host/usr/lib" /home/fabrice/buildroot/output/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
- policy/modules/services/ftp.te:484:ERROR 'type ssh_home_t is not within scope' at token ';' on line 92051:
- 	allow sftpd_t ssh_home_t:dir { open read getattr lock search ioctl add_name remove_name write };
- #line 484
- checkpolicy:  error(s) encountered while parsing configuration
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- policy/modules/services/ftp.te | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/policy/modules/services/ftp.te b/policy/modules/services/ftp.te
-index 0d84da71cf..5686b22581 100644
---- a/policy/modules/services/ftp.te
-+++ b/policy/modules/services/ftp.te
-@@ -481,10 +481,6 @@ tunable_policy(`sftpd_full_access',`
- 	files_manage_non_auth_files(sftpd_t)
- ')
- 
--tunable_policy(`sftpd_write_ssh_home',`
--	ssh_manage_home_files(sftpd_t)
--')
--
- tunable_policy(`use_samba_home_dirs',`
- 	fs_list_cifs(sftpd_t)
- 	fs_read_cifs_files(sftpd_t)
-@@ -496,3 +492,9 @@ tunable_policy(`use_nfs_home_dirs',`
- 	fs_read_nfs_files(sftpd_t)
- 	fs_read_nfs_symlinks(ftpd_t)
- ')
-+
-+optional_policy(`
-+	tunable_policy(`sftpd_write_ssh_home',`
-+		ssh_manage_home_files(sftpd_t)
-+	')
-+')
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 6c33a4d974..b8f6f023eb 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256 48cbf2c63ff9003bef05e03c8d3cdddb4e8f63fef2a072ae51c987301f0b874d  refpolicy-2.20210203.tar.bz2
+sha256  4d3140d9fbb91322f5de36d73959464ce1d8946dcd149e36fcaf60e92444e902  refpolicy-2.20210908.tar.bz2
 
 # Locally computed
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index a42483dba2..eb345d0f98 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -22,9 +22,9 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20210203
+REFPOLICY_VERSION = 2.20210908
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20210203
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
 
 # Cannot use multiple threads to build the reference policy
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
