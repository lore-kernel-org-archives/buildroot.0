Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D0BCDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D422608D8;
	Thu, 12 Oct 2023 10:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D422608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YaGVYglDREYT; Thu, 12 Oct 2023 10:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BDF61497;
	Thu, 12 Oct 2023 10:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BDF61497
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C76B41BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D1A40509
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D1A40509
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UShih36qZbv7 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:37 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3337F404F8
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3337F404F8
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99de884ad25so127757166b.3
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106755; x=1697711555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbBK90yMavF/ytovHor0fYYMcHnrKz5qJp1p7bczmoA=;
 b=AS7UG4COuL6bjnzXgow/KWCOY+1u5PjcLX2PJEW87U+TMVM9w6WLvDgEOr4Q5vwfhp
 dyeYJ1UZj6w8nvVljPBo9AoL8yw18p3jbSmOm76FbvxCjkhXUBG63lQL6Dv9JRce219z
 BonuPaSngYRLpD/R4Ic5b9AjrX0htqTNu4++nkQi8BPRfVXGypuPOnz9bHJB/VIBfbsu
 WexyCOv+V7IMro5YukrjzMdCja3iwRPAwcxabgzHCmn31zDzeMsyhTlzzFXNGjbplxMh
 D75mmkUYkgPRaFkkL3nImbBOd9/fXTuvjkoRy7bF2s1Pokr0BB+wxY31N20PTMsS1v6W
 kzow==
X-Gm-Message-State: AOJu0YzdnEUnBwsVyVdGH8/hOlrjIXEMnXr3WPCHSTlXY3VUSl3vVVS7
 C36HLlmHVrFccsXV6beq24w2Dtxvr9Sfzw/MxY+hxg==
X-Google-Smtp-Source: AGHT+IG6tJ2xYhRacDS7KbpSbwK1meXwu3WLMmMJFt9NBcllR+bnTsitm/u301jIdRX6SaWAAQOvdw==
X-Received: by 2002:a17:906:1c:b0:9b2:794d:62d3 with SMTP id
 28-20020a170906001c00b009b2794d62d3mr20681632eja.14.1697106754968; 
 Thu, 12 Oct 2023 03:32:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:34 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:01 +0200
Message-ID: <20231012103210.2915871-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106755; x=1697711555;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbBK90yMavF/ytovHor0fYYMcHnrKz5qJp1p7bczmoA=;
 b=BdbPp/VwViBxCInWq0tLGpq1ssV4mvvRBQjGcf4nKmgchsqqwy2BxgPZGe5I2x0HD5
 TpHElzNZqg3lsTmV4XJGxL2xa9+8+UFJJNwyfrObElaIm2JcH/VkgliZWS/p0E7OzNIG
 9cqoFJSdwFhaHcwUIHnbgRmaR51rO+db7dsHQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BdbPp/Vw
Subject: [Buildroot] [PATCH 04/12] package/systemd/selinux: Add buildroot
 systemd selinux policy
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

Systemd requires quite a bit of extra permissions not provided by the refpolicy
systemd module to function properly in enforcing mode without denials. This is
based off of Maxime Chevallier's previous work found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20210107135307.1762186-3-maxime.chevallier@bootlin.com/

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                   |  1 +
 package/systemd/selinux/buildroot-systemd.fc |  0
 package/systemd/selinux/buildroot-systemd.if |  1 +
 package/systemd/selinux/buildroot-systemd.te | 66 ++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 package/systemd/selinux/buildroot-systemd.fc
 create mode 100644 package/systemd/selinux/buildroot-systemd.if
 create mode 100644 package/systemd/selinux/buildroot-systemd.te

