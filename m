Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F4FCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 339D060F24;
	Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJpdd9Vl7eVf; Fri, 12 Jun 2026 11:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E34D160EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263348;
	bh=alW+FlonkcSbk31vKEcIVNoUXlEygmMrr46pMtR4LCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b0PJtbsk5AnReaVmrZtgD8h6Ejn3A10DZw5vCL48MY8hXQ+QX6lsfXVOEpxtEkfFk
	 I8txoaWNBlEE7P98xV95DMdAlXPbw5eV5ce7FuYP8goa6I4MFSwnpCOlu+SWE9+gY2
	 OnfxdoRre6GZDihVzGsbH5Sf7n8VVcV4xXN39HfQLubFeBksSqq6S53d1BqOk7/QEU
	 5phXjs4ES8IdAjfph7yeoeSgInPcrQk26a0J3fNjM7YtGR5I8u4RT3nPDAE084mgZu
	 oShId+7jtZSYp1qygdVgSM0d95VuZc9wAAfN4vjFrsz8w9kRHw8v2nv/GgDFtst/La
	 ZCOot4QDSRExA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E34D160EF8;
	Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A856237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F65F40148
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-cJmq6a-2SI for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9318240657
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9318240657
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CA0E880D5; Fri, 12 Jun 2026 11:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:09:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 116effbc600d745ad6bf90e7e6cdf13eb6209d8f
X-Git-Newrev: dea44b42a7b07054d71f63108db70574eaec7efc
X-Patchwork-Hint: ignore
Message-Id: <20260612112203.6CA0E880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 fix hash_file location
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dea44b42a7b07054d71f63108db70574eaec7efc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 2df4f1d573685234cc59361cde6c624885056c79)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
