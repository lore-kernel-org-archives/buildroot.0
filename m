Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5420BCDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBA860FC6;
	Thu, 12 Oct 2023 10:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBA860FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwXFA4HS8Rl8; Thu, 12 Oct 2023 10:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E67661282;
	Thu, 12 Oct 2023 10:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E67661282
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE7EB1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97FD28223A
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FD28223A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74vtTwHhZbWo for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:28 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C5B682211
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C5B682211
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9ae7383b7ecso421509566b.0
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106746; x=1697711546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3KUCLyGQes6xxheYEJK7gtrJveDd5gkiwIgAmPsE1l4=;
 b=Z6e+vLH78oTwSYm2YeHUoKkeUbGftSNh1nm1lQYfd47iXQ+fAiT79WTLXrH2g13x+c
 mmSDxSQigxMQZBaPEfvmdr8WmoEYzRjtDUdoZmYWr8T/0N2gMBDs3dtb6wk+mE6zXGcB
 5TB7FEGaYciG3HRXb2y1lln5ymVLT6k9imLW4oy8HR9WsMMTGNIp2peeUmt/RHVSgKUX
 ylTBYSZQoJ5KpoehZufwWFLZOgrsXJAE5bXyA1OmxQ12TAAHE9YOIftmoBxyyFuNzwrU
 XEe7WN/+UiaszTpU97+UoufvLk+bw/J5YMuQvcv3j5+g7EWNjrkGv3kKkcuFuXTnZtqO
 wmeQ==
X-Gm-Message-State: AOJu0Yz7P58ayxIDBJGWHUAAPYxs63hLtp3LnMMVdeiUmS6/Pait9/2A
 3pVeQzIajvYljUasEie/BZEX5+vSQGqGLiQKDyIQwA==
X-Google-Smtp-Source: AGHT+IEysTi26L4Wp/r8dHlZNs+Uw4/IbAuyNAguUyXJix/lqczKY6tvpBNAdsbNpeYWwRKfmUmg+A==
X-Received: by 2002:a17:906:748d:b0:9ae:5513:e475 with SMTP id
 e13-20020a170906748d00b009ae5513e475mr18999674ejl.9.1697106746118; 
 Thu, 12 Oct 2023 03:32:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:31:58 +0200
Message-ID: <20231012103210.2915871-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106746; x=1697711546;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KUCLyGQes6xxheYEJK7gtrJveDd5gkiwIgAmPsE1l4=;
 b=nK3+1WT+EhOKaab6eDQC7xpswlIw9qozCDxt6QFBvQT/iY8BxUMZXbbHrgGIGIb50d
 gI//VnSKLnc1PfyIBxu9pvOa3pXAt1OxfLEjJBkAoH2bjtOaQZYtK0TGX/7W8VD5nhEe
 cyZTlvZ28RrtqaRhErHFkkmUgsyi9MC56rNWM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nK3+1WT+
Subject: [Buildroot] [PATCH 01/12] package/refpolicy/selinux: Add buildroot
 base policy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This policy is the first in several that supports running Buildroot in
enforcing mode without any denials. This is a generic set of Buildroot-specific
permissions that are tied to the enabled repolicy modules enabled when a user
selects the upstream version of refpolicy.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                             |  1 +
 package/refpolicy/selinux/buildroot.fc |  0
 package/refpolicy/selinux/buildroot.if |  1 +
 package/refpolicy/selinux/buildroot.te | 67 ++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/refpolicy/selinux/buildroot.fc
 create mode 100644 package/refpolicy/selinux/buildroot.if
 create mode 100644 package/refpolicy/selinux/buildroot.te

diff --git a/DEVELOPERS b/DEVELOPERS
index 3fffc4346c..e863d06535 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/refpolicy/selinux/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/package/refpolicy/selinux/buildroot.fc b/package/refpolicy/selinux/buildroot.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/refpolicy/selinux/buildroot.if b/package/refpolicy/selinux/buildroot.if
new file mode 100644
index 0000000000..acf797e604
--- /dev/null
+++ b/package/refpolicy/selinux/buildroot.if
@@ -0,0 +1 @@
+## <summary>Buildroot rules</summary>
diff --git a/package/refpolicy/selinux/buildroot.te b/package/refpolicy/selinux/buildroot.te
new file mode 100644
index 0000000000..1e004452ae
--- /dev/null
+++ b/package/refpolicy/selinux/buildroot.te
@@ -0,0 +1,67 @@
+policy_module(buildroot, 1.0.0)
+
+#============= chkpwd_t ==============
+allow chkpwd_t tmpfs_t:dir search;
+
+#============= getty_t ==============
+allow getty_t device_t:chr_file { getattr ioctl open read setattr write };
+allow getty_t getty_runtime_t:file watch;
+allow getty_t init_runtime_t:dir read;
+allow getty_t init_runtime_t:sock_file write;
+allow getty_t init_tmpfs_t:file { lock open read write };
+allow getty_t init_t:unix_stream_socket connectto;
+allow getty_t proc_t:filesystem getattr;
+allow getty_t sysctl_kernel_t:dir search;
+allow getty_t sysctl_kernel_t:file { open read };
+allow getty_t sysctl_t:dir search;
+allow getty_t tmpfs_t:dir search;
+allow getty_t var_t:lnk_file read;
+
+#============= local_login_t ==============
+allow local_login_t bin_t:file execute;
+allow local_login_t device_t:chr_file { ioctl open read relabelfrom relabelto write };
+allow local_login_t init_tmpfs_t:file { lock open read write };
+allow local_login_t proc_t:filesystem getattr;
+allow local_login_t var_log_t:file { create lock open read write };
+allow local_login_t var_run_t:dir { add_name write };
+allow local_login_t var_run_t:file { create lock open read write };
+
+#============= semanage_t ==============
+allow semanage_t tmpfs_t:dir search;
+
+#============= syslogd_t ==============
+allow syslogd_t device_t:chr_file { open read write };
+allow syslogd_t self:capability audit_control;
+allow syslogd_t self:netlink_audit_socket nlmsg_write;
+allow syslogd_t tmpfs_t:dir { add_name search write };
+allow syslogd_t tmpfs_t:file { append create getattr open };
+allow syslogd_t var_t:dir { add_name write };
+allow syslogd_t var_t:file { append create };
+allow syslogd_t var_t:lnk_file read;
+
+#============= sysadm_t ==============
+allow sysadm_t device_t:chr_file { ioctl open read write };
+allow sysadm_t kernel_t:fd use;
+allow sysadm_t kernel_t:system module_request;
+allow sysadm_t node_t:tcp_socket node_bind;
+allow sysadm_t self:capability { audit_control audit_write};
+allow sysadm_t self:netlink_audit_socket { nlmsg_read nlmsg_write };
+allow sysadm_t selinux_config_t:file watch;
+allow sysadm_t tmpfs_t:dir watch;
+allow sysadm_t unlabeled_t:file { execute map read };
+allow sysadm_t unlabeled_t:lnk_file read;
+allow sysadm_t var_t:dir watch;
+
+#============= klogd_t ==============
+allow klogd_t device_t:chr_file { read write };
+allow klogd_t selinux_config_t:dir search;
+
+#============= ifconfig_t ==============
+allow ifconfig_t device_t:chr_file { getattr ioctl read write };
+allow ifconfig_t proc_t:filesystem getattr;
+allow ifconfig_t root_t:chr_file { read write };
+allow ifconfig_t sysctl_kernel_t:dir search;
+allow ifconfig_t sysctl_kernel_t:file { open read };
+
+#============= kernel_t ==============
+allow kernel_t sysadm_t:process transition;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
