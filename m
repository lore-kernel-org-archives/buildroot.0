Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78F6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751DA40918;
	Mon,  7 Mar 2022 22:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9yTzgfuHmS6; Mon,  7 Mar 2022 22:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1656408C9;
	Mon,  7 Mar 2022 22:27:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADD711BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D5C58294A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfXeFwfiT2rZ for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:27:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDE7782948
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:27:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0892581375; Mon,  7 Mar 2022 22:19:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 23:15:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd03d4f057bdbd343f78360bd732df1b47d774a0
X-Git-Newrev: b4adbfaf2e6153ad0e811b4debcf945ff5788c76
X-Patchwork-Hint: ignore
Message-Id: <20220307221917.0892581375@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: disable tesseract
 without threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4adbfaf2e6153ad0e811b4debcf945ff5788c76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ghostscript embeds a local copy of tesseract-ocr which is enabled by
default since version 9.53.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7322ef87546c55b29056c1d96d8bdbb7f3ba53ef

Since version 9.55.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5459f7aca1ded3b7cf96c339a2419f418aa406c7,
ghostscript expects that tesseract is disabled if threads are not
available resulting in the following build failure since commit
7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22:

configure: error: Threading disabled or not available. Tesseract OCR relies on threading. Rerun configure with "--without-tesseract" to exclude OCR from the build

So disable tesseract if threads are not available. It should be noted
that there is no way to tell ghostscript to use a system provided
tesseract-ocr package.

Fixes:
 - http://autobuild.buildroot.org/results/fd35a47b2a77cf57c243ec1c88802b53ddca8f52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ghostscript/ghostscript.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 24a0c489a8..02cb35fcfc 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -83,4 +83,8 @@ else
 GHOSTSCRIPT_CONF_OPTS += --without-x
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+GHOSTSCRIPT_CONF_OPTS += --without-tesseract
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
