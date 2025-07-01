Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF52C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51FD6611DA;
	Tue,  1 Jul 2025 19:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1D1OTzeRnki; Tue,  1 Jul 2025 19:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CCB36072F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCB36072F;
	Tue,  1 Jul 2025 19:44:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A58179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF45C6072F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8J7Lb9Zat4Z for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3A156083A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A156083A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3A156083A
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 676F0B0053E;
 Tue,  1 Jul 2025 21:44:18 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  1 Jul 2025 21:44:09 +0200
Message-ID: <20250701194411.13153-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751399063;
 bh=+le69U7xLKDLJm++h5+l1XK0STPxFcDMyVYMwzct2+o=;
 h=From:To:Cc:Subject:Date:From;
 b=bnP483/nGLC3qhdH0TQWqjUW+p2fRXI9uLnA0FPIZHeyzAU7TisimZs8vfXLt+eCO
 LBVWI245thwroIJeSkCFMs8+BxOfj/qC29LYAckVTZcJK11sRUFg20wna9odtblh70
 t+1Jy8weK+r9gTCRdmIltF68QLOtLAcfkjw/IoI9mYRwS/u0iG8PJ7oY3ntUNoICKD
 sTgzwblnzBfWo1DiZicSaZDtPTSN2Q3CUekNFEFDRcLFMRZyIV2WegVgN2ruFBYv3A
 pmBvrV5Qvze22D+/2LmtbYiJKalMJy6Fxvwxa08Slt87NtzHGN/vt6t4OLjEjQwZwT
 C0OJQdpiZBiuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bnP483/n
Subject: [Buildroot] [PATCH v2 1/3] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_16
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gcc 15 was introduced in Buildroot in commit [1].

In Buildroot, a user creates a build configuration in Kconfig
menus by selecting the CPU architecture and CPU first, then
a toolchain that support this CPU, then packages and system
configuration.

To make sure those Kconfig menus and choices behave correctly in that
order, we use a logic in which a CPU selects the Kconfig symbol
BR2_ARCH_NEEDS_GCC_AT_LEAST_N (with N being the needed gcc version).
Then, to make sure unsupported gcc version are hidden for a selected
CPU, a gcc version N has in fact a "depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_(N+1)". For example, Cortex-A710 needs
at least gcc 12. See [2] and [3].

This means that when we introduce the latest gcc version with this
logic in place, we already need this BR2_ARCH_NEEDS_GCC_AT_LEAST_(N+1)
symbol defined. Doing so is desirable to avoid forgetting to add it
later. See for example commit [4], adding those missing dependencies
for gcc 13 and 14.

Since in Buildroot we currently keep 3 actively maintained gcc
versions, adding a new gcc version N in Buildroot should:
- add the BR2_ARCH_NEEDS_GCC_AT_LEAST_(N+1) symbol
- add package/gcc N
- switch the default gcc from N-2 to N-1
- drop package/gcc N-3

Then, once this new gcc N is added, new CPUs supported by that version
can be introduced, by selecting BR2_ARCH_NEEDS_GCC_AT_LEAST_N.

All this logic will be ready for future gcc versions. This was also
described in commit log [5].

This commit simply adds the BR2_ARCH_NEEDS_GCC_AT_LEAST_16 symbol.

It is worth mentioning that, at the time of this commit, gcc 16 is not
released yet. This release number 16 is already known, though. See [6].

For reference, this was discussed in [7].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/75891397abe60dbe3d82a1ec39654ff81d1b1406
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/arch/Config.in.arm#L514
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/package/gcc/Config.in.host#L27
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/6f231d3003502282710a0da7ecd98344ec868095
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/eab17d763c6ca1bf74749e3a793fd044b5e6d457
[6] https://gcc.gnu.org/gcc-16/changes.html
[7] https://lore.kernel.org/buildroot/877c0v1sn1.fsf@dell.be.48ers.dk/T/#m45688e25632401029e4c0d989072e1d3e1a59854

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- mention buildroot commit eab17d76 in commit log, which already
  described this topic.
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 6b54c65df9..fa8fe0f5ac 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -311,6 +311,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
