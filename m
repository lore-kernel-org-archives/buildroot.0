Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36242C83F05
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 13:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7FC940A14;
	Wed,  2 Jul 2025 13:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uivDfu39Azv; Wed,  2 Jul 2025 13:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED16440A37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED16440A37;
	Wed,  2 Jul 2025 13:45:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CA82196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E721E40A08
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkUzVSfE1Mls for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2148A40A00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2148A40A00
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08709856EE; Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Jul 2025 15:14:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 533c0aac289a545d07efc69766227d71d2df9d80
X-Git-Newrev: 77242680343df0c619bcba9658039cdb59b05ab1
X-Patchwork-Hint: ignore
Message-Id: <20250702134536.08709856EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: introduce
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=77242680343df0c619bcba9658039cdb59b05ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
