Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C4FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E17461250
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E17461250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3D9401E3;
	Sun, 17 Oct 2021 13:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_YX75c3rzRj; Sun, 17 Oct 2021 13:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 651BA401B1;
	Sun, 17 Oct 2021 13:22:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F32E1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6835E6066D
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VD7j8hS7DPTC for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 13:22:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8727605DE
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 13:22:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 d198-20020a1c1dcf000000b00322f53b9b89so2431370wmd.0
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sn4Kf0XKOmPsEaKeUHG3QnIVnBmXrL2jOJugSyppBgM=;
 b=m5usR/0Wz9hsubh1SvZ1G19+UE+6U/a03oB9cHdj6I4jY7PCN5kkuBjYXIX7ASq8Qu
 UU/ikMaFQfqXuZc+rWar0NX46y52RCr0xFuTxGszlKlUFL4s9n7DHF8G+e91bVFHBqvX
 mlwNE/PtK7jUoUKorWLn3HHZdDzjuRIXmOKzmp1rzjCOpOzk/IuLYTHKq38NPQvxoyeu
 KUAnct1yviSGEDbKz4/pepp35em2i2ds50FCqPdD0CHxVvyNFw2KuTG8oXp/tCtuRVZe
 XOYwZ2DO2pQen+Ev/eijCRTThyC/p+0Jgz7RQot0ptTxYQrMaK/n45pZ6c8uiaRuKCHU
 L+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sn4Kf0XKOmPsEaKeUHG3QnIVnBmXrL2jOJugSyppBgM=;
 b=73KA1C2fdc8e2mJzjkkSeyLjR58qM8UXVWK+hetmFTHO2vgBZndqc/8lljlW9lZHym
 WGDf91p95Il5KNjRIYivuJ2Aue7AZFUTYjHuMliqCrZrOfhqtCItiljfAgKcrnrErfyp
 1pUoxMz0/+uoAF0WDm+kCLU5gKbLos07Iom2mQPRrjpkDocLXLURYS3whGmZt6s5nbDA
 cIACwUbMKUpLjaJjhHymysgiPwGI0ffpGL19A9oqf0M90bsRTRTlBiKbHOvSX2kkRSl9
 d5x6SZqSAqXPEp/4BN7QOS1mrdNEU95MYBB1xg4e79tewvvJep4L9NduX36Gl+5j6WVr
 +KNw==
X-Gm-Message-State: AOAM533GYJ+MEs2yetSK3Q9A8E/C8vaLONK3LCLlUmr3HcU9xqob+ZOd
 HGzJKFEhkdUhba4Pnu7Qm9dbnP/IY+M=
X-Google-Smtp-Source: ABdhPJzcq8VWEnz46y7Bp4mOlCwylcnnfY+EzP3ixEhE0hNWNAs790ESe4Zjv3sa3+Ctd0gj6p5l8w==
X-Received: by 2002:a1c:1f86:: with SMTP id
 f128mr38072111wmf.124.1634476949547; 
 Sun, 17 Oct 2021 06:22:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t14sm9944463wrr.75.2021.10.17.06.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 06:22:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 15:21:09 +0200
Message-Id: <20211017132110.1153910-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5,1/2] package/libpcap: add host variant
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-libpcap is needed to build host-zeek

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpcap/libpcap.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 1e02ec56e0..21422b2c0a 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -11,6 +11,7 @@ LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_CPE_ID_VENDOR = tcpdump
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
+HOST_LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
@@ -23,6 +24,13 @@ LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag \
 	--without-dpdk
 # Disable dbus to break recursive dependencies
 LIBPCAP_CONF_OPTS += --disable-dbus
+HOST_LIBPCAP_CONF_OPTS = \
+	--disable-bluetooth \
+	--disable-dbus \
+	--disable-yydebug \
+	--with-pcap=linux \
+	--without-dag \
+	--without-libnl
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # Omit -rpath from pcap-config output
@@ -50,3 +58,4 @@ LIBPCAP_CFLAGS += -fPIC
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
