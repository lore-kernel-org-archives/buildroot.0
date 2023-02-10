Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393A9C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5C4419BD;
	Fri, 10 Feb 2023 14:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5C4419BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uakmMq2gXqqq; Fri, 10 Feb 2023 14:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F608419B7;
	Fri, 10 Feb 2023 14:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F608419B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 415E61BF2C9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B91A41138
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B91A41138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uW0-MT0StF81 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF07A41139
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF07A41139
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC93984EAD; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 15:11:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8fe92584446bba2bb81f454c5ebbcb4f80a371b
X-Git-Newrev: 8012a86f5cf751f9c4d5d4a63f6502a6ac60d13a
X-Patchwork-Hint: ignore
Message-Id: <20230210141450.BC93984EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/norm: use external waf
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
