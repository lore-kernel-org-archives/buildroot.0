Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF7AC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E468409B2;
	Mon, 12 Aug 2024 13:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8Dy9_kKYjmv; Mon, 12 Aug 2024 13:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A446B40CAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A446B40CAB;
	Mon, 12 Aug 2024 13:10:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2931D1BF311
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECBCC40984
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XVYUR2YhWDc for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8156E40947
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8156E40947
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A4C485239; Mon, 12 Aug 2024 13:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 15:07:14 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 22f476b997497dced9759085e85f0208c33f3556
X-Git-Newrev: 23e9dab58a831cf7bee941b659142e97952cd65e
X-Patchwork-Hint: ignore
Message-Id: <20240812130957.7A4C485239@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] utils/checkpackagelib:
 really check variable name
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

commit: https://git.buildroot.net/buildroot/commit/?id=23e9dab58a831cf7bee941b659142e97952cd65e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Currently, when a package defines an unprefixed variable, but its value
contains a properly prefixed expansion (or even just the name of a
variable), there is not error reported (e.g. with the recently fixed
composer issue):

    BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar

The reason is that he check is done on the whole line, rather than on
the variable that is being set.

We fix that by really looking at the variable we found, instead of
looking in the whole line.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit b0964df557bedd88db1a223491fba615c995484f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 1e6bd708a5..d21e409b4c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -316,7 +316,7 @@ class TypoInPackageVariable(_CheckFunction):
 
         if self.ALLOWED.match(variable):
             return
-        if self.REGEX.search(text) is None:
+        if self.REGEX.search(variable) is None:
             return ["{}:{}: possible typo: {} -> *{}*"
                     .format(self.filename, lineno, variable, self.package),
                     text]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
