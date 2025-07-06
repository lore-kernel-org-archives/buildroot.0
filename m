Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20744C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 06:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC8E560E3B;
	Sun,  6 Jul 2025 06:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmkb8V1X49lo; Sun,  6 Jul 2025 06:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11DB160EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DB160EC4;
	Sun,  6 Jul 2025 06:44:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 343E415F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 255BF40C36
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74bnS0VDLwHu for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 06:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4745E40C34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4745E40C34
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4745E40C34
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C04FA4C3ADE
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 08:44:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49540)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYJ6n-000000008SG-0KoY
 for buildroot@buildroot.org; Sun, 06 Jul 2025 06:44:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Jul 2025 08:44:16 +0200
Message-Id: <20250706064416.276504-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250706064416.276504-1-bernd@kuhls.net>
References: <20250706064416.276504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751784257;
 bh=XCvzpbixrCSh+VsEtNTFr9aYbRxu5sELJIApSAdK6jY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tr/wi5Zdg3I90uT6Toh/F6oR1s1jw07lyoKEqChexJcqsE0KaubY0raANcEEnTMub
 mKhMDDnmEb76NkzXBwteFCBM/BcGj4onnSaNBCQRtkrbekV394cU1aojAVVLUas0RP
 PO8W9V2dMvH/mY7AQlPS5uEUkS0fhwlKoXBHVV5dtrV/KE6ahI54Ql3e1Ty5EGiPtj
 SSG5LkTnYsAbSZ4ppk5dhKZsKK7K70XqQj8Tq7GHmQ9MuYsb1jYlz/crCid1V2NYa2
 QKGuN6UsUMXoMaVqwQ5pgKe5bhuYofwvTxitfuUHMgJ/x3P9oLx5A6vWrWw5ZwgxqH
 C1b/eiz3Mwamg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=tr/wi5Zd
Subject: [Buildroot] [PATCH 3/3] package/ntp: add Upstream tag to patch 0001
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
 .checkpackageignore                          | 1 -
 package/ntp/0001-ntp-syscalls-fallback.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 298d080475..dc62f1f2a6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -859,7 +859,6 @@ package/norm/0001-protolib-drop-linux-version-check.patch lib_patch.Upstream
 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch lib_patch.Upstream
 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upstream
 package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
-package/ntp/0001-ntp-syscalls-fallback.patch lib_patch.Upstream
 package/ntp/S49ntp.in lib_sysv.Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
 package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
diff --git a/package/ntp/0001-ntp-syscalls-fallback.patch b/package/ntp/0001-ntp-syscalls-fallback.patch
index 46704b9d3f..445efd95e5 100644
--- a/package/ntp/0001-ntp-syscalls-fallback.patch
+++ b/package/ntp/0001-ntp-syscalls-fallback.patch
@@ -1,7 +1,6 @@
 inline ntp syscalls fallback
 
-Reference:
- https://bugs.ntp.org/show_bug.cgi?id=769
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=769
 
 Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 ---
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
