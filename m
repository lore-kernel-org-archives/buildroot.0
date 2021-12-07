Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B97C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 17:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA9E140649;
	Tue,  7 Dec 2021 17:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wrt3W5IN43IZ; Tue,  7 Dec 2021 17:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C34D640641;
	Tue,  7 Dec 2021 17:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7BB71BF291
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 17:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B73C741C23
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 17:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xre1VyDDCq4Y for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 17:12:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA5D5403F2
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 17:12:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t9so30898586wrx.7
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 09:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYhsa+ZMS11i8TW1n+VBeeQWI+56WpT8w4XbWQCWM5A=;
 b=UASgW3L2MqlmQ7bjOUv51yFOrVq3ubzPQ2wfcOEM0FTPuIUCjMbClfJGR0giZ8krC9
 8bhSBnfeCn8iRScImQP7ma8n/EAOFflMHhZDpplkPH7iYwfA4TS6p88GHhbtNxdZg0v+
 ySwTulYr7YKoKuKyhKII2fAJrA3hBMzzASkIXwbMZ3OmKgEHzVqCcT58Vp/P7nfY/dX2
 WZtZl/U+rZBDzsWl2bLDxE5LOhC2NvEQKYXehKSbaDb9v8QjZgDFePwFwRWTTCBth6Zu
 6s2djFOric/RJz9FzbXLqzSkHox78HtK7KJdZK5gWmrqJg3eqdAPxSnAn+DZk/qQG0XQ
 lkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYhsa+ZMS11i8TW1n+VBeeQWI+56WpT8w4XbWQCWM5A=;
 b=Gr6kym6+GyBonRHubWDbe9re90Sc7TfHafNwdT5Zh5lMrRCeM1PI5BBVC5ZoU6ShOp
 W5SOALXxRb71RHhcubRmy4XbVYMdM0oMQf0lROpDs43ns3yz2eSncPPztIHa5Hg6zfSN
 gEKj1dJC/c6xEA6iT9LhX6Q1lwFi5j4yPrjrk/Rj2YMBIWk98zAYXTvZSMVL0F/vITOm
 7rbe4QPPMF5PRe990P163P/7t9CC1Jx6nPcZ53ON/1isuYJ6oseGMGDngX4gGBhEMh6B
 HTd/3C2V5/0Uw6rRrLhGzO17l/4tAaf9zK86BnK5hzi50jm67L2oI/sRG7inrqUz60U2
 3LTA==
X-Gm-Message-State: AOAM532A3nvyRMa4QZ1/zZBotpbJ3I/E0hqDRcjdW9S2pMNAr4znI/HW
 RH+80sSZkx1fA3g+h9TDMMiDX94v1RBN/w==
X-Google-Smtp-Source: ABdhPJzb5GxFbiPCUaSSjwj+mEkZCziVcSQagQeD4zGn64BNll/GQjs8ZVpdbkaDJSYE12oBSAQQOg==
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr51949169wrq.610.1638897170657; 
 Tue, 07 Dec 2021 09:12:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id f3sm248931wrm.96.2021.12.07.09.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 09:12:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 18:12:37 +0100
Message-Id: <20211207171237.2857189-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libyang: needs __sync_*_4 intrinsics
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libyang needs __sync_*_4 intrinsics since bump to version 2.0.112 in
commit 2a3edc5e00b38f4f927894d0911990c9060e4415 and
https://github.com/CESNET/libyang/commit/080064b7906aecd7454e58e1c34c1c2198809e4e:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ../../libyang.so.2.13.7: undefined reference to `__sync_fetch_and_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/c1f090bde4891ac1cc84e59c51ff9561869d42b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/Config.in         | 2 +-
 package/libnetconf2/Config.in | 2 ++
 package/libyang/Config.in     | 2 ++
 package/netopeer2/Config.in   | 2 ++
 package/sysrepo/Config.in     | 2 ++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index 911913292f..877b75b107 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_FRR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libyang
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_C_ARES
diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 0a735b5ed6..7865f9e487 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBNETCONF2
 	bool "libnetconf2"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
@@ -12,4 +13,5 @@ config BR2_PACKAGE_LIBNETCONF2
 
 comment "libnetconf2 needs a toolchain w/ threads, dynamic libraray"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libyang/Config.in b/package/libyang/Config.in
index 54df061b58..d08f8fd42f 100644
--- a/package/libyang/Config.in
+++ b/package/libyang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBYANG
 	bool "libyang"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrinsics
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PCRE2
@@ -10,4 +11,5 @@ config BR2_PACKAGE_LIBYANG
 	  https://github.com/CESNET/libyang
 
 comment "libyang needs a toolchain w/ threads, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
index 763b1f234b..db31a786a1 100644
--- a/package/netopeer2/Config.in
+++ b/package/netopeer2/Config.in
@@ -1,11 +1,13 @@
 comment "netopeer2 needs a toolchain w/ gcc >= 4.8, C++, threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_NETOPEER2
 	bool "netopeer2"
 	depends on BR2_USE_MMU # libnetconf2, libssh, sysrepo
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
 	depends on !BR2_STATIC_LIBS # libnetconf2, libssh, libyang, sysrepo
 	depends on BR2_INSTALL_LIBSTDCPP # sysrepo
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 52df1bc4c3..b1535bed9f 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSREPO
 	bool "sysrepo"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -24,5 +25,6 @@ endif
 
 comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
