Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4A1ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 14:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B745402CE;
	Mon,  9 Sep 2024 14:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrjLffkOgeUa; Mon,  9 Sep 2024 14:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 215594045A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 215594045A;
	Mon,  9 Sep 2024 14:39:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACA7C1BF863
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 14:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2108880E3A
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 14:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ga0aUJ-OIT2W for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 14:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC3C80E40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC3C80E40
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 14:39:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4F1E86D74; Mon,  9 Sep 2024 14:39:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Sep 2024 16:22:25 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d78b6cf98a47fabde85ea10c7c04d276ab484d68
X-Git-Newrev: ba22d70c074e0b2790279e461d510dcffebacb07
X-Patchwork-Hint: ignore
Message-Id: <20240909143900.E4F1E86D74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/am335x-pru-package: correct download hash
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
Content-Type: multipart/mixed; boundary="===============8671616147315924188=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8671616147315924188==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ba22d70c074e0b2790279e461d510dcffebacb07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
http://autobuild.buildroot.net/results/94fd27ea48c4128033ad10cf0dc5dba3f5d97a02/

Commit 4aff9fae454495d071829cbe (package/am335x-pru-package: fix download
issue) updated the filename and hash of the package, but something went
wrong when adjusting the hash for 2024.02.x.

Investigating the local tarball shows that the permissions in the tarball were
were wrong:

diffoscope old-dl/am335x-pru-package/am335x-pru-package-5f374*-br1.tar.gz \
           dl/am335x-pru-package/am335x-pru-package-5f374*-br1.tar.gz | \
	   grep 96/.gitignore
│ │ --rw-rw-rw-   0        0        0      199 2016-02-10 20:56:25.000000 am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096/.gitignore
│ │ +-rw-r--r--   0        0        0      199 2016-02-10 20:56:25.000000 am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096/.gitignore

And indeed, the file does have mode 666 in the git repo:

ls -lah old-dl/am335x-pru-package/git/.gitignore
-rw-rw-rw- 1 peko peko 199 Aug 31 18:16 old-dl/am335x-pru-package/git/.gitignore

It is unclear how this happened, maybe an issue with switching between
master/2024.05.x/2024.02.x.

Adjust the hash to match what is should have been instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/am335x-pru-package/am335x-pru-package.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/am335x-pru-package/am335x-pru-package.hash b/package/am335x-pru-package/am335x-pru-package.hash
index a6fc8109af..c7e7e32d4c 100644
--- a/package/am335x-pru-package/am335x-pru-package.hash
+++ b/package/am335x-pru-package/am335x-pru-package.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  065807a896717a112a8630883ae87271a7586db7c72f21ec3572f76dd77ec34b  am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096-br1.tar.gz
+sha256  cb7d2998431a1d76e41121d0728d921baecb1501a25d30950102d017b0ced9d7  am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096-br1.tar.gz
 sha256  f0fcdf9b2090896389eb4b784f23be96d5544c5ce5282d84f82ae9a8e8331beb  pru_sw/utils/LICENCE.txt

--===============8671616147315924188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8671616147315924188==--
