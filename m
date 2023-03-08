Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D4AC678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1CD6113B;
	Wed,  8 Mar 2023 08:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B1CD6113B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QEwg63k047d; Wed,  8 Mar 2023 08:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ACAF61135;
	Wed,  8 Mar 2023 08:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACAF61135
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E41D11BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF9340BB8
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF9340BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Slr4_x80nRiF for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:54:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5E840BB1
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F5E840BB1
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:54:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h14so14596794wru.4
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 00:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678265638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRtMovjPsn9JHtQvS7ehaLGXBP0lMkiAct3/TwQOhm4=;
 b=Lc6hJ1kpYwRkt2w4raUEasVYO+SEHC+LSaf+8k7XpEu/Qki6qpxLD47V48gS1q2/DO
 XLFKPg+SdfGsqHQE0VZ0gP/UARRj9/5GzweiJek9nAn82w2i8UZr/vci1tdJKUdF0QVf
 SVmRhQqDqCsFKKql5/OdmceWDg2SHYdgqRCUB3YhyeLAu4v6kavztpKzR4lQvSb5HTMD
 /nSRwsir0JqfxdDP3JknSxyBFyTirWoWMUUXiZqi4yqpds40NmXJLHvp4Cr2aiX6rMCS
 y4VZSZvg5ffjuXy5HH5MlM8hLopcl1cC+1TppvgLBuRzXffbJ8cF+x/4yLWTam3bupxG
 +JOQ==
X-Gm-Message-State: AO0yUKXPUr5taR4hnV/TYs08qDVIhNkjeMN8t5kYlVuqEiLyCvxjeQN9
 G0paHz0cU1mw4H49vc9ZfxWWY/VGY/cmV3vk6sg=
X-Google-Smtp-Source: AK7set8zZ+NHfBTsUdR6oZYJKr8kLkwFZezUfes0faVAWM1AZRJDWckGuGalQh5pea4ALv19TG5QKg==
X-Received: by 2002:adf:fa4e:0:b0:2c7:7b3:36c6 with SMTP id
 y14-20020adffa4e000000b002c707b336c6mr10905303wrr.52.1678265638482; 
 Wed, 08 Mar 2023 00:53:58 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a5d508d000000b002c54536c662sm14879471wrt.34.2023.03.08.00.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:53:58 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 09:53:51 +0100
Message-Id: <20230308085354.127183-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678265638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRtMovjPsn9JHtQvS7ehaLGXBP0lMkiAct3/TwQOhm4=;
 b=Wvdj+iIMzv+JgIhKrCz7aH9IhXgY1ZFwN2F1AddaX4dEuyWBhciJa2xq+DRk0rLPyb
 ToBI9aPXGh5aJgoqXpNMksMKHjy7bHRSm4WJj9jFUCbrBgs9/zdY3540aa2IXessiiR2
 9boxA7aPwz8oefh71LKi0N1R8iqxhughrljbRzHkHUbQ+qid0Jkw3ZFiDzIhzFEWYo7w
 ELsVmNvh6bww0eZmzI6kG0u+AsEGWMKjNBeGXdvVQkEfxXsl8ZIvnAffqSf35RR8W2Vb
 ZWMb5Plmhzi80dQlY2ApAkCUK6dlvH71YEj+k0Gt0Em1X501Bx/nlHtShUsoKgvDaZMJ
 3Ang==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Wvdj+iIM
Subject: [Buildroot] [PATCH v5 1/3] package/nushell: new package
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
Content-Type: multipart/mixed; boundary="===============7970507961253880360=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7970507961253880360==
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


--===============7970507961253880360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7970507961253880360==--
