Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1FAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A214340147;
	Wed, 29 Dec 2021 09:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spHicpohTFQi; Wed, 29 Dec 2021 09:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC567400C7;
	Wed, 29 Dec 2021 09:11:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8AB81BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A758660B60
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iK0UO6Osx4sM for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:11:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F148F60AC3
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B5B8182A06; Wed, 29 Dec 2021 09:06:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:11:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50b8d6307f92c26c10b769b58eb867856c5ed78a
X-Git-Newrev: c5912e7db37cc0a04696cf081410ec007f8f0be9
X-Patchwork-Hint: ignore
Message-Id: <20211229090605.B5B8182A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: set HOST*_NOCCACHE variables
 only if unset
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5912e7db37cc0a04696cf081410ec007f8f0be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 1e0e0927ee..99a34c1600 100644
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
