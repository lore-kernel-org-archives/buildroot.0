Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E86C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:10:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE8061A05
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EE8061A05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE5F640111;
	Fri,  1 Oct 2021 18:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ6tzs7uL01E; Fri,  1 Oct 2021 18:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A081401FB;
	Fri,  1 Oct 2021 18:10:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C93C1BF2B0
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A821401FB
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fS8Xfz38dEQD for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 18:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B39640111
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 18:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B84A58DA7D; Fri,  1 Oct 2021 18:08:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Oct 2021 20:09:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5916cc501120aab59452cbe6f99ac8797558e1ca
X-Git-Newrev: 6cddc00399759296ab64fad4956380d89cd71609
X-Patchwork-Hint: ignore
Message-Id: <20211001180805.B84A58DA7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "support/dependencies: don't check
 for `which'"
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cddc00399759296ab64fad4956380d89cd71609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a95c353a46247db036862ad839c095ca9ae4f690.

Switching to using 'command -v' instead of 'which', opened a can of
worms that is hard to fix in a timely manner:

  - recursive call to 'make' from a post-build, post-iamge script, fails
    because of a redefinition of HOSTCC_NOCCACHE (a bug on its own that
    needs a separate fix anyway) [0];

  - 'make' believeing it can call "simple" commands with execve() et al.
    instead of passing them through a shell via system(), and thus
    failing to find 'command' in the PATH [1].

[0] https://lore.kernel.org/buildroot/20211001175329.GA1973888@lbrmn-mmayer.ric.broadcom.net/T/#m95c17eb8374e4e3dd6eee700d397aa12cca0739e
[1] https://lore.kernel.org/buildroot/20211001180304.GV1504958@scaer/T/#m3a8f36bd76ec7d8e5038a6c8932bb6ffe23ea268

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/dependencies/dependencies.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a3e0b3ecc4..c5dcb86231 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -65,6 +65,8 @@ check_prog_host()
 	fi
 }
 
+# Verify that which is installed
+check_prog_host "which"
 # Verify that sed is installed
 check_prog_host "sed"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
