Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6534C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2491A41B4A;
	Mon, 30 May 2022 21:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0c_PwFnO7r-g; Mon, 30 May 2022 21:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4F941A4A;
	Mon, 30 May 2022 21:05:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5551BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B8E583F2C
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_sVs3fNjp10 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:05:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BFE383F24
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:05:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e25so5505896wra.11
 for <buildroot@buildroot.org>; Mon, 30 May 2022 14:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TRvqdGqZjDc2KxT13J030fRrnxcWp/qgxMFONvbgb3o=;
 b=HQUsrC/FwQh5cJXLPIGR3mWJPwun/wVimHQwPDwiSeYd5xZZyxUX5K+D//03PcN5o+
 txW9HBUPG9DuBW2ZdQUvOc5EGJ0bWNOC8rhXnM3ASJl1bxOqoVus1yU90tUq8U7DanVN
 XxuKHCfr2VRe3zqxfd6H1GNifnXrnGCzUwRATLp3QBfe2N5qTDWTK+nmka7LkF8l71b6
 rnED+36M6f7Jjc30QkewQv1ZExv7BG2VVqlVkiVigD6Kpv++0UXZi6nVu1USxOMeC/o/
 dw/krBPTdEU22eWTv5rX0/HZR+9+SY4HQnUyJHcBvyQ58HvXlg8MhespWCPLri9cSUh8
 eELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TRvqdGqZjDc2KxT13J030fRrnxcWp/qgxMFONvbgb3o=;
 b=IFM5TeFeMB3T3075B9mFF+XJ/LRTVFSKDbwI9ivVcnwPgV1hMtqPM004XhmKUf64dn
 TYA+Lf/jwO4tf/qFKgXmy362mu5OZzCiLzKYwKQbUKmFG+Skf13+ZpfSlc0WtOgbKYIe
 qDF68VGQFHcgy6Buvn3Zleqj8nB8tWE6lTSTFCEO+nRSfdGYUWf0BZyouuxp40Xk+L9x
 JpsR83FeS7i4lY5elJIj3epuPwu6FY4L4zka1sELqs/50UxNEnSlq8VEiYF3dM06CULv
 GsVkDsgYKeRiAADUYW+fnm9CDKBz7abLLB9BTmtN9MP14o9RsmmCpWmplKv0dKH0bi6L
 m5qA==
X-Gm-Message-State: AOAM531g6YSiMieQd8GAebe0EIFlMTkRZt9g59fKxiSLQjpq+ClGqEG1
 bDeFHO24ItGG7hrANj3lW0pL+W80r5Q=
X-Google-Smtp-Source: ABdhPJxY9CQN0vgrXp8kV+pl3VfdjFcEMRNnQcfhLT46aeH1LaXq2L3wihcsCpK5Cm/5J5gmaAvNOA==
X-Received: by 2002:adf:ee8e:0:b0:210:824:5634 with SMTP id
 b14-20020adfee8e000000b0021008245634mr19699447wro.695.1653944715331; 
 Mon, 30 May 2022 14:05:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0020fdc90aeabsm9643152wrt.82.2022.05.30.14.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 14:05:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:02:43 +0200
Message-Id: <20220530210243.3055759-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gcr: put back
 BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 5452b5887005298a87650ff4003ecfaecfd9aca0 wrongly removed
BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS dependency resulting in the
following build failure:

Makefile:576: *** libgpg-error is in the dependency chain of libgcrypt that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/261a137824109342fd83b766a299c1eeda6ff401

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gcr/Config.in    | 2 ++
 package/midori/Config.in | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index 7c5fdba008..dbc22cf478 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GCR
 	bool "gcr"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -15,6 +16,7 @@ config BR2_PACKAGE_GCR
 	  https://developer.gnome.org/gcr/
 
 comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/midori/Config.in b/package/midori/Config.in
index f45444a289..6029c0a9df 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gcr -> libgcrypt -> libgpg-error
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
