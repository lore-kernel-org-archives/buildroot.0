Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C1EC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 11:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC55A40AE0;
	Sat, 23 Jul 2022 11:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC55A40AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTsa22aaf-Nl; Sat, 23 Jul 2022 11:34:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4C1340227;
	Sat, 23 Jul 2022 11:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C1340227
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4341BF2F2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7682C40227
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7682C40227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nHvWyOdWz3U for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 11:34:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8283E40AB5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 11:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8283E40AB5
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BD63B84329; Sat, 23 Jul 2022 11:21:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 13:32:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7d4356cc7cde18a3d3be2a296a00938157b5f22
X-Git-Newrev: 96a6b3bf3931704c8c93fcfbaa1b47011e7a876a
X-Patchwork-Hint: ignore
Message-Id: <20220723112101.BD63B84329@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: disable Events when
 Namespace is minimal
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

commit: https://git.buildroot.net/buildroot/commit/?id=96a6b3bf3931704c8c93fcfbaa1b47011e7a876a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option UA_ENABLE_SUBSCRIPTIONS_EVENTS is enabled by default,
but not compatible with UA_NAMESPACE_ZERO=MINIMAL resulting in

CMake Error at CMakeLists.txt:1120 (message):
  Events require at least the reduced Namespace Zero

Fixes: http://autobuild.buildroot.net/results/d8e34b8bddf0f3568e64705c6618b17bce70d210/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/open62541/open62541.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 594243c8a7..5f46703c17 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -34,7 +34,7 @@ OPEN62541_CONF_OPTS += -DUA_ENABLE_ENCRYPTION=OPENSSL
 endif
 
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
-OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
+OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL -DUA_ENABLE_SUBSCRIPTIONS_EVENTS=OFF
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
