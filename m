Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A2AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 10:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A9660B2E;
	Fri, 11 Nov 2022 10:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66A9660B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbbgDYZCERhX; Fri, 11 Nov 2022 10:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7CA60B26;
	Fri, 11 Nov 2022 10:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7CA60B26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69A1D1BF2C8
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 418F340407
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 418F340407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaCnbdwXnGB0 for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 10:58:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38409400BB
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38409400BB
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 10:58:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v1so5955356wrt.11
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 02:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThweuJQz4zXrkwpP3KvdPBOvbHhyBVLVfD5W7YL1YZ0=;
 b=jxSoFvfOSt+KVTr6gtTEr9dq551qxWG1YHQh7o21Bol5fAcHYGBlISdz/YFQpFyhAV
 GcgxrcTQE8pJnPYvG5bgoy+K/WyK3WSkIUi5Uk4V/2/wFguaWBqRou58yQh7+xzkbAmk
 V4Rtl/qzKmtKW7UZK+AC4Ye4ew6vSn7vjGHD8Wzb2ESoQmiUvR/jsHxH2d+5DMIdcSph
 NINNv++5Gjebm3tUdJ2z+oOveBMf6/Xfw584lIQLzpt+l2USBots05soWVWo2IO0l1PN
 oK9Y3l7Hexk1aLIwjXjvvERjM74ZjdWAsNpko2qLcOFXHoLnzfYMXED+AeK6QeCaZLeb
 TL4A==
X-Gm-Message-State: ANoB5pnDvpAKvPEyM+Y7KiBmsz9kfo2bxDpyS0wDAFxMMOmwQgxglqHa
 yc31/GoKvuOIjjMmhvY9a4TY5lBDr8o=
X-Google-Smtp-Source: AA0mqf5dkSXsT7ECO5l9paj1MLpH/7eZs7Iqn/qOMQsNzB/0PJ3TnmwDFfxIv40DqK/T26RV7GQ3Kg==
X-Received: by 2002:a5d:43d0:0:b0:236:4e3c:7720 with SMTP id
 v16-20020a5d43d0000000b002364e3c7720mr897535wrr.674.1668164311129; 
 Fri, 11 Nov 2022 02:58:31 -0800 (PST)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b0022cc6b8df5esm1627594wrr.7.2022.11.11.02.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:58:30 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 11:57:54 +0100
Message-Id: <20221111105757.552459-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111105757.552459-1-nolange79@gmail.com>
References: <20221111105757.552459-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThweuJQz4zXrkwpP3KvdPBOvbHhyBVLVfD5W7YL1YZ0=;
 b=Qt02cIo0W64yi9WIXoguc4fZXPn9dTmFChd7ggVtjRd6yYLy/yRLfjZmUSA/BZYWUB
 Q/iKajRhCPa7tiuOl2T9n/tY8822JYugV8LDN9tHGLZ2Ywerdm8LSBdskmg4sc6N5ddh
 BkYjgzPmAyOYpKfPmxFykKXMsuntz0Wfz0lvDyliqS0sx9MKR6QtAVkMVwU94tLSwyZd
 deHn2bTgmuT8yzHnQhN3MoKZMkTVM61MEHRf97AcuFb9+89UbkbVhOnXgihoA+OOMlyH
 jG3YynZjAShcI/A7ETsIvmKb8e5zrWNeD3/npDOytnDRUcS1sOIeMv80uBaiPVvtLnD3
 NXrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Qt02cIo0
Subject: [Buildroot] [PATCH v7 2/4] package/systemd: Add config option for
 sysupdate feature
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
Cc: james.hilliard1@gmail.com, Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support the new feature added with v251,
requires openssl.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 12 ++++++++++++
 package/systemd/systemd.mk |  7 ++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f35305c0be..9278772951 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -481,6 +481,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUPDATE
+	bool "enable sysupdate support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-sysupdate atomically updates the host OS, container
+	  images, portable service images or other sources, based on
+	  the transfer configuration files described in sysupdate.d.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 57b6734d21..78632992fd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -91,7 +91,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
-	-Dsysupdate=false \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
@@ -484,6 +483,12 @@ else
 SYSTEMD_CONF_OPTS += -Dsysext=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
+SYSTEMD_CONF_OPTS += -Dsysupdate=true
+else
+SYSTEMD_CONF_OPTS += -Dsysupdate=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
