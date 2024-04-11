Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984C2C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B828608DC;
	Thu, 11 Apr 2024 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0lyWahjEQqA; Thu, 11 Apr 2024 21:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B0D0612DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0D0612DA;
	Thu, 11 Apr 2024 21:00:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAADB1BF330
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5FE140298
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1n_v9DIW1ZSu for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A86740291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A86740291
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A86740291
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:00:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22B64A4C3146;
 Thu, 11 Apr 2024 23:00:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51558)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1X2-00000000164-1JJp;
 Thu, 11 Apr 2024 21:00:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:00:28 +0200
Message-Id: <20240411210028.2127823-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869229;
 bh=tNYAtimRydjWck+G3HBkn4HXlht96fE06BYFgx/j+ys=;
 h=From:To:Cc:Subject:Date:From;
 b=vqQ2Y9XmPPBtUFl90oEIj7vKEQaXSNsHKj0Btz8wnjmdNNWFnoVVP5kePf49j5Hcm
 6SfPJsv2OOjoO2hIyR77enIEU9n1AhduSOs94GMuuRva4WDv7IvEnJvD2O+4/0kxjL
 rfZGOWK/bRCU3gcHyGMbGUD5pUduXveOUc5k/eLm4Xvd7A5hmBGFkPNH219gpm7TFv
 Ww4xqxVtYdeO2EaH5lDQss98uR1w8zCHVFWtepA6IPKgQFCATA0O3Gid3mzxG+HTEw
 23fRqIZg6NGRK3F5UnfOT931xCzrB6l9RYEgKza21iBm69B+5zp4LiW/V8hQmXXtuj
 8b1e4yTVJWmzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=vqQ2Y9Xm
Subject: [Buildroot] [PATCH] package/libcap-ng: bump version to 0.8.5
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

Switched _SITE to https.

Changelog: https://people.redhat.com/sgrubb/libcap-ng/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcap-ng/Config.in      | 2 +-
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index 46f0b69ca4..bee66b3357 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_LIBCAP_NG
 	  running applications and print out any capabilities and
 	  whether or not it has an open ended bounding set.
 
-	  http://people.redhat.com/sgrubb/libcap-ng/
+	  https://people.redhat.com/sgrubb/libcap-ng/
diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index bb4280368d..022dd1f895 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a  libcap-ng-0.8.4.tar.gz
+sha256  3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff  libcap-ng-0.8.5.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 2ec88810b4..9c8012b238 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.8.4
-LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
+LIBCAP_NG_VERSION = 0.8.5
+LIBCAP_NG_SITE = https://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_CPE_ID_VALID = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
