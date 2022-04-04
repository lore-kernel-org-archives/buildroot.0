Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3990C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 07:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5538360EEA;
	Mon,  4 Apr 2022 07:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfydY2lLErIa; Mon,  4 Apr 2022 07:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 660E1605A1;
	Mon,  4 Apr 2022 07:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C30091BF306
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD75140223
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTpRD6ivBBXV for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 07:27:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D7540186
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 07:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 26CBD86150; Mon,  4 Apr 2022 07:18:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 09:27:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 192dfc68c0e43d0865beb16250582b3b4e5ed178
X-Git-Newrev: d1fc278f6d7bbb86be5f9b13d6ab9302ade5c12b
X-Patchwork-Hint: ignore
Message-Id: <20220404071821.26CBD86150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/tpm2-tss: bump version to
 3.2.0"
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1fc278f6d7bbb86be5f9b13d6ab9302ade5c12b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ed13a65a08cfe315aed9344abc609f5f2b92c782 as it
has the following non trivial issues:
 - pkgconfig files have no version number if we run autoreconf
   (https://github.com/tpm2-software/tpm2-tss/issues/2329) resulting in
   the following build failures with tpm2-{abrmd,pkcs11} or libsecret:

   configure: error: Package requirements (tss2-esys >= 2.0) were not met:

   Package dependency requirement 'tss2-esys >= 2.0' could not be satisfied.
   Package 'tss2-esys' has version '', required version is '>= 2.0'

 - addgroup/groupadd and adduser/useradd are mandatory since
   https://github.com/tpm2-software/tpm2-tss/commit/7fde604383c62fc764a1e060dff48fc06f79860b:

    configure: error: addgroup or groupadd are needed.

It seems better to find an upstreamable solution to both issues before
bumping.

Fixes:
 - http://autobuild.buildroot.org/results/d4d6807af3493deb47951c6f11f427040e5c5e11
 - http://autobuild.buildroot.org/results/a304e45bacb8cd7e7ea9bc49e4a8ec9359ca0a3a
 - http://autobuild.buildroot.org/results/be0befa81e955ac8cf16f9d20723f9b9b174e012
 - http://autobuild.buildroot.org/results/d4ebee400423f6df51613193c86db3c58c94ff88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index db6b3b7ad0..b6eb3c1f97 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  48305e4144dcf6d10f3b25b7bccf0189fd2d1186feafd8cd68c6b17ecf0d7912  tpm2-tss-3.2.0.tar.gz
+sha256  8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8  tpm2-tss-3.1.0.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 568ac35c8f..060883c377 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.2.0
+TPM2_TSS_VERSION = 3.1.0
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
