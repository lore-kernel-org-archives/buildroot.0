Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759FAC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF14241DB3;
	Sat, 17 Sep 2022 21:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF14241DB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sd4dfEf04E3o; Sat, 17 Sep 2022 21:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB1741A42;
	Sat, 17 Sep 2022 21:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB1741A42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 430CA1BF3CE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EA3B40119
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA3B40119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQU5-_SBjn-X for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51D62400E4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D62400E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F5CA846F3; Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 23:36:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2040961b48ea2d7f35b5cdd7de0deca36c9c65cb
X-Git-Newrev: c2f642256395afdd51946722bd0c37c380a3d9ad
X-Patchwork-Hint: ignore
Message-Id: <20220917213624.3F5CA846F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: improve sysv script
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2f642256395afdd51946722bd0c37c380a3d9ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As specified in the manual (18.5 The SNNfoo start script),
the name of the script should reflect the name of the daemon,
which in this case in polkitd.

Also remove the redundant/broken reload case.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/{S50polkit => S50polkitd} | 2 +-
 package/polkit/polkit.mk                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polkit/S50polkit b/package/polkit/S50polkitd
old mode 100755
new mode 100644
similarity index 97%
rename from package/polkit/S50polkit
rename to package/polkit/S50polkitd
index f07e2d613b..5810e780a0
--- a/package/polkit/S50polkit
+++ b/package/polkit/S50polkitd
@@ -40,7 +40,7 @@ restart() {
 }
 
 case "$1" in
-	start|stop|restart|reload)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature.
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a8b371acf8..f94579a149 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -68,8 +68,8 @@ define POLKIT_INSTALL_INIT_SYSTEMD
 endef
 
 define POLKIT_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/polkit/S50polkit \
-		$(TARGET_DIR)/etc/init.d/S50polkit
+	$(INSTALL) -D -m 0755 package/polkit/S50polkitd \
+		$(TARGET_DIR)/etc/init.d/S50polkitd
 endef
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
