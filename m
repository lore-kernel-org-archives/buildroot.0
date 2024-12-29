Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5233E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 15:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5409180E22;
	Sun, 29 Dec 2024 15:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_PofwuXNwVz; Sun, 29 Dec 2024 15:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E06D80E44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E06D80E44;
	Sun, 29 Dec 2024 15:51:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E91CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 340CE80E44
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcfn3LyWbgah for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 15:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 624D980E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 624D980E22
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 624D980E22
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:51:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8cb.dip0.t-ipconnect.de [84.161.184.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73216A4C41FB
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 16:50:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55226)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRvZB-00000000879-2RdM
 for buildroot@buildroot.org; Sun, 29 Dec 2024 15:50:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 16:50:56 +0100
Message-Id: <20241229155057.1910781-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735487458;
 bh=Cefqvz8qRch4NLjgz6BydlWOH8zAceQmQTnEgMlkgp4=;
 h=From:To:Subject:Date:From;
 b=keDu5VTH3Frp2Ke7spoFQc7j/tLOUcH9lySuWE3UJ1I6UPPhiaO4as3ZNjYVu13ud
 ajTzUIwPyGB2Ln2LaDcPySa2M2LOFpmc3ICw3te//lw7eO2YlRJzyl05MLqfJlvS5V
 QNlseNDIA1JVIqGX8M/tfzMI2iFtwWS9rk2qYHmZwhEY7HgqcX0H5ZAd5R/+dl8GkM
 IECUggdCMKnh+q+6YOmzBkRc4mcGLDSTuCHnrejNRlYLNmHifWJVXcIzlsyxJwnSyy
 PAcjhgkBhkxibSk3z/RCU7yceXWlUD5yzyUsozQtAmtZeDtFqPliSg0ejuywvafGXJ
 5GyKGWdn48r5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=keDu5VTH
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-argustv: bump version to
 21.1.0-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index df9b9242d4..e18c4995a6 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2fc9a21411f2015ef5d07fc4aad1411588860b2036a5677bde88b2429839192b  kodi-pvr-argustv-21.0.2-Omega.tar.gz
+sha256  8a4b7029ef620043c44ee2e863a6240573c817fa5d3a4f8498ad6381688c1ad0  kodi-pvr-argustv-21.1.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index d1f05cadf7..a785694b47 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 21.0.2-Omega
+KODI_PVR_ARGUSTV_VERSION = 21.1.0-Omega
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
