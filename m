Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F8FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F20E34032E;
	Sun,  6 Feb 2022 10:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJFuidwhu17c; Sun,  6 Feb 2022 10:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFB20401ED;
	Sun,  6 Feb 2022 10:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 009E81BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3781817D3
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9q5e0u0QCeU for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:11:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF652813A7
 for <buildroot@busybox.net>; Sun,  6 Feb 2022 10:11:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso6658056wms.2
 for <buildroot@busybox.net>; Sun, 06 Feb 2022 02:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bC7zH2lLnIzBg4JSOA1SHc/Td1FDwisgzf6FFlIpTRY=;
 b=DPimizUNvF8Wb0aGjTZ41jdnKtoxOfrMtCNAFvtn/WD59ni52U3dhvXgFvreXZ0CNU
 ecDKdK8exD5sRqEIpUUNlGTg6rwj78Med+CfohCboc4TYSpwbGLXQrB4rrAn0B5p0Iic
 O9n/4cTE83g7VjCR7hNAIs1Hnrr6bO0Hs5ydyCg780nNFNVhmuQIjl4VicHzk7QtCqSf
 fyIBzvGUSKQ34qCgr3KxZnfy0xpwMtPz3L7Bb0Cp3BtjaCOeSjmkp5CO8R0ualJ1MRr0
 GKNRCtW03H5DFvPI2+gV7h7uCHUdaSux72pPyhPdVJhttd3TlYAZBXM5PL+532SbhmPE
 P/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bC7zH2lLnIzBg4JSOA1SHc/Td1FDwisgzf6FFlIpTRY=;
 b=QFKawBO9dmkoE3T7HNw7GCfrPQQfBxxYt9Dy1FPjA8SwDuYQg9tDllxYZFZJJ3uwEp
 yicQ0uzLVvAZdIpU8gIMkAmOo1mflPGb7Vn3ovhFzCmSHUCXPmmPq6SqLoHPolDgGfa1
 hj0VSkEfRY/rfy6as2EIkGwCKVKQOdDpgd9ol50GI25KvpWABUUXx+VcS74EvL0Miq2h
 OA98Th99XXOoxxEEh1yQPw2OkftAuzwlk76W2hCZ96g/HjHifyAAisG+e8F7yz875uwD
 2EKScnubxJd3HLXGrCSr0LH6AkR5hx+cAXUNHRoU6Cd2ijUXPidPek5i1Wyg7VooVzw5
 jxig==
X-Gm-Message-State: AOAM531MpbfNJ7wYslh+7Ut+WkHeUO8eJzU/vzjsUxvDqVTiRgzBt4Vt
 i3rNpyhzs1zYkrtuKEoI7TR7M05KQCE=
X-Google-Smtp-Source: ABdhPJxkaRHCSX+YPMD6O6SOwuCuCmrN/sAz6C16qcRlywdICVbuE1UX5xFnMbDh5VDtujxPI8ffNw==
X-Received: by 2002:a05:600c:4186:: with SMTP id
 p6mr6458226wmh.12.1644142306730; 
 Sun, 06 Feb 2022 02:11:46 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id d7sm141165wrw.98.2022.02.06.02.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:11:46 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun,  6 Feb 2022 11:11:34 +0100
Message-Id: <20220206101134.30291-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mbw: new package
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/mbw/Config.in |  7 +++++++
 package/mbw/mbw.hash  |  3 +++
 package/mbw/mbw.mk    | 20 ++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/mbw/Config.in
 create mode 100644 package/mbw/mbw.hash
 create mode 100644 package/mbw/mbw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1ec9a091e..acc87aa007 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1148,6 +1148,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
+F:	package/mbw/
 F:	package/pixiewps/
 F:	package/python-pybind/
 F:	package/reaver/
diff --git a/package/Config.in b/package/Config.in
index e4ca195beb..8445173633 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
+	source "package/mbw/Config.in"
 	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
 	source "package/netperf/Config.in"
diff --git a/package/mbw/Config.in b/package/mbw/Config.in
new file mode 100644
index 0000000000..7bafa35359
--- /dev/null
+++ b/package/mbw/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MBW
+	bool "mbw"
+	help
+	  MBW is a memory bandwidth benchmarking tool.
+	  MBW determines the "copy" memory bandwidth available
+	  to userspace programs.
+	  https://github.com/raas/mbw
diff --git a/package/mbw/mbw.hash b/package/mbw/mbw.hash
new file mode 100644
index 0000000000..966b3c9dae
--- /dev/null
+++ b/package/mbw/mbw.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9f7365c752f4dfe0d7d46c599ff1e4b412179be764b0d712269d7ee61e0cf718  mbw-1.4.tar.gz
+sha256  43a285e18a2158494b099645e1ea3514452c085927b34856d39c1f6917c7d04d  mbw.spec
diff --git a/package/mbw/mbw.mk b/package/mbw/mbw.mk
new file mode 100644
index 0000000000..fb599d0bfd
--- /dev/null
+++ b/package/mbw/mbw.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mbw
+#
+################################################################################
+
+MBW_VERSION = 1.4
+MBW_SITE = $(call github,raas,mbw,v$(MBW_VERSION))
+MBW_LICENSE = LGPL-2.1
+MBW_LICENSE_FILES = mbw.spec
+
+define MBW_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define MBW_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/mbw $(TARGET_DIR)/usr/sbin
+endef
+
+$(eval $(generic-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
