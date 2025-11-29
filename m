Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B66D116F3
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 08:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2C8606AF;
	Sat, 29 Nov 2025 08:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQxz-TiWf1AQ; Sat, 29 Nov 2025 08:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D2BD606FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D2BD606FF;
	Sat, 29 Nov 2025 08:07:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C54811A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 08:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A9040AED
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 08:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2N78dWc48bqI for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 08:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1EDB40ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1EDB40ABE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1EDB40ABE
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 08:07:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA37FA4C7761;
 Sat, 29 Nov 2025 09:07:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49808)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPFzC-000000003cH-2BKq;
 Sat, 29 Nov 2025 08:07:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Sat, 29 Nov 2025 09:07:18 +0100
Message-ID: <20251129080718.1667632-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764403638;
 bh=1nGaRRNwCCp4IVKhZfdgcyEjHawnBSWr4JAtX7lbWpY=;
 h=From:To:Cc:Subject:Date:From;
 b=eYn3oYxKNfBLGRYhDHCggjKDPDrf1pCOInL3UmiubGk+ANEya2SQDChCJxgs9x6BU
 kMsZLOVjh3QF5JIm255BJKcoaWygCq+/fW9voYZlNnpwgFlxoDOiGKwJcyWF4LXMcg
 8KOP7JyjgTSKkOLePIlsMNEVtpF8sG7nFJWXVSHNgLok7ZZV6VKFjedF4ksROEyYkd
 yVALTvS7f75I2nR8EIkitarAvUM/2h27Ypk+/8uTQ5mdir5q08cqAyesLsXAozobcV
 /cHG25vRXnDa1YJ/e9BNpKqxsP6Kdv5hsw6oAbfJj2AcZZu+8zFU5Yj+5dSjezI5Rn
 6UcDoW2dh6NfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=eYn3oYxK
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: bump version to 9.33.0
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

Changelog: https://github.com/LINBIT/drbd-utils/blob/v9.33.0/ChangeLog

Fixes:
https://autobuild.buildroot.net/results/abd/abd9fe3f8b8051b8fac278bcd56e1c11aa056737/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 9bdfd69538..c9db5b6587 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  730d68b9ee48df7b2e3ddff38bf54a5bc405651bac0ece180b4f22a468e543b3  drbd-utils-9.21.4.tar.gz
+sha256  223fe07d0b646e991b33ba9ea41468f9a66f903562e7da766dd0fc6b4ea33db9  drbd-utils-9.33.0.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index c1035191f1..657f9fafd8 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.21.4
+DRBD_UTILS_VERSION = 9.33.0
 DRBD_UTILS_SITE = http://pkg.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
