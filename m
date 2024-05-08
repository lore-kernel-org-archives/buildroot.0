Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78807C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C06D6058C;
	Wed,  8 May 2024 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbvQwpUcZ9gC; Wed,  8 May 2024 16:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D6960D54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D6960D54;
	Wed,  8 May 2024 16:33:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8F471BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B59EC40108
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDVrNf7lHUJJ for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA3CD400DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA3CD400DB
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A170B86AD0; Wed,  8 May 2024 16:33:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:33:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa94135455db294bc33807a4217ad4f705c464af
X-Git-Newrev: faf371a476c3125f2d2a3f50da89d9d372dfd68e
X-Patchwork-Hint: ignore
Message-Id: <20240508163327.A170B86AD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: fix host build
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

commit: https://git.buildroot.net/buildroot/commit/?id=faf371a476c3125f2d2a3f50da89d9d372dfd68e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmake options were renamed by
https://github.com/Kistler-Group/sdbus-cpp/commit/0074c79e7fd7983dda3c2a4e4ac7febe67751a28
resulting in the following host build failure since bump to version
2.0.0 in commit 0f5bb364c629dd7fc91f4295f872e46d89c0feef:

/home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp: In member function 'virtual sdbus::PendingAsyncCall sdbus::internal::Proxy::callMethodAsync(const sdbus::MethodCall&, sdbus::async_reply_handler, uint64_t)':
/home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:125:91: sorry, unimplemented: non-trivial designated initializers not supported
                                                                       , .floating = false });
                                                                                           ^
/home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:133:60: error: class template argument deduction failed:
     auto asyncCallInfoWeakPtr = std::weak_ptr{asyncCallInfo};
                                                            ^

Fixes: 0f5bb364c629dd7fc91f4295f872e46d89c0feef
 - http://autobuild.buildroot.org/results/66668261d05203575658a243e02e78cf77018d8c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdbus-cpp/sdbus-cpp.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 675ed1fa1f..2994f079c9 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -14,10 +14,10 @@ SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
 # Host build for sdbus-c++-xml2cpp
 HOST_SDBUS_CPP_DEPENDENCIES = host-pkgconf host-systemd
 HOST_SDBUS_CPP_CONF_OPTS = \
-	-DBUILD_CODE_GEN=ON \
-	-DBUILD_DOC=OFF \
-	-DBUILD_TESTS=OFF \
-	-DBUILD_LIBSYSTEMD=OFF
+	-DSDBUSCPP_BUILD_CODEGEN=ON \
+	-DSDBUSCPP_BUILD_DOCS=OFF \
+	-DSDBUSCPP_BUILD_TESTS=OFF \
+	-DSDBUSCPP_BUILD_LIBSYSTEMD=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
