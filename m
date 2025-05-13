Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37D7C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 11:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB9C8200C;
	Tue, 13 May 2025 11:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QviW0Gs9YX8i; Tue, 13 May 2025 11:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2448782026
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2448782026;
	Tue, 13 May 2025 11:58:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49D8F153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F66B60E02
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3go8cY0DzbZZ for <buildroot@buildroot.org>;
 Tue, 13 May 2025 11:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0AB46067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0AB46067D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0AB46067D
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:58:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad23e8fcc38so64451666b.2
 for <buildroot@buildroot.org>; Tue, 13 May 2025 04:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747137527; x=1747742327;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uOJSdxiFGp4FBb8+AKEJEs86ZkLaRf65/Rf/nvNtL3Y=;
 b=n8rIr7qUCZ6c+r9HzEhshu4XAWCpV2kp2yKDvCHbPcBJqjHOFrQfFL8+Zq2SIV+w3B
 3g/e2bWLChrPTH6g4a9AXb1YBqrVm/D0fSBXr5/Lg39ZxPIBJOhEEhkdylfCtOCIorEH
 wPjJUUsAnGdGSp/fkFSEztnBB2HZUH2r8IUWEwqm9m9+FaxOZ+uzZ1pkcj7tN+ijW8qg
 jJvwp7ZxhWbaitEFXGkmDiYXN2uKKMhN/Pt+aKkmVg/Uz2+iEcQaLwPSbPujm2xW7MmQ
 NhOldFMfk/iau/I9lN5AC/VGGQeP/ovK/RfahgrdUp6CN5TsWKrPpUIyJof/PCPWgojY
 GHJQ==
X-Gm-Message-State: AOJu0YxgoI5GQegpv1gwMTK5zCKbp39g4PCBdSoR9U5LrhuPL7scPkTH
 vC9lAviewkkwiCtPtPTs7VDcxQhaN+pmPHS2u50XMGEErnWh7XJMLhsbN845pFeKSwh3IIMJhmK
 rGn4=
X-Gm-Gg: ASbGncvNLIC41cHB1h9vDBRbnyUOKnEZAdzvifz6v5nqbe2wTN5+nQNdXbQpfmZ58XT
 OHES0gmKFfp5YRPBPR29thCQfXYKNHeML+m7lr4Z37tFBNtAqZ8z/m0jnUJZ1agOqV579ocyUTP
 gixRzQJwDluz+yEfn2Dr0BDIO7A9xAPq9IhiZWvIdED3LR4SO8OI+q2eKGPtar05opfBZGZ3LxE
 AB15Ad8lOFgKtgTrSORNoTnJ6MGXf8ZDS7BbBXy5fNVO/25Vs9IAtirIo+V4f6E6nT4i0Y5XcMa
 aYhxPrmho9z8FYcIrBzMHr4G+eUg7PfyjikDGj9nG1/HQvio0meF5RDErgMdp4MRPYyu+v8r0dV
 liQD6F3x78T1innHfJaLV+6353PJdgqHuc+fzkJNUduk30PFRXHJssx5RuAQPTjf7jkbTZHqCW2
 UHFF1Y+jFBWMvwLi8=
X-Google-Smtp-Source: AGHT+IE85LPJ9mACl7Z6rtDQQZzSW4tN3umvIoDdrMR47zoItVFWjatfgNu2jK3bRDW7lhZBdmEaQg==
X-Received: by 2002:a17:906:9907:b0:ad2:1bd1:4fb8 with SMTP id
 a640c23a62f3a-ad21bd153b3mr510563666b.15.1747137527274; 
 Tue, 13 May 2025 04:58:47 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad223d5c4aasm694150666b.22.2025.05.13.04.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 04:58:46 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 13 May 2025 13:58:44 +0200
Message-ID: <20250513115844.135963-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747137527; x=1747742327;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uOJSdxiFGp4FBb8+AKEJEs86ZkLaRf65/Rf/nvNtL3Y=;
 b=SY9K6Ab+/r8DeDxqMDVdFeO8Z4ZldZlby2GOolGyxXI4Ys+6Tpsxv+0Co9uH8rQx1O
 ay24vehq9QhJqANYil2uaLkBT3GyJ11+zD+tbZkudCVap9XGPRzC/pQN/bOhl0LCN87g
 5pZ4yBRJducrMtD0LdlRPZ0PPJM0LGZddfcLA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SY9K6Ab+
Subject: [Buildroot] [PATCH 1/1] package/openrc: bump to version 0.62.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove 0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch as the
meson build now automatically creates the symlinks for tty1 - tty6.

