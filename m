Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C83C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 10:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E3F40190;
	Tue, 28 Dec 2021 10:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKseB56BmGMm; Tue, 28 Dec 2021 10:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 136E440111;
	Tue, 28 Dec 2021 10:22:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36E221BF362
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 256B960AD4
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGh_-zYepD1g for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 10:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A5BF60AD1
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 10:22:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q16so37439348wrg.7
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k1B19TVBxslCzL8wrjnn50Tjg03LvFB/E2EKCF5SKeE=;
 b=ezpP6SLXvTPeAxPx8bIvzzsllp9KkFb70N5fVGtcJizyoqzPhcNyKB+JDtLzR+7KV9
 AuL38j44tvCUsV73AqiRh/WBYFUebEaDmjGR1B5oVDEGayzwV6i7PeTNorkvWugXoVtr
 2CvFddiYF6B3aVYbx3YHWQwMHKDoZos+gqvuyFUAcsvx5Pxul/N0UDbCFoaECxta0PGM
 d+kN4znyC4wZ9OOGVcMBqNenOB8ZN9bLc1To4/OcW365SqXwSbXntemK04kW+/nF/MBo
 YH+NqvOqHODLjJsEy0r5LJPmIjAbEtum2zHWUDDBM03sAWHLHyq4PNR/ityVauNbN+Dx
 apZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k1B19TVBxslCzL8wrjnn50Tjg03LvFB/E2EKCF5SKeE=;
 b=wcvbFJbeU0nCwzYAjKxpX7jYmAMNdZYT3+s6i43Whfcs+vYfwgEpyx9Z5aaoyiyWxa
 eioHfW/ZF9TLaH15Jh3fOzkVgEmfYmSkZCqcWC7qRv8xFeanSS6isF/vLG/mopIPFMHM
 iQ1HnwY6LdSDvX8z+ClDhRliHEWPUY89eEtPYOOq5Z+jCdyE4dl8koJjDsxgysYaP0b9
 IrZpdBtHXlM8PHw9CiTIjj5WwrweX7rsfrv3IlemR8KeVtZP+ifNgTY6litm+KjzhMJ1
 JVZ+uTScpMHdpqxdaWCxAo68UUKMRQJYDZZPyoKtO8L21809huS8zYw3JDGHP12koPeM
 in0A==
X-Gm-Message-State: AOAM533YxWYVmG3J0yY53JtsgLtTi3HqAi2vSoBXAeSNDKSdMcNDO2RU
 qRMPldRnJDfVpNpq1OpIvXuHGbzcIH7nVw==
X-Google-Smtp-Source: ABdhPJxgybleYD1Fwthmr2zXHX/Cl3Js6ym1pt+DELcjA4HaTDhCVak/ZdvnOGJj0jmeyaG/gELajg==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr15510342wru.57.1640686944252; 
 Tue, 28 Dec 2021 02:22:24 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i8sm18635786wmq.4.2021.12.28.02.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 02:22:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 11:21:27 +0100
Message-Id: <20211228102130.3575690-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/libsigc: bump to version 3.0.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change license to LGPL-3.0+:
https://github.com/libsigcplusplus/libsigcplusplus/commit/8a231956bc0a8d9c5d0db59a3eaf4311ee36275f

https://github.com/libsigcplusplus/libsigcplusplus/blob/3.0.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsigc/libsigc.hash | 6 +++---
 package/libsigc/libsigc.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index d631185a41..97c9d0cc84 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.6.sha256sum
-sha256  dda176dc4681bda9d5a2ac1bc55273bdd381662b7a6d49e918267d13e8774e1b  libsigc++-2.10.6.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.7.sha256sum
+sha256  bfbe91c0d094ea6bbc6cbd3909b7d98c6561eea8b6d9c0c25add906a6e83d733  libsigc++-3.0.7.tar.xz
 
 # Locally calculated
-sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
+sha256  97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b  COPYING
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 6539fdbdb6..18be25fd03 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 2.10
-LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).6
+LIBSIGC_VERSION_MAJOR = 3.0
+LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).7
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_INSTALL_STAGING = YES
-LIBSIGC_LICENSE = LGPL-2.1+
+LIBSIGC_LICENSE = LGPL-3.0+
 LIBSIGC_LICENSE_FILES = COPYING
 LIBSIGC_CONF_OPTS = \
 	-Dbuild-examples=false \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
