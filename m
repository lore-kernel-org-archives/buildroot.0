Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD580C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C3B41B73;
	Fri, 22 Jul 2022 07:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C3B41B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6PoVys2yQ6Y; Fri, 22 Jul 2022 07:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E14419AE;
	Fri, 22 Jul 2022 07:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E14419AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1273D1BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B7D5416EB
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B7D5416EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAKtoMcoZWCZ for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:08:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87E3B416C0
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87E3B416C0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 77CEB8414E; Fri, 22 Jul 2022 06:55:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:06:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 202ca784874aa08c61fe46a707600e592f2c4f6f
X-Git-Newrev: eaf50b2e6096820a2a34f04fdd8ac6ea89921063
X-Patchwork-Hint: ignore
Message-Id: <20220722065519.77CEB8414E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/tcpreplay: fix
 build with musl-fts
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaf50b2e6096820a2a34f04fdd8ac6ea89921063
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure with musl-fts raised since bump to
version 4.4.1 in commit cc66cf922b0481b66011b171db7985a27c79c381 and
https://github.com/appneta/tcpreplay/commit/e1f4c2ac9133584da4be0da855c04c314a2e68c2:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: tcpreplay-tcpreplay.o: in function `main':
tcpreplay.c:(.text.startup+0x21c): undefined reference to `fts_open'

Fixes:
 - http://autobuild.buildroot.org/results/e47940b5b158395329c0132bb1bbea429c4dc249

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4138151e447e69771e2579ea5a3daa89c56d41a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 86894e468e..f228882ecc 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -11,14 +11,20 @@ TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CPE_ID_VENDOR = broadcom
 TCPREPLAY_CONF_ENV = \
-	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
+	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config" \
+	LIBS="$(TCPREPLAY_LIBS)"
 TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
 	--enable-pcapconfig
 TCPREPLAY_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+TCPREPLAY_DEPENDENCIES += musl-fts
+TCPREPLAY_LIBS += -lfts
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 TCPREPLAY_CONF_OPTS += --enable-dynamic-link=no
-TCPREPLAY_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`"
+TCPREPLAY_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --libs`
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDNET),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
