Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06A2C77B7A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC7E4285A;
	Fri,  2 Jun 2023 19:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC7E4285A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukifVSJrTgk8; Fri,  2 Jun 2023 19:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D860542854;
	Fri,  2 Jun 2023 19:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D860542854
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6331BF97E
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84789616B8
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84789616B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnXyLSncf2W3 for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FC64616B6
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC64616B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CB5B86BBD; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 21:46:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1c55ea6dd4e7b93e4720206fc1ea390933ef675
X-Git-Newrev: 8d93c999a39344bb3b73a21490cc4e0122ef5923
X-Patchwork-Hint: ignore
Message-Id: <20230602194659.8CB5B86BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipython: add missing dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d93c999a39344bb3b73a21490cc4e0122ef5923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported [1], the test TestIPythonPy3 fail since it was updated
to 8.6.0 release just after 2022.11.

  ModuleNotFoundError: No module named 'stack_data'

Indeed there is no such python3-stack-data in Buildroot.
For example, Fedora packaging added python3-stack-data while updating
to ipython 8.0.1.

With python-stack-data added, the test TestIPythonPy3 still fail
with:

  ModuleNotFoundError: No module named 'sqlite3'

Since ipython 8 sqlite3 fallback imports has been removed [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089

[1] http://lists.busybox.net/pipermail/buildroot/2023-May/668086.html
[2] https://github.com/ipython/ipython/commit/7a0bdabecfa745b60c3a711e1da2df378687e746

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ipython/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 3de49ae574..c217efcfd1 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_BACKCALL # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
@@ -7,6 +8,7 @@ config BR2_PACKAGE_PYTHON_IPYTHON
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
 	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
+	select BR2_PACKAGE_PYTHON_STACK_DATA # runtime
 	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
 	help
 	  IPython is a command shell for interactive computing in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
