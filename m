Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980ADD43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F58C4117C;
	Thu, 11 Dec 2025 19:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q8BKL6oW-ey; Thu, 11 Dec 2025 19:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A274117D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481417;
	bh=UgU9+7Jo5sDdNOb7j0dUxw7W9m/mpCGXbxMIkCZ5c9I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K7l4YbhMjZR32I69dcdsnpgi9vtjermiaS1Ysh+2fNy4YSfTQej3YSA24gJ8Y03E0
	 9xpXx8C11A2fIeMLsyXxo5GUcqt33EOoIlEdmVKOHUsOh1niyBBfb3jNm87UrXnvkG
	 xX0AGYRmfA3y5sYNw7M8H4fd7Fly5zTq5H0ZZmKgOVpunNwxs8UAt1eARvcrx+1+eR
	 xGCljrmSwEG8zyimQ9tjceDaa1VECzvpkWGh7LLKA5yRGvWWHUYNKHRUzAY/ERVWBS
	 da4ygmqxc7+HTGkiWHasmJo3KPr/xjmLU0faxRFG3gk+738ZNjsBvUwkUkDlpU3QUB
	 IvJtFplGPDF9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A274117D;
	Thu, 11 Dec 2025 19:30:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 341352C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69BE460679
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e_6nqfVZZaF for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C586605D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C586605D2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8BB086BE8; Thu, 11 Dec 2025 19:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:12 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 8f0bc04e8b5cf4f3cd2bb5ac589d8a52744d294a
X-Git-Newrev: 68d8692cec51ca0aee5d16ad00677b81c54f577b
X-Patchwork-Hint: ignore
Message-Id: <20251211192953.E8BB086BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x]
 support/scripts/pkg-stats: check_url_status(): use HEAD requests to limit
 server load
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

commit: https://git.buildroot.net/buildroot/commit/?id=68d8692cec51ca0aee5d16ad00677b81c54f577b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The gnu.org admins have been blocking the IP address of machines running
pkg-stats as the GET requests for the (many) packages with gnu.org URLs are
seen as abusive.

The resource body is not used, so use a HTTP HEAD request instead of a GET
to limit server load and bandwidth use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f9f3e6ccc66cd4f2becfc29e6b2b74beaddf14e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cfea179458..c659acb80e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -469,7 +469,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
-        async with session.get(pkg.url) as resp:
+        async with session.head(pkg.url) as resp:
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
