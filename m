Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771EFCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BADF414C1;
	Wed,  3 Apr 2024 15:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ih8V9WbxGtW9; Wed,  3 Apr 2024 15:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE29414CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE29414CC;
	Wed,  3 Apr 2024 15:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99C641BF5A0
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85BFB416A5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cN8elxzSpJpr for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:37:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9375F414C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9375F414C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9375F414C1
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:37:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D946A4C2ABF
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fJ-000000000Rn-3YGT
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:36 +0200
Message-Id: <20240403153641.4122789-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=ylabmsh4thU8Y3DKW2JI5ecNzLxyP3rqMMaEVwZJ8FE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N6YgxOGQvFzgrGMVoFXDsksMyxLdP7l4yBj5DWcO0h28KAgiHhIw6EYQ3sn+eW5/w
 U5i5ySxGeNiS65om/YDG+JXvnNRSLcJ1sI5YGzMq9Gyq5BtXsDVgWToVSFv/F0YcqW
 azT1y/GY2378i3O1aTJRqCafe331NfCdQ3jWwS22sI10Kqnh53Sa+5SwWKRNt2T1TH
 r4ntZAaYyBeLzxTJvQQsR9EpTedluDWYZo1k/9D84EpwEcUwlo7t4wcXqAh0mlUDwj
 lqEterFceCMswB5KPKPG9/fUTu+BAAwVnqjzboFg0OQw4yXINp+/fE21GJUnJ3+TM2
 ShyAOscpw1BNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=N6YgxOGQ
Subject: [Buildroot] [PATCH 4/9] package/freeswitch: add optional dependency
 to libxcrypt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing freeswitch's libcrypt dependency this
broke the freeswitch build using glibc version 2.39.

To fix this select the libxcrypt dependency to freeswitch when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/Config.in     | 1 +
 package/freeswitch/freeswitch.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 1ab624c33c..80d18e064d 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_FREESWITCH
 	depends on BR2_USE_WCHAR # uses wchar_t
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_JPEG
 	# src/mod/applications/mod_cv/mod_cv.cpp includes
 	# highgui.h, imgproc.hpp & objdetect.hpp
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 5b9dc49c9b..6160fe5fcb 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -229,6 +229,10 @@ FREESWITCH_DEPENDENCIES += libpng
 FREESWITCH_ENABLED_MODULES += formats/mod_png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+FREESWITCH_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIBYAML),y)
 FREESWITCH_DEPENDENCIES += libyaml
 FREESWITCH_ENABLED_MODULES += languages/mod_yaml
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
