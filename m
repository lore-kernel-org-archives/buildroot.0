Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283A3C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 21:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A120260A69;
	Tue, 21 May 2024 21:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zkdXbsQ3fIX; Tue, 21 May 2024 21:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F20FF60A57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F20FF60A57;
	Tue, 21 May 2024 21:38:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5CF1BF414
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 21:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 363DC400C9
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 21:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iF7TnVY979o4 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 21:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37E55406D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E55406D0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E55406D0
 for <buildroot@buildroot.org>; Tue, 21 May 2024 21:38:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B627DB0051E;
 Tue, 21 May 2024 23:38:21 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 23:38:14 +0200
Message-ID: <20240521213814.763832-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716327503;
 bh=+RE15io8BHDZRVNWf3CWpfKEiirqdZPJv2fkWl72UQM=;
 h=From:To:Cc:Subject:Date:From;
 b=A0xB4f7ubcoZSfDvGpRtXZg3yE5HrbhSp5rYPZ75Yn6Ma9h024txNgJ840AbSZYR8
 eVB2FwY8DWVoZW7q0MFHdm9oIBGRP65O13CbKd8QvsJsG2z4QGlmrG3HSjOBNlOIlP
 Vdz578beKUOxYfRay/C4Ljvey89A7ymIDoRQOJ4u34J/KEKmxC161Fc+/ThBE1dA0D
 XSv6gDKGFIf443KX0aVBBd/namdsjCqWNZRLFtCeMEEpNpOyHLR0EPpS8rAPiyaXHe
 CG6NQIqtxVwihyefrkwr41OnmjBkQY3kiNNbjH4EO/K7xvAZgicitdFqGkkEfQR/X+
 m44nSwo+pukWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A0xB4f7u
Subject: [Buildroot] [PATCH 1/1] support/config-fragments: fix
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

This commit fixes the issue by adding BR2_x86_i686=y to the config
fragment.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/a8be4a04ade8e695c5c4d4a825253d69e80693f9/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.2/arch/Config.in.x86?ref_type=tags#L38
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/345ccb523e/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options#L5768-5770

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/config-fragments/autobuild/bootlin-x86-i686-musl.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/autobuild/bootlin-x86-i686-musl.config b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
index 2afe096f32d..697e9c625ec 100644
--- a/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
+++ b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
@@ -1,4 +1,5 @@
 BR2_i386=y
+BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE=y
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
