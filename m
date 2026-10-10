Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D904CCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EACD04094B;
	Sat, 10 Oct 2026 16:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6wgDHgN5-5A; Sat, 10 Oct 2026 16:44:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF5DE407EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791650692;
	b=c+UA8h8zHapLSqLcvvrTcVP0mNHyKiLNwHMNjyPbtXGoqxMXHKJo6/0LjjRqPru+vIUP
	 0vo6Sp+VXn2W7Fpp/udOU7oE9UGRwlxDmjznR3odnyO7KzU0AW9FYsHyRSJ/V+6KX9Ot2
	 +5+gOgpaBWaYSvqFp/bX5A2onC4tqC2akPpdcAGNmBDgPis+FOFhWk9xI/M3aV15qrPgi
	 l1pGecL2j1UoWrxEBPXk4NMkKEmPnubEpkS+Mnfpw3ZJXpxLhcUG3KtMIGF22LJmxC9U4
	 hQtSdkqC2mo41r79w4Wd02L4FFTDGSm53KFwO/ZjLBBrE6DDywBwR9CBxVFg0JOI6tQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791650692;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gZn6PnY9hrtgKTm6Gg05ZrjNDPQj6tOC+qGbsyeY8y4=;
	b=kLb49l4BqaIMeQ4Shd0TSVcOwbPJ1AtXT3IF1LEdlpCpaK8zmmRgDBaWZmuckFiOqrIb
	 ar+SOFyUaPOzzopfvdR7QxS1nU7HORUajNB0wV/RPvteQrbTtoVhXCtz5Bh3Scphqbgdp
	 PE+ahv+WffBksyFOBvcJDcHAiAMmpDETcvm9tLQ8LXIaIRwT/I7UkihGZOxz8MJvCM5l/
	 zM7pG6eQxYILRmAQWgouSM2J9TxpcNBPkfKCXtxzvDoU9OMrWVW76Eyd6aV/Z30UBpRst
	 DoPR6jVqkqt9cu+1HjE1qLtGxcmnL10VtWbXNltM9Qcbl1rlcr5XVjZ2wEOA9ekoJvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791650692;
	bh=gZn6PnY9hrtgKTm6Gg05ZrjNDPQj6tOC+qGbsyeY8y4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DeeuFfFhMBVcYIkmfnhS5U7cwTIdotgyLz6j/gaPmYhJ75ex5+MRuUelOX+wUEuL0
	 ePRXITt9CdFWXXXadTHB29STfiQQNzkfPtIDixOq7newPgwaG+3wTVEIOwsmOkiqse
	 LtIc78SMGtlqHqTrkcDvRaNoHnxJn/GhwOAViI9VLsFoUpX6h9zr7DqiJ+6km0VD99
	 UqwEoBYauON56zBV5lcx1a8/+EfxFh4grEI72g6btJvb2vly2RmCAbEMA/jBkMPln/
	 3EFTqrE/kmhFD4ovIeWloezfss3a9NvrS4f4erzl1Esy3YacPRl9sD/CEcGMjht1Cy
	 H9/NHY3rTathw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF5DE407EE;
	Sat, 10 Oct 2026 16:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2EF1DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD88340891
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMPp-CVgH46q for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A81940882
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791650687;
 b=eRdq1D+Amd7SSbYNXtBtpiRIgOnCa/MNHmGNBxLJMoYnjOOUlhQeVrvhGOFuiWsTVwGQ
 fu5dVbTozuNHQn/ZSSo0iecJT+XxEtm00/PFX78g/+4KWYTcoGwT0QgdnxfQQBi+KoX9z
 pgic/00MD7IMVtZqeskwMUHgST5/LW5scnbGSRfTmqgGg8tn/iq/dxKQpsVonbMlzzfwi
 lIDP1KR0BOc4jEC5jxe5H1rbQxcNXk5kmH/bx+pM6F8b4QgZKL21XkYKMYeSxOS6qofgs
 fv+CZ1VTqz29T/6SXb6wX3ZtAn6r6A7CSC3Qi8gdVLA/VrYvqRBk6oohXdUcv9PyvVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791650687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4Pn1qrt3GjBHlSaKrgOOxsoy2p+ANLeTQJet25BiYpw=;
 b=nujJZFqkbFyb4GmyXhI87tAJUE/rk1dZSkxzI1biPEUos6gIBcMxmMC7VEG4PKQguYPa
 F9zidrelDl83WKifwFEkHg2gMikzMTP7lBjjs0eNwPf61tRczLdH8XlfU2fsYYWfcYKSx
 P1Y9yc+zITk34y16OFenn9+0O8Pc5DzJODfCviB4QpD801S6Qdm/hnBj9LMh5+VMyQpYt
 /B5/9A83j2Gvflp65VW4MMf5oCsBWNYFgckdJLnO0iX5+QhVwRBy4RUvywg1sO1Y8Zcuc
 6QND2ZIxhYPSJdtOoRt2qcZNbxQ1uEedSAXRW7tJ5oRlNkrZgQJ/HrqnibI/py0sSJg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A81940882
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5DC792083; Sat, 10 Oct 2026 16:43:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:44:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8caac27d69f54eac96cbb14687e9d54797de2354
X-Git-Newrev: 119f97d1e96d80a0eae451377e710c444a5321b5
X-Patchwork-Hint: ignore
Message-Id: <20261010164328.C5DC792083@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal2/post-image.sh: add custom
 hardware support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/119f97d1e96d80a0eae451377e710c444a5321b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Users will ultimately need the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config to
import custom dts files for custom versal2 hardware. Improve the post-image.sh
to support either the default device tree which comes from u-boot or a
custom device tree for custom hardware.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs or overlays.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 board/versal2/post-image.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index af50909fb1..3037e0a5ab 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -1,9 +1,17 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "system.dtb", and
-# with versal2, the Linux DTB is the same as the U-Boot DTB, so
-# let's use a symlink since the DTB is the same.
-ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+# By default U-Boot loads DTB from a file named "system.dtb".
+# With versal2, there is no default dts in the Linux kernel tree
+# because the default is the same as the u-boot.dtb. This means
+# it is necessary to cover two cases, a custom dts or the default.
+# The BR2_LINUX_KERNEL_DTS_SUPPORT will only be set for custom dts
+# files, so it can be used for checking which case is configured.
+if grep -Eq "^BR2_LINUX_KERNEL_DTS_SUPPORT=y$" "${BR2_CONFIG}"; then
+	LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+	ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
+else
+	ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+fi
 
 BOARD_DIR="$(dirname "$0")"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
