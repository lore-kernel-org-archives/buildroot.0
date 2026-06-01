Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C0CCD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0499605C4;
	Mon,  1 Jun 2026 19:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CIIJ8_TWz7n; Mon,  1 Jun 2026 19:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9495605BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341164;
	bh=A5W0n+Xfwkyfn51pdOgzdb4vvWJjEja4ohDTCnXbpC4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nq8S/S0sf9zveVUeTNKfpiD7XKOHpABm6DVe6vUXMNIl2jLZKRiTZ2ZW16SFHznmW
	 o2S4CBT8/34Uwx6vFyJXjIkzojXCvoBNwR819ACjPspslyXquQthd7UmEqsLWg8MWs
	 B08CousZrAB2TJe96E/dLt3YvvfGdP0GLXdLfLu4/yZDUtjTrBSTYfzwZmtjIvBvaN
	 RS0bu8558kw+rF5IA6MaGo2JpwwCfFhcUU80r2J2ubd3LqcRqjxHXTds5wrM1GeU/o
	 jN84GyNNTW5ekyBM/R6/Mk35QOdGdTEjdJ96JwkbmlG/BCht209vN7rGWod4TZX01T
	 +jJ03WUdD3f7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9495605BE;
	Mon,  1 Jun 2026 19:12:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A7F8F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C334402B1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqES8MRou55D for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455C5402A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 455C5402A0
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2437C8780B; Mon,  1 Jun 2026 19:12:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 21:12:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92cdec5a54a009ece181eaaa6446fadef0303a66
X-Git-Newrev: 2df4f1d573685234cc59361cde6c624885056c79
X-Patchwork-Hint: ignore
Message-Id: <20260601191228.2437C8780B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: fix hash_file
 location
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2df4f1d573685234cc59361cde6c624885056c79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 'show-info' output always the location relative to the Buildroot
root directory.
When running 'generate-cyclonedx' outside of the Buildroot root
directory the hash file locations are not correct. Only using the
'hash_file' variable coming from 'show-info' doesn't guarantee the
script to succeed.

Use the 'brpath' variable to correctly reference the absolute path.

Fixes: 1791b79422 utils/generate-cyclonedx: add hashes from .hash files to externalReferences
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 11edc05d80..bade018cd4 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -302,7 +302,7 @@ def cyclonedx_source_hashes(comp, source):
 
     hashes = []
     for hash_file in comp.get("hashes", []):
-        with Path(hash_file).open() as f:
+        with (brpath / hash_file).open() as f:
             for line in f:
                 line = line.strip()
                 if not line.startswith("#") and line.endswith(f" {source}"):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
