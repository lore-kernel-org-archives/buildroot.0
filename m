Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9F7C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C26A81754;
	Wed,  6 Jul 2022 21:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C26A81754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZUJ_bm1jWnK; Wed,  6 Jul 2022 21:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A105F81656;
	Wed,  6 Jul 2022 21:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A105F81656
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6805C1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41CC740C3D
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41CC740C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DT6zi2yq3HUB for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B6694011D
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6694011D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 63EB3831C4; Wed,  6 Jul 2022 21:32:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:45:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3ebeca4409d5848480cb7cf7b1d0c07b344ce96
X-Git-Newrev: 4138151e447e69771e2579ea5a3daa89c56d41a8
X-Patchwork-Hint: ignore
Message-Id: <20220706213212.63EB3831C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcpreplay: fix build with musl-fts
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

commit: https://git.buildroot.net/buildroot/commit/?id=4138151e447e69771e2579ea5a3daa89c56d41a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with musl-fts raised since bump to
version 4.4.1 in commit cc66cf922b0481b66011b171db7985a27c79c381 and
https://github.com/appneta/tcpreplay/commit/e1f4c2ac9133584da4be0da855c04c314a2e68c2:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: tcpreplay-tcpreplay.o: in function `main':
tcpreplay.c:(.text.startup+0x21c): undefined reference to `fts_open'

Fixes:
 - http://autobuild.buildroot.org/results/e47940b5b158395329c0132bb1bbea429c4dc249

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
