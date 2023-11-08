Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800E3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C9C81BD9;
	Wed,  8 Nov 2023 21:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C9C81BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9IcNqENwSW2; Wed,  8 Nov 2023 21:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F55382039;
	Wed,  8 Nov 2023 21:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F55382039
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 172AC1BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDFC2400FB
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFC2400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTFkVsLWasmD for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72CB54023B
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72CB54023B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6144A86D65; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 21:51:29 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ed0ba7481759bcc6cca3a833b1ed2b520b311c7e
X-Git-Newrev: 73a2491b7823420473bb6e0c7ae28031efbb257d
X-Patchwork-Hint: ignore
Message-Id: <20231108211053.6144A86D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 package/freeradius-server: fix redis handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=73a2491b7823420473bb6e0c7ae28031efbb257d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

redis handling is wrong since the addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176. Indeed, freeradius-server
needs hiredis, not redis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5a8d6014c747b228758b1adc76b3e6519c6e30cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeradius-server/freeradius-server.mk | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index af3320eb44..5a560d9153 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -71,6 +71,17 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_ippool
 endif
 
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+FREERADIUS_SERVER_CONF_OPTS += \
+	--with-rlm_redis \
+	--with-rlm_rediswho
+FREERADIUS_SERVER_DEPENDENCIES += hiredis
+else
+FREERADIUS_SERVER_CONF_OPTS += \
+	--without-rlm_redis \
+	--without-rlm_rediswho
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C)$(BR2_PACKAGE_LIBCURL),yy)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_rest
 FREERADIUS_SERVER_DEPENDENCIES += json-c libcurl
@@ -150,13 +161,6 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-readline
 endif
 
-ifeq ($(BR2_PACKAGE_REDIS),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_redis --with-rlm_rediswho
-FREERADIUS_SERVER_DEPENDENCIES += redis
-else
-FREERADIUS_SERVER_CONF_OPTS += --without-rlm_redis --without-rlm_rediswho
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_sqlite
 FREERADIUS_SERVER_DEPENDENCIES += sqlite
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
