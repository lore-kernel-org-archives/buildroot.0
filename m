Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53936D0E415
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E18B60866;
	Thu, 24 Oct 2024 20:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0MqbI3B4FnA; Thu, 24 Oct 2024 20:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B18960828
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B18960828;
	Thu, 24 Oct 2024 20:22:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CC55497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B6094044B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wwdgd-tWj1ql for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:22:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10629400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10629400B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10629400B5
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:22:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf36.dip0.t-ipconnect.de [79.214.207.54])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3BB89A4C0160
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 22:22:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34062)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t44Lu-0000000059l-39IE
 for buildroot@buildroot.org; Thu, 24 Oct 2024 20:22:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:22:36 +0200
Message-Id: <20241024202237.2629544-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729801358;
 bh=Amt+4MjcNRLqXGxPK5Xz7iqzbgIeZ64j4ccPDowh6Wc=;
 h=From:To:Subject:Date:From;
 b=hWekSSIFrY1tp4pOf7O/2j80t5QqpkRtKCpH5astc3TDxOmJh3nGQaoIJCeVEOAUF
 UtC7iTCvkks9iJpCkuJGkGmR0JnXVsZWZ70vRirChjdIaHbnXndSeZhX19bdm9xv34
 KqsmTRpiMXO4I5tcjYdrzb7v/WXRF5lpB1mbKqeRKMyjfaXYp/MaN2/jGQ2DDMy5cf
 Fa5pBHFKZ2MT/6zYgr8xQxrn/Nn4QaIwyZ0LJP0cmDOO6Ys/601cAsdZPVG7r67KDt
 g8dlxPcbkIYt2ManxxNB1nEgk4hBOAvTjDiWEM+IIgPYDXrsVp0iFl6eLYp+IOJYZv
 VyeE6iWezgzJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=hWekSSIF
Subject: [Buildroot] [PATCH] package/kodi-pvr-mediaportal-tvserver: bump
 version to 21.0.4-Omega
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
 .../kodi-pvr-mediaportal-tvserver.hash                          | 2 +-
 .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index b6add33bb7..568ec564cd 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0aedb77bd9f3a36375feec7f3769d596dbc536b66d584eb933fb11ec7cff8514  kodi-pvr-mediaportal-tvserver-21.0.3-Omega.tar.gz
+sha256  8193889ef3033e2df471660bae77a02e7c12d519928eed19b19142c548070b1c  kodi-pvr-mediaportal-tvserver-21.0.4-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 8ada1a1eb1..ec01821411 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.3-Omega
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.4-Omega
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
