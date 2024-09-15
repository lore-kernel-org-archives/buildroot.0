Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF069C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEC6084A67;
	Sun, 15 Sep 2024 21:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIkDKMnIP3vq; Sun, 15 Sep 2024 21:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E022084A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E022084A5E;
	Sun, 15 Sep 2024 21:43:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17FE71BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07A9F608A4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuA0yMnJeJwG for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 023E060DB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 023E060DB2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F36C8821B6; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 23:34:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ec0e1c2b67ecf5554a516a69e70ae47079e8a97
X-Git-Newrev: ec270a08150980e37e36eeb43f4471ed8f7d662e
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.F36C8821B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/manual.adoc: unbreak
 BR2_VERSION logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec270a08150980e37e36eeb43f4471ed8f7d662e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The behaviour of asciidoc on my laptop (Debian 10.2.0-1) changed at the end
of last year, causing the BR2_VERSION logic to no longer work:

grep 'manual generated' buildroot-2023.02.*/docs/manual/manual.text
buildroot-2023.02.6/docs/manual/manual.text:Buildroot 2023.02.6 manual generated on 2023-10-16 08:41:26 UTC from
buildroot-2023.02.7/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-11-14
buildroot-2023.02.8/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-12-04

We don't really NEED to strip the -git suffix; indeed, for a git tag, there
would be not -git suffix, while for any other commit there will be one
and we want to see it (e.g. in the nightly manual, or on a development
branch locally).

So just drop that to unbreak the version output.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: explain why wew don't want to drop it]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/manual.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/manual.adoc b/docs/manual/manual.adoc
index 31d5f80bae..cfcc3e52a9 100644
--- a/docs/manual/manual.adoc
+++ b/docs/manual/manual.adoc
@@ -4,7 +4,7 @@
 = The Buildroot user manual
 :toc:
 
-Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
+Buildroot {sys:echo $BR2_VERSION} manual generated on {localdate}
 {localtime} from git revision {sys:git rev-parse --short HEAD}
 
 The Buildroot manual is written by the Buildroot developers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
