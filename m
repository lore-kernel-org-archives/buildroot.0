Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED244C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:43:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B60E61AE2
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B60E61AE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD424013F;
	Mon, 13 Sep 2021 13:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HaZwX7iJc_G; Mon, 13 Sep 2021 13:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7614740056;
	Mon, 13 Sep 2021 13:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90D441BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 846964036F
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mC_-qU6-6iZV for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAA944036E
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E2198A52C; Mon, 13 Sep 2021 13:41:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:37:21 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 9fdeeef212871c32583c0f28e2c3d116fe0fa466
X-Git-Newrev: 739dd503be92e830cdd84a19d00799a5ac7e3304
X-Patchwork-Hint: ignore
Message-Id: <20210913134135.1E2198A52C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 package/environment-setup/environment-setup: add zsh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=739dd503be92e830cdd84a19d00799a5ac7e3304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

environment-setup uses BASH_SOURCE which is bash specific. For other
shells, this variable is empty, leading to an error message and empty
SDK_PATH.
Zsh Uses $0. Unfortunately POSIX is not specifying how exactly $0
should behave when in sourced (or using special dot utility). So other
shell support have to be implemented in different manner.

Signed-off-by: Krzysztof Kanas <kkanas@fastmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 65cee90cc3cec4da11987370ea2de35d32f046b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/environment-setup/environment-setup | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index e9bc36fdd0..84a9843c24 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -16,4 +16,10 @@ Some tips:
 * To build CMake-based projects, use the "cmake" alias
 
 EOF
-SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
+if [ x"$BASH_VERSION" != x"" ] ; then
+	SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
+elif [ x"$ZSH_VERSION" != x"" ] ; then
+	SDK_PATH=$(dirname $(realpath $0))
+else
+	echo "unsupported shell"
+fi
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
