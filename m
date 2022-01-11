Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B596C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B99408FE;
	Tue, 11 Jan 2022 20:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kfex-z8yUQjT; Tue, 11 Jan 2022 20:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A95F4057C;
	Tue, 11 Jan 2022 20:49:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 738311BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61FA56FB28
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7btmkecmfFw for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2B2160F20
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E3062834DC; Tue, 11 Jan 2022 20:43:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:48:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0662d0ec61e83581a96f162bb32637c01304a47d
X-Git-Newrev: b4705dfdd43d9e62c11d42bc2fb3f6600a5a7e33
X-Patchwork-Hint: ignore
Message-Id: <20220111204311.E3062834DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparsing: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4705dfdd43d9e62c11d42bc2fb3f6600a5a7e33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-pyparsing dropped python2 support since version 3.0.0:
https://github.com/pyparsing/pyparsing/blob/master/docs/whats_new_in_3_0_0.rst#python-2-x-no-longer-supported
resulting in the following build failure since bump to version 3.0.6 in
commit 7affc7827aee0e07ec94d3b4d91c2e23bda8d937:

  File "setup.py", line 8, in <module>
    from pyparsing import __version__ as pyparsing_version
  File "/home/buildroot/autobuild/instance-0/output-1/build/python-pyparsing-3.0.6/pyparsing/__init__.py", line 100
    major: int
         ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/8ac5224f4b6c2c59035dbfb53541e76f58b15e47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-httplib2/Config.in  | 7 +++----
 package/python-pyparsing/Config.in | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
index 39671f2386..0095d95b51 100644
--- a/package/python-httplib2/Config.in
+++ b/package/python-httplib2/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_HTTPLIB2
 	bool "python-httplib2"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3 # python-pyparsing
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON3_SSL
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  httplib2 is a comprehensive HTTP client library, httplib2.py
diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
index 926ca07ed7..9b5894116d 100644
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPARSING
 	bool "python-pyparsing"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  The pyparsing module is an alternative approach to creating
 	  and executing simple grammars, vs. the traditional lex/yacc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
