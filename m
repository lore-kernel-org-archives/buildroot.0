Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3366CCD193
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 20:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A76ED61656;
	Mon, 20 Oct 2025 20:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxyfIwzQpnNy; Mon, 20 Oct 2025 20:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD9E6163A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD9E6163A;
	Mon, 20 Oct 2025 20:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F36F70A
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E958A82C7C
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x2sC7GDXkb0 for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 20:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFFF182C38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFF182C38
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFFF182C38
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94864A4C2073;
 Mon, 20 Oct 2025 22:34:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38910)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAwaK-000000006LE-2xwq;
 Mon, 20 Oct 2025 20:34:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Oct 2025 22:34:26 +0200
Message-ID: <20251020203428.2751864-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020203428.2751864-1-bernd@kuhls.net>
References: <20251020203428.2751864-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760992468;
 bh=IwPCjf0j1MVSKn69t+9tImDpaOyOeNTpRw2AlHspUF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uzrQWm/MJ3EUWmcwo5v0dB72944chnGnN0yCmg6noCx+6jX8ZuUBxtFC/59XSUr4q
 gWKjWPWbz2q3zrocKTrJWuSNtr9lp0gIJyDbm31Nc/aJjrk7T7XDzCAq+hnLTrgYS5
 paEfKmO64ENR58sjMCd1T3XLps3qEbOeVLQuvyeZLa6iicwIBBevfh2Ri2Wjm9sdr8
 tN1I9TQuXopB+Z5wdoFJ1uiH9yydVwG8xGMAys0oxr7/9LrKD18Ybd2Qm1D65Ye4Gp
 ZmS3mMqvwbG66W/0Wuxx5/FfUCW0HcHbYBhB5uYOThGK2bzsNebp+GJU7INv9zJmyG
 3Js9Dr/IN/4Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=uzrQWm/M
Subject: [Buildroot] [PATCH 2/4] package/dante: security bump version to
 1.4.4
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

Changelog: http://www.inet.no/dante/announce-1.4.4

Fixes CVE-2024-54662: https://www.inet.no/dante/advisory-2024-12-16.txt

Needed for bump of libminiupnpc to version 2.3.3.

Updated license hash due to copyright year bump:
https://github.com/notpeter/dante/commit/53727f08eec6cae55c4ed6efb88c3d688839f2cb
(commit taken from unofficial mirror)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dante/dante.hash | 4 ++--
 package/dante/dante.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dante/dante.hash b/package/dante/dante.hash
index a76018fdb6..c9d86608d9 100644
--- a/package/dante/dante.hash
+++ b/package/dante/dante.hash
@@ -1,5 +1,5 @@
 # From https://www.inet.no/dante/download.html
-sha256  418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d  dante-1.4.3.tar.gz
+sha256  1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec  dante-1.4.4.tar.gz
 
 # Hash for license file
-sha256  05e2db26147a8575005f090aada119ea6cb40a4382164929d647f00abef3bdfd  LICENSE
+sha256  49034b51407f6e51a07aed87c3c00c0889294348cd5e99d78d6b6f62746ff3fc  LICENSE
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index bae46c5a71..2f4e75d1e5 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DANTE_VERSION = 1.4.3
+DANTE_VERSION = 1.4.4
 DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
