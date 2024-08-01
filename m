Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325CBC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 11:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EED1A612CE;
	Thu,  1 Aug 2024 11:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69OI5_FoFES7; Thu,  1 Aug 2024 11:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FB91612D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FB91612D3;
	Thu,  1 Aug 2024 11:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3441BF3C9
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 11:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35EA940E43
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 11:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6HhSuYTwM72 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 11:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A699040B77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A699040B77
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 11:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A048B83874; Thu,  1 Aug 2024 11:05:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 12:48:39 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: ec0bad566a72c42bdeeacbc5181fd9cafb251da8
X-Git-Newrev: cf9b5e669c448270608fa829d0270302b67bd6b2
X-Patchwork-Hint: ignore
Message-Id: <20240801110509.A048B83874@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/fail2ban: fix
 data_files installation path
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
Content-Type: multipart/mixed; boundary="===============8559318182009070860=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8559318182009070860==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cf9b5e669c448270608fa829d0270302b67bd6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

When packaging data_files in a wheel, those files shall have the destination
path expressed as relative to the wheel installation.
The reason for that is the wheel installation shall be contained inside a
specific folder and/or in site-packages.
When building the wheel file by the bdist_wheel command, python will package
files with absolute paths as python files ending up installing them in
site-packages.

Fixes:
http://autobuild.buildroot.net/results/36ac5278d19195a21c3d02d087965e08f49228ef

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
[Arnout: add Upstream tag to the patch]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c90b87156dec69c9acabb8bd80d2447a5dbfb1e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-setup.py-fix-data-relative-paths.patch    | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch b/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
new file mode 100644
index 0000000000..75bd9aafac
--- /dev/null
+++ b/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
@@ -0,0 +1,74 @@
+From 7b7fa3c02d4575c09362336bc310835c37859f1a Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Fri, 19 Apr 2024 22:47:20 +0200
+Subject: [PATCH] setup.py: fix data relative paths
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As per distutils documentation:
+
+The directory should be a relative path. It is interpreted relative to the
+installation prefix (Python’s sys.prefix for system installations;
+site.USER_BASE for user installations). Distutils allows directory to be an
+absolute installation path, but this is discouraged since it is incompatible
+with the wheel packaging format [1].
+
+When packaging to a bdist_wheel indeed, the files in the "data_files" dictionary
+are not picked at all as data files if they have an absolute path,
+but they are instead added to the wheel as python files.
+This has the effect of installing them as part of python files in the
+site-packages folder when the wheel is installed.
+
+This patch cannot be sent upstream because it breaks the legacy way of
+installing the package with *python setup.py install* and it is needed only to
+comply with the pep517 buildroot compatibility layer.
+
+[1] https://docs.python.org/3.10/distutils/setupscript.html#installing-additional-files
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Upstream: N/A [breaks traditional setuptools installation]
+---
+ setup.py | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 91f71cf2..99ba2e32 100755
+--- a/setup.py
++++ b/setup.py
+@@ -238,26 +238,26 @@ setup(
+ 				for f in w[2]]
+ 	} if with_tests else {},
+ 	data_files = [
+-		('/etc/fail2ban',
++		('etc/fail2ban',
+ 			glob("config/*.conf")
+ 		),
+-		('/etc/fail2ban/filter.d',
++		('etc/fail2ban/filter.d',
+ 			glob("config/filter.d/*.conf")
+ 		),
+-		('/etc/fail2ban/filter.d/ignorecommands',
++		('etc/fail2ban/filter.d/ignorecommands',
+ 			[p for p in glob("config/filter.d/ignorecommands/*") if isfile(p)]
+ 		),
+-		('/etc/fail2ban/action.d',
++		('etc/fail2ban/action.d',
+ 			glob("config/action.d/*.conf") +
+ 			glob("config/action.d/*.py")
+ 		),
+-		('/etc/fail2ban/fail2ban.d',
++		('etc/fail2ban/fail2ban.d',
+ 			''
+ 		),
+-		('/etc/fail2ban/jail.d',
++		('etc/fail2ban/jail.d',
+ 			''
+ 		),
+-		('/var/lib/fail2ban',
++		('var/lib/fail2ban',
+ 			''
+ 		),
+ 	] + data_files_extra,
+-- 
+2.34.1
+

--===============8559318182009070860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8559318182009070860==--
