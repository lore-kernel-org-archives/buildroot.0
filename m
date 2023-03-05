Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2B7C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB6D405CE;
	Sun,  5 Mar 2023 17:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB6D405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYP2A_QIh7Ad; Sun,  5 Mar 2023 17:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67F9A4049A;
	Sun,  5 Mar 2023 17:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F9A4049A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35FD81BF868
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F94381A24
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F94381A24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpaBEPoe-KZ8 for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E9D2817C0
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E9D2817C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE003864E7; Sun,  5 Mar 2023 17:40:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:18:44 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2a3d06fee6e18c8a671c2caca4dafa7a169e9b7c
X-Git-Newrev: 05e97cdf8520ff0b9d3a81f0426b388c683790a9
X-Patchwork-Hint: ignore
Message-Id: <20230305174057.EE003864E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mutt: fix build
 failure when host provides an old gpgrt-config
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

commit: https://git.buildroot.net/buildroot/commit/?id=05e97cdf8520ff0b9d3a81f0426b388c683790a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

As already done for gnupg2 in commit
d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8, apply the same fix to mutt to
avoid the following build failure:

/home/thomas/autobuild/instance-2/output-1/host/bin/i686-buildroot-linux-uclibc-gcc -DPKGDATADIR=\"/usr/share/mutt\" -DSYSCONFDIR=\"/etc\" -DBINDIR=\"/usr/bin\" -DMUTTLOCALEDIR=\"/usr/share/locale\" -DHAVE_CONFIG_H=1 -I.  -I. -I.   -I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Wall -pedantic -Wno-long-long -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -c -o txt2c.o txt2c.c
i686-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

Fixes:
 - http://autobuild.buildroot.org/results/98010be4ef70e58819ea2d17315bdac66a619b23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a39e328bb2835cd157ee1622d5117ba252d44733)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 0a98396d88..5cf1b6bad2 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -37,6 +37,10 @@ MUTT_DEPENDENCIES += libgpgme
 MUTT_CONF_OPTS += \
 	--enable-gpgme \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr
+
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+MUTT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
 else
 MUTT_CONF_OPTS += --disable-gpgme
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
