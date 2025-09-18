Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71C1CAC5AA
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF59C610D5;
	Fri, 19 Sep 2025 12:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThdwowBTo7Wm; Fri, 19 Sep 2025 12:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCA9D610A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA9D610A2;
	Fri, 19 Sep 2025 12:54:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 748B9E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4947140B35
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQuH_3MM1vj6 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A4140DB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A4140DB4
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5A7685FD9; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:42:30 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 376785362f6b7975a10a3ed6f8a5661a6497a45d
X-Git-Newrev: 112da41bed84729822480f22748c570853136dfe
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.A5A7685FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/mariadb:
 workaround cmake < 3.30 check TRY_RUN issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=112da41bed84729822480f22748c570853136dfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
(cherry picked from commit de9c0f971c4798ea2d87cfcba17dad9519f209e9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
