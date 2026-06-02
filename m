Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532B0CD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 18:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27EF610A0;
	Tue,  2 Jun 2026 18:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncOUigigTh5i; Tue,  2 Jun 2026 18:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D180660E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780425873;
	bh=UQep7ofi7zyvQzO/pnvVRESEAfji511i1EaCUGRVxgU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OF9ODGjLIxisrUmIM0GbaubPVLAnXGekw6t99oR6AZyDJ4OO7FC4zY4YEP1Cz0HMR
	 mM0K0eXsBEF3uLIWZs1m4gfk94HCuZ/Ln/153Gh33LKktmRoAQB3V6d8a9Ytcywk1f
	 Ac1IYH3nzBznu9c/QRIXGL0hlXjbornWZIRlb4recKXqB/oIq/q/Wzq4BjFuYcVYuI
	 ovcMdjw4NqzX/RTe2DYVu2/bA+Qh9ZKv5PmuPNkDzvTvBocqBI2pn+cl5H+QH8CAZH
	 aVnWJkqU8PYPQSs5332Q4AkqqQ/J33ODZEc0yBvlX4Am5HC2dcx8n2/DJ+ek5q9KkY
	 HWt5rvw9kimgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D180660E3E;
	Tue,  2 Jun 2026 18:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10AE9187
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 18:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01EEA41CF3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 18:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPaNCGDS50T4 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 18:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE9534129A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9534129A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE9534129A
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 18:44:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90216A4C3A19
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:44:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44618)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUU6E-0000000035n-3H3u
 for buildroot@buildroot.org; Tue, 02 Jun 2026 18:44:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 20:44:26 +0200
Message-ID: <20260602184427.1707888-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780425867;
 bh=hB+FP4QENadm5zr04fyS88b8TtySdPwZO0zCpJeiLwk=;
 h=From:To:Subject:Date:From;
 b=o2CFTYkDj//eYjKe10cdO4uS69f++MvlCzsD6Pve3uqsTEz9IFUqUGOk3fXdQnyG4
 krUrFbwTW6fuzKiV3lo6zfsu9bswTvEpA2rJJuWcB4guCsdU5pl3TyLoH4Oa4+rRQk
 z1AI9ymZMcmrjo8lH9BkVUS8dBrEFNeB2fIYQMiua5+EqcRudZDVyDE256SJ0veKR2
 VSUYxgb/YLCCEfuhDSF5rOLtBxoz0QqTXjrdyyo3ybzz5+iGon/W8PnCMiHMGI+RUe
 XBBTFF0FzvrbkrqAQipupW79F2tEstW+6DT2lfvGOuPf0SNVy6ObfspcvEI+Vcs1CG
 tGjMcPJl8ZJCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=o2CFTYkD
Subject: [Buildroot] [PATCH/next 1/2] package/alsa-lib: bump version to
 1.2.16
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

https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b2539e30e573fb104243141866b5b755d047bc73

 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 1cefb08d5e..9544f1cafa 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e  alsa-lib-1.2.15.3.tar.bz2
+sha256  122b1e3166d55fe19bcde656535d7a36f2ab10e66c72c6ad2f43f20ffded0a96  alsa-lib-1.2.16.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 50e54712d0..2530dae9db 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.15.3
+ALSA_LIB_VERSION = 1.2.16
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
