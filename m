Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A85FC83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 17:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 310C441528;
	Tue, 29 Aug 2023 17:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 310C441528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnzJqJ4dQse1; Tue, 29 Aug 2023 17:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 761374155C;
	Tue, 29 Aug 2023 17:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 761374155C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D540C1BF3EA
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF9F6113F
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF9F6113F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-Z2MmOcCIgA for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DB4761132
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DB4761132
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B5BB8649B; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 18:45:58 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6fc43d90b4c9327d838ccb1b32f8fb51a2ac83e4
X-Git-Newrev: c2019a9f186837e5613696a34f65bd8db7757acf
X-Patchwork-Hint: ignore
Message-Id: <20230829170309.6B5BB8649B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/yaml-cpp: fix
 library name
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2019a9f186837e5613696a34f65bd8db7757acf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

In the current state this package install libyaml-cppd.so due to "d"
being added because the variable CMAKE_DEBUG_POSTFIX is not set:
https://github.com/jbeder/yaml-cpp/blob/master/CMakeLists.txt#L137

This breaks the build of mongodb which expects the library name
libyaml-cpp.so:
https://github.com/mongodb/mongo/blob/master/SConstruct#L5090

Fixes:
http://autobuild.buildroot.net/results/304/3044d040dec090a2f528a96f201d4e554f6779b4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9613092610729177f060bea62708fe3d81c0536b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/yaml-cpp/yaml-cpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index d65298ffb9..367df27ff1 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -13,6 +13,7 @@ YAML_CPP_CPE_ID_VENDOR = yaml-cpp_project
 
 # Disable testing and parse tools
 YAML_CPP_CONF_OPTS += \
+	-DCMAKE_DEBUG_POSTFIX="" \
 	-DYAML_CPP_BUILD_TESTS=OFF \
 	-DYAML_CPP_BUILD_TOOLS=OFF
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
