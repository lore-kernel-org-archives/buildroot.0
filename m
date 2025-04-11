Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA40C369A9
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 520216F6A7;
	Fri, 11 Apr 2025 10:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Y2C5y67-95S; Fri, 11 Apr 2025 10:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA2F6F6B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA2F6F6B5;
	Fri, 11 Apr 2025 10:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43531138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B4CD81C56
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2skKGSROC6it for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 526C181170
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526C181170
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42659843A1; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:24 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 8cb5263d3802da6cd22eb384ed6b0bb4bff7f103
X-Git-Newrev: 79494bba2936434e047da73aec6754b4fdb9cbd0
X-Patchwork-Hint: ignore
Message-Id: <20250411104450.42659843A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/linux-tools:
 selftests: Add path containing BPF binary to _BIN_ARCH_EXCLUDE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79494bba2936434e047da73aec6754b4fdb9cbd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Enabling BR2_PACKAGE_LINUX_TOOLS_SELFTESTS (on rock5b_defconfig,
which uses kernel 6.12 at the time of writing), results in:

make[1]: Leaving directory '/br/output/build/linux-endpoint-test/tools/testing/selftests'
ERROR: architecture for "/usr/lib/kselftests/tc-testing/action-ebpf" is "Linux BPF", should be "AArch64"
make: *** [package/pkg-generic.mk:402: /br/output/build/linux-tools/.stamp_installed] Error 1

To solve this, add /usr/lib/kselftests/tc-testing/ to
LINUX_TOOLS_BIN_ARCH_EXCLUDE.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3a03cb2ad61e78544e5aa1ee64790e356c692713)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-tools/linux-tool-selftests.mk.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index 0bcc47af0a..db7e4fa1a3 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -26,6 +26,9 @@ SELFTESTS_MAKE_FLAGS = \
 	ARCH=$(SELFTESTS_ARCH) \
 	KHDR_DIR=$(LINUX_DIR)/usr/include
 
+LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
+	/usr/lib/kselftests/tc-testing/
+
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
 # not just $(LINUX_DIR) so that it isn't built in the root directory of the kernel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
