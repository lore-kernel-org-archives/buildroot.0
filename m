Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FCECAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 10:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B6EB613BF;
	Sat,  4 Oct 2025 10:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mj4FgKEdGI2M; Sat,  4 Oct 2025 10:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84FF26123E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84FF26123E;
	Sat,  4 Oct 2025 10:31:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ACB7909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 880BB406DD
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpvdoOz-Epwg for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 10:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D317E406E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D317E406E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D317E406E0
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:31:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7346AA4C5977
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:31:10 +0200 (CEST)
Received: from [192.168.1.144] (port=59748 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4zXh-000000000dh-3V9G
 for buildroot@buildroot.org; Sat, 04 Oct 2025 10:31:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 12:31:09 +0200
Message-ID: <20251004103109.28487-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759573870;
 bh=gOcu+yK9M5Cc7yTBNdSX7FAU6yehKKlTU7a3GlNaXyE=;
 h=From:To:Subject:Date:From;
 b=F1szcNeGnm3YtLGr0F1aWBKzKmO30B6jFuUyMOUI6WLTLh8lUauB4iO9Ahcv4NjAX
 UASxeosTeG4KVm8zKxg/nLq3lIigld1iH2ejkhfn7elP++eFZEAuq1Yc6MAB+dCYJ3
 tMHZwjOSc22N1w3Gy6wsZK8MTA44Mj1NOVtOwQVhC7H1WuslhKRTg3/2mjAe02NRM1
 yQzNDPGgJWOf+X3NwpE2C/coGbVQXuWhJ8IzfvdrtxIoB0FyU33G7WwTSLDeN4Km5S
 Ci7SC+v1DqMKax3aj0hW7j6nAu3Cxz28L7qmZmdhcFu67+oCl+PFwsF/r8O6l3qhVW
 Wg44DvPJ+wtPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=F1szcNeG
Subject: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: fix license hash for kernel 6.17
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

Buildroot commit 76d25d365bc12c34d01703f1f9a45a0e02454466 added support
for kernel 6.17 but forgot to update a license hash needed due to
upstream commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/LICENSES/preferred/GPL-2.0?h=v6.17&id=660470dc58624242e39b7fdc6290c81a4f810b1e

Fixes:
https://autobuild.buildroot.org/results/fbf/fbf40bda2e31ed9b9eb94dbc398123695366b776/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b975932778..f233337062 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -14,5 +14,5 @@ sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
 sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
