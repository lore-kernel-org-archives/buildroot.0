Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43226C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 20:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADBA241A00;
	Fri, 10 Nov 2023 20:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADBA241A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfGgnomx6jp4; Fri, 10 Nov 2023 20:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89E3941A0E;
	Fri, 10 Nov 2023 20:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E3941A0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 078031BF2C4
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B8A83C39
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4B8A83C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0LS3mmzfYwz for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 20:11:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D315E83C37
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 20:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D315E83C37
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFA1286F78; Fri, 10 Nov 2023 20:11:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 18:38:19 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7938949369daaca5def35fc2cf245cb394e871c6
X-Git-Newrev: 99148db45619c37dd446c6f8ef8678bd1d533fe9
X-Patchwork-Hint: ignore
Message-Id: <20231110201125.BFA1286F78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/nodejs/nodejs-src: fix arch check on additional modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=99148db45619c37dd446c6f8ef8678bd1d533fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit cbc5691ab298c89f6bd02b06a0a790ab531f2b55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e07d79091a..13a68a25be 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -248,6 +248,9 @@ define NODEJS_INSTALL_MODULES
 	# help in diagnosing the problem.
 	$(NPM) install -g $(NODEJS_MODULES_LIST)
 endef
+
+# Exclude prebuilt binaries with different architectures and OS from check
+NODEJS_BIN_ARCH_EXCLUDE = /usr/lib/node_modules/
 endif
 
 define NODEJS_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
