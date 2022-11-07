Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EDC43219
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 17:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59AAB817D3;
	Mon,  7 Nov 2022 17:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59AAB817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UxwQNZ4FbTl; Mon,  7 Nov 2022 17:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67531817B1;
	Mon,  7 Nov 2022 17:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67531817B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8ED1BF954
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8613D40286
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8613D40286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpRAzU-JF3QN for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 17:33:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9021D400DB
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 17:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9021D400DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CC8C88096; Mon,  7 Nov 2022 17:33:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 18:31:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3dde2792693bda14bebcdb907ba81c0db3a18c60
X-Git-Newrev: 8450b769187087751f83cbefcf0a88f70d9da670
X-Patchwork-Hint: ignore
Message-Id: <20221107173309.7CC8C88096@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-cargo: move
 CARGO_HOME into DL_DIR
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
Content-Type: multipart/mixed; boundary="===============6328436027483053964=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6328436027483053964==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8450b769187087751f83cbefcf0a88f70d9da670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CARGO_HOME is where Cargo stores its downloaded artefacts. See
https://doc.rust-lang.org/cargo/reference/environment-variables.html:

  CARGO_HOME — Cargo maintains a local cache of the registry index and
  of git checkouts of crates. By default these are stored under
  $HOME/.cargo (%USERPROFILE%\.cargo on Windows), but this variable
  overrides the location of this directory. Once a crate is cached it
  is not removed by the clean command. For more details refer to the
  guide.

We currently make it point to $(HOST_DIR)/share/cargo, but this has a
number of drawbacks:

 (1) It is not shared between Buildroot builds. Each Buildroot build
     will re-download the crates index, and the crates themselves,
     unless of course the final vendored tarball is already there.

 (2) With BR2_PER_PACKAGE_DIRECTORIES=y, it is even worse: CARGO_HOME
     is not even shared between packages, as $(HOST_DIR)/share/cargo
     is per package. So each package in the build that needs vendoring
     of Cargo crates will download the crates index and the crates in
     its own CARGO_HOME location.

To solve this, this commit moves CARGO_HOME into $(DL_DIR), so that it
is shared between builds and packages.

Even though not the best/most authoritative source,
https://github.com/rust-lang/cargo/issues/6930 indicates that there is
a lock when accessing CARGO_HOME, because a user even complains that
this lock has even become more coarse-grained than it used to be
(which for us is fine, it just means that two Cargo fetch operations
from two different packages will be serialized, not a big deal).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Moritz Bitsch <moritz@h6t.eu>
[yann.morin.1998@free.fr: rename directory: s/\.cargo/br-cargo-home/]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 5923725f5e..666c5ac971 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -20,7 +20,7 @@
 #
 ################################################################################
 
-BR_CARGO_HOME = $(HOST_DIR)/share/cargo
+BR_CARGO_HOME = $(DL_DIR)/br-cargo-home
 
 PKG_COMMON_CARGO_ENV = \
 	CARGO_HOME=$(BR_CARGO_HOME)

--===============6328436027483053964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6328436027483053964==--
