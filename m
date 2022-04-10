Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CD2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF9F82F9E;
	Sun, 10 Apr 2022 19:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0ZMez1EF9Oj; Sun, 10 Apr 2022 19:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A82483337;
	Sun, 10 Apr 2022 19:58:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB041BF338
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B48D60BAA
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1Qa43xHIpES for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 19:58:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 881E160AFF
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 19:58:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C741838C2; Sun, 10 Apr 2022 19:49:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 21:54:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e0819662eab8db5f2fdc4999011945d840df7081
X-Git-Newrev: 3d399c990533f87f6e39cb33715f5cdbffbf25b5
X-Patchwork-Hint: ignore
Message-Id: <20220410194900.4C741838C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-ujson:
 needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d399c990533f87f6e39cb33715f5cdbffbf25b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

python-ujson needs C++ since bump to version 4.1.0 in commit
a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

powerpc-buildroot-linux-gnu-gcc.br_real: error: ./deps/double-conversion/double-conversion/bignum-dtoa.cc: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/b11600bdba42be9b211163e92afa3173276c3f8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9f83216ff1f86c625023bee3037773997fc2987d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ujson/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
index 81d1bc457c..7af03e6497 100644
--- a/package/python-ujson/Config.in
+++ b/package/python-ujson/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PYTHON_UJSON
 	bool "python-ujson"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  UltraJSON is an ultra fast JSON encoder and decoder written
 	  in pure C with bindings for Python 3.
 
 	  https://pypi.python.org/pypi/ujson
+
+comment "python-ujson needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
