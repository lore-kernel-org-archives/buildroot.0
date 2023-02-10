Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F22C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E22670089;
	Tue, 21 Feb 2023 01:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E22670089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J55x8Ifhexfw; Tue, 21 Feb 2023 01:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 668827016D;
	Tue, 21 Feb 2023 01:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 668827016D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 888DA1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FD8B70019
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD8B70019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70-aQHyPVI40 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 539BA70008
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539BA70008
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE0881979; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 15:11:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e8fe92584446bba2bb81f454c5ebbcb4f80a371b
X-Git-Newrev: 8012a86f5cf751f9c4d5d4a63f6502a6ac60d13a
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.4CE0881979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/norm: use external waf
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

commit: https://git.buildroot.net/buildroot/commit/?id=8012a86f5cf751f9c4d5d4a63f6502a6ac60d13a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/ee1/ee15cadf8af10dee6c83b9726a034367e8ae81a7/

The bundled waf script is too old (2.0.7) for python >= 3.11 as it uses the
'U' modifier to open (universal newlines), which have been deprecated since
python 3.3 and finally removed in 3.11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/norm/norm.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/norm/norm.mk b/package/norm/norm.mk
index 2f9fc7b657..a3fa1b4f80 100644
--- a/package/norm/norm.mk
+++ b/package/norm/norm.mk
@@ -11,6 +11,9 @@ NORM_INSTALL_STAGING = YES
 NORM_LICENSE = NRL License
 NORM_LICENSE_FILES = LICENSE.TXT
 
+# The bundled waf script is too old for >= python3.11
+NORM_NEEDS_EXTERNAL_WAF = YES
+
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 NORM_DEPENDENCIES += libnetfilter_queue
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
