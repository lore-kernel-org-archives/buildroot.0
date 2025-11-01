Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E105BCCF9F0
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 08:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B68761C41;
	Sat,  1 Nov 2025 08:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYoAB_AkVZn1; Sat,  1 Nov 2025 08:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB8A161C42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8A161C42;
	Sat,  1 Nov 2025 08:30:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35592964
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A8740488
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qteTS3T7t3zs for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 08:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3818640ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3818640ADE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3818640ADE
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:30:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E490CA4C5B0A
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 09:30:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35074)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vF6zo-000000004Si-3i9H
 for buildroot@buildroot.org; Sat, 01 Nov 2025 08:30:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Nov 2025 09:30:00 +0100
Message-ID: <20251101083000.2088619-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761985801;
 bh=O1e9gQac6520QyvfcRIJnyDFtqbSxKk8KRQRrtFbM/4=;
 h=From:To:Subject:Date:From;
 b=uSkQyqH3hIpCVt8RjpOZrV/aAk6dV1uXhEaIFGgV4GBDbtQ5bZQdayeEZ6WWpGKVT
 B5jk+pXCrYR5oRdahRWQllFZLSx/D/pEehI/mzq2GfW5lCjbOhWmoMPRcpfCiXfv3y
 XDJywpo9f6mxbU0uWp8pUlo/kRUSBzWQc57OC+Y6b4DYWA5UT++nix6y8SwRnypkqW
 vPJsYxWW7TD2VJvZfTpO6+Gay3WZqyq/YExishIBc9p8IeSz6NFy5FRgkUj3Gu7JRx
 Rz/9eX351VCutVf9Ki3fnqf6Scy9W6+o9KHb4CyFFyHJUGkLjEtOtDcUqU6UHreuRi
 CMZiiCiyRe8Wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=uSkQyqH3
Subject: [Buildroot] [PATCH 1/1] package/enscript: Fix build with gcc 15.x
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

Fixes:
https://autobuild.buildroot.net/results/7fd/7fdda216e2ec57b9bcc1d2613b6546db35a29749/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/enscript/0002-enscript-c23.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/enscript/0002-enscript-c23.patch

diff --git a/package/enscript/0002-enscript-c23.patch b/package/enscript/0002-enscript-c23.patch
new file mode 100644
index 0000000000..707674935d
--- /dev/null
+++ b/package/enscript/0002-enscript-c23.patch
@@ -0,0 +1,19 @@
+Fix build with gcc 15.x
+
+Upstream: https://savannah.gnu.org/bugs/?66845
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff --git a/compat/regex.c b/compat/regex.c
+index c6907f3..87f2840 100644
+--- a/compat/regex.c
++++ b/compat/regex.c
+@@ -336,7 +336,7 @@ typedef char boolean;
+ #define false 0
+ #define true 1
+ 
+-static int re_match_2_internal ();
++static int re_match_2_internal (struct re_pattern_buffer*, const char*, int, const char*, int, int, struct re_registers*, int);
+ 
+ /* These are the command codes that appear in compiled regular
+    expressions.  Some opcodes are followed by argument bytes.  A
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
