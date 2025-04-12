Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21679C369AF
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 12:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC71A84059;
	Sat, 12 Apr 2025 12:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MGJt-7Okqo2; Sat, 12 Apr 2025 12:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D9BE83EF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D9BE83EF2;
	Sat, 12 Apr 2025 12:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDF3D193
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFA84606EA
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CellJb-8xQZE for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 12:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105DF60617
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 105DF60617
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:00:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BF53843C9; Sat, 12 Apr 2025 12:00:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Apr 2025 13:59:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cac028add66c046b8f93137dbcc41138938e29ea
X-Git-Newrev: 7d890426bcef037a5d09624913d9c22d91ed9c94
X-Patchwork-Hint: ignore
Message-Id: <20250412120057.0BF53843C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unmatched: add missing
 uboot custom hash file
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7d890426bcef037a5d09624913d9c22d91ed9c94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] introduced the hifive_unmatched_defconfig with
BR2_DOWNLOAD_FORCE_CHECK_HASH enabled and with custom hash files.
But it forgot to add the custom hash for uboot. It was not detected
at that time because the U-Boot version was the same as the default
"latest" version and was providing its hash.

This defconfig fails to build since the default "latest" was bumped
in commit [2].

This commit fixes the issue by adding the missing uboot hash.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167053

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f9cc5dbd453c80790c1f2f7e9b19a85ded5979be
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/c14ce5346d969e660cc788f2f4d8619b27c805a2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/sifive/hifive-unmatched/patches/uboot/uboot.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/sifive/hifive-unmatched/patches/uboot/uboot.hash b/board/sifive/hifive-unmatched/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..50674352d7
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
