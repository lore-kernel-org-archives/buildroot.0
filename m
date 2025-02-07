Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC974C0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 22:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C67681351;
	Fri,  7 Feb 2025 22:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfihSX7TnzVc; Fri,  7 Feb 2025 22:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D2EE812D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2EE812D5;
	Fri,  7 Feb 2025 22:25:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 798231B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69ABD7052D
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5Fd8-sv0GeV for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 22:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F60B70524
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F60B70524
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:25:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9462F86A0E; Fri,  7 Feb 2025 22:25:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 23:24:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93550cb7712255b1f842b15a8ed668c29ebcc70f
X-Git-Newrev: 4bf27608a77143650fa94994363b444d57db7842
X-Patchwork-Hint: ignore
Message-Id: <20250207222529.9462F86A0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lynis: add wchar dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bf27608a77143650fa94994363b444d57db7842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the introduction of the package lynis in 48bce6ad8f autobuild
failure for the gzip package started appearing on configuration
without wchar support with the following error message:

vasnprintf.c:355:38: warning: implicit declaration of function 'wctomb' [-Wimplicit-function-declaration]
  355 | #   define local_wcrtomb(S, WC, PS)  wctomb ((S), (WC))
      |                                      ^~~~~~

This error happens when building gzip without BR2_USE_WCHAR dependency.
The gzip package already depends on BR2_USE_WCHAR, this patch also apply
this dependency to the lynis package.

Fixes:
https://autobuild.buildroot.org/results/fbf/fbf31c8c09496cd3fe02e8ed55939dad5c1cbaec
https://autobuild.buildroot.org/results/560/56083310acedba31dccc1f6594f814347bf21caf
https://autobuild.buildroot.org/results/1d9/1d97e3f0c626421fdae45e794f02c560d1b9080c

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lynis/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lynis/Config.in b/package/lynis/Config.in
index 2757e86a2d..e97cb0bf91 100644
--- a/package/lynis/Config.in
+++ b/package/lynis/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LYNIS
 	bool "lynis"
+	depends on BR2_USE_WCHAR # gzip
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_GZIP  # runtime (zgrep /proc/config.gz)
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
