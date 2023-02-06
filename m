Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AC3C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5E6181B3E;
	Mon,  6 Feb 2023 13:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5E6181B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7V_RFYTFn6x0; Mon,  6 Feb 2023 13:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB2AB81A3E;
	Mon,  6 Feb 2023 13:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB2AB81A3E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 170CD1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E525460AAF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E525460AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMwy-_5n-VLm for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A4160A7A
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A4160A7A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14C1583C26; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04a4b86a982e307268d660a38d231315134572fb
X-Git-Newrev: 01cb02cfaecb34fd7d413775673e78272c68f85f
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.14C1583C26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: unconditionally set
 BUILD_DEFINES
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

commit: https://git.buildroot.net/buildroot/commit/?id=01cb02cfaecb34fd7d413775673e78272c68f85f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ifdef construct intended to avoid passing -DBUILD_DEFINES="" was
never needed, because even upstream version v1.9 used in 2019 when the
configuration options were added, can handle an empty string for
BUILD_DEFINES.
In fact an empty string is the default for v1.9 if it is not passed
during configure.

Also, the host variant already sets BUILD_DEFINES unconditionally.

So remove the unneeded conditional.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/pugixml.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index c796186827..7d4f47c6fa 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -29,9 +29,7 @@ ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
 endif
 
-ifdef PUGIXML_BUILD_DEFINES
 PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
-endif
 
 HOST_PUGIXML_CONF_OPTS += \
 	-DBUILD_PKGCONFIG=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
