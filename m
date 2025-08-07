Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A76EC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2554E605FC;
	Thu,  7 Aug 2025 17:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DEP955zd3Jj; Thu,  7 Aug 2025 17:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32ADD60632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32ADD60632;
	Thu,  7 Aug 2025 17:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CB5A31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0576840012
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1L0vbEwlEq8I for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F21E140022
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F21E140022
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED6A7868A1; Thu,  7 Aug 2025 17:00:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:05:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e157776d6b07a55ce03ffe43f285dc0620a72141
X-Git-Newrev: 786700f1d3ee356fb65587479d61aed5eb8f1680
X-Patchwork-Hint: ignore
Message-Id: <20250807170019.ED6A7868A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libesmtp: bump to
 version v1.1.0-14-g335ee8d to fix build with gcc-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=786700f1d3ee356fb65587479d61aed5eb8f1680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When building libesmtp on the autobuilder with gcc-14, the
following error occurs:

    /workdir/instance-0/output-1/per-package/libesmtp/host/bin/arc-linux-gcc -Ilibesmtp.so.6.2.0.p -I. -I.. -I/workdir/instance-0/output-1/per-package/libesmtp/host/arc-buildroot-linux-gnu/sysroot/usr/include -fdiagnostics-color=always -Wall -Winvalid-pch -std=c11 -O3 -D_POSIX_C_SOURCE=200809L -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=2 -fPIC -pthread -MD -MQ libesmtp.so.6.2.0.p/smtp-api.c.o -MF libesmtp.so.6.2.0.p/smtp-api.c.o.d -o libesmtp.so.6.2.0.p/smtp-api.c.o -c ../smtp-api.c
    ../smtp-api.c: In function 'smtp_version':
    ../smtp-api.c:1183:7: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Wimplicit-function-declaration]
     1183 |   if (strlcpy (buf, v, len) > len)
          |       ^~~~~~~
          |       strncpy

This error has been fixed upstream in commit [1], but no new release
has been made since.
This patch update the package version to fetch the latest upstream
commit v1.1.0-14-g335ee8d.

For the changes, see:

 - https://github.com/libesmtp/libESMTP/compare/v1.1.0...335ee8d2fa5cb7d30db7b818ec05563ad139ee2f

[1] https://github.com/libesmtp/libESMTP/commit/972eb547493357681b1b7012ef20618e6831cfde

Fixes: https://autobuild.buildroot.org/results/ced/ceda012506edccda1727904eb3327017b07e27d8
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien:
 - mention gcc-14 as the root cause of the build failure
 - use "git describe --tags --abbrev=40" format in _VERSION
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 84077c777658d834ba8bb67582707f24d73cb914)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libesmtp/libesmtp.hash | 2 +-
 package/libesmtp/libesmtp.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
index 596ed4eaca..e13616d8f8 100644
--- a/package/libesmtp/libesmtp.hash
+++ b/package/libesmtp/libesmtp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  32bc3614ca12d21c7d933f32d43410e8744b6f91fdca7732da9877a385e4e6c3  libesmtp-1.1.0.tar.gz
+sha256  144aece0077db6a2bd655d3d9558c714c9defd30a2d52c6e85ed54457d712daf  libesmtp-v1.1.0-14-g335ee8d2fa5cb7d30db7b818ec05563ad139ee2f.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING.GPL
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 6456e83e10..5e0b65ce91 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBESMTP_VERSION = 1.1.0
-LIBESMTP_SITE = $(call github,libesmtp,libESMTP,v$(LIBESMTP_VERSION))
+LIBESMTP_VERSION = v1.1.0-14-g335ee8d2fa5cb7d30db7b818ec05563ad139ee2f
+LIBESMTP_SITE = $(call github,libesmtp,libESMTP,$(LIBESMTP_VERSION))
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING.GPL LICENSE
-LIBESMTP_CPE_ID_VALID = YES
+LIBESMTP_CPE_ID_VERSION = 1.1.0
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBESMTP_CONF_OPTS += -Dtls=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
