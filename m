Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36139C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4B7C41700;
	Thu, 21 Apr 2022 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjWrKct8kITK; Thu, 21 Apr 2022 21:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1659415D2;
	Thu, 21 Apr 2022 21:04:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FCED1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF0534114A
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcUWH9uiPOIs for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B3254114F
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4B7E840FF; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e0fbf4dcd4cd0cf17cfe89ebf6808fdace8f01f
X-Git-Newrev: 7d81d082aaaa105fa8ac8d06a4bc9d63cef6352c
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.D4B7E840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pybind: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d81d082aaaa105fa8ac8d06a4bc9d63cef6352c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-pybind needs C++ since its addition in commit
f42f2a63b3c5733dc56a58b18d6ba417a59d8342:

-- Check for working CXX compiler: /usr/bin/c++ - broken
CMake Error at /nvmedata/autobuild/instance-24/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/90364b752bef3f7b4b1fd9181e21030349e0e529

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pybind/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
index 604cb9ee67..6e03cc62fc 100644
--- a/package/python-pybind/Config.in
+++ b/package/python-pybind/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PYTHON_PYBIND
 	bool "python-pybind"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  PyBind is a lightweight header-only library that exposes C++
 	  types in Python and vice versa, mainly to create Python
 	  bindings of existing C++ code.
 
 	  http://pybind11.readthedocs.org/en/master
+
+comment "python-pybind needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
