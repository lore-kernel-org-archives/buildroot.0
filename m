Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389D7C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 058B5811B4;
	Fri,  4 Sep 2026 16:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bX92BMAV_DB2; Fri,  4 Sep 2026 16:22:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 23DA3811B6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538958;
	b=ix7zQfYA4K1G/O/0Imd9Z0PqO3nexowMBwRa03XNH6mxt9H9HRiwGFX3hgebyWXZE46G
	 qZUWZ4R4/CnVwu+3hcycMLpyH5USsxcw5V7XK1rVesxVVaG+GrvWP160v6uKq4x525Zz1
	 nOapaRMYeoNV40WY3YeEWLtIH7el8jYND8cWxakP8P3HZoUAsT//3Vclsh5Cca7YjW0S+
	 byudAuuua69IWu2YsMXv98xdASvWF3mRPLWWtkBO22nGXJ3gy8CSjOhhyqAbhvxNf7Lg4
	 Fctz/S7V/SfgN9/RYcIZkLe8YfIXICfKd4APBwUzCCsPxNuw661xiSCYVK7oNQq+7eQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Di0FHVPLf61aotAWePmsM4N12NA75W+YWmAPdowu67s=;
	b=lbsu2NGzR4Cy3cFy4EnHHGyalE5xyTfy+yBEybODGJw5W4d8tsQM9u2UW4WrksLR97e9
	 z3lwHj/kXif71kvZoFkZ0Qyu3/Hy/+Mj+Hqww7wBP8hyfLXy6wGrWpjcWo6QmhOyLFHSV
	 GFYlsE0XOJnxhd8r+B64CD+Xi0Cc8nFkHvUcdvoa/HUMykiuu8szE6jdteJT9EMJj6ItX
	 1z7Hf17WA2nBSbdjBMcvINmeldoZ1neLNV575leshj6GtxzEBXMuYHUuIGWQmvB6O+3gS
	 Yso7bPnz2SkXqr44tkiYNUeUCoQdPGmbfaWBWU0SvaB/njfGmKkxbWJrvMwhotkqvQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538958;
	bh=Di0FHVPLf61aotAWePmsM4N12NA75W+YWmAPdowu67s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EW6/6puoJpRPjc8S25e/kgZZLBzyxyChaUnFX9X5VWe/Zh21HhAh/wg9wBZGRkr3q
	 gkMiWmSUizsmrrv4iTdHWE/b5zrjqL1wPz2nnuVHO1TEKUvJRl93iAB5V4SOq+TYdz
	 ywvFK1g492TxZLWL+oZn0Yuw4SlpcTjE1iwqa06Y8lzYImbKrl6tE0wKVQWJwyImQn
	 swSBanqXtAPWa6ogV5FsOpXgBLLJx+KctYA6MypwHLqfwoW/bFXq3Xq70ygDa7eCYG
	 JfJ+d0fuTeA5DSKNzuISvRW77jDGdhx1zljk3aC/j9FwoXiBdI1RlAibBti0tHgczo
	 qZLilYeZycPuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23DA3811B6;
	Fri,  4 Sep 2026 16:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D182010E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1D2040A68
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLRLriWULhz3 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D011640A61
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=TgVy0QTU8qYu0f2wuE4b0HC19IbxPGzZg0GzkS6PpZbRkaj6HBKKC3/V5cx/LFebMARE
 VdHb1Ynd3yXVFdeRhDplx4awCCdDkLJH4TrlaT+w05Kq/UqeRc69oUSZePNGUtwj0nwRd
 +vZrpFQ49/3DS3uyPVGIUgTiMkNpGG7TO6XycTXqgze7dr47dZXqn/kUJ1leQFv/PGByL
 a9F5rGTbMgDZ9fGuW4R24HOtdgAOq1mDew1EMk4YO+8gg8mHb3+6WvTk/qnkGGPOFYLiI
 id64wOWUCwV8KGWJVcH2fc8E+tGXDPYWhciKla03htVF83NJh4EBcW1JZa/SEs/7I+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YLuxHetFSX+we7kPDMTyCNW8GKR1CDutfKmm0CZ6yHY=;
 b=mt347YSR6q/kbvNLnU5LPxG1HeVu9Kctm7PSzyrDaNURmhthW+zYqt7av7Z2aoE/VyDe
 AziEtYelNe7ySZdAoYwcJe81r3ujIVldhuvqYT26EADZs09SVBeVw/zLVVPeZpd19Iwg9
 17qYJhr9eqT+t6sEDret3ZntRW0mSAF5qhM7mUfWdvaBoIG2hCgLfg7QLe0qeZEtHgwEo
 kX1s9UtWoV0EJKAMikKnMKdLoIaNEHJGuzPIKT3FLohAuNmSDUCARvRaW4HC76nAPBmK7
 qvzGthmOLxiIr/VLlaJibzaDwAw1TAWu9GNjbVeyDQKjcgihBMmIj8mnNlRUxB4/qfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D011640A61
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EB2C94C40; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 20:09:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 798741f4dc8da3baed0c7947d459d9d4223d90d4
X-Git-Newrev: 1a87a2669d9dac045f1c088bf6acaf4e46e53b38
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.4EB2C94C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: add Linux 6.18.40 hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a87a2669d9dac045f1c088bf6acaf4e46e53b38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the hash for the Xilinx Linux 6.18.40 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash  | 1 +
 board/xilinx/linux_6.18.40/patches/linux/linux.hash                | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash b/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/linux_6.18.40/patches/linux/linux.hash b/board/xilinx/linux_6.18.40/patches/linux/linux.hash
new file mode 100644
index 0000000000..f0b8984573
--- /dev/null
+++ b/board/xilinx/linux_6.18.40/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  bdb5c40d7b43f8a1ea6ee34e2392a389935120b11cf54c36ad3ccff937b1a179  xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
