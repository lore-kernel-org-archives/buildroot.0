Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC645ECD6C5
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EA06136F;
	Wed, 11 Feb 2026 16:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwVTlSrfm1Zt; Wed, 11 Feb 2026 16:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E096135B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770827671;
	bh=HeOnBbm4zQmk2FexFQ7Cl7w9gUhUyAAeYewmIuWquNw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=flk9SGR59ZUHDsmVetHp+ocSSvcFN2DlfWs9wUe3EBgVmxCLPU02LpPMR3zIz0K0K
	 n8bz2NSxX29HmjGom1QzHC54XVo4eCcuSrdEBbuEL951luKTOuxbteFlN8bcb8RM1Y
	 X7ZEOu/R1EdNqfXU223gj8MQNpiLpkVA9Mqhu+1h+5yY/YKPa8y7RholrBM5TgiB4h
	 INrUyr0i9T8ZUX8UgwC5npZNvUjKDYGAhK5yjrMtmN0OeHzsZ8B7G93qO97RO0noAk
	 klUx1BtS0EjakQKDzruyPRdzQ21i4CkGkXiY3/ENHMR+2X4OiLFLebRpPW7bh6W/IT
	 TW0tzPeRB4I4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E096135B;
	Wed, 11 Feb 2026 16:34:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C05F1BE
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 16:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA5C61348
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 16:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLPOvT9N5E9e for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 16:34:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76B3960DB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B3960DB8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76B3960DB8
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 16:34:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EABA8A4C0DEE;
 Wed, 11 Feb 2026 17:34:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54096)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vqDAT-0000000010E-3nW0;
 Wed, 11 Feb 2026 16:34:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 17:34:22 +0100
Message-ID: <20260211163422.987611-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770827663;
 bh=m6BwHKEDmEmx1g39m9NmXg64ma9YANDQEWAA8JHaTaA=;
 h=From:To:Cc:Subject:Date:From;
 b=fVvaliHbpHn+FEgWhlfiudO9p6xSdsMXRsmSKqC3X7ZseB7fTP0x2W24rwXe9CQCb
 KYLLm3NMRq/j5sxKRdK1YlEa075LZQL96J3nFnMvUP066dLFElZKUoZc6D9uQoAe9a
 SboBWQv0HS5AnF3G8cO+Nr6WEDpPyhbdJgk7lEc3RyE/fHid3vSho+qRSNz438UQD5
 FBD9LZOb1fjNaikxWKgEX8hA7IX0/uN+/FJe9OPw496o5lWkMdQX0pIX5vb33jQEca
 th+1CmrPOM6j/oCLjZA2a1Hqj2wXI9vIiaYWkx2bvmyeAHJCaJcInE7Bb/qAh4b4xe
 42jW8D7DLOkGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=fVvaliHb
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.19
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

Updated license hash due to copyright year bump:
https://github.com/strace/strace/commit/4d6755b556fb00fe5c33b09b08f951bad956c580

This bump includes two upstream commits
https://github.com/strace/strace/commit/bf9384561f295340f85c69deb307740fc9dc28f0
https://github.com/strace/strace/commit/822b5e840dbf4a80262eaea455d9bc7b6a00d245

that fix build errors introduced by the bump of linux-headers to version
6.19 with buildroot commit 566150745bf61fdc1aee68fcf319bc4e8942960a.
This bump is not included in any buildroot LTS branch so no backport
necessary.

Fixes:
https://autobuild.buildroot.net/results/7a3/7a35bfcae87b1fbe1d6e0c4271a364ce330c1d51/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strace/strace.hash | 8 ++++----
 package/strace/strace.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 268045ef1d..63c32a53ef 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature with RSA key from
-# https://raw.githubusercontent.com/strace/strace/refs/tags/v6.18/GPG-KEY
-# https://strace.io/files/6.18/strace-6.18.tar.xz.asc
-sha256  0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325  strace-6.18.tar.xz
-sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
+# https://raw.githubusercontent.com/strace/strace/refs/tags/v6.19/GPG-KEY
+# https://strace.io/files/6.19/strace-6.19.tar.xz.asc
+sha256  e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143  strace-6.19.tar.xz
+sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5230b4d60c..3f9e68820c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.18
+STRACE_VERSION = 6.19
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
