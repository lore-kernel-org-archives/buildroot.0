Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949DAC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38DBC40BED;
	Fri, 22 Jul 2022 08:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38DBC40BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DvKPHoztvTZ7; Fri, 22 Jul 2022 08:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C49040BF1;
	Fri, 22 Jul 2022 08:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C49040BF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD1231BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9769B40BED
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9769B40BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxzjAs2U1eeS for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:54:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CEC240A1B
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CEC240A1B
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:54:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l23so7474451ejr.5
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 01:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjQFeuPWQBMd2Y8JluPzQwRRgIDdyZ+cSBvtOP4IU7o=;
 b=G7HegPq5yvu4J1yPSait87xbzeOSM+VDNH33dQDHgB69qQH40nBsWbz4ho7uDfhw5/
 sZ5Fe3VozEeZJw7Vf92Ktju07GhsddAIHNdVcEIhpD32DEIwZO4bBnm0gsHoFbzjFrn1
 +/aMHxMLnQOeZ9Bi6IOHBpZfujc3PApY3B4be4TpkLNbfDRbyxNHYmt5XG3XCs2wyPeB
 hZx+Cn1a4mVCD2GNsvWEgqyFZofMUwzWue53Q6xOxdyp/zHUmtoKyTt+rFs1YFHz/AYq
 uPuiHVIf25Oiyutbjw8ZdnlRXGsMSODu7CRCpDvQ3IE5lqHfcg/ywoDyMxPY7oAgzwpb
 s0HQ==
X-Gm-Message-State: AJIora8fUTMg+eW2WEXdhxv0sh5QJm+NW8bf0+Ryp2+2aDfeZXtSf6k4
 sQvGevt1aDO9KKP4HmJ7ak8TKZmGt50+9Kty
X-Google-Smtp-Source: AGRyM1tGeFbEUtx1OzkRDiy5ION2iGjQji2J7/1GMw3r7Kv2/0XE8Y93KCbpQHpSt40aOpl1btvb/g==
X-Received: by 2002:a17:906:93ef:b0:72b:491c:a36e with SMTP id
 yl15-20020a17090693ef00b0072b491ca36emr2274850ejb.593.1658480078219; 
 Fri, 22 Jul 2022 01:54:38 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:10fe:4180:33f2:cfe8:3447:ab97])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa7d719000000b0043a6c9e50f4sm2205718edq.29.2022.07.22.01.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 01:54:37 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:53:44 +0200
Message-Id: <20220722085348.645793-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjQFeuPWQBMd2Y8JluPzQwRRgIDdyZ+cSBvtOP4IU7o=;
 b=q6ZTu6Cxbc9a/NyLdw333vewmaiCGW5El78d57U9t3nbaeCp+CTzaLfzGaQhKbatxZ
 fE3ZWNZr+3R3ZyB/Q/0VzcDJtVC/9elpdsCd8Feipc60OJP8s3eOUe9cEjwIrssJLBkg
 bYMJIsrcT21qtXgq3IwRFhgcmX4XXLALq2dUkKkoi8MHtbJq1aCprlISqxVPcIfpvPSt
 xlOd2A9ffJk14knveltzSYtU3rK3KTSxaeX85KrSGiYfCnB1YlI2oyqY27ZCcNMOGGPS
 nBlHSXWYxDWybkHGHS8sP4xUpw/z6ryE1SyuayKLgcVr86bl55ZUva+0OUFTlW7zCywo
 w5mQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=q6ZTu6Cx
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.18.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE OS package version to OP-TEE release 3.18.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index f199de31eb..db7a93c10c 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.17.0"
+	bool "3.18.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.17.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.18.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 5c1047bac3..38f68bec5d 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.17.0/optee-os-3.16.0.tar.gz
-sha256  5d5a3bda83abddfeb5ee765a15525f23adf2709ba2475a05e0c5f25790c1883f  optee-os-3.17.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.18.0/optee-os-3.18.0.tar.gz
+sha256  bdd309697745ec4406951652094b50d9adb06c3612f01bd8a3d72682ec8e03e8  optee-os-3.18.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
