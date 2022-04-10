Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9430FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DBED60D54;
	Sun, 10 Apr 2022 14:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REPAmMelfIfs; Sun, 10 Apr 2022 14:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43AAD60BD6;
	Sun, 10 Apr 2022 14:48:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA811BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A04C60BD6
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nLVlOepeovV for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E09160B15
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8BB8D837CC; Sun, 10 Apr 2022 14:38:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:15:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 718574186190e23c45c6f3e92000f1e36dfe6c95
X-Git-Newrev: 9f83216ff1f86c625023bee3037773997fc2987d
X-Patchwork-Hint: ignore
Message-Id: <20220410143837.8BB8D837CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f83216ff1f86c625023bee3037773997fc2987d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-ujson needs C++ since bump to version 4.1.0 in commit
a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

powerpc-buildroot-linux-gnu-gcc.br_real: error: ./deps/double-conversion/double-conversion/bignum-dtoa.cc: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/b11600bdba42be9b211163e92afa3173276c3f8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
