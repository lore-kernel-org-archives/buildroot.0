Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B581C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 021BD83F1E;
	Thu, 16 Dec 2021 19:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isVoekB7jIeT; Thu, 16 Dec 2021 19:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571DA83EE5;
	Thu, 16 Dec 2021 19:20:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD66E1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B906883F1E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-ePpXf73L7k for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:20:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6A1A83EE5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:20:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 489BD8229F; Thu, 16 Dec 2021 19:14:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 20:11:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8
X-Git-Newrev: f7f7124ee0a1fa328f26fb1b6ca940bc0018f5e3
X-Patchwork-Hint: ignore
Message-Id: <20211216191449.489BD8229F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add xxhash mandatory
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7f7124ee0a1fa328f26fb1b6ca940bc0018f5e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add xxhash mandatory dependency to avoid the following build failure
with the embedded xxhash (in version 0.8.1) and uclibc raised since
bump to version 1.4.63 in commit
2a002466459a17f44f565209a9cfd8512676ca47 and
https://github.com/lighttpd/lighttpd1.4/commit/23b07fa3efde70b76afa5380b1602d0515aedd46:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: src/lighttpd.p/algo_xxhash.c.o: in function `XXH32_canonicalFromHash':
/home/buildroot/autobuild/instance-0/output-1/build/lighttpd-1.4.63/build/../src/algo_xxhash.h:2282: undefined reference to `static_assert'

Fixes:
 - http://autobuild.buildroot.org/results/7b644dce244a1aa4a193a3196059a56b2c4c7591

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lighttpd/Config.in   | 1 +
 package/lighttpd/lighttpd.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index e9a5aa34f0..9f593a9228 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_XXHASH
 	help
 	  lighttpd a secure, fast, compliant and very flexible
 	  web-server which has been optimized for high-performance
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 98e84e8de8..5d53767263 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -11,7 +11,7 @@ LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSIO
 LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
-LIGHTTPD_DEPENDENCIES = host-pkgconf
+LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
 	-Dwith_brotli=false \
 	-Dwith_dbi=false \
@@ -33,7 +33,7 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_sasl=false \
 	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
-	-Dwith_xxhash=false \
+	-Dwith_xxhash=true \
 	-Dwith_zstd=false \
 	-Dbuild_extra_warnings=false \
 	-Dbuild_static=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
