Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B149AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6989D80AFD;
	Wed, 23 Feb 2022 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJeQjpK1dX5c; Wed, 23 Feb 2022 20:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE7282978;
	Wed, 23 Feb 2022 20:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4A901BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2F4C82978
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QN5VBYoeXdq for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:23:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A51E082977
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:23:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 265CB838A7; Wed, 23 Feb 2022 20:15:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 21:20:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fc5c8e92c1d7997e48b207187d2d3c7ad42819c
X-Git-Newrev: a7062df3272be4a012e0b8288f17bb7e0220bbdb
X-Patchwork-Hint: ignore
Message-Id: <20220223201530.265CB838A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: set FRR_XREF_NO_NOTE
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7062df3272be4a012e0b8288f17bb7e0220bbdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set FRR_XREF_NO_NOTE to avoid the following build failures with
microblazeel, nds32 and xtensa raised since bump to version 8.1 in
commit ca2753fd47d47e5ad0eec16ea62f7b7f096331b6:

_clippy.ELFAccessError: virtual address (538157256) not found in program headers

[...]

/tmp/ccFGv94v.s:13: Error: can't resolve `__start_xref_array' {*UND* section} - `L0' {.note.FRR section}
/tmp/ccFGv94v.s:14: Error: can't resolve `__stop_xref_array' {*UND* section} - `L0' {.note.FRR section}

Here is an extract of
https://github.com/FRRouting/frr/blob/7347a4859d4b984cea0aef769a16622d3f02e44f/lib/xref.h:
"the following blurb emits an ELF note indicating start and end of the xref
array in the binary.  This is technically the "correct" entry point for
external tools reading xrefs out of an ELF shared library or executable.
...
FRR itself does not need this note to operate correctly, so if you have
some build issue with it just add -DFRR_XREF_NO_NOTE to your build flags
to disable it."

In other words, this is only *possibly* needed for another package that
wants to extracts the xrefs. We currently don't have anything that
depends on frr in-tree, and it's not even installed in staging, so it's
hard to check, but it seems pretty unlikely that this is really needed.

Fixes:
 - http://autobuild.buildroot.org/results/3cdb50f5e5a1b3f37a6edcd4276fcbf015e28828
 - http://autobuild.buildroot.org/results/a3cc0b5090a1faa2bca9c8dfe0fec9b6a918ba4d
 - http://autobuild.buildroot.org/results/694cc65478a82ec93d2074252892036855cdc49d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frr/frr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index cc83016f9f..0e6ab7a815 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -17,7 +17,9 @@ FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
-FRR_CONF_ENV = ac_cv_lib_cunit_CU_initialize_registry=no
+FRR_CONF_ENV = \
+	ac_cv_lib_cunit_CU_initialize_registry=no \
+	CFLAGS="$(TARGET_CFLAGS) -DFRR_XREF_NO_NOTE"
 
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