diff --git a/DEVELOPERS b/DEVELOPERS
index 36108715bf..e49960f572 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -39,6 +39,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/refpolicy/selinux/
+F:	package/systemd/selinux/
 F:	package/sysvinit/selinux/
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/systemd/selinux/buildroot-systemd.fc b/package/systemd/selinux/buildroot-systemd.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/systemd/selinux/buildroot-systemd.if b/package/systemd/selinux/buildroot-systemd.if
new file mode 100644
index 0000000000..7c56777c32
--- /dev/null
+++ b/package/systemd/selinux/buildroot-systemd.if
@@ -0,0 +1 @@
+## <summary>Buildroot systemd rules</summary>
diff --git a/package/systemd/selinux/buildroot-systemd.te b/package/systemd/selinux/buildroot-systemd.te
new file mode 100644
index 0000000000..8d6dee99cf
--- /dev/null
+++ b/package/systemd/selinux/buildroot-systemd.te
@@ -0,0 +1,66 @@
+policy_module(buildroot-systemd, 1.0.0)
+
+#============= sysadm_t ==============
+allow sysadm_t init_t:fd use;
+
+#============= system_dbusd_t ==============
+allow system_dbusd_t init_t:unix_stream_socket connectto;
+
+#============= systemd_generator_t ==============
+allow systemd_generator_t locale_t:dir search;
+allow systemd_generator_t locale_t:file { getattr open read };
+allow systemd_generator_t locale_t:lnk_file read;
+allow systemd_generator_t self:capability dac_override;
+allow systemd_generator_t self:process setfscreate;
+allow systemd_generator_t selinux_config_t:dir { getattr search };
+allow systemd_generator_t tty_device_t:chr_file { ioctl open read write };
+
+#============= systemd_homed_t ==============
+allow systemd_homed_t self:unix_stream_socket listen;
+allow systemd_homed_t selinux_config_t:dir search;
+
+#============= systemd_hw_t ==============
+# allow systemd_hw_t init_runtime_t:dir search;
+
+#============= systemd_journal_init_t ==============
+allow systemd_journal_init_t self:capability net_admin;
+allow systemd_journal_init_t selinux_config_t:dir { getattr search };
+
+#============= systemd_networkd_t ==============
+allow systemd_networkd_t net_conf_t:dir { getattr open read search };
+allow systemd_networkd_t selinux_config_t:dir { getattr search };
+allow systemd_networkd_t selinux_config_t:dir search;
+allow systemd_networkd_t system_dbusd_runtime_t:dir read;
+allow systemd_networkd_t system_dbusd_runtime_t:sock_file read;
+allow systemd_networkd_t var_run_t:dir read;
+
+#============= systemd_resolved_t ==============
+allow systemd_resolved_t system_dbusd_runtime_t:dir read;
+allow systemd_resolved_t system_dbusd_runtime_t:sock_file read;
+allow systemd_resolved_t var_run_t:dir read;
+
+#============= systemd_sessions_t ==============
+allow systemd_sessions_t self:capability net_admin;
+
+#============= systemd_sysctl_t ==============
+allow systemd_sysctl_t selinux_config_t:dir { getattr search };
+
+#============= systemd_sysusers_t ==============
+allow systemd_sysusers_t self:capability net_admin;
+
+#============= systemd_tmpfiles_t ==============
+allow systemd_tmpfiles_t auditd_log_t:dir { create getattr open read relabelfrom relabelto };
+allow systemd_tmpfiles_t etc_t:dir relabelfrom;
+allow systemd_tmpfiles_t etc_t:file { relabelfrom relabelto };
+allow systemd_tmpfiles_t init_t:unix_stream_socket connectto;
+allow systemd_tmpfiles_t ssh_home_t:dir { getattr relabelfrom relabelto };
+allow systemd_tmpfiles_t system_dbusd_var_lib_t:dir read;
+allow systemd_tmpfiles_t systemd_journal_t:lnk_file { read getattr relabelfrom relabelto };
+allow systemd_tmpfiles_t user_home_dir_t:dir { getattr search relabelfrom relabelto };
+allow systemd_tmpfiles_t user_home_t:dir { getattr search relabelfrom relabelto };
+allow systemd_tmpfiles_t usr_t:dir read;
+allow systemd_tmpfiles_t usr_t:file { open read };
+allow systemd_tmpfiles_t var_spool_t:dir create;
+
+#============= systemd_update_done_t ==============
+allow systemd_update_done_t self:capability net_admin;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
