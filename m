Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EF4C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 08:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 184F76112D
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 08:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 184F76112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFAEF40900;
	Thu,  7 Oct 2021 08:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzxL_YZfRRWT; Thu,  7 Oct 2021 08:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41955408F8;
	Thu,  7 Oct 2021 08:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE211BF383
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 08:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B5A7408F8
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 08:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OayUX9xQOdQ8 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 08:01:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59F5B408F5
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 08:01:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8F3FF934A0; Thu,  7 Oct 2021 07:58:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 09:45:35 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b8b0dcbf7a17cbf7d0801e4a3ea0993a98d056b4
X-Git-Newrev: 039a7c4f3c669a5e4155ec195cf42760708b506c
X-Patchwork-Hint: ignore
Message-Id: <20211007075843.8F3FF934A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/nmap: add zlib
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=039a7c4f3c669a5e4155ec195cf42760708b506c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

zlib is an optional dependency since bump to version 7.60 in commit
c4faf1d4d11764da769abdd252dd3925d83378cb and
https://github.com/nmap/nmap/commit/0c142333bb356b6ff15fff5c95522c4cfc410a9c.
If it is not disabled, nmap will build its own zlib version which can
result in the following build failure:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libz.so.1.2.11'

Fixes:
 - http://autobuild.buildroot.org/results/da9469e24390c94fe74f133152dc320c21872159
 - http://autobuild.buildroot.org/results/53034d8dd506bc033dc92343f9a37cd4ac8b2142

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e991c2cba6f1a350461a91c9646a20ac7d3853b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 13414a56ee..34cf61ff0b 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -44,6 +44,13 @@ else
 NMAP_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+NMAP_CONF_OPTS += --with-libz="$(STAGING_DIR)/usr"
+NMAP_DEPENDENCIES += zlib
+else
+NMAP_CONF_OPTS += --without-libz
+endif
+
 NMAP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 
 ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
