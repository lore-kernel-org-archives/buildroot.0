Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4CDC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 18:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48B3960A38;
	Tue, 16 Jul 2024 18:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Q_DZl0m5RlZ; Tue, 16 Jul 2024 18:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3983E60ABE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3983E60ABE;
	Tue, 16 Jul 2024 18:40:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD4B81BF3B5
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C622980B35
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbqNR3ryGDvo for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 18:40:18 +0000 (UTC)
X-Greylist: delayed 422 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 16 Jul 2024 18:40:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B1DD80B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1DD80B20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B1DD80B20
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 18:40:17 +0000 (UTC)
Received: from andi-ThinkPad-P52.fritz.box
 (ipb21bd56e.dynamic.kabel-deutschland.de [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id 314735245CE7;
 Tue, 16 Jul 2024 20:33:13 +0200 (CEST)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 20:32:59 +0200
Message-Id: <20240716183259.113591-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=ultratronik.de
Subject: [Buildroot] [PATCH 1/1] package/evemu: needs autoreconf for python
 3.12 compatibility
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
Cc: Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

evemu ships with an ancient py-compile script (from 2011) depending
the imp module, which was finally removed in Python 3.12.
Set autoreconf in order to get an up to date version of py-compile
which automatically handles the different python versions.

This is a similar problem as in
42eae73ef1 package/cracklib: python needs autoreconf

Fixes:

 http://autobuild.buildroot.org/results/a52/a520583be6e86993d268d6535f727a352bd92028/

and many other configs where Python3 is selected and thus evemu
is configured to build the python-bindings.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/evemu/evemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 886ceb1142..b450e372de 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -9,6 +9,7 @@ EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
 EVEMU_LICENSE_FILES = COPYING
+EVEMU_AUTORECONF=YES
 EVEMU_INSTALL_STAGING = YES
 
 # asciidoc used to generate manpages, which we don't need, and if it's
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
