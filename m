Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF2AC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E00E403BE;
	Wed, 20 Dec 2023 20:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E00E403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSdh-Srt4rD8; Wed, 20 Dec 2023 20:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6424D436D9;
	Wed, 20 Dec 2023 20:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6424D436D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDEF31BF95D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C59BE4211B
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C59BE4211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDaIYfHpKgFk for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F17E242114
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17E242114
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD3ED87C44; Wed, 20 Dec 2023 20:42:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:32:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08b6c78e6a853831b95c7cbc49d26655d6c2e853
X-Git-Newrev: ceb678ca19d66ea1be945097d3cf53a3af735ca1
X-Patchwork-Hint: ignore
Message-Id: <20231220204216.DD3ED87C44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] editorconfig: fix wildcard expansion
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ceb678ca19d66ea1be945097d3cf53a3af735ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that wildcard expansion, * and ?, is not performed in
matching lists {...}, at least in the vim plugin. The spec is not clear
about that, but refer to "pattern matching through Unix shell-style
wildcards" [0].

So, let's consider that this is not supported. Expand the patterns into
one section each, rather than use a list.

[0] https://spec.editorconfig.org/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
