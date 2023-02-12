Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB77C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 01:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8299060BF1;
	Sun, 12 Feb 2023 01:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8299060BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jifFc8gRATK; Sun, 12 Feb 2023 01:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD9A60BA1;
	Sun, 12 Feb 2023 01:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD9A60BA1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C8251BF855
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 01:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6651781A58
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 01:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6651781A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0Ab1x5g3vsD for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 01:42:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C78F81A16
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C78F81A16
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 01:42:21 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so9220498pjp.0
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 17:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jqjl0izjbgP2ngCva1mO5hYZdLJI+Fmeun3AnyDgHw=;
 b=nRAmBrNFuXGZWjvAUinSVRHdRpeIn7oWC+O+/r56uUDei2hKgeNrt1HcXkQNOP+7b4
 NljPAZHMFmd7dMjg66ee+DwDNGjCuP9xnLx1tT48SMFbid8zaY/b0A6GANO5JG7EsjD8
 hbFFwT9ynU9zmTPA2oYRI6njOgSTI/P+/NWPi28FT1w/6NK64Iiie1bnvgo2oTkAI1Sh
 ysvdTgulLI+QdlwqLu6KiGTPRGnNEcx/vP/+yFhCt64FzdmwNAUyCF4+FxLTkmuuLre8
 YXHkN1BV+vS6dpEqXHjb60OxZqIGR0PQtAyxC6eJEGObtcAzDtqRO/7WvmQri5LZR9so
 PdBQ==
X-Gm-Message-State: AO0yUKXF06MVA4KR3KKxqygPhZBtqsZ68lwRJ/45w2Bd12GsxKITlTe5
 Vd0ixcZUTC/Xc1BLRbiRC8LCNoz6/zw=
X-Google-Smtp-Source: AK7set91tYWrYLvkBXKgihKsTlrcHB9Q+ovr0Di7LWhdB6tpZx0qyT9uwWSXwPHg1kgU1eAa/4LRZQ==
X-Received: by 2002:a05:6a20:a01d:b0:bf:abad:c7c9 with SMTP id
 p29-20020a056a20a01d00b000bfabadc7c9mr20725853pzj.22.1676166140355; 
 Sat, 11 Feb 2023 17:42:20 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 l1-20020a17090a4d4100b002309279baf8sm7095507pjh.43.2023.02.11.17.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 17:42:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 17:42:16 -0800
Message-Id: <20230212014216.6293-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl8723ds: bump to 2023-02-11
 version with new license file
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A COPYING file has been added to rtl8723ds as of the most recent commit.

Update the version of the package and add the license file hash.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8723ds/rtl8723ds.hash | 3 ++-
 package/rtl8723ds/rtl8723ds.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index d5abf9913c..e94a7b40ef 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  97f3ebc5d977ba35d10c9c06e6817e4a00458727b651b56fc00c207c05a61995  rtl8723ds-a638cc8639015b8b9390af3350fab0366b6c87e7.tar.gz
+sha256  672787c3f3d1f795b750cd74de8ca34bb661b8ae60f5aa50fb279ec08ff3f05f  rtl8723ds-ec85dc6b9f72bfe413bff464ed01a272e29c8dbe.tar.gz
+sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index f303a24041..1bb164fa86 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = a638cc8639015b8b9390af3350fab0366b6c87e7
+RTL8723DS_VERSION = ec85dc6b9f72bfe413bff464ed01a272e29c8dbe
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
+RTL8723DS_LICENSE_FILES = COPYING
 
 RTL8723DS_USER_EXTRA_CLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
