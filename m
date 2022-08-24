Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDBDC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A04415FF;
	Wed, 24 Aug 2022 11:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A04415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_GzmRS1I7wK; Wed, 24 Aug 2022 11:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E18401C5;
	Wed, 24 Aug 2022 11:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E18401C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDE611BF37A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B98E740B1D
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B98E740B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETRfvA4a-q93 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:17:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB473401A3
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB473401A3
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C5DB87CFD; Wed, 24 Aug 2022 11:02:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:16:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fee46b54e7b51c6b40fa57cf03fb150c21fdf8e5
X-Git-Newrev: 84d32e53657db32784608c1130ec5290667a652f
X-Patchwork-Hint: ignore
Message-Id: <20220824110213.4C5DB87CFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: set krb5-config
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

commit: https://git.buildroot.net/buildroot/commit/?id=84d32e53657db32784608c1130ec5290667a652f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following libkrb5 build failure raised since the addition of the
package in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:

checking for krb5-config... /bin/krb5-config
checking krb5-config CFLAGS... Failed to find installation architecture
""
checking krb5-config LDFLAGS... Failed to find installation architecture

checking krb5-config reported version... Failed to find installation architecture
 ()
checking krb5-config reported vendor... Failed to find installation architecture

checking canonical API type... HEIMDAL

[...]

In file included from src/modules/rlm_krb5/rlm_krb5.c:32:
src/modules/rlm_krb5/krb5.h:41:9: error: unknown type name 'krb5_verify_opt'
   41 |         krb5_verify_opt options;
      |         ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f173d1600c278d910f4cbeae86dcad1ee0f911f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/freeradius-server.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 5b74a3b01a..f77413a170 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -86,7 +86,9 @@ FREERADIUS_SERVER_CONF_OPTS += --without-libcap
 endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_krb5
+FREERADIUS_SERVER_CONF_OPTS += \
+	ac_cv_path_krb5-config=$(STAGING_DIR)/usr/bin/krb5-config \
+	--with-rlm_krb5
 FREERADIUS_SERVER_DEPENDENCIES += libkrb5
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_krb5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
