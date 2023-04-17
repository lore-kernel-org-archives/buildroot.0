Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FCEC77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 19:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC3B481E3E;
	Mon, 17 Apr 2023 19:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3B481E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mE0pTufUj0Xt; Mon, 17 Apr 2023 19:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E2981E38;
	Mon, 17 Apr 2023 19:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E2981E38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39E391C422A
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 126FE6110F
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 126FE6110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfUqsYvWd9C1 for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 19:54:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FB326110C
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 19:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB326110C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C0C384180; Mon, 17 Apr 2023 19:54:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Apr 2023 21:53:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1557312f18a5e2a84387055aada9b1e6d59c5ad4
X-Git-Newrev: a7ad7816262dd1b0db6c51a08f3013e2c473c0b3
X-Patchwork-Hint: ignore
Message-Id: <20230417195447.1C0C384180@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: Exclude checking PE
 binaries from perf test
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7ad7816262dd1b0db6c51a08f3013e2c473c0b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
("perf tests: Add test for PE binary format support") present in >=
v5.10 there is an unconditional installation of PE binaries.

Some toolchains have a readelf tool that correctly interpret the PE
files, and reports ELF-alike fields. This causes check-bin-arch to
reject those files.

Make sure that these binaries are excluded from being checked to allow
the installation of the perf tests.

Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/linux-tool-perf.mk.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 5431c78152..122c7cbbc4 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -169,6 +169,10 @@ define PERF_INSTALL_REMOVE_SCRIPTS
 	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
+
+LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
+	/usr/libexec/perf-core/tests/pe-file.exe \
+	/usr/libexec/perf-core/tests/pe-file.exe.debug
 endif
 
 define PERF_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
