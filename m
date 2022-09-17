Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADAC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA7A41D1B;
	Sat, 17 Sep 2022 08:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA7A41D1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMiIp6inpqeA; Sat, 17 Sep 2022 08:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4D041D0F;
	Sat, 17 Sep 2022 08:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4D041D0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21F811BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEB8D842D8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEB8D842D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckw9rdsfXLHL for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:30:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 245DB842D7
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 245DB842D7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0FA8784000; Sat, 17 Sep 2022 08:30:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:28:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4134dff6203885269cf35a9c94e751485e496ead
X-Git-Newrev: ceabca4b853203ee5a97e63f69deaead41db3678
X-Patchwork-Hint: ignore
Message-Id: <20220917083027.0FA8784000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: fix detection of
 pppd
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

commit: https://git.buildroot.net/buildroot/commit/?id=ceabca4b853203ee5a97e63f69deaead41db3678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the switch to meson in 58c58466319a (package/network-manager:
migrate autotools build system to meson), the detection of pppd is
broken for cross-compilation:

    Has header "pppd/pppd.h" : YES
    Program pppd /sbin/pppd /usr/sbin/pppd found: NO

    ../../../O/br-2022.08/vtc/build/network-manager-1.36.4/meson.build:570:4: ERROR: Assert failed: pppd required but not found, please provide a valid pppd path or use -Dppp=false to disable it

Indeed, meson will simply look for existing files on the host, and that
can't work in cross-compilation.

Fix that by telling meson the results it can't find by itself.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a3bcd4dab8..105273a74c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -103,7 +103,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
 NETWORK_MANAGER_DEPENDENCIES += pppd
-NETWORK_MANAGER_CONF_OPTS += -Dppp=true
+NETWORK_MANAGER_CONF_OPTS += \
+	-Dppp=true \
+	-Dpppd=/usr/sbin/pppd \
+	-Dpppd_plugin_dir=/usr/lib/pppd/$(PPPD_VERSION)
 else
 NETWORK_MANAGER_CONF_OPTS += -Dppp=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
