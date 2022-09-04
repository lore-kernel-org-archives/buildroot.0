Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17627ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A632760F45;
	Sun,  4 Sep 2022 20:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A632760F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMsvkuBFSgA7; Sun,  4 Sep 2022 20:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C584060F3A;
	Sun,  4 Sep 2022 20:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C584060F3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41E371BF38B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A0DE60F41
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A0DE60F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98JOI77hARAH for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:14:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8DF60F3A
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E8DF60F3A
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:14:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r27so6955351ljn.0
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K95QTW9aUcUCFcI63JF26u4u+6rDl+eqCOgsbRFZEtw=;
 b=zRDMHCGXOkmTHpS/c6jrWUt//Zfnpj9t2HvaZugNNL+mNH/pSbxaBd5ciSJX8/qvJf
 H3quWLqXbDVSjKuZIz0cOryV+7YKb3HQz2Ihjtm5cNzajTSeAGdNrEFPe4NEgzlZG5ay
 ML4aoOm8gKhULJoJ6gzDCPYvyvEi/W1k/urWa7/R1gJGedRL14Z5Bcz99LW8G/ozZwUI
 iSikhyHc947e35ilGeKnHTcvY3GAYbgQB2jBRXWxTR8XPmhXBXjLAPGmUlCbcu5utqN9
 aJ2SZZsTts0yy3DkNJyOFnox1NayM06lFkq2dLmegaIg6N5r2l1Qh3flL3jAdIhtv+V+
 VU5g==
X-Gm-Message-State: ACgBeo0MOBXftEznq1/cWYhEvx18nzKhal7a6VRhMjSCHW88d+Jzgcdd
 9UpaGAY0PtNS28kIIeFeu3R1QLtU+ds=
X-Google-Smtp-Source: AA6agR56tQH+mZ6Tn9A1ft4bxStQy32eA5vlKLcR2EQlcNp7V9FD49oRFxEupwFG5vSFWFeu7xY1XA==
X-Received: by 2002:a05:651c:1071:b0:26a:5fef:3625 with SMTP id
 y17-20020a05651c107100b0026a5fef3625mr595836ljm.449.1662322477289; 
 Sun, 04 Sep 2022 13:14:37 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020a056512071600b004945c1c5cccsm1004179lfs.268.2022.09.04.13.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:14:36 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 23:14:29 +0300
Message-Id: <20220904201429.1480971-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220904201429.1480971-1-geomatsi@gmail.com>
References: <20220904201429.1480971-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=K95QTW9aUcUCFcI63JF26u4u+6rDl+eqCOgsbRFZEtw=;
 b=n3HJxxQmGcH1T3K3XjJJnBWu6ZC/ioHuAezvTaZyI3H4jBV5GiUVUHrMbt2VuONgyx
 oc0jlFVjVRUhs9U3MuY2iXtmS322gRg4Z7WNdR2MwxNMZzbl6toskDlIyfC/PM83hMs1
 4huvvzPY7544ST14VBppk9oCQcpkGmDRn9LDCeonC7if9dOtY7NW1YrF+mYU5SnEaET/
 BWxDD/1jznZPMfD1orAyv6Z5PY0X+Jo45sWYBAPpZK7suumlRCOkApHurfm5uUWd3UlE
 kCmIn+RvwcPKPEuyOR+O1dDZazB3IckdSFRd69ccM6pkVfxnfHq/PWZ4S4YEijC6UDt+
 /gpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n3HJxxQm
Subject: [Buildroot] [PATCH 2/2] package/wpa_supplicant: disable build with
 static zlib-ng
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Static linking fails because both wpa_supplicant and zlib-ng define
functions with the same name 'crc32'. For now do not allow to select
zlib-ng as zlib provider for wpa_supplicant in the case if static
libraries are enabled.

Fixes: http://autobuild.buildroot.net/results/ac19975f0bf77f4a8ca574c374092ba81cd5a332/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/wpa_supplicant/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..b44d3e2d07 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	depends on BR2_USE_MMU # fork()
+	depends on !(BR2_PACKAGE_ZLIB_NG && BR2_STATIC_LIBS)
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
@@ -8,6 +9,9 @@ menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 
 	  http://w1.fi/wpa_supplicant/
 
+comment "wpa_supplicant fails to build with static zlib-ng"
+	depends on BR2_PACKAGE_ZLIB_NG && BR2_STATIC_LIBS
+
 if BR2_PACKAGE_WPA_SUPPLICANT
 
 config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
