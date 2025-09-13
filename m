Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A679CAC593
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42819408D3;
	Sat, 13 Sep 2025 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckgCqm_-iXEj; Sat, 13 Sep 2025 22:26:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C2B14089D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C2B14089D;
	Sat, 13 Sep 2025 22:26:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 659BA25B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B6B460D8D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8EZ--TUaSSg for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 22:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA3660D8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EA3660D8A
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:26:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D01A83BC2; Sat, 13 Sep 2025 22:26:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 00:25:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c5e4ef002e34037900fb397da2eed1b30fc05f9
X-Git-Newrev: de9c0f971c4798ea2d87cfcba17dad9519f209e9
X-Patchwork-Hint: ignore
Message-Id: <20250913222625.6D01A83BC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: workaround cmake < 3.30
 check TRY_RUN issue
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de9c0f971c4798ea2d87cfcba17dad9519f209e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last mariadb version bump [1] added -DHAVE_SYSTEM_LIBFMT_EXITCODE=0
to workaround cross-compiling issue during libfmt cmake check.
But it actually requies at least cmake >= 3.30 to work.
Indeed, our docker image used by Gitlab-CI uses cmake 3.25.1 and
segfault while testing for libfmt.

  -- Performing Test HAVE_SYSTEM_LIBFMT
  /bin/bash: line 1: 163369 Segmentation fault

  $ cmake --version
  cmake version 3.25.1

Using the same TestPerlDBDmysql configuration locally with
cmake 3.30.8 installed build fine.

Looking at cmake cmTryRunCommand.cxx history from 3.30.x show that
several fixes about cross-compiling isses were applied to cmake 3.26.x
[2] probably solving the issue. Requires BR2_HOST_CMAKE_AT_LEAST_3_30
for now, since only cmake 3.30.8 installed locally was tested.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124486 (TestPerlDBDmysql)
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124439 (TestMariaDB)

[1] 6cd8f95346 ("package/mariadb: bump version to 10.11.11")
[2] https://gitlab.kitware.com/cmake/cmake/-/commits/v3.30.9/Source/cmTryRunCommand.cxx?ref_type=tags

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mariadb/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index 503f884c62..b4c276a72f 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
+	# HAVE_SYSTEM_LIBFMT cmake < 3.30 check TRY_RUN issue
+	select BR2_HOST_CMAKE_AT_LEAST_3_30
 	help
 	  MariaDB is one of the most popular database servers in the
 	  world.  It's made by the original developers of MySQL and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
