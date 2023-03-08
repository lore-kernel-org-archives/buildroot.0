Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9754C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 318CB400B9;
	Wed,  8 Mar 2023 08:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 318CB400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwUZ4nRAiImk; Wed,  8 Mar 2023 08:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65A63400CC;
	Wed,  8 Mar 2023 08:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A63400CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 736251BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5323F80E99
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5323F80E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQN-CnvkbDh7 for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:27:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD8EA80DCB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD8EA80DCB
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:27:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bx12so14505401wrb.11
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 00:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678264056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRtMovjPsn9JHtQvS7ehaLGXBP0lMkiAct3/TwQOhm4=;
 b=WeA4pyHfFbgvpOoS0DHqroAkU2j+dQvtGizb2k5NofS4MPiB3BUgBvDG1moYF5Zsic
 GIJJZ6oTGfApeOxDI/A8CKlcEhg7C7RAUl728ZtXl14w9hhoQngQPFqyPdDqonOfVmoI
 HxhFBDO1K4gyTMy2r3EJ1B42hEfqZa+nX5teZXTADpY5qx0tANApRMfz+jcjcSrQuQxr
 iDP6lh+IJfjSjE1Vgu694Pm/B96AgwN+ohOJ2LhVOKvdmvQfnZH3UTRJVAPGeRO3N+LO
 cDu4/ExTVnuhKPkDO7erERWRhvXNKxwenx7Jm2ZLwhWeuZtwnmGDUzaE9hxNLD5m1UCL
 WjMA==
X-Gm-Message-State: AO0yUKWeZ8rmiFJBIrwzNIsAutfMarYpueiO/uvpOjEtRnlf8hjH/0++
 FpKbGtuLWGTei7PgtYKr8Kg2bXJJZIkEmGJIBDQ=
X-Google-Smtp-Source: AK7set+64IKyn65Cfj27FN6UFjqx5J2rz4lY7efDCaXkFhwbFtJ6G4Q48Vs9LDnPObbreMln8Jrucg==
X-Received: by 2002:adf:decf:0:b0:2c7:70c:2d8c with SMTP id
 i15-20020adfdecf000000b002c7070c2d8cmr10856460wrn.35.1678264056694; 
 Wed, 08 Mar 2023 00:27:36 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600018c900b002c5a1bd5280sm14531683wrq.95.2023.03.08.00.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:27:36 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 09:27:13 +0100
Message-Id: <20230308082716.54730-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678264056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRtMovjPsn9JHtQvS7ehaLGXBP0lMkiAct3/TwQOhm4=;
 b=mzupJW+CXAA/cSmoX3ly6hRKeegiRSwtYLXpFt/HNmDFrdgOgmPNs2dcSkR5gUFXdu
 gU0LM6CTkyesM0DbUvtLQuoWmGcvJP/3hjesIn2mmxQzWv1w2sAq+sjOYGoYFD1tX4d9
 NfJtVEQ/I2c5yM9KnPx5FE95+AKbW+jrkD4JhudQkNocXXqHelBNhQr/FYVtIOBwTBPX
 eT4EMpBAYxCQFEdcDbtU2enJmsbFFU2qokVwkt5+/VM1CLM5UCc857TFV9G+DHNX5/lp
 Gm94RYmXnYItTxoZy4GzHRREIcm92je6Lkib8oubRsDYeLV1EzSXoOvCl3WkRe3L24kZ
 wAiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=mzupJW+C
Subject: [Buildroot] [PATCH v4 1/3] package/nushell: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============4423308147531981511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4423308147531981511==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Nushell is a shell - written in Rust - that makes use of the nushell
language to interact with the operating system

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
This new version adds ncurses-target-progs as a dependency which is a
hidden dependency of nushell. With this option enabled, nushell is also
usable without specifically replacing getty by agetty.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/nushell/Config.in    | 12 ++++++++++++
 package/nushell/nushell.hash |  2 ++
 package/nushell/nushell.mk   | 20 ++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/nushell/Config.in
 create mode 100644 package/nushell/nushell.hash
 create mode 100644 package/nushell/nushell.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6256576e02..4577f20b22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2550,6 +2550,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:  Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/nushell/
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
diff --git a/package/Config.in b/package/Config.in
index 3ace25c665..7fca46afb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2577,6 +2577,7 @@ comment "Shells"
 	source "package/bash/Config.in"
 	source "package/dash/Config.in"
 	source "package/mksh/Config.in"
+	source "package/nushell/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/apg/Config.in"
diff --git a/package/nushell/Config.in b/package/nushell/Config.in
new file mode 100644
index 0000000000..edb01d2f72
--- /dev/null
+++ b/package/nushell/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NUSHELL
+	bool "nushell"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_HOST_PKGCONF
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PROGS
+	help
+	  A new type of shell.
+
+	  https://github.com/nushell/nushell
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
new file mode 100644
index 0000000000..a77e711a5d
--- /dev/null
+++ b/package/nushell/nushell.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256  352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a  nushell-0.76.0.tar.gz
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
new file mode 100644
index 0000000000..836f414d0a
--- /dev/null
+++ b/package/nushell/nushell.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# nushell
+#
+################################################################################
+
+NUSHELL_VERSION = 0.76.0
+NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
+NUSHELL_LICENSE = MIT
+NUSHELL_LICENSE_FILES = LICENSE
+NUSHELL_DEPENDENCIES = openssl host-pkgconf ncurses
+
+# Add /bin/nu to /etc/shells as in package/bash/bash.mk
+define NUSHELL_ADD_NU_TO_SHELLS
+	grep -qsE '^/bin/nu$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/nu" >> $(TARGET_DIR)/etc/shells
+endef
+NUSHELL_TARGET_FINALIZE_HOOKS += NUSHELL_ADD_NU_TO_SHELLS
+
+$(eval $(cargo-package))
-- 
2.25.1


--===============4423308147531981511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4423308147531981511==--
