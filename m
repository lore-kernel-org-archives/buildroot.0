Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4455EC77B73
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 10:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FD560FBF;
	Sat, 27 May 2023 10:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FD560FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 435Re788t5b4; Sat, 27 May 2023 10:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB54361317;
	Sat, 27 May 2023 10:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB54361317
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1861BF34B
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 10:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB27960F2C
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 10:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB27960F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tztYZqG3osh for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 10:00:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E285F60F56
 for <buildroot@buildroot.org>; Sat, 27 May 2023 10:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E285F60F56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D167586532; Sat, 27 May 2023 10:00:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 11:57:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aecf8a96e1768a20f2f12258a6c755e5aa316ff9
X-Git-Newrev: 8ac1458e8162ab9d3ac3c5354c874a00bdf36d57
X-Patchwork-Hint: ignore
Message-Id: <20230527100003.D167586532@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-can: add missing setuptools
 runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ac1458e8162ab9d3ac3c5354c874a00bdf36d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] removed setuptools from runtime dependencies
"Drop spurious setuptools runtime dependency.". Since then
the test TestPythonPy3Can fail with the following error:

  ModuleNotFoundError: No module named 'pkg_resources'

Add back setuptools to provide "pkg_resources".

Fixes
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819285

[1] 09c966af735ca53b447f52965d123c21e43ae522

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 5d21e29d88..68a9ffca71 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_AENUM # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
