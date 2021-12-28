Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05654C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF26E4023C;
	Tue, 28 Dec 2021 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No_1mu4aq41m; Tue, 28 Dec 2021 14:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BE140201;
	Tue, 28 Dec 2021 14:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9491F1BF471
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 838DB81A8E
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMNFgUksvQGS for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 14:50:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6717C8198A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 14:50:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q16so38845317wrg.7
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 06:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEB/A2SoRm+y5iXKM6XwC3nIzJSlLQlWwL3XmBm82+o=;
 b=gw6gfQ9YBXuJjlk9m/rpicLdUnTlHJtYlFWEWhHIBA05ZorMkRTxdWgAq0TNkH8wwU
 cu93dGKZ9iX1Eml/GRpQqeAq9HO+Qx2ssAfVmB0FdCi1+Q5ewjoDn8OOW0qkuR5j2RwC
 pGJU6UTkpoNgwCkLIcbZRaHfbJow5fTwAVy0H66OEPijjQTDMnn79eNuDlphqIFWpNTT
 zTGiU6C40p6x21p2D+ZfAGtDAbSZBHRrow/H/SSUdYHVm/+H7AJU6GHL0u4IbQiOMyqQ
 QiuPWkvFSmjmfLDtZH09M95D0UQmqLwOcs2UxQ6zmSMJh+qeYi32BVqI7E6LsQduu84j
 xlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEB/A2SoRm+y5iXKM6XwC3nIzJSlLQlWwL3XmBm82+o=;
 b=YqiTKB2asAGv1mvOWzkoFhAVmdW/gTurpgTI1dl3AaQcIznD86CwPW82eAn4wzI4e4
 ylC5C25qLGrlifpHzZ+x3wiKqkuSPedVZKmTGwLLtUVJZ7kZulDjxquxfVlqeaX1I2HZ
 ObR1V7TMTeEv77HP1mN2bkS33XE3G010pdZ+tZn47Hlulaco4oYQwLdz6l72WJD28+uv
 Cu0sTHY2nqvEFtxrcO8+WasLIYsyC3ULPxfh3ba8WIKFhEKg+sRmeBodahyUsxLCf57P
 8rxIIdiWb18GUzSRPEThllgDxeZNWG9C5KMLZdnb+qYVfYHrJlaSU1A8aLRpcfDUpWZC
 1Zkg==
X-Gm-Message-State: AOAM530vufqDf6KqqJ32CAzfh+vqyyV+/u82Msyh6sZVeGOCGEjrY+EP
 YKzqjAdoj5IdcFfDOn7NJkh+g1q9gTIBAA==
X-Google-Smtp-Source: ABdhPJyYyeL/BoKNYupNr4ydbO47s+o8T1m2aNjKixbAqNGHSIkE2HeBtFI/9NvGMjyTeb3T5wmksA==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr16775710wrx.49.1640703025604; 
 Tue, 28 Dec 2021 06:50:25 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id u12sm18036920wrf.60.2021.12.28.06.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 06:50:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 15:49:35 +0100
Message-Id: <20211228144935.4060468-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libxmlpp: bump to version 5.0.1
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to meson-package as configure is not shipped anymore

This bump will fix the following build failure raised since bump of
glibmm to version 2.68.2 in commit
dddb65efbdf2c7952f22a1e51009f17f1676db4a:

Package 'glibmm-2.4', required by 'virtual:world', not found

https://github.com/libxmlplusplus/libxmlplusplus/blob/5.0.1/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/ab3c3ace6d9409a70a4a8c1e27dfa9b915be10fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxmlpp/libxmlpp.hash |  4 ++--
 package/libxmlpp/libxmlpp.mk   | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 7a59880e7e..50238eff00 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/3.2/libxml++-3.2.0.sha256sum
-sha256  b786fae7fd7820d356698069a787d107995c3efcbef50d8f4efd3766ab768e4f  libxml++-3.2.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/5.0/libxml++-5.0.1.sha256sum
+sha256  15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098  libxml++-5.0.1.tar.xz
 
 # Hash for license file
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 98cba2a5a2..874577eb1f 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-LIBXMLPP_VERSION_MAJOR = 3.2
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).0
+LIBXMLPP_VERSION_MAJOR = 5.0
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
 LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
 LIBXMLPP_INSTALL_STAGING = YES
 LIBXMLPP_DEPENDENCIES = libxml2 glibmm host-pkgconf
+LIBXMLPP_CONF_OPTS = \
+	-Dbuild-examples=false \
+	-Dbuild-tests=false \
+	-Dvalidation=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
