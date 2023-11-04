Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A372C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E640E40223;
	Sat,  4 Nov 2023 18:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E640E40223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSFJZq6FArOr; Sat,  4 Nov 2023 18:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E43F9402E0;
	Sat,  4 Nov 2023 18:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E43F9402E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE33A1BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D8F418C1
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D8F418C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmaH3a0h2zbz for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:24:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C44D5417CA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44D5417CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A78FA866DC; Sat,  4 Nov 2023 18:24:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 19:23:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c5a82a29ceb382d53ccb08ffd34a92c142cadbb
X-Git-Newrev: ce918125e126a8b75f2dce68e09205bb0e78add6
X-Patchwork-Hint: ignore
Message-Id: <20231104182443.A78FA866DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: enable default
 modules mschap and realm
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce918125e126a8b75f2dce68e09205bb0e78add6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"mschap" and "realm" are already part of default required
raddb modules(DEFAULT_MODULES in raddb/all.mk).

so removed them from disabled module list so that
radiusd.service can start without following errors:

- /etc/raddb/mods-enabled/mschap[11]: Failed to link to module 'rlm_mschap': /usr/lib/rlm_mschap.so
- /etc/raddb/mods-enabled/realm[21]: Failed to link to module 'rlm_realm': /usr/lib/rlm_realm.so

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
