Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D5FC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 10:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3537B60FC7;
	Sat, 27 May 2023 10:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3537B60FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJDTIs4y7bVX; Sat, 27 May 2023 10:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ACE760F56;
	Sat, 27 May 2023 10:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACE760F56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3E431BF34B
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 10:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB38060F2C
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 10:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB38060F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7oKZCngUiCG for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 10:00:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD50760F30
 for <buildroot@buildroot.org>; Sat, 27 May 2023 10:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD50760F30
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7E9586503; Sat, 27 May 2023 10:00:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 11:56:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4030a7eb59fa7d12fe31ef56fe0479f2c5f8d3f7
X-Git-Newrev: aecf8a96e1768a20f2f12258a6c755e5aa316ff9
X-Patchwork-Hint: ignore
Message-Id: <20230527100003.C7E9586503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: add missing
 python-zlib runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=aecf8a96e1768a20f2f12258a6c755e5aa316ff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tree django core files are using "import zlib" and requires
BR2_PACKAGE_PYTHON3_ZLIB to be enabled.

django/core/cache/backends/filebased.py:import zlib
django/core/files/images.py:import zlib
django/core/signing.py:import zlib

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819300

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 5830cadc93..c236a6dc0b 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_DJANGO
 	bool "python-django"
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_SQLPARSE # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
