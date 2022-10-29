Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E968C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 20:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B258A40545;
	Sat, 29 Oct 2022 20:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B258A40545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcEhSOi17Ueu; Sat, 29 Oct 2022 20:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE8A74052C;
	Sat, 29 Oct 2022 20:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8A74052C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5CC81BF5A8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BADA34052C
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BADA34052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-yjcpQu-GaZ for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 20:30:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 524F5400DA
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 524F5400DA
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 20:30:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j15so10818581wrq.3
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 13:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2M+i+Aym+0IBBh7pAcxP10YOuc6at3SdrlWI8iSFRY=;
 b=Wmr2+WPUg7W8fAGOPv+yjeWwdEmmpyb9alrp6aWVL+2TyLSYNWUZ14jVZJXxUjOBhZ
 QjKX5B+iJrggY139etQYHvT4wwn4HyPdMZmse9eENrty4LgzuRwbXHT+cLobNAWN0NEW
 qwJqTBlq2JBS4L+4tHvOD7ibZSp07R1KlsEjouRMg/C3GqsJ4SPDZDLTiADV73bYtK84
 EEmi07NigUIzMvX/8Z3jjrZhYH1aeOxiNE6UyrubM9WTGKCPChbWx6PJiLPTbaK0Fxx7
 mJxPCHgdxxW/x0s/7iT8MwBPwd39QQr3FFLx+nvYtljhiqPvE+Mnw315b6U22ZqVTt2/
 ZywA==
X-Gm-Message-State: ACrzQf3CtmgcWIUMmMa2Aq3sPLf7m6bjk3ShDDynM2fr+c/XhuVjStgJ
 51LhCOXIRQTaeXQqcpjpJmxhU82XLzI=
X-Google-Smtp-Source: AMsMyM6AskwofX7wNvYROoHH4vUV+5398UyVKpWxM58k4aqZ29vak5nlHehVRiXvIQDdQl9iMzYn+A==
X-Received: by 2002:a05:6000:1a8d:b0:236:4810:9966 with SMTP id
 f13-20020a0560001a8d00b0023648109966mr3108973wry.366.1667075445209; 
 Sat, 29 Oct 2022 13:30:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d4612000000b002368424f89esm2330995wrq.67.2022.10.29.13.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 13:30:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 22:30:39 +0200
Message-Id: <20221029203039.115558-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l2M+i+Aym+0IBBh7pAcxP10YOuc6at3SdrlWI8iSFRY=;
 b=PxpkSokMhWdvvM2pZ6jRBGIoN8FVd4C6dOlnmAJeT8nqMHmiGbaSUnxMPTQTpvFTfn
 I+lnSr+kMPJwU/ylhBbsES60Ug+pSAP4rNeFFXSG6cJzxiY84adlkMDqEzPRB7eSaHQK
 zw0LuNrwv+Vmi9q7IZEc3OKdMfHq6gjAUGwDZGfzIiLORSx30xsCkFIJKb/4rhX7eOYB
 0C7VCDaimHR9JSag0k3E75tt33WDTTKmwrKwPHJi4MpRoJd3jYVf6dZWdPUT77tme6ut
 cH63qHXDVoxZUVZ0dkChUs+ebQe2yamlQtm9VTl9PefpULvQYRDx4W96yI8Vbh7as0cn
 FKHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PxpkSokM
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump to version 1.7.2
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official tarball

https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.2
https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index 5eeb6387fa..f38d93c04a 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8985f8df249087ea68c6051dec6dac3ef0703fe2aa87d0266f3951f93aa8da5e  makedumpfile-1.7.0.tar.gz
+sha256  748583ea4c0b32346008aa53b313e9708f60a8481959c25c76e5c94740032d9b  makedumpfile-1.7.2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 868c681344..8dc60b043e 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.7.0
-MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,$(MAKEDUMPFILE_VERSION))
+MAKEDUMPFILE_VERSION = 1.7.2
+MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
 MAKEDUMPFILE_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
