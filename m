Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E510C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5CF4092E;
	Mon,  3 Jun 2024 15:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZ4iUitjFR96; Mon,  3 Jun 2024 15:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C1F40925
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C1F40925;
	Mon,  3 Jun 2024 15:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8061BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E055B60854
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVHI2OSjMHzk for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C13560A52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C13560A52
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1755A87A02; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 17:52:06 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 30cb9d9f902caf02e715df1cbab967dc9e8bea52
X-Git-Newrev: bf952b0cb7d10361389984027019161d46da105f
X-Patchwork-Hint: ignore
Message-Id: <20240603155720.1755A87A02@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/config-fragments:
 fix bootlin-x86-i686-musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf952b0cb7d10361389984027019161d46da105f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit a8be4a04ad "support/config-fragments: replace
br-i386-pentium-mmx-musl" replaced this old toolchain by
bootlin-x86-i686-musl.

When using test-pkg with all toolchains, bootlin-x86-i686-musl is always
failing. The issue can be reproduced with for example:

    utils/test-pkg -a -p busybox

The issue can also be reproduced with a simple config like:

    cat > .config <<EOF
    BR2_i386=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE=y
    BR2_PACKAGE_BUSYBOX=y
    EOF
    make olddefconfig
    make

Compilation fail with output:

    Cannot execute cross-compiler '/i586-linux-gcc'

This issue happen is because the toolchain can never be selected.

The config fragment [1] selects BR2_i386 alone.

The target architecture variant default to i586 if target
architecture is i386. See [2].

Finally, the generated toolchain options includes a depends on
BR2_i386 and !BR2_x86_i586, making the toolchain always ignored.
See [3].

This commit fixes the issue by adding BR2_x86_i686=y to the
bootlin-x86-i686-musl.config fragment as suggested by the
Bootlin toolchain fragment [4].

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/a8be4a04ade8e695c5c4d4a825253d69e80693f9/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.2/arch/Config.in.x86?ref_type=tags#L38
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/345ccb523e/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options#L5768-5770
[4] https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/fragments/x86-i686--musl--stable-2024.02-1.frag

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Romain: add the link to the Bootlin toolchain fragment]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 1263adf7a97b2cbc943b0c947f24401a59716aa6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/bootlin-x86-i686-musl.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/autobuild/bootlin-x86-i686-musl.config b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
index 2afe096f32..697e9c625e 100644
--- a/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
+++ b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
@@ -1,4 +1,5 @@
 BR2_i386=y
+BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
