Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC5C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8773C40A5C;
	Tue,  2 Jan 2024 20:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8773C40A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVCRXy6DMvKN; Tue,  2 Jan 2024 20:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FA9C40A5E;
	Tue,  2 Jan 2024 20:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FA9C40A5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 979CC1BF977
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714B081E4C
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714B081E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIYGhkPczhTN for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D5681AD7
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D5681AD7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91F8D83CC1; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:06:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98684ba7885b9a62ba05af9093aa0f1010d1ee02
X-Git-Newrev: b25176ee9a373d00ab18e46d3e39f6a56dfbbfcf
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.91F8D83CC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-contourpy: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=b25176ee9a373d00ab18e46d3e39f6a56dfbbfcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++ is mandatory resulting in the following build failure since the
addition of the package in commit
1e7f0794bbb0075285dc3b4dab8484f12adbb886:

../output-1/build/python-contourpy-1.1.0/meson.build:1:0: ERROR: Unable to detect GNU compiler type:

Fixes:
 - http://autobuild.buildroot.org/results/6b50f9621b00aab384cc2dde77fae7daff46d08b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-contourpy/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-contourpy/Config.in b/package/python-contourpy/Config.in
index 4843884a97..313d270dda 100644
--- a/package/python-contourpy/Config.in
+++ b/package/python-contourpy/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PYTHON_CONTOURPY
 	bool "python-contourpy"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PYTHON_PYBIND
 	help
 	  Python library for calculating contours of 2D quadrilateral
 	  grids.
 
 	  https://github.com/contourpy/contourpy
+
+comment "python-contourpy needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
