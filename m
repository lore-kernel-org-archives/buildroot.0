Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1331C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 11:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E39F402D2;
	Wed, 22 May 2024 11:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2r7ClfXpTzjI; Wed, 22 May 2024 11:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29A09402DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A09402DA;
	Wed, 22 May 2024 11:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8DD1C5AF1
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 379A540102
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_b8XHOZKrJY for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 11:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64FBD400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64FBD400C4
 for <buildroot@buildroot.org>; Wed, 22 May 2024 11:58:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A21B8750C; Wed, 22 May 2024 11:58:43 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 13:55:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ea7784c9427e25a3b4f39ab1cc82a9ac1c01966
X-Git-Newrev: 1263adf7a97b2cbc943b0c947f24401a59716aa6
X-Patchwork-Hint: ignore
Message-Id: <20240522115843.4A21B8750C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments: fix
 bootlin-x86-i686-musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=1263adf7a97b2cbc943b0c947f24401a59716aa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
