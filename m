Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5576FC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9AB660709;
	Sun,  5 Feb 2023 12:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9AB660709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7XCz6W6cndP; Sun,  5 Feb 2023 12:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E60F606F5;
	Sun,  5 Feb 2023 12:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E60F606F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43E0A1BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F0B14010D
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F0B14010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BB3QmlpUFDXR for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:28:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48B484010C
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48B484010C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34E968378B; Sun,  5 Feb 2023 12:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:28:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 122c85985f199f48f02c5fbd411111629023fc37
X-Git-Newrev: f802249c6227fa1b7299e59d8fff43b98cb2106d
X-Patchwork-Hint: ignore
Message-Id: <20230205122816.34E968378B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: remove runtime
 dependency on python-toml
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f802249c6227fa1b7299e59d8fff43b98cb2106d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 7.2 [1], with Python 3.11+ pytest no longer uses tomli to
parse pyproject.toml but instead uses tomllib which is part of Python
itself [2]. Note that toml was replaced with tomli in version 7.0, so
the dependency was anyway incorrect.

Note that tomllib is unconditionally installed as part of Python 3.11,
there is no PYTHON3_LIBTOML option or anything like that that needs to
be selected.

[1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-2-0-2022-10-23
[2] https://github.com/pytest-dev/pytest/pull/9741

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index c3956c76d2..9bbc9ea2d2 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_PYTEST
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
 	select BR2_PACKAGE_PYTHON_PY # runtime
-	select BR2_PACKAGE_PYTHON_TOML # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  pytest is a framework that makes building simple and scalable
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
