Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DAECFD35B
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 21:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF42F83B8F;
	Mon, 24 Nov 2025 21:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVVkTD7HElhP; Mon, 24 Nov 2025 21:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037F783B7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 037F783B7A;
	Mon, 24 Nov 2025 21:37:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE0135C
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 513EF60E00
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bvrk6_T_3qIq for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 21:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 167DE60DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 167DE60DE3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 167DE60DE3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:37:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5097A4C75B5
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:37:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41552)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vNeFb-000000001xN-0KEI
 for buildroot@buildroot.org; Mon, 24 Nov 2025 21:37:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 22:37:35 +0100
Message-ID: <20251124213735.1553096-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764020255;
 bh=k30DE104f0NSIvn3QKjeRgFIKnIcuz+wPxxo8jwgBfw=;
 h=From:To:Subject:Date:From;
 b=CwBqDzNC+iUxkL+qJPJrZxbCfihWRNsTDgHoPgMcI/UF7/NQmTus4c36yQAWgtCTM
 Lyln7VPVt9G4aWqMCjvABiRXOY0Dqehw4QzHk/td+6sLCm1OUkNUHCCqT/pUXOO6bJ
 +emsfYQNsDuMX/DIxDFTcynlykNQlD4cqFJ9JEdR5PAG9e/6i5dFDLHCNngNEiWnZT
 do4mvbXIbykchGGlsYqX/4ou+DToWNi/Qpr5Ro1ohGS+zYQPLIDliwXJGkzts4iirX
 RtDQB2A/n8lYJwws5IRpM9LeQ/VslMoLbO7+8dh+cYhr/XkstbQCb8MuJB+QZC44VS
 Q3w6+36DUXM9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=CwBqDzNC
Subject: [Buildroot] [PATCH 1/1] autobuild-run: also save Meson config log
 files on package failure
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
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 4987c61..0e4e4bf 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -627,7 +627,7 @@ class Builder:
             srcroot = os.path.join(self.outputdir, "build", '-'.join(reason))
             destroot = os.path.join(self.resultdir, '-'.join(reason))
             config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
-                'CMakeOutput.log')
+                'CMakeOutput.log', 'meson-log.txt')
 
             for root, dirs, files in os.walk(srcroot):
                 dest = os.path.join(destroot, os.path.relpath(root, srcroot))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
