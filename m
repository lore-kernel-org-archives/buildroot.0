Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E65C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CE7B40185;
	Sat,  8 Jan 2022 22:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NItIJPo0Q04R; Sat,  8 Jan 2022 22:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 044F040220;
	Sat,  8 Jan 2022 22:39:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A89D11BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A38F0813C3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWnbH9q5Zg4Q for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:39:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6463A8135A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:39:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e9so17285403wra.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEoCjsEhQY4iJqbeuS46nolwGuMbtnUfKFsNQxbGFdI=;
 b=EzQZvWa8+E+e2l/rELEA4QKOsdIsWzwoCzzHIPiwGOiB+t5VAMD8CC1Jqh/sGZckeY
 U5jkL+UkOTq8tAZZFS4fya28JfRGY/G3S2V1L3v6NmPe2r8L/bJm9ltQ5A0ufh4axAq3
 +bFx9YleZZlI2DzKub1aBgfejBrRqjz1L+Qk3Bz+Ld/MkyejkjfYeyH637aRJeEYUC43
 XkMp6lahhJZY+jFiDQdg4miF3lpD/WfUSkMRkeU18E9B+RKRb4J9yileWwwB5V1CrYjJ
 dHt9m9smUPJX7Rr/uahKM89saeOZqHkyqqkP2d79/znrhoidtjUD4ahIbxiaGMSRCqKv
 bXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEoCjsEhQY4iJqbeuS46nolwGuMbtnUfKFsNQxbGFdI=;
 b=m+/xJBnBXHchI87AR3VqzG1wWW1HpCEmAseKAR/KDqnyHeyNzdxn9ZAVYW6jm5n9Zi
 K3QxIyP4l4f9YOF1H+35ZhPEXZJvT+Q15OIfOYh4A1Z4C28marfdLiPWbn14fnItfpv7
 BQ+qTwNHiwIfDjxaxozdak8pJCMYXv+oGvSnMJwUPmNHggZU7G849g0zI6BZ5SuOWbef
 X9pF3sbP41e/1uSCcisgUBVsRPP2/YitolJcBJfJjUo8jQGNp6dTjDkUECGmWSWJJifs
 yZdxtbO3jG03pemMe2AXJzjIfIEhEoeK58bgFr5gTqcoReo6wUJYYaVS2kWfKFXW8zVd
 /Mrw==
X-Gm-Message-State: AOAM531kyzLBSDdcZu/g8Q6H8G6DMtMhY1uaI452jEkX80rYvN2ZGEnw
 2/xo38plOb/0n3WI1qlcn6aQXKtVAZA=
X-Google-Smtp-Source: ABdhPJyJdbKBjE4sq6tN7aDuEDQK6KQVWHjZ0PPBpEj+ektWkhpnYJDCB0mm9xArKJzlGfbD/kOYdg==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr61968361wrz.350.1641681588536; 
 Sat, 08 Jan 2022 14:39:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g9sm2778267wmq.22.2022.01.08.14.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 14:39:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:38:28 +0100
Message-Id: <20220108223829.3701891-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libmd: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This library provides message digest functions found on BSD systems
either on their libc (NetBSD, OpenBSD) or libmd (FreeBSD, DragonflyBSD,
macOS, Solaris) libraries and lacking on others like GNU systems.

https://www.hadrons.org/software/libmd/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/libmd/Config.in  |  9 +++++++++
 package/libmd/libmd.hash |  5 +++++
 package/libmd/libmd.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/libmd/Config.in
 create mode 100644 package/libmd/libmd.hash
 create mode 100644 package/libmd/libmd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cb06de820d..c1ccab966c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -899,6 +899,7 @@ F:	package/libidn2/
 F:	package/libjpeg/
 F:	package/liblockfile/
 F:	package/libmatroska/
+F:	package/libmd/
 F:	package/libmpdclient/
 F:	package/libnetfilter_conntrack/
 F:	package/libnetfilter_queue/
diff --git a/package/Config.in b/package/Config.in
index ad542ac8bc..d8ee96a588 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1412,6 +1412,7 @@ menu "Crypto"
 	source "package/libgpgme/Config.in"
 	source "package/libkcapi/Config.in"
 	source "package/libksba/Config.in"
+	source "package/libmd/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
 	source "package/libolm/Config.in"
diff --git a/package/libmd/Config.in b/package/libmd/Config.in
new file mode 100644
index 0000000000..63139ad69b
--- /dev/null
+++ b/package/libmd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBMD
+	bool "libmd"
+	help
+	  This library provides message digest functions found on BSD
+	  systems either on their libc (NetBSD, OpenBSD) or libmd
+	  (FreeBSD, DragonflyBSD, macOS, Solaris) libraries and lacking
+	  on others like GNU systems.
+
+	  https://www.hadrons.org/software/libmd/
diff --git a/package/libmd/libmd.hash b/package/libmd/libmd.hash
new file mode 100644
index 0000000000..1a3c9d80df
--- /dev/null
+++ b/package/libmd/libmd.hash
@@ -0,0 +1,5 @@
+# From https://lists.freedesktop.org/archives/libbsd/2021-October/000311.html
+sha512  731553ecc5e0e1eb228cced8fccd531fe31fb5c7627ca30013d287e1aeb8222959cf7498fbb7414bbabb967b25d4e8b0edd54fc47f6ccf55fc91087db0725ce3  libmd-1.0.4.tar.xz
+
+# Hash for license file
+sha256  4365ef6255ad553fce69dd4bc0e093472c5d0e41b8ea493a545cc926ce171aa6  COPYING
diff --git a/package/libmd/libmd.mk b/package/libmd/libmd.mk
new file mode 100644
index 0000000000..19a2458982
--- /dev/null
+++ b/package/libmd/libmd.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libmd
+#
+################################################################################
+
+LIBMD_VERSION = 1.0.4
+LIBMD_SOURCE = libmd-$(LIBMD_VERSION).tar.xz
+LIBMD_SITE = https://archive.hadrons.org/software/libmd
+LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, Public Domain
+LIBMD_LICENSE_FILES = COPYING
+LIBMD_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
