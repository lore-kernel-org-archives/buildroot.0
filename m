Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A92FC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 08:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC16811F0;
	Sat, 29 Jun 2024 08:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdcbmjQXNOX9; Sat, 29 Jun 2024 08:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBBA841C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBBA841C7;
	Sat, 29 Jun 2024 08:27:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9AE31BF387
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 08:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A28FC415CD
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 08:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb-w4i-WN2Uv for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 08:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71B28415BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B28415BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B28415BA
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 08:27:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B017A4C0D1F
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 10:27:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44342)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNTQu-000000004DG-3xwS
 for buildroot@buildroot.org; Sat, 29 Jun 2024 08:27:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 10:27:45 +0200
Message-Id: <20240629082745.3489228-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719649665;
 bh=ym3pE7uihhlfMqn2x2Of+FnuGFm5507ujrhZKHfKKj4=;
 h=From:To:Subject:Date:From;
 b=JMU46oWPA/zUGmz32fwNndvg13jyxKi0hq2QhDbfG5G5nFbU6Z3SI99zvFoQh+hgb
 jVhvCI6NE/dclA3gKCk8rUF/pnN/LTjvgqhfBg2CEjyucFnK8ihbADoKDNLgHTPZ3N
 xIjrR279QuoSI3+cfq7eUdFhtDxBPZXyf8ozbqjhAU/je4pEbuB+ju/TaFgQjFKX0K
 sRUA6qXBrqtZRQOVYmDn8nAQm9BplSvsnadG+PPYDR2JEl0/7ktsrpiJ1JbzOgvlHF
 K8fZa+ZnQudRVyNieD0xGaJhBd4LE6HvFGvNuwXn9iYcIjyqtT3EFE+ic4py218ojn
 fPRIFI7bubMTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=JMU46oWP
Subject: [Buildroot] [PATCH 1/1] package/crda: update patches to be applied
 with fuzz 0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, crda fails to build with output:

    Applying 0001-crda-support-python-3-in-utils-key2pub.py.patch using patch:
    patching file Makefile
    Hunk #1 FAILED at 112.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej

Rebase patch to fix the problem, problem was not yet caught by
autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../crda/0001-crda-support-python-3-in-utils-key2pub.py.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
index f2b9cca2d6..00b5a52ea7 100644
--- a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
+++ b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
@@ -33,6 +33,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Romain: Use pycryptodomex]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Bernd: rebased for version 4.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile         |   2 +-
  utils/key2pub.py | 146 ++++++++++++++++++++++++-----------------------
@@ -49,7 +51,7 @@ index a3ead30..8da38d0 100644
 -	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
 +	$(Q) python utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
  
- $(LIBREG): regdb.h reglib.h reglib.c
+ $(LIBREG): reglib.c regdb.h reglib.h
  	$(NQ) '  CC  ' $@
 diff --git a/utils/key2pub.py b/utils/key2pub.py
 index 9bb04cd..8a0ba2a 100755
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
