Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA615C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADFB82BC4;
	Mon, 25 Apr 2022 20:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WniEz9eNB2ql; Mon, 25 Apr 2022 20:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA0182B1E;
	Mon, 25 Apr 2022 20:27:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 417331BF982
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E472860F72
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GklAr3nXepN1 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D3FE60F87
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 126628448B; Mon, 25 Apr 2022 20:15:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 22:19:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e21a7931c7afc6f8740775c03c29a8bc03afa16b
X-Git-Newrev: f5e4bb185a2694c180ba1c51efab4e5a6c8b3975
X-Patchwork-Hint: ignore
Message-Id: <20220425201532.126628448B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: fix libxml2 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5e4bb185a2694c180ba1c51efab4e5a6c8b3975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass ac_cv_path_xmlconfig to fix the following build failure with
libxml2 raised since bump to version 0.102.0 in commit
007f49962a961f96ff87795217758ec3786d03ac and
https://github.com/Cisco-Talos/clamav/commit/083ca38727b0ebd3979cf1ebc7b31148f6d5e7f7:

aarch64-none-linux-gnu-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include/libxml2'
In file included from /usr/include/libxml2/libxml/parser.h:810,
                 from others.c:62:
/usr/include/libxml2/libxml/encoding.h:31:10: fatal error: unicode/ucnv.h: No such file or directory
   31 | #include <unicode/ucnv.h>
      |          ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5bb3bea6d13ac8d497f6862374d65a59bea7ed09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/clamav/clamav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index cd2d06e6b3..e2ee99d02b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -69,6 +69,7 @@ CLAMAV_CONF_OPTS += --without-libjson
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
+CLAMAV_CONF_ENV += ac_cv_path_xmlconfig=$(STAGING_DIR)/usr/bin/xml2-config
 CLAMAV_CONF_OPTS += --with-xml=$(STAGING_DIR)/usr
 CLAMAV_DEPENDENCIES += libxml2
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
