Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705F1C46467
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C95410C2;
	Sun, 27 Nov 2022 13:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C95410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbuP8dloMCXQ; Sun, 27 Nov 2022 13:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A82A410C7;
	Sun, 27 Nov 2022 13:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A82A410C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22C601BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF63C410C7
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF63C410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfpOmOzKu7SI for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8576410DF
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8576410DF
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:09:02 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id e205so8999288oif.11
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6moIqYaVlSS7/Za+qXaiiuP50JTAGbUOhMdZRwzJXQ=;
 b=1gKCQ2TPiO2yt8HaLsu2dBk8Qvt46qXHJjQmmsWG4wx6aWx5KtTjOpL5EjD7dGYwFP
 W1PybIvcWuj5X1F2Gbj3aCiCqJowLn96hvFJU7hTJ4+Y9xwiuWzL8XGNexctpo7RmWjD
 UE8V5aYQXkTuceKBS4LJGbnbJdIiwo6plVRRTSkVw1M3T9Sw3E80lXiBZS3Qn28MnMUb
 I+T0vHbbk5MI7iRmQRoLnG1117c0dgS+bV8uphGLCyimncd6U703Y1e42Oyucue6JV0v
 bW3CFDMDuTn7kbNl3IAtxBcrIfDkIo27oJtRAnZqX09SbCV42NN6LmL4CMY6C62uOZcu
 qyAA==
X-Gm-Message-State: ANoB5pmjd4lTZOxWguLOUp+K/3dZplTw9M987lsqEIrYKh82YiWo6yIr
 HjcKzekXYeiy21M2BImF4O2bKen3O5w=
X-Google-Smtp-Source: AA0mqf5/F5yEfLVA6zmJA/FWBaYZIH66V3T59/8YW3YzunMisf2yC8//DXUa8WkWGztSEs+WwhZBYw==
X-Received: by 2002:a05:6808:3187:b0:354:7fd4:f17b with SMTP id
 cd7-20020a056808318700b003547fd4f17bmr12265206oib.221.1669554542418; 
 Sun, 27 Nov 2022 05:09:02 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:09:01 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:36 -0300
Message-Id: <20221127130739.1862398-23-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6moIqYaVlSS7/Za+qXaiiuP50JTAGbUOhMdZRwzJXQ=;
 b=UZFKFnVhQ+T2cvYveNyDo2aKQKadYCqqK9/FK/kcaQMie5rVSIyIY0bXYiwVMISdGr
 sCdESbL1RazeLgpZm+AJBLjc7CsF2Z16476DcEWS/jQ60T/sk1AaVHztehCXncfPHCcD
 fSHeY2xLMe78vJM/4PkBIQXEA/YyRVzANdeg2b1vz9V9ypYhDjzLX/cZNX+p8dS8YtyS
 bDa1/Oa131ZzqbnnJyr+zxMKT/yu/2SDXHtAqRL8JQlPbOqVm7AWVrXotfAdPFAyFIJ/
 iga4nbVx1MT7WDfA8uVJc1JGcwKyzDJIs6ZbERZlFBrHmrXWz4FW8uoswmJ/RVy3BUcL
 UmWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UZFKFnVh
Subject: [Buildroot] [next 22/25] package/openjdk: properly handle legacy
 for renamed options
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
Cc: Tudor Holton <buildroot@tudorholton.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "a610bf9967 package/openjdk{-bin}: bump version to 17.0.1+12"
tried to add legacy handling but the new symbols are part of a choice,
and Kconfig does not enforce the select of a option from a choice.

Update the legacy entry for 2021.11, following the example described in
the beginning of the file.

Cc: Tudor Holton <buildroot@tudorholton.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test config 1:
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_OPENJDK=y
BR2_OPENJDK_VERSION_LTS=y
---
 Config.in.legacy          | 6 ++++--
 package/openjdk/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5dfbd8b831..27f5602d19 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -702,18 +702,20 @@ comment "Legacy options removed in 2021.11"
 config BR2_OPENJDK_VERSION_LTS
 	bool "OpenJDK LTS version was renamed to OpenJDK 11"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENJDK_VERSION_11
 	help
 	  The LTS version option was renamed to OpenJDK 11 to make it
 	  clear what LTS version is.
+# Note: BR2_OPENJDK_VERSION_LTS is still referenced from
+# package/openjdk/Config.in
 
 config BR2_OPENJDK_VERSION_LATEST
 	bool "OpenJDK latest version (16.x) was removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENJDK_VERSION_17
 	help
 	  OpenJDK 16.x is no longer mainted, so the option has been
 	  removed. Use OpenJDK 17.x instead.
+# Note: BR2_OPENJDK_VERSION_LATEST is still referenced from
+# package/openjdk/Config.in
 
 config BR2_PACKAGE_MPD_TIDAL
 	bool "mpd tidal option removed"
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 8fbe51a27f..24a56e6b84 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -57,6 +57,8 @@ if BR2_PACKAGE_OPENJDK
 
 choice
 	prompt "openjdk version"
+	default BR2_PACKAGE_OPENJDK_VERSION_11 if BR2_OPENJDK_VERSION_LTS # legacy
+	default BR2_PACKAGE_OPENJDK_VERSION_17 if BR2_OPENJDK_VERSION_LATEST # legacy
 	default BR2_PACKAGE_OPENJDK_VERSION_17
 	help
 	  Select the version of OpenJDK you wish to use.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
