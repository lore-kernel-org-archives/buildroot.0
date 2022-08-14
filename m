Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A388DC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 07:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7FD60BDD;
	Sun, 14 Aug 2022 07:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7FD60BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bcAFchhNXGs; Sun, 14 Aug 2022 07:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0375260BB1;
	Sun, 14 Aug 2022 07:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0375260BB1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B98811BF335
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 07:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9308583F16
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 07:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9308583F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7NkYt5-iEIi for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 07:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A4C7813FC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A4C7813FC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 07:51:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l22so5705956wrz.7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 00:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=MX1IfxaQCHpan3Yvd9/279SKfV7FzGKXkEIyJzez7iM=;
 b=tn4KEugbyaVlVJ9EsPwPpO7gLwg5NBXalllVdqtUO3/c8OipSht4VZkPDPItp5bftk
 CBuIGRGnW9ZnaRnNok+D9r0N1OiUdMkB8eQhnvGYZwcWWfAJQgpStN80t6PmRX+4KxlG
 kCoJkqEEoryWCPycOjEVXK7j+hEKg4rRw/APTFzsMBBWQlAN8HfoZayIyqLhPLiDBxvF
 xQX4E43EiRXMn0UJG6WcYkpIj1Rmrsb0uUgRCI+SE8Spe62GCJwpgUPy/oNpFKy9ulLR
 j5QwfFLznuSILuX7IH49nsexbpxKG6e30IsPXXgykhq1RxkVk1cevHBOVg747BX/6aSn
 K2Tg==
X-Gm-Message-State: ACgBeo0ZZYDErMaI6bqGQNzN0ZizgbD32xM2MIFDWVedgnDEdweAMN2x
 to43pu8yzVo/I0moA+OBZS8wnCVBzww=
X-Google-Smtp-Source: AA6agR4urrn2e9hhLCAH9saAiCwRwSmj+5fS/oQ4WGHGMoXRUywZzQe/njyQhD5X6akMCv2jGiysEA==
X-Received: by 2002:a05:6000:1046:b0:21f:173c:222e with SMTP id
 c6-20020a056000104600b0021f173c222emr5708316wrx.168.1660463496698; 
 Sun, 14 Aug 2022 00:51:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00623e26afd6274afb.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:623e:26af:d627:4afb])
 by smtp.gmail.com with ESMTPSA id
 o30-20020a05600c511e00b003a5dde32e4bsm4908262wms.37.2022.08.14.00.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 00:51:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 09:51:32 +0200
Message-Id: <20220814075132.2432549-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=MX1IfxaQCHpan3Yvd9/279SKfV7FzGKXkEIyJzez7iM=;
 b=KNIjBrfHQzUxE+csnUMp1McjhZOR3FGH+vxNlwjX6ik8DlLE11GIsebCkSdtLqDp2h
 Qesyj36XeqvlB7KljCo9z5bAYacYKaSFwLKxq9gD+BQk9IKWJ0apYOPBZM37s+xEiPv/
 Xs5iuY2QIJpNuu/f2Im0Btq5j0LAtRqEEjKCP4tSuveoSU4qM50bJgAS6zo6KLXEZvTs
 j5Zs/3nin4kz8V6KV2JputMfD1noD625t512sbpmJbi0sM7rDdptFa+uy93Zl13kh0J3
 NnhBp1/Jzi4m4CdwB0JL1k3vxfb/9389OWDuZRFd339sQkqSLizh8Yzjc4RNcNzN10hl
 z4bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KNIjBrfH
Subject: [Buildroot] [PATCH 1/1] package/libvirt: fix libvirtd dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a dependency to BR2_TOOLCHAIN_USES_GLIBC to fix the following
libvirtd build failure raised since commit
f81242ae4fb64ab85af5d38e70246222276552ae:

Makefile:575: *** libbsd is in the dependency chain of netcat-openbsd that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

BR2_TOOLCHAIN_USES_GLIBC is only needed by netcat-openbsd, but a
dependency on BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_NETCAT_OPENBSD
can't be added as it will create a circular dependency

An other option would be to revert
f81242ae4fb64ab85af5d38e70246222276552ae and to always mandate C++ even
if it is only needed by nmap-ncat

Fixes:
 - http://autobuild.buildroot.org/results/aada1d92df6cab0d01e27431b7b7483e3d165e79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 29098f3f55..ab8624c05f 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -39,6 +39,7 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9 # iptables
+	depends on BR2_TOOLCHAIN_USES_GLIBC # netcat-openbsd
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
@@ -51,8 +52,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
-comment "libvirtd needs a toolchain w/ headers >= 4.9"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+comment "libvirtd needs a glibc toolchain w/ headers >= 4.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_USES_GLIBC
 
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
