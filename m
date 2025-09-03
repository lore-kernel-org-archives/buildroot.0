Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F7ACA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C731F42308;
	Wed,  3 Sep 2025 16:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTjhv6ExAiQg; Wed,  3 Sep 2025 16:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D9B940E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D9B940E11;
	Wed,  3 Sep 2025 16:23:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D64A110E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF4D3615B8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9QoqkZeWqWm for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D6B46153D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D6B46153D
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2890087EA3; Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 18:17:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04cd135b26406dcc31cb66af1480d53fffe81e59
X-Git-Newrev: f84765314459c0f92c5e7f98746ba08d5d82cf1f
X-Patchwork-Hint: ignore
Message-Id: <20250903162314.2890087EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jose: needs shared libraries
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

commit: https://git.buildroot.net/buildroot/commit/?id=f84765314459c0f92c5e7f98746ba08d5d82cf1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://autobuild.buildroot.net/results/bf23e75461877a4ca3a189626f30cf8cde24de36/

Jose unconditionally builds a shared library since v11 with:

 commit b72f8cad002edc87286dd1f2331c359158c512e8
 Author: Rosen Penev <rosenp@gmail.com>
 Date:   Tue May 30 12:18:30 2023 +0300

   jose: build library only as shared (#119)

   Needed because of constructor usage in library.

So add a dependency on BR2_SHARED_LIBS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jose/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jose/Config.in b/package/jose/Config.in
index 4a9ed8da65..32e17276b6 100644
--- a/package/jose/Config.in
+++ b/package/jose/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JOSE
 	bool "jose"
+	depends on BR2_SHARED_LIBS # builds .so
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JANSSON
@@ -10,5 +11,5 @@ config BR2_PACKAGE_JOSE
 
 	  https://github.com/latchset/jose
 
-comment "jose needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "jose needs a toolchain w/ shared libraries, threads"
+	depends on !BR2_SHARED_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
