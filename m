Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA745C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A3D340A01;
	Sun,  3 Dec 2023 22:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A3D340A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GACArbV345u; Sun,  3 Dec 2023 22:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D59A409BD;
	Sun,  3 Dec 2023 22:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D59A409BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 463C11BF8C7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7514012E
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A7514012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLbycXBrnDjI for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E8FD400F9
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E8FD400F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DE3487901; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 23:21:53 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 11c1a1c5bc78f3cbf2f1cbc06e8dba19449d7c77
X-Git-Newrev: c602cf3d11f59c0e0112aca57ec5aa6caa788065
X-Patchwork-Hint: ignore
Message-Id: <20231203222319.7DE3487901@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mariadb: security
 bump to version 10.11.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=c602cf3d11f59c0e0112aca57ec5aa6caa788065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This bump will fix the following build failure raised since bump of fmt
to version 10.1.0 in commit 619b5585d92c8f701cd92e0e26c0883a753125ad
thanks to
https://github.com/MariaDB/server/commit/f4cec369a392c8a6056207012992ad4a5639965a:

-- Performing Test HAVE_SYSTEM_LIBFMT
-- Performing Test HAVE_SYSTEM_LIBFMT - Failed

[...]

-- Downloading...
   dst='/home/buildroot/autobuild/instance-3/output-1/build/mariadb-10.11.4/extra/libfmt/src/8.0.1.zip'
   timeout='none'
   inactivity timeout='none'
-- Using src='https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip'
CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
  Each download failed!

    error: downloading 'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported or disabled in libcurl

This bump will also fix CVE-2023-22084

https://mariadb.com/kb/en/mariadb-10-11-5-release-notes/
https://mariadb.com/kb/en/mariadb-10-11-6-release-notes/

Fixes:
 - http://autobuild.buildroot.org/results/9cb577195aa939289102116df5a2eac03f0d5017

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d20329ed76082553368241aa4b38f4dabf45bc76)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 03ce5a968a..fd73cca4f3 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.4
-sha512  62fc05395857dd036ebeed53b1ff0ecd9abd95ce8e5316194286521caae0f9452cf96a93613adec809e39e1d8ef20c330b24fee82b3bb90ee27a84f2bbd0d8d2  mariadb-10.11.4.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.6
+sha512  3d77f7be4a26d5a36af56150a5f8ed5e21adeed9bc8ea1bd694e47a25a571bd73468eada7c96e0dfe5a6c81bef625abf71a56d228cf43a738e555e3c0d824a6a  mariadb-10.11.6.tar.gz
 
 # Hash for license files
 sha256  2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f805ff91a  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 78e4703eee..7f3755892a 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.4
+MARIADB_VERSION = 10.11.6
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
