Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A1AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B136D40914;
	Sat,  5 Mar 2022 14:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emzmEiFM2HyB; Sat,  5 Mar 2022 14:55:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67FC408F8;
	Sat,  5 Mar 2022 14:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6D41BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B52C4018D
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wmepsiH6OhM for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CF6E403BE
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C8B13826CD; Sat,  5 Mar 2022 14:46:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 15:08:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cfbda109fc41d7567a67666f1f8a541ea1d1f61
X-Git-Newrev: 2baaf5bcd748521a3bfcc178c284bc2b302993ed
X-Patchwork-Hint: ignore
Message-Id: <20220305144636.C8B13826CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: needs cargo
 env when downloading
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

commit: https://git.buildroot.net/buildroot/commit/?id=2baaf5bcd748521a3bfcc178c284bc2b302993ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-cryptography is a python package, but it internally builds a rust
crate. As such, it needs to be vendored at install time.

Currently, we only pass the path to the sub-directory where the rust
source is in the package tree, but calling cargo needs additional
variables, most notably it needs CARGO_HOME to be set in the
environment, otherwise it ends up writing in the user's own cargo home,
which is by default ~/.cargo/

We do not really know what variables are used at vendor time, so we pass
the full Cargo environment, that we pass when building target packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-cryptography/python-cryptography.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e642691bc5..a524f729c8 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -24,6 +24,7 @@ PYTHON_CRYPTOGRAPHY_ENV = \
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
 PYTHON_CRYPTOGRAPHY_DL_ENV = \
+	$(PKG_CARGO_ENV) \
 	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
