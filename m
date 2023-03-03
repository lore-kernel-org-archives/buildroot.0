Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A700CC64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 07:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1A141986;
	Fri,  3 Mar 2023 07:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1A141986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r980NdNpzwpN; Fri,  3 Mar 2023 07:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE48419D8;
	Fri,  3 Mar 2023 07:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE48419D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6344D1BF3FC
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D289419D8
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D289419D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fzO0Z8ayquC for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 07:39:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55E1741986
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55E1741986
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:39:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r18so1373590wrx.1
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STIqdtVPq4kPw0y/1OjgHL62lYGpWgIkC0R/0cVdQc8=;
 b=qzZFNzF4E8e4+M9ONuuTVeO9RUN4Mv5vNCj/oT6IVgWJs3Qoft7gneTNYl4tpNdQMN
 HiwZL7hIbnGakTDhU1UAR3Xv3VMkaO7xaqA/TsVsr/etQh7JeotCBcLsJGRfCBlRWmQq
 joKY40B+/7md/Eo5oIqaX0zl1FhL2RQhX9uSHCNXaUhV1DdUpz7JqVI/mqnv501IodW+
 ylMqW5sb6Ov63+WD3LZFvj3m9ukx/7BFp4nxCoZwya6nrFlxFXMerJwpDeAEZ4rZ3ftA
 lqbkQ8Q2ssQRz9vsUxLEFRyYZq6iRXJXOXpAjCWrm6nnqufa9CagekLT+PPjTLg7TZD3
 j35g==
X-Gm-Message-State: AO0yUKW9OL8isETfpLTzSdp3dzfTjgU6POKbYBYffm43lx7LJSpTmrUu
 Ma7ShiQ3pFkmWkvlfgQuBZH4FH9sD/Xs3njd
X-Google-Smtp-Source: AK7set++MwnRial4Rqh0lYb8T2h+DRA+tGiSMaifbUWNkyQd4qQ94tVjs1kQMQe9PAooDC4KMZfcRw==
X-Received: by 2002:a05:6000:52:b0:2c7:15a5:439d with SMTP id
 k18-20020a056000005200b002c715a5439dmr756884wrx.8.1677829162132; 
 Thu, 02 Mar 2023 23:39:22 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:98b4:4a16:150e:c276])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a5d5150000000b002c559843748sm1419576wrt.10.2023.03.02.23.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 23:39:21 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 08:39:07 +0100
Message-Id: <20230303073909.1798364-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=STIqdtVPq4kPw0y/1OjgHL62lYGpWgIkC0R/0cVdQc8=;
 b=UwxBg8bTYfx7yyALRmBLV8Dywae/T5srkH9XLIDTh/uB7Ba/iXhNTNVYQqzoqtm+37
 pPk5Mx0r74wgUOCVNJp4efKFopekFY+NUsT6Am1g/gZzXZu7laPT1AV2LenT7yHijyIo
 WW6/oPA6EdagoBz6xhyu0bZt3tonX2k4jYMZvsKTYgSvxyufrPA1E4IUbHTSBLOa+ic2
 nn7Hz0JNz/hSYp6hBC/YaCgNOAHKG5jFenvHRE0RZPWNk4zhPWtLrkl1EiIGSowGNv3m
 pURt30URIwYkLYBrOjJuyfPoHsf3F8lLuayS8Xv/MUYHxrb2dwKh7av/akmUuWdLLQQ7
 QKAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=UwxBg8bT
Subject: [Buildroot] [PATCH v3 1/2] package/nushell: new package
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
Content-Type: multipart/mixed; boundary="===============9048371482022721592=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9048371482022721592==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Nushell is a shell - written in Rust - that makes use of the nushell
language to interact with the operating system

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
If you connect via a serial port and use getty (default for busybox)
nushell will be unusable. One needs to either connect via SSH or use
agetty instead.

Nushell is not POSIX compliant and therefore should not be used as login
shell since some programs might assume a POSIX-compliant shell and
therefore break the system.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/nushell/Config.in    |  9 +++++++++
 package/nushell/nushell.hash |  2 ++
 package/nushell/nushell.mk   | 20 ++++++++++++++++++++
 5 files changed, 35 insertions(+)
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
index 0000000000..f666f44e47
--- /dev/null
+++ b/package/nushell/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NUSHELL
+	bool "nushell"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
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
index 0000000000..7de02cfc6a
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
+NUSHELL_DEPENDENCIES = openssl host-pkgconf
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


--===============9048371482022721592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9048371482022721592==--
