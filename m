Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64845C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B2E610FF
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0B2E610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 954C440607;
	Thu,  5 Aug 2021 20:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-9Qv9p36vYp; Thu,  5 Aug 2021 20:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E62CC405E9;
	Thu,  5 Aug 2021 20:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73DCE1C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 611CD401CA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyTr1ucnq7_N for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:46:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A693400CD
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:46:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0CF518C5BC; Thu,  5 Aug 2021 20:46:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:35:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 208e98beb2d550529d39b098ebd6a692d6ce822d
X-Git-Newrev: 3418a068befff3cf15c0a49ba1539a162f6bce53
X-Patchwork-Hint: ignore
Message-Id: <20210805204613.0CF518C5BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/test-pkg: remove
 configurations that are skipped
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3418a068befff3cf15c0a49ba1539a162f6bce53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When the config fragment provided by the user is not usable with a
specific toolchain configuration, the resulting .config file was kept
around.

In a follow up commit, we'll need to know, from outside test-pkg, if a
specific configuration was indeed usable or not.

So, unless if the user actually requested to keep the build directories,
remove the .config file when it contains a configration that would be
skipped.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/test-pkg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/test-pkg b/utils/test-pkg
index a317d8c17a..54c6c5e8fe 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -161,6 +161,10 @@ build_one() {
     # done in the same locale.
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
+        if [ ${keep} -ne 1 ]; then
+            # Invalid configuration, drop it
+            rm -f "${dir}/.config"
+        fi
         return 1
     fi
     # Remove file, it's empty anyway.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
