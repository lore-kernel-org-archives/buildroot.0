Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF8CC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 162E160D52;
	Tue,  7 Nov 2023 21:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 162E160D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0BniVjhL8Ew; Tue,  7 Nov 2023 21:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341FF60D4F;
	Tue,  7 Nov 2023 21:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341FF60D4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E98A1BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA48A81A81
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA48A81A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1kgYkCuoHiH for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76BC381A50
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76BC381A50
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 630DE86C29; Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 22:31:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f59da331afea8d0db7a126565587f3405c50872f
X-Git-Newrev: cbc5691ab298c89f6bd02b06a0a790ab531f2b55
X-Patchwork-Hint: ignore
Message-Id: <20231107213549.630DE86C29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs/nodejs-src: fix arch check
 on additional modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbc5691ab298c89f6bd02b06a0a790ab531f2b55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Node modules available on the npm registry, may contain prebuild
binaries for various targets and/or ABIs; for example., there might be
ARM. AArch64, x86_64 binaries for glibc or musl, for Linux or Darwin.
Needless to say, those binaries will most often not match the current
target architecture; as such, check-bin-arch will whine loudly as
reported in #15823:

    ERROR: architecture for "/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm/node.napi.armv6.node" is "ARM", should be "AArch64"
    ERROR: architecture for "/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/android-arm/node.napi.armv7.node" is "ARM", should be "AArch64"
    ERROR: architecture for "/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm/node.napi.armv7.node" is "ARM", should be "AArch64"
    ERROR: architecture for "/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.glibc.node" is "Advanced Micro Devices X86-64", should be "AArch64"
    ERROR: architecture for "/usr/lib/node_modules/node-red-node-serialport/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.musl.node" is "Advanced Micro Devices X86-64", should be "AArch64"

The proper solution would be to remove all those prebuilt binaries, and
request npm to forcefully rebuild the proper binary for the current
architecture; alas, there is no option to tell npm to do so.

Doing it manually would not be easy either, as such modules might be
retrieved as part of the "vendoring" for another module that the user
has requested, and be pretty deep in the dependency chain; trying to fix
this properly would be a nightmare: it would require that we manually
inspect the depednency chain, and install dependent modules one by one,
recursively, re-implementing the same logic npm has when multiple
verions of the same module are installed as part of different branches
of the depenency tree, all while detecting prebuilds and removing them
before installing the mpdule (hence decorrelating download and install,
which is not trivial to do with npm alone).

We also can't simply remove all the prebuilds, because it is not known
whether the location ("<module>/prebuilds/") is standardised, or a
convention with the path noted somewhere in the package metadata, and
how deep they would be in the tree, and whether that could conflict with
arbitrary files...

Instead, we will consider that npm has a sane heuristic to detect
whether it should indeed rebuilt the modules, and that node has a sane
heuristic to know which binary to load at runtime, and we will leave the
prebuilt binaries in place and just exclude them from being checked.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=15823

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs-src/nodejs-src.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
index 6fb550f158..8f934202b0 100644
--- a/package/nodejs/nodejs-src/nodejs-src.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -244,6 +244,9 @@ define NODEJS_SRC_INSTALL_MODULES
 	# help in diagnosing the problem.
 	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
 endef
+
+# Exclude prebuilt binaries with different architectures and OS from check
+NODEJS_SRC_BIN_ARCH_EXCLUDE = /usr/lib/node_modules/
 endif
 
 define NODEJS_SRC_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
