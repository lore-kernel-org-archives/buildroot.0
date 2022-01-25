Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC49C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8479F4034C;
	Tue, 25 Jan 2022 21:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uj6LKdjCt6ZS; Tue, 25 Jan 2022 21:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB78640341;
	Tue, 25 Jan 2022 21:12:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0B951BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB864828B3
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwRoc6_KDO_P for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:12:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BAA882890
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:12:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E4F39814BB; Tue, 25 Jan 2022 21:05:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 22:07:28 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 2d4a00623ebc44f197b08e039fe533bba82290b5
X-Git-Newrev: 7a6bcea2b1da0c38344baa55feab9b6990f6c697
X-Patchwork-Hint: ignore
Message-Id: <20220125210534.E4F39814BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] Makefile: set
 HOST*_NOCCACHE variables only if unset
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a6bcea2b1da0c38344baa55feab9b6990f6c697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Set HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE only if they are not
set. This allows recursive calls to "make" to work as intended in the
presence of ccache. Such recursive calls to "make" can for example
happen if one calls "make legal-info" from within a post-build script,
to integrate some results of the legal-info output into the root
filesystem.

Without guarding these variables, a recursive invocation of make would
re-define
    HOSTCC_NOCCACHE := $(HOSTCC)
and
    HOSTCXX_NOCCACHE := $(HOSTCXX)
at a point in time when HOSTCC and HOSTCXX already point to ccache.

It used to work by "accident" until
ca6a2907c27c8171336643d1ab41bd5c34ee3794 ("make: support: use `command
-v' instead of `which'"), due to how "which" was behaving when invoked
with multiple arguments. After switching to "command -v", which
behaves different with multiple arguments, this HOSTCC_NOCCACHE
redefinition problem surfaced. Even though
ca6a2907c27c8171336643d1ab41bd5c34ee3794 has since then been reverted
for other reasons, it does make sense to guard the definition of
HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE to not rely on a side-effect of
using "which".

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c5912e7db37cc0a04696cf081410ec007f8f0be9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 74ef7dc598..386b4f4e44 100644
--- a/Makefile
+++ b/Makefile
@@ -286,12 +286,16 @@ ifndef HOSTCC
 HOSTCC := gcc
 HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
 endif
+ifndef HOSTCC_NOCCACHE
 HOSTCC_NOCCACHE := $(HOSTCC)
+endif
 ifndef HOSTCXX
 HOSTCXX := g++
 HOSTCXX := $(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
 endif
+ifndef HOSTCXX_NOCCACHE
 HOSTCXX_NOCCACHE := $(HOSTCXX)
+endif
 ifndef HOSTCPP
 HOSTCPP := cpp
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
