Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC25C83F07
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 13:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3859381E7B;
	Wed,  2 Jul 2025 13:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUN-81EiKaJX; Wed,  2 Jul 2025 13:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DBF381762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DBF381762;
	Wed,  2 Jul 2025 13:45:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5824128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2DFB60711
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4ilLNE_jLdW for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 13:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39EA860703
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39EA860703
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A548856F5; Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Jul 2025 15:14:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49dbfba22f4ae4d39e36484ee403bbb390ddbc6c
X-Git-Newrev: 8e48dd8f216cbc1fbcc35de8dc969ee55a50d8cf
X-Patchwork-Hint: ignore
Message-Id: <20250702134536.1A548856F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-custom: hide gcc versions
 for unsupported CPUs
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e48dd8f216cbc1fbcc35de8dc969ee55a50d8cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards were added in commit [1]
for toolchain-external-custom gcc versions from 4.8 to 12. No guard
was added for gcc 13 because is was the latest version at that time
(and the symbol BR2_ARCH_NEEDS_GCC_AT_LEAST_14 was not available
at that time).

Then, commit [2] and [3] added gcc 14 and 15 without adding
guards.

In order to prevent a Buildroot user selecting an external custom
toolchain that does not support a selected CPU, this commit adds all
the missing guards.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/7fa12e4f9ed736c7238dbdadf4dc5b9da03007b3
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/5f1a38a41f0b6702444940b24bcd0d79a41a0059

Reported-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0a4003b57c..1580ffb920 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -48,14 +48,17 @@ choice
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_15
 	bool "15.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_14
 	bool "14.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_13
 	bool "13.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
