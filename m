Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E39DC54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E0881DA3;
	Sun, 24 Mar 2024 13:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXk3TrPVRyFs; Sun, 24 Mar 2024 13:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66FCD818D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66FCD818D7;
	Sun, 24 Mar 2024 13:05:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF01C1BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB58940645
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X2pDbnlBt4h for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CB0C40642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB0C40642
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CB0C40642
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:05:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C9FEA4C1145;
 Sun, 24 Mar 2024 14:05:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54836)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roNXV-000000005RL-2GP1;
 Sun, 24 Mar 2024 13:05:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 14:05:29 +0100
Message-Id: <20240324130529.29785-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711285530;
 bh=RIV8w80xNlsrUm5X4tn5c8kc+iNAKtLc9LyvKrte4MU=;
 h=From:To:Cc:Subject:Date:From;
 b=x+iWEZY7yZ3OM2J+oWjsf4I9xq9MeSPArO3ks5JZsNnuEpx+LmN+0OIdYmwmmI+qV
 6PwIQ34TJCmT+wLwa7hhWJTRncFXFIArqZxd2px0vzo6kD66iKSALJMoWsdCZM4X62
 yobecxkHOVn/7yHkU/0lHxj03bNTTW+YWV/+JRfPc09dxPNniBjRjtAhrFEZdCR/Zj
 2sunRrSW6i8vgpy8Nlhpg4eCYx23XOh76RQCgVmGaMIliTTKwnYtMsEijJlYskfT6D
 xcqyHExB8inFlyH49ILw7K1IQU4Nr4ZgOUc3kHnTSOp4ShFHlIZyCGc+ehTNhJk4Nw
 2gjwycwzkr9fQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=x+iWEZY7
Subject: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.12.6
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.6/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 959887ab0e..086bb41098 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.5.sha256sum
-sha256  a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21  libxml2-2.12.5.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.6.sha256sum
+sha256  889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb  libxml2-2.12.6.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 6070c07b03..e7ed6fb752 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
