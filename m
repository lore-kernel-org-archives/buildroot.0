Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDFAC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BD9410F6;
	Mon, 19 May 2025 16:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5WJpDU9dN8U; Mon, 19 May 2025 16:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82D0D40E1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D0D40E1C;
	Mon, 19 May 2025 16:42:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8292193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A72405DE
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jo74A8UQbMA for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08E340606
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C08E340606
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF25787479; Mon, 19 May 2025 16:42:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:40:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 76dbbe8f419048d83e882f9132a62c16155a0702
X-Git-Newrev: 5ba0f2cc8ad63b534150040fb84e25938630e515
X-Patchwork-Hint: ignore
Message-Id: <20250519164229.AF25787479@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ngrep: fix build with
 gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ba0f2cc8ad63b534150040fb84e25938630e515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ngrep/0005-gcc15.patch | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/ngrep/0005-gcc15.patch b/package/ngrep/0005-gcc15.patch
new file mode 100644
index 0000000000..e1dd7785b8
--- /dev/null
+++ b/package/ngrep/0005-gcc15.patch
@@ -0,0 +1,34 @@
+From 742424ddd76e15bd151e40834e8f1fad65900b65 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 09:44:12 +0000
+Subject: [PATCH] fix build with gcc-15
+
+Upstream: https://github.com/jpr5/ngrep/commit/742424ddd76e15bd151e40834e8f1fad65900b65
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ngrep.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ngrep.c b/ngrep.c
+index 3df9389..57b4ddd 100644
+--- a/ngrep.c
++++ b/ngrep.c
+@@ -146,7 +146,7 @@ struct re_pattern_buffer pattern;
+ 
+ char *match_data = NULL, *bin_data = NULL;
+ uint16_t match_len = 0;
+-int8_t (*match_func)() = &blank_match_func;
++int8_t (*match_func)(unsigned char *, uint32_t, uint16_t *, uint16_t *) = &blank_match_func;
+ 
+ int8_t dump_single = 0;
+ void (*dump_func)(unsigned char *, uint32_t, uint16_t, uint16_t) = &dump_formatted;
+@@ -177,7 +177,7 @@ FD_SET delay_fds;
+ SOCKET delay_socket = 0;
+ #endif
+ 
+-void (*print_time)() = NULL, (*dump_delay)() = dump_delay_proc_init;
++void (*print_time)(struct pcap_pkthdr *) = NULL, (*dump_delay)(struct pcap_pkthdr *) = dump_delay_proc_init;
+ 
+ 
+ /*
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
