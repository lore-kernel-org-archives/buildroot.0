Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF1C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 11:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1480B40119;
	Thu,  9 Nov 2023 11:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1480B40119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-WaUv0VdvB0; Thu,  9 Nov 2023 11:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25580409F3;
	Thu,  9 Nov 2023 11:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25580409F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE9D21BF28A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8897F80E6C
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8897F80E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEGgfdALwzqP for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 11:19:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B314A80E16
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 11:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B314A80E16
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EE3886DD8; Thu,  9 Nov 2023 11:19:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 12:12:25 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 470087031c1e6e8d4abd889a0cb4030ca3c4a735
X-Git-Newrev: ea2695a1b0032425c7e2d42b368699e7ba230d92
X-Patchwork-Hint: ignore
Message-Id: <20231109111952.9EE3886DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 package/freeradius-server: enable default modules mschap and realm
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea2695a1b0032425c7e2d42b368699e7ba230d92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

"mschap" and "realm" are already part of default required
raddb modules(DEFAULT_MODULES in raddb/all.mk).

so removed them from disabled module list so that
radiusd.service can start without following errors:

- /etc/raddb/mods-enabled/mschap[11]: Failed to link to module 'rlm_mschap': /usr/lib/rlm_mschap.so
- /etc/raddb/mods-enabled/realm[21]: Failed to link to module 'rlm_realm': /usr/lib/rlm_realm.so

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce918125e126a8b75f2dce68e09205bb0e78add6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeradius-server/freeradius-server.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 2dd9c4e609..e493f7a17e 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -45,9 +45,7 @@ FREERADIUS_SERVER_CONF_OPTS += \
 FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_eap_ike \
 	--without-rlm_eap_tnc \
-	--without-rlm_mschap \
 	--without-rlm_perl \
-	--without-rlm_realm \
 	--without-rlm_sql_iodbc \
 	--without-rlm_sql_oracle \
 	--without-rlm_sql_freetds \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
