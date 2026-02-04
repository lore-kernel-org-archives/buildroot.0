Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F0AEA7943
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 20:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C13E825DF;
	Wed,  4 Feb 2026 20:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTb37sLIEXyr; Wed,  4 Feb 2026 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3951083641
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770235564;
	bh=3QnPHpWccKEgYSTdrU2e4LSLZSjVmHuuLETPIu58DUI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTZcFkdwXGmRi2hlXG98yOWqVl+2haXZPqzYi/gyDB8ZNdOFH1NF6gFh17x00O3qs
	 gYaxIIP4uWqIs71ugqUJsHhGIiDECSSrMjEMWrBTxKqhQWA6ULDwCruRtV8aYINOlg
	 dRkDOTHVVvKOYddzv69a53t0WOt1MKixAtlxNNC+7Lb6IDY4MpwFz5byCPGQ7Qrt+d
	 7u27W9SNx6VT3DYOk99xKow/YFWuwC7NSVQF4gz+Co1lL6gv5djjeUzVol4v+MLJn3
	 kMSMJyhD0fwMwcyFca5c2cGLif8Q0KIFkFGWn6TNfgc4AtDPZB5UMYczajIvkTQMWP
	 w65ZbSvCiYIVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3951083641;
	Wed,  4 Feb 2026 20:06:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CACA17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55F8660E07
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fB9m7dVPlTpf for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 20:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8B3160AF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B3160AF9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8B3160AF9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:05:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5408CA4C565A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 21:05:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42250)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnj8D-000000008Jp-0qts
 for buildroot@buildroot.org; Wed, 04 Feb 2026 20:05:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 21:05:44 +0100
Message-ID: <20260204200544.3753631-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204200544.3753631-1-bernd@kuhls.net>
References: <20260204200544.3753631-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770235545;
 bh=G/zbkMY8A4MI+/3nFRgo/m1yP0P1XoPJXrEj85yZgKw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rQ5Dacn8LUdip7ziYf7/ZI4tpQnGqZbzUHVwCWg7ZfGUnvhKF0PSIXxumFjbe1sKO
 MSs2qF+FWuzE3zX4N/FvDFJNxHVyDhWIo+VrUWCp0JCzqurKLVYHKr+mx/sDcn99vI
 WFfhF1CCEswcltPSvU8hRKpKHD570tPWL/J3EpLExBAxwhWYTJQCbsp5kg8QUk8eK9
 ea6JuwbzbVMtH01t3EIFlUvK72qnTG+5j/Vyih3Rm9vRN0/2+uz9szKPSw9SEjCQ5U
 vBHvSdLjHcHMCSVi0JzWjiC3XbDt1qGUpmIrupInLbtHNndQ14UiFDMFMjWo7J21di
 Qt5i/Uf5+bv4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rQ5Dacn8
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-mythtv: bump version to
 21.2.14-Omega
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

https://github.com/janbar/pvr.mythtv/blob/21.2.14-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index dcb363a095..a8b6ca79b6 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cec35fe171a388fa9eab4366d5e1f6fcca869a995bc3ea4e3566a38a2db75c4  kodi-pvr-mythtv-21.2.3-Omega.tar.gz
+sha256  c34a54d06aefef1c4c250ab766c459becc1fdaf42782da75cf749b71585bf6dd  kodi-pvr-mythtv-21.2.14-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index d4c70013cc..78ea3041b7 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.2.3-Omega
+KODI_PVR_MYTHTV_VERSION = 21.2.14-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
