Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F94FC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1FAD60872;
	Fri,  3 Jul 2026 19:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NS_qxcuYX1Fp; Fri,  3 Jul 2026 19:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66AA3607EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783106454;
	bh=kNRQ32wgfBk7vf0ly14ZYYyRz3ae3VYLXMCy1xaEYVc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NIklhvJQX/p76Z9K3fAvxyY9xNRmFgSgkeaKcW5pSSXBPgVhSxBUHxk0r4dpl0CB7
	 XYMvWUXQlXVGuoRTP3VqidOvg2SkFnr8oSf61gtOptFnDoeNhGo02ljvs30R0ZYi/E
	 Jdu/+rCEnsQ7yTHShdAXazavJaOpK7FXalI7S5UvQRHRV2FLSUhIy02oXOawev1LbQ
	 SBoHxXQ6bb4+1+12hm9vl2SRZJMIl+b/YI2j8/1q/VPzC3erRcuIjz7DpbsvH60MJ6
	 xHXcmj/Ps+4Uso0coAAVUdsIcjSdVETtqVaXI/mESLIiUi+T5qRxd6C1frEfrfDL+g
	 1BwFSz7FvjOkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66AA3607EF;
	Fri,  3 Jul 2026 19:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC89C316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F88405BA
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UmmJLlP5mS7 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:20:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9079B4059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9079B4059A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9079B4059A
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:20:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9CD6BA4C0465
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:20:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56462)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjRS-000000000eX-1Pxt
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:20:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:20:50 +0200
Message-ID: <20260703192050.3692508-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783106450;
 bh=qptUJqc56JIJO4phnLYhZBovA+hhmtPtOGehi1cGH/E=;
 h=From:To:Subject:Date:From;
 b=Xgp3jJNYheM0OwgzneGEP8vwPW0dHsg9fSXHY1i+hWS8pfKTnRjg5Wx2tBKKOTFRE
 IAEDk8Q/mfXc9BMfe1oG5jQfaDTCwgte3R4I5PNPVnIjzTdxV2q65jk/Wu3Xfm9P6U
 Lj5SVXYwzM7/AliE+V4N2IQa6B3Q/uU19jYyGUQSWvlpOPb64EU+xhZuEWXwm6MyPC
 cHwmRU9ddoQUdxk+2rNUMTKSGrbwAbZEzoBKtrJVp9x95OfRfvztKifqQca32gahRi
 xlmlMX0J/0/ZGZ0GB7SdtJA4QFbFnflmrqb7VekmqDIqvxyPcrbVrfsa4kHYVFphFm
 2R/fzbR91ryDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Xgp3jJNY
Subject: [Buildroot] [PATCH 1/1] package/libvpl: bump version to 2.17.0
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

https://github.com/intel/libvpl/releases/tag/v2.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/525db8e9afe68ee3f75f5b26483bc76df6dba41d

 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 08b2de31fc..684de90837 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d60931937426130ddad9f1975c010543f0da99e67edb1c6070656b7947f633b6  libvpl-2.16.0.tar.gz
+sha256  4de3e2faf1e8307fb282e4a43f443191810f6a6b0a484fffa7995ba1c814c6ec  libvpl-2.17.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 4e3c4807cd..e5ab9ac8ee 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.16.0
+LIBVPL_VERSION = 2.17.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
