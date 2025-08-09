Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D320FC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C7240543;
	Sat,  9 Aug 2025 16:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQr7ubEkN9gc; Sat,  9 Aug 2025 16:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE1640B29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE1640B29;
	Sat,  9 Aug 2025 16:56:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E55AC1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6E7D40B2E
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gv8_eLAue11J for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E4840B28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E4840B28
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D3818216E; Sat,  9 Aug 2025 16:56:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 18:51:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: faa97af62a4db9a34c881ff4ca51338153211f46
X-Git-Newrev: 161d7ded43da4d48641db5ea83b1af4cb976410a
X-Patchwork-Hint: ignore
Message-Id: <20250809165600.0D3818216E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: fix list-defconfigs for
 br2-external with weird descriptions
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=161d7ded43da4d48641db5ea83b1af4cb976410a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a br2-external tree description contains an odd number of single
quotes, list-defconfigs will fail with a shell error message:

    /bin/sh: -c: line 1: unexpected EOF while looking for matching `"'
    make[1]: *** [Makefile:1243: list-defconfigs] Error 2

Whoever wrote that code will have to write this sentence 100 times
on the blackboard:

     Never, ever pass user-provided data in a printf format.

(see commit 49117c102803 (core: support description for br2-external
trees); dang, I knew it... And I should have known better when I wrote
that code, damit...)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c581067320..fa82afa49c 100644
--- a/Makefile
+++ b/Makefile
@@ -1223,7 +1223,7 @@ define list-defconfigs
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \
-				printf 'External configs in "$(call qstrip,$(2))":\n'; \
+				printf 'External configs in "%s":\n' "$(call qstrip,$(2))"; \
 			else \
 				printf "Built-in configs:\n"; \
 			fi; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
