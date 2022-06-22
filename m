Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959EAC43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B9083F62;
	Wed, 22 Jun 2022 20:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B9083F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGuwJZNxLIPd; Wed, 22 Jun 2022 20:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 210E883F41;
	Wed, 22 Jun 2022 20:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 210E883F41
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB311BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027F241A1B
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 027F241A1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfatpg7IfKh6 for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:14:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BD941A19
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1BD941A19
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:14:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q9so24963668wrd.8
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ojeT3SDHwHatmVODa5iu5ff5mTONKbUDK1qC6CSNcqE=;
 b=DYuYP2Gk54J9nlDo3cEE5Ae+1vAs/Im0h+6LISZNmVRvg9F7hekYNlkK4X65+8CBeH
 2wv/+6CkboiSLAGGcHnMbLcs6YG2Q15w9G099BCHnAkXhzRe8aHWoh2kYtFrMAJ+mxUh
 tojCorkoRmvV2/egSpB2LDFqTpz/SCBrpAebf0mAMQYnPcJnVDrrVzg4ThKmWW/DA2L6
 ahkU68GE2yNwqliR2qdfzWyNScIKfHi2n0FrDSX54QqEM1EIaa0rDkemgi28Ht3ZsWgE
 TLj73IYutGmsslJsNPhV2a9r+IX94xgQlXMOmJwhJDlvmCW2m9jk3y4zEX1AoFzEBbdR
 VciQ==
X-Gm-Message-State: AJIora8KHP/0zZU2uv2f5JILCC18OVI963it6goN93hX1T5TOt9Muil+
 3PUwM/RMyMjip0RsANlryxpWduCnf3Q=
X-Google-Smtp-Source: AGRyM1vCLcMe9aWQsTJC8RV1m9a7suPNs2wnYrGli8v0LPuECDPTOtHqLc7VCGOvQdfkEi7U7nMTdg==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr5006614wrz.690.1655928883719; 
 Wed, 22 Jun 2022 13:14:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a5d620c000000b0021b866397a7sm14737962wru.1.2022.06.22.13.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 13:14:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:11:55 +0200
Message-Id: <20220622201155.150177-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ojeT3SDHwHatmVODa5iu5ff5mTONKbUDK1qC6CSNcqE=;
 b=i4+TBqRdc9AQpi44/WcGtAvcrmi/9vKtbKbbC6LJW6euaLu9Tx12ZV80Nud14HgJTO
 ADaHegVCAsMKO2J4Y3DsiGH2tedjBAYwc5UdDLbC80nBhauDqdRxe6HJb0kP7Ipy/A+g
 eaA2IYRdcCl1bCA+vyqLsLDADnxc0m4sgF7/1+vEObKFehTrtCIAp9NFcDL9A9DmWnGr
 jPGETGdZ6kJLiDf9snHHanr60c07yKcU2jcc921ut8YpQR8fXaJlF8Guo2r4bEWtvHyk
 yVzkRxREmKLOB5nlKBhNp+htYimzKzY7/ufPuHJqsXSxR4OeAQBKTzYEIpkjeb7xIcPf
 BVMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i4+TBqRd
Subject: [Buildroot] [PATCH 1/1] package/tio: bump to version 1.40
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to meson-package
- Add inih mandatory dependency
- COPYING has been removed because it was redundant with LICENSE file:
  https://github.com/tio/tio/commit/39a9c4bbdaf2f77bda04fdbee506a206eecdb5e9
- Update indentation in hash file (two spaces)

https://github.com/tio/tio/blob/v1.40/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tio/Config.in | 1 +
 package/tio/tio.hash  | 6 +++---
 package/tio/tio.mk    | 7 ++++---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index d5d619100e..a84daf8a24 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TIO
 	bool "tio"
 	depends on !BR2_sparc64 && !BR2_sparc
+	select BR2_PACKAGE_INIH
 	help
 	  "tio" is a simple TTY terminal application which features a
 	  straightforward commandline interface to easily connect to
diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index 3053bd1bf0..5058ccca8e 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# Locally computed:
-sha256 a8f5ed6994cacb96780baa416b19e5a6d7d67e8c162a8ea4fd9eccd64984ae44  tio-1.32.tar.xz
+# From https://github.com/tio/tio/releases/download/v1.40/tio-1.40.tar.xz.sha256sum:
+sha256  beafc4763552ff7cf3a368e8af36258018ef85fac32133c4635051d7615ab527  tio-1.40.tar.xz
 
 # Hash for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 31f1dfb5a8..5c469667f6 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-TIO_VERSION = 1.32
+TIO_VERSION = 1.40
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
-TIO_LICENSE_FILES = COPYING
+TIO_LICENSE_FILES = LICENSE
+TIO_DEPENDENCIES = inih
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
