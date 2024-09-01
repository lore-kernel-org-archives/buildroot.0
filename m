Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8554DCA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 06:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322E181315;
	Sun,  1 Sep 2024 06:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UATuZuiWhlsU; Sun,  1 Sep 2024 06:45:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2791B81319
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2791B81319;
	Sun,  1 Sep 2024 06:45:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9C1D1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 960C941306
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o77we34cNfaU for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 06:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2221741303
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2221741303
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2221741303
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 06:45:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53346132365so3897597e87.1
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 23:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725173139; x=1725777939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HPrYmF4GnpP2z6JjCTsv5/eGIrpWY8wOILAnc4N9bDU=;
 b=qPEHxcr3eu8EQ4sZohz+DU6xBJf8iDeGxzjoJKixyOoao7U3P5RLSQi6jPqhkhpMgZ
 y0Su4Z5gTY3RCykJPI75fajNXAHyTRJ62fzAwf8056OQsuPl5yBI2VC+6MP3B1rOa4ci
 flv9D//l0CLwkjUHFQMIlWxAEd/kFv3wQnQY+sP8vgU6oANgqx+fxyuZQPYGJ+bz2lev
 mik5VgdgIOYRvPbaQNH/A4b93XnNF5ht/JR9QfZhLrkspKsmcDvBzB0Q/D41fgteSSpK
 YK4O0LgXQbHR9yE45X2NsWONdwOXrkglio+gjd9VyqcByDXlzAXsSEy45FYGVGgVT8Ip
 xU0w==
X-Gm-Message-State: AOJu0YzKLfvQXmDpcbqCQnaRlz7BAsXD+CLMAaAkv4DX3ZclX9QT6dBH
 F6uX+onTR1Btk0wzVJzmwYxxSxFzsV2XUcAylmgUnjON0+OWfkx925OlHTfpsJPtWwcWJOW7z7C
 SXdA=
X-Google-Smtp-Source: AGHT+IHWxPbBEc0TgUCaswZLE5prsQoy4c2KtMssXTeuEDSWaeFmvHWfA5QOZGwJSZ9IyGnxt6PheA==
X-Received: by 2002:a05:6512:318f:b0:52c:d626:77aa with SMTP id
 2adb3069b0e04-53546babeb7mr4329508e87.58.1725173139120; 
 Sat, 31 Aug 2024 23:45:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb32asm402254066b.23.2024.08.31.23.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 23:45:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 08:45:08 +0200
Message-ID: <20240901064509.3505801-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725173139; x=1725777939;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HPrYmF4GnpP2z6JjCTsv5/eGIrpWY8wOILAnc4N9bDU=;
 b=COUZSl+uc3qHifypVy+a6/AGRThlm7YfpHJGaYjmzlAKuUctPwKYXYtKtU2Qjzczjz
 0n8ltfJTRT9LQsCRvtuaP14/Nz27p1THitxK4hzUBcsxeYCra5vbTelh1MIYrumvhiWE
 Rtqr/wCApClnjJbaH/EXNzF7m0jKN23IQ51oo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=COUZSl+u
Subject: [Buildroot] [PATCH v2 1/2] package/armadillo: temporarily update
 the site URL
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following an email exchange with Conrad Sand, one of the maintainers of
the project, I learned that version 9.900.2 has been moved to
https://sourceforge.net/projects/arma/files/retired/.

This patch fixes the package download error, waiting for a subsequent
patch that will restore the previous URL to bump to a more recent
version.

Adding the .RETIRED suffix to the downloaded tarball generated the
following error:

armadillo-9.900.2.tar.xz.RETIRED: OK (sha256: d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05)
>>> armadillo 9.900.2 Extracting
buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED | buildroot/output/host/bin/tar --strip-components=1 -C buildroot/output/build/armadillo-9.900.2   -xf -
/bin/bash: line 1: buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED: Permission denied
buildroot/output/host/bin/tar: This does not look like a tar archive
buildroot/output/host/bin/tar: Exiting with failure status due to previous errors
make[1]: *** [package/pkg-generic.mk:213: buildroot/output/build/armadillo-9.900.2/.stamp_extracted] Error 2

which required the addition of ARMADILLO_EXTRACT_CMDS to be fixed.

Finally, it was also necessary to modify the tarball's hash.

Fixes:
- http://autobuild.buildroot.org/results/d4e9e7b453960a4f62a199344b30b729a4f235bc

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
  - Don't bump to 10.1.0 but update the URL site to continue to download and
    build the current version (e. g. 9.900.2).

 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index cc91fb456aa0..9b19b8c8c4a2 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz
+sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz.RETIRED
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 8661bfd9da87..81684a44f72f 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ARMADILLO_VERSION = 9.900.2
-ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
-ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
+ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz.RETIRED
+ARMADILLO_SITE = https://sourceforge.net/projects/arma/files/retired
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
@@ -30,4 +30,8 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
 ARMADILLO_DEPENDENCIES += lapack
 endif
 
+define ARMADILLO_EXTRACT_CMDS
+	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) $($(PKG)_DL_DIR)/$(ARMADILLO_SOURCE)
+endef
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
