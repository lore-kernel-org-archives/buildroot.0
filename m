Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41DEC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3EBC40B5B;
	Sun, 23 Apr 2023 10:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3EBC40B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1OC5GEz0AHIN; Sun, 23 Apr 2023 10:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C259E400A4;
	Sun, 23 Apr 2023 10:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C259E400A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC4191C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6C0082070
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C0082070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tccHFRF6fr3p for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:41:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D119C8200F
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D119C8200F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF7AB843FE; Sun, 23 Apr 2023 10:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 12:38:21 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 69d9cdfcc723849c7c7b81378af430dea3bf483e
X-Git-Newrev: af738be309376fec8f888c8f4f831a7855ebea03
X-Patchwork-Hint: ignore
Message-Id: <20230423104109.BF7AB843FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/linux-tools:
 Exclude checking PE binaries from perf test
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

commit: https://git.buildroot.net/buildroot/commit/?id=af738be309376fec8f888c8f4f831a7855ebea03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit a7ad7816262dd1b0db6c51a08f3013e2c473c0b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
