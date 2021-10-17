Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77264C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:01:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7FF360F93
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7FF360F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40B8D81BC2;
	Sun, 17 Oct 2021 13:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjMv7vL338xX; Sun, 17 Oct 2021 13:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A2381D5F;
	Sun, 17 Oct 2021 13:01:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38DF31BF2B1
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24C0740153
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRusGsvt9ut0 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 13:01:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A42F9400F6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 13:01:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e3so35658667wrc.11
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sn4Kf0XKOmPsEaKeUHG3QnIVnBmXrL2jOJugSyppBgM=;
 b=ONG/PcMMpX8HTPbpguDptlWK8nvLKDQUYA9zjL8OkTg6DHs8u9S6rQPlP9Rjk6eEl5
 9vSKziFbgJR0QBvekhpfjnBgAvwTtnXxLPsIJnr4B3jiLHzED3fs0KYq73ekZVO1jLJc
 y9gY33srmPt3LFc7KOV8XCmA3vHoPDeN5O6FKqDrA6IjjC8HABg/lxf5X76Bvb6zyHlO
 rsR9wslGRJV5lXaMeGhBc52oXZL0sLdwqOjaQ0DX1cP05BKVGpaWeFGh7Th3Z10JXZCg
 1TfAc7NbXnxD4SC+AoKO8VBeVuYtIT1eMJb7AotGa5oT3mhqwVRSjx5HCK8LI6fdzwrU
 PDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sn4Kf0XKOmPsEaKeUHG3QnIVnBmXrL2jOJugSyppBgM=;
 b=WLIQcFzLi8Ec9G9PZYw6Ndhrzmv6v1iqKf0ybjenmUbsfJpw+IQqSjrd1nXFI31X+p
 8QsbuTsYG8Z/9fib1H4eDFUmHU7MwhXXRlpy+2W7r0ssDrnJTvg/WYhUK9cNtl/sOt0x
 BZvMxjXgsWzxLcYOlR2DTaf1uavz+92HzlOGs0+V5cjt6oSUDdIaTNSOuqcipq4IaUGI
 wzmCHwdVD0S9I8rzGop0hk6niuNWD+CtwhpsR8vL7eegvto40qel0PqtfeyxFQE+nMOr
 3s9fqYxv0q+Dl7AmO72xvS2CqgPez/rz/g9BXNamHBC4maiatCK+RqR5D18Hd8TsTHKD
 Nl0A==
X-Gm-Message-State: AOAM53102t2rLIxZGemI3I1tWyHxt5YBYQ7B36BADWzLD9rtEqbpSg5x
 r/cv0eVJuTBnDXFpfO2B0Bhm6RsDVY0=
X-Google-Smtp-Source: ABdhPJzWimNjF42Bp1NQAQKtJTnCBHlCYa9BFtehJIvI42iStHClHiASHfJ6QjPFHZO13hoCKaKOUw==
X-Received: by 2002:adf:e9c8:: with SMTP id l8mr27925404wrn.188.1634475658390; 
 Sun, 17 Oct 2021 06:00:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l2sm9781671wrw.42.2021.10.17.06.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 06:00:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 14:59:38 +0200
Message-Id: <20211017125939.1007483-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4,1/2] package/libpcap: add host variant
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
