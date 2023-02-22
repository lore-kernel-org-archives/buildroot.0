Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEC0C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF5F54173A;
	Wed, 22 Feb 2023 17:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF5F54173A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVfiMBcGbVXy; Wed, 22 Feb 2023 17:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00B4741713;
	Wed, 22 Feb 2023 17:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B4741713
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2E81BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B99E4410D8
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B99E4410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whdBz_a-rXwa for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A390F410D4
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A390F410D4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E7FF867D3; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:43:46 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: a6d8ee54041bd23af01064d125b37cad99f6e68d
X-Git-Newrev: 4dd50584123986cb032776a3ede0c62eeb11fab7
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.8E7FF867D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/pugixml:
 unconditionally set BUILD_DEFINES
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dd50584123986cb032776a3ede0c62eeb11fab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 01cb02cfaecb34fd7d413775673e78272c68f85f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/pugixml.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 9137f04630..6c756e9c29 100644
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
