Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C165FC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955EF606A3;
	Thu,  9 May 2024 21:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XHGW9xm1Dma; Thu,  9 May 2024 21:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC4C6129E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC4C6129E;
	Thu,  9 May 2024 21:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11A241BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BB9541E05
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JT8FUsm2_oel for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DD9640491
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DD9640491
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:11:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3408B86DF1; Thu,  9 May 2024 21:11:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 23:11:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 776dc1ed504421e0a67627eeff147840ff74503d
X-Git-Newrev: 21335682a1a8a2033047ffe59012c5946a1be9bd
X-Patchwork-Hint: ignore
Message-Id: <20240509211139.3408B86DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: fix required gcc version
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

commit: https://git.buildroot.net/buildroot/commit/?id=21335682a1a8a2033047ffe59012c5946a1be9bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 2.0.0 in commit
0f5bb364c629dd7fc91f4295f872e46d89c0feef sdbus-cpp package requires
designated initializers support (C++20 feature), and fails to compile
with gcc < 8:

/home/buildroot/autobuild/run/instance-2/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp: In member function 'virtual sdbus::Slot sdbus::internal::Proxy::callMethodAsync(const sdbus::MethodCall&, sdbus::async_reply_handler, uint64_t, sdbus::return_slot_t)':
/home/buildroot/autobuild/run/instance-2/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:146:90: sorry, unimplemented: non-trivial designated initializers not supported
                                                                       , .floating = true });

Fixes: 0f5bb364c629dd7fc91f4295f872e46d89c0feef
 - http://autobuild.buildroot.net/results/1764ce0d48b390e430d2d8f54388013d3700e9d7

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdbus-cpp/Config.in      | 6 +++---
 package/sdbus-cpp/Config.in.host | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdbus-cpp/Config.in b/package/sdbus-cpp/Config.in
index 85f149eaa1..010efaafcf 100644
--- a/package/sdbus-cpp/Config.in
+++ b/package/sdbus-cpp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SDBUS_CPP
 	bool "sdbus-c++"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_SYSTEMD
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++20
 	help
 	  sdbus-c++ is a high-level C++ D-Bus library for Linux
 	  designed to provide expressive, easy-to-use API in modern C++.
@@ -11,6 +11,6 @@ config BR2_PACKAGE_SDBUS_CPP
 
 	  https://github.com/Kistler-Group/sdbus-cpp
 
-comment "sdbus-c++ needs systemd and a toolchain w/ C++, gcc >= 7"
+comment "sdbus-c++ needs systemd and a toolchain w/ C++, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_SYSTEMD || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/sdbus-cpp/Config.in.host b/package/sdbus-cpp/Config.in.host
index d62a65ae84..024a2e9a9c 100644
--- a/package/sdbus-cpp/Config.in.host
+++ b/package/sdbus-cpp/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_SDBUS_CPP
 	bool "host sdbus-c++"
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8 # C++20
 	help
 	  sdbus-c++ is a high-level C++ D-Bus library for Linux
 	  designed to provide expressive, easy-to-use API in modern C++.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