All tests pass.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...so-create-run-lock-subsys-directory.patch} |  2 ++
 ...-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch | 35 -------------------
 ...06-allow-setting-rc_libexecdir-path.patch} |  9 +++--
 package/openrc/openrc.hash                    |  2 +-
 package/openrc/openrc.mk                      |  2 +-
 5 files changed, 10 insertions(+), 40 deletions(-)
 rename package/openrc/{0006-Also-create-run-lock-subsys-directory.patch => 0005-Also-create-run-lock-subsys-directory.patch} (91%)
 delete mode 100644 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
 rename package/openrc/{0007-allow-setting-rc_libexecdir-path.patch => 0006-allow-setting-rc_libexecdir-path.patch} (83%)

diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0005-Also-create-run-lock-subsys-directory.patch
similarity index 91%
rename from package/openrc/0006-Also-create-run-lock-subsys-directory.patch
rename to package/openrc/0005-Also-create-run-lock-subsys-directory.patch
index ad78a4b8f7..14b4185cd4 100644
--- a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
+++ b/package/openrc/0005-Also-create-run-lock-subsys-directory.patch
@@ -7,6 +7,8 @@ Buildroot service scripts regularly use this directory, so
 create it in the most appropriate spot.
 
 Signed-off-by: Norbert Lange <nolange79@gmail.com>
+[Adam: update for 0.62.2]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  sh/init.sh.Linux.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
deleted file mode 100644
index 42f77ffdea..0000000000
--- a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 014dc43447fa553e875984ac4a528e5916cc9e06 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Sat, 29 Feb 2020 22:41:30 -0300
-Subject: [PATCH] runlevels: do not add agetty.tty[1-6] if MKSYSVINIT=yes
-
-Buildroot starts a single getty, according to the system configuration.
-Also tty[1-6] may not exist (e.g. embedded devices with serial consoles
-only).
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
-[Adam: update for 0.50]
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- tools/meson_runlevels.sh | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/tools/meson_runlevels.sh b/tools/meson_runlevels.sh
-index 1473d4e..eee256b 100755
---- a/tools/meson_runlevels.sh
-+++ b/tools/meson_runlevels.sh
-@@ -91,11 +91,5 @@ if ! test -d "${DESTDIR}${shutdowndir}"; then
- 		ln -snf "${init_d_dir}/$x" "${DESTDIR}${shutdowndir}/$x"
- 	done
- fi
--if test "${sysvinit}" = yes && test "${os}" = Linux; then \
--	for x in tty1 tty2 tty3 tty4 tty5 tty6; do
--		ln -snf "${init_d_dir}/agetty" "${DESTDIR}/${init_d_dir}/agetty.$x"
--		ln -snf "${init_d_dir}/agetty.$x" "${DESTDIR}/${defaultdir}/agetty.$x"
--	done;
--fi
- 
- ln -snf "${rc_libexecdir}"/sh/functions.sh "${DESTDIR}/${init_d_dir}"
--- 
-2.18.2
-
diff --git a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch b/package/openrc/0006-allow-setting-rc_libexecdir-path.patch
similarity index 83%
rename from package/openrc/0007-allow-setting-rc_libexecdir-path.patch
rename to package/openrc/0006-allow-setting-rc_libexecdir-path.patch
index 5787c26dde..8ca97d8713 100644
--- a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
+++ b/package/openrc/0006-allow-setting-rc_libexecdir-path.patch
@@ -9,7 +9,7 @@ Subject: [PATCH] allow setting rc_libexecdir path
 Upstream: https://github.com/OpenRC/openrc/pull/443
 
 Signed-off-by: artoo <artoo@artixlinux.org>
-[Adam: update for 0.56]
+[Adam: update for 0.62.2]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  meson.build       | 2 +-
@@ -30,15 +30,18 @@ index 5b3f8fa..40d4be1 100644
  rc_sbindir = rc_libexecdir / 'sbin'
  rc_shdir = rc_libexecdir / 'sh'
 diff --git a/meson_options.txt b/meson_options.txt
-index 2c74152..d2f67e4 100644
+index 8cefbbb..9d58de0 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -26,3 +26,5 @@ option('sysvinit', type : 'boolean', value : false,
+@@ -28,6 +28,8 @@ option('sysvinit', type : 'boolean', value : false,
    description : 'enable SysVinit compatibility (linux only)')
  option('zsh-completions', type : 'boolean',
    description : 'install zsh completions')
 +option('librcdir', type : 'string', value : 'rc',
 +  description : 'default location of rc libexec dir')
+ option('agetty', type: 'array',
+   value: ['tty1', 'tty2', 'tty3', 'tty4', 'tty5', 'tty6'],
+   description : 'agetty symlinks to install when sysvinit is also specified')
 -- 
 2.41.0
 
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index 85e869f82a..6f74c315e1 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a06b530290057637eab17fc943cbf79c0335eb734ba71ece38b9f3acd8a341d4  openrc-0.56.tar.gz
+sha256  bddb0fe1c0cc5074439255d17ae92eeb989322f02eac0536f4924b9d96cd73a0  openrc-0.62.2.tar.gz
 sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 67846ce0ea..dd8069bd21 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.56
+OPENRC_VERSION = 0.62.2
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
