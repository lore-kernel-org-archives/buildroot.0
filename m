Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B3AD33999
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 15:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B85403BB;
	Mon, 28 Oct 2024 15:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOpSLsc8iAvy; Mon, 28 Oct 2024 15:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96434037A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C96434037A;
	Mon, 28 Oct 2024 15:41:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BA1AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D232808A2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtHHjomsc4ev for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 15:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D446480851
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D446480851
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:41:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAAAD821B2; Mon, 28 Oct 2024 15:41:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 15:47:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04141fdcab49608102e62aee3615dff7c5017ed1
X-Git-Newrev: 81e7806b9353ab403e202d3e3d1d2a5818eb390f
X-Patchwork-Hint: ignore
Message-Id: <20241028154105.BAAAD821B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.12.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2475945434097765457=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2475945434097765457==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=81e7806b9353ab403e202d3e3d1d2a5818eb390f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is bugfix release of stable libmdbx branch.

The most significant fixes since v0.12.10 (the previous version pinned to
buildroot):

 - Fixed the possibility of `SIGSEGV` inside the `coherence_check()` after
   changing the geometry by another process with an increase in the upper
   DB size above the previous in-process limit.

 - Fixed cursor(s) handling opened in parent transactions and closed before
   the completion of nested/child transactions. In such case, closed
   cursors were "resurrected", which led to a leak of memory allocated for
   such cursors.

 - Fixed a possibility of `SIGSEGV` when enabling logging of the
   `MDBX_LOG_TRACE` level in debug builds.

 - Correction of the missing `TXN_END_EOTDONE` in the case the start of
   a reading transaction fails. The mentioned bit-flag was missing in the
   transaction destruction/shutdown path on error its launch. Because of
   this, an attempt was made to destroy the cursors, which led to crash
   debug builds, since the corresponding array is intentionally filled
   with poison pointers.

 - Modification of `mdbx_close_by()` to return an error when trying to
   close the dbi descriptor of a table created and/or modified in a
   still-running transaction. Such premature closure of the descriptor is
   an incorrect use of the API and a violation of the contract/preconditions
   formulated in the description of `mdbx_close_dbi()`.

   However, instead of returning an error, an incorrect closure of the
   descriptor was performed, which could lead to the creation of a table
   with an empty name, leakage of database pages and/or corruption of a
   b-tree structure (wrong reference to the root of a table).

The complete ChangeLog:
    https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 1dbdef7c69..222e7caf5c 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  4637e06768a9a8fc7577e6e458e045ad1f9a8baee74996a3c88bc0ad64cbcf67  libmdbx-amalgamated-0.12.10.tar.xz
+sha256  19c0eb33e1ed43ca2a94dceb06dd31946432d16f30a9751d3701c67efa22eb1a  libmdbx-amalgamated-0.12.12.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 6e0571ff24..c736945e92 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.12.10
+LIBMDBX_VERSION = 0.12.12
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============2475945434097765457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2475945434097765457==--
