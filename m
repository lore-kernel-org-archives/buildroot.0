Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE56C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B3D8607DC;
	Sat, 15 Jun 2024 18:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Z3XP6vqTMMo; Sat, 15 Jun 2024 18:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C811607BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C811607BB;
	Sat, 15 Jun 2024 18:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A20531BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F8B5607BB
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wVBBWLKf-Yh for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF07C60645
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF07C60645
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:56:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A82F187E91; Sat, 15 Jun 2024 18:56:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:52:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 913a6c7788ef2dcc76860e45d2abe70cce812b9d
X-Git-Newrev: d1f3ae32c2feba6541b41dac77e6daf63fc3aece
X-Patchwork-Hint: ignore
Message-Id: <20240615185604.A82F187E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] ppd-merge: speed up per-package-rsync
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
Content-Type: multipart/mixed; boundary="===============8623153738087179541=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8623153738087179541==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d1f3ae32c2feba6541b41dac77e6daf63fc3aece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The per-package-rsync stage can add a significant amount of time to
builds. They can also be annoying as the target-finalize and
host-finalize targets are the slowest and run on every `make all`, which
is used frequently for partial rebuilds.

The per-package-rsync is slow because it launches a new rsync for each
source tree, and each rsync must rescan the destination directory and
potentially overwrite files multiple times. We can instead merge all the
rsync calls down into one call, and rsync is smarter about scanning all
the source directories and only copying over the files it needs to.

We feed the source trees to rsync in reverse-order, as this preserves
the original behaviour. I.e. when using multiple rsyncs, the last source
tree would overwrite anything in the destination. Now when using a
single rsync, we put the last tree first as rsync will select the first
file it finds.

This only supports the 'copy' mode, which is used in the finalize step.
The 'hardlink' mode would require specifying each source tree with the
--link-dest flag, and rsync only support at most 20 such trees at a
time, so we'd need a clever loop, so the 'hardlink' mode is left out, at
least for now.

Below is a benchmark running the host-finalize target for a build with
200 packages.

Benchmark 1: before copy
  Time (mean ± σ):     27.171 s ±  0.777 s    [User: 6.170 s, System: 14.830 s]
  Range (min … max):   26.343 s … 28.566 s    10 runs

Benchmark 2: after copy
  Time (mean ± σ):      6.296 s ±  0.196 s    [User: 2.874 s, System: 5.600 s]
  Range (min … max):    6.094 s …  6.709 s    10 runs

Summary
  after copy ran
    4.32 ± 0.18 times faster than before copy

Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d1964299af..3ab9e9fe52 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -221,18 +221,12 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 # $4: literal "copy" or "hardlink" to copy or hardlink files from src to dest
 define per-package-rsync
 	mkdir -p $(3)
-	$(foreach pkg,$(1),\
-		rsync -a \
-			--hard-links \
-			$(if $(filter hardlink,$(4)), \
-				--link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/, \
-				$(if $(filter copy,$(4)), \
-					$(empty), \
-					$(error per-package-rsync can only "copy" or "hardlink", not "$(4)") \
-				) \
-			) \
-			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-			$(3)$(sep))
+	$(if $(filter hardlink,$(4)), \
+		$(foreach pkg,$(1),\
+			rsync -a --hard-links --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+				$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ $(3)$(sep)), \
+		printf "%s/$(2)/\n" $(1) | tac \
+			| rsync -a --hard-links --files-from=- --no-R -r $(PER_PACKAGE_DIR) $(3))
 endef
 
 # prepares the per-package HOST_DIR and TARGET_DIR of the current

--===============8623153738087179541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8623153738087179541==--
