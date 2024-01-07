Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13097C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7D6E4040D;
	Sun,  7 Jan 2024 16:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7D6E4040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPYVQ8fHPRZQ; Sun,  7 Jan 2024 16:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E8040396;
	Sun,  7 Jan 2024 16:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E8040396
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A32C1BF869
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37658415E4
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37658415E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o99MfBMrO6di for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E9BD415E5
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E9BD415E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BAC784758; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 12:21:04 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 063bd879470b8e7a82d467944ccbb971dbc01fbf
X-Git-Newrev: 95b06923757d380c07a78d0e97dcc28246d71421
X-Patchwork-Hint: ignore
Message-Id: <20240107162200.4BAC784758@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] editorconfig: fix
 wildcard expansion
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

commit: https://git.buildroot.net/buildroot/commit/?id=95b06923757d380c07a78d0e97dcc28246d71421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

It turns out that wildcard expansion, * and ?, is not performed in
matching lists {...}, at least in the vim plugin. The spec is not clear
about that, but refer to "pattern matching through Unix shell-style
wildcards" [0].

So, let's consider that this is not supported. Expand the patterns into
one section each, rather than use a list.

[0] https://spec.editorconfig.org/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ceb678ca19d66ea1be945097d3cf53a3af735ca1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .editorconfig | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/.editorconfig b/.editorconfig
index 4acaf3486b..af6cf4b449 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -13,11 +13,19 @@ insert_final_newline = true
 indent_style = tab
 indent_size = tab
 
-[{Config*.in*,linux/Config.ext.in}]
+[Config*.in*]
 indent_style = tab
 indent_size = tab
 
-[{Makefile*,*.mk}]
+[linux/Config.ext.in]
+indent_style = tab
+indent_size = tab
+
+[Makefile*]
+indent_style = tab
+indent_size = tab
+
+[*.mk]
 indent_style = tab
 indent_size = tab
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
