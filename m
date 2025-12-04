Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E1ED2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10F9761C33;
	Thu,  4 Dec 2025 20:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvtMZ0Zeduhw; Thu,  4 Dec 2025 20:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E52F861254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880766;
	bh=IXfpvBkjCEZtoUz1LdG4Fw0PqRBbIDlDSRT2pkLITLI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qNMHRrcPq3ZjJhiY6+vVcsol5HSYCgY1yRZwz54MUrLYEtGC6fwHT+uSe+RbzZjYl
	 kveUpnFYvghbGSF7p74R/Bm3Y0sPg5ylbcEr1yh9i9ky3G0qOncqf0WToBbMOedOyh
	 35D5C2lqHdzj1zvIFAZ0v4jJtMbkXOhUD6V2DNeji6u2iqmzjO3lHLRabEV+jLg/Tf
	 5mnhfaP7EKrtoqyE2MKALtgs4Krwgj23J6IWcrrRMhLEaJPdaCJmYTShcsla+bRxOq
	 Qr427ubaL2XtqxvwRHSR7Dhwxq/BIax9HGerKbJ/uqIwT5V4VLMZ7lCPsDq0SsbjyF
	 UP7IC9fW0RjYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E52F861254;
	Thu,  4 Dec 2025 20:39:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 193A41BD
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F29CF8435F
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dw9AteWdqGnv for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D295C8448F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D295C8448F
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C390E864DB; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:14:18 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: df847b57a2543e39135ca073296bfe201082b942
X-Git-Newrev: 6ca40f2cccc212cfee9232ccd2dae3af7108704e
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.C390E864DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tmux: fix build
 failure due to type mismatch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ca40f2cccc212cfee9232ccd2dae3af7108704e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Package tmux fails to build with:
compat/utf8proc.c: In function 'utf8proc_mbtowc':
compat/utf8proc.c:51:39: error: passing argument 3 of 'utf8proc_iterate' from incompatible pointer type [-Wincompatible-pointer-types]
   51 |         slen = utf8proc_iterate(s, n, pwc);
      |                                       ^~~
      |                                       |
      |                                       wchar_t * {aka long int *}

Add local patch already committed upstream to fix it.

Fixes:
https://autobuild.buildroot.net/results/651/6510cfb16d0c3f3772918cd3bde0542d0b59a230/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7cf46f0384a7953df54f56aab0a1871b9817a25d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...id-warnings-on-32-bit-architectures.-GitH.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch b/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
new file mode 100644
index 0000000000..e9cd9d5acc
--- /dev/null
+++ b/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
@@ -0,0 +1,28 @@
+From f812b8d30456c071ee23e9a02d6ce16036fd3f68 Mon Sep 17 00:00:00 2001
+From: Nicholas Marriott <nicholas.marriott@gmail.com>
+Date: Wed, 29 Oct 2025 08:47:45 +0000
+Subject: [PATCH] Cast to avoid warnings on 32-bit architectures. GitHub issue
+ 4597.
+
+Upstream: https://github.com/tmux/tmux/commit/f812b8d30456c071ee23e9a02d6ce16036fd3f68
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ compat/utf8proc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compat/utf8proc.c b/compat/utf8proc.c
+index dd4ab27f..147da696 100644
+--- a/compat/utf8proc.c
++++ b/compat/utf8proc.c
+@@ -48,7 +48,7 @@ utf8proc_mbtowc(wchar_t *pwc, const char *s, size_t n)
+ 	 * *pwc == -1 indicates invalid codepoint
+ 	 * slen < 0 indicates an error
+ 	 */
+-	slen = utf8proc_iterate(s, n, pwc);
++	slen = utf8proc_iterate(s, n, (utf8proc_int32_t*)pwc);
+ 	if (*pwc == (wchar_t)-1 || slen < 0)
+ 		return (-1);
+ 	return (slen);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
