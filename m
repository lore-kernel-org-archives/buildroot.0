Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190E2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9658603E9
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9658603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913D84068D;
	Fri, 10 Sep 2021 11:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKa0CDVvGeMP; Fri, 10 Sep 2021 11:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C703040671;
	Fri, 10 Sep 2021 11:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CDE01BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45925405F4
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2niva25fGm0b for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:13:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C4C44061B
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E57B188C83; Fri, 10 Sep 2021 11:11:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 13:12:47 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2ae0409d46da45880dd69c7d09c0ccfd87918e4e
X-Git-Newrev: 8ef751d8ad36259d724ecc1b996e63bc2303f967
X-Patchwork-Hint: ignore
Message-Id: <20210910111140.E57B188C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-pyudev:
 fix build with python 2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ef751d8ad36259d724ecc1b996e63bc2303f967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 57aa6e718f8adbd0ac324179e28c9549cb862b59)
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
