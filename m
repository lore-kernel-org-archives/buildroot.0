Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48B7D41C2B
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7965B404E9;
	Wed, 13 Nov 2024 09:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qC5sTkFvpI_z; Wed, 13 Nov 2024 09:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6D1C403B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D1C403B8;
	Wed, 13 Nov 2024 09:54:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16D0F1531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67080405F3
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEjvnYMKclny for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D3D040AFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3D040AFA
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 574A586226; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:18:13 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d917825b2aef3696228b86394273a570bb35eab5
X-Git-Newrev: 020a6c269bd4da0c3df7c55b621b61c997bc3706
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.574A586226@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libmdbx: bump
 version to 0.12.12
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9154074463906192198=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9154074463906192198==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=020a6c269bd4da0c3df7c55b621b61c997bc3706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 81e7806b9353ab403e202d3e3d1d2a5818eb390f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============9154074463906192198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9154074463906192198==--
