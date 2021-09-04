Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13568C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:38:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A905660EC0
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A905660EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5613C4030F;
	Sat,  4 Sep 2021 09:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kSluku0Puqeu; Sat,  4 Sep 2021 09:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9782F400CE;
	Sat,  4 Sep 2021 09:38:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D14801BF836
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0A9560753
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Yg5JB3oOhfK for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 09:38:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 157C060644
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 09:38:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AB2AC882D2; Sat,  4 Sep 2021 09:37:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 11:24:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 301502b7f7e3d1c7b99bab8addbbcdc794bf8d50
X-Git-Newrev: 57aa6e718f8adbd0ac324179e28c9549cb862b59
X-Patchwork-Hint: ignore
Message-Id: <20210904093701.AB2AC882D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyudev: fix build with
 python 2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=57aa6e718f8adbd0ac324179e28c9549cb862b59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with python 2 is broken since bump to version 0.22.0 in commit
0adb141d342707ca9a478f57f187e38d5bb716f2:

error:   File "/usr/lib/python2.7/site-packages/pyudev/_ctypeslib/utils.py", line 54
    lib = cdll.LoadLibrary(f'lib{name}.so')
                                         ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/8b35ca6910dfd881953968f8d88ac842d57c9262

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Workaround-finding-libudev-on-systems-without-ldconf.patch   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index 67c2766496..d798f836a5 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -13,6 +13,8 @@ https://github.com/pyudev/pyudev/pull/117
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 [Marcin: adjust to 0.22.0]
 Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+[Fabrice: Use %-formatting instead of f-string for python 2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/pyudev/_ctypeslib/utils.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -37,7 +39,7 @@ index 9dffb3c..aa9942f 100644
 -    library_name = find_library(name)
 -    if not library_name:
 +    try:
-+        lib = cdll.LoadLibrary(f'lib{name}.so')
++        lib = cdll.LoadLibrary('lib%s.so' % name)
 +    except OSError:
          raise ImportError('No library named %s' % name)
 -    lib = CDLL(library_name, use_errno=True)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
