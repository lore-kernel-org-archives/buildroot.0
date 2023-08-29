Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D51CC6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 17:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43F88414C8;
	Tue, 29 Aug 2023 17:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43F88414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30nYIga9nr8p; Tue, 29 Aug 2023 17:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 626D5414FE;
	Tue, 29 Aug 2023 17:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 626D5414FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5571BF97E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 684BE610A6
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684BE610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbbP6ouaNj4c for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 17:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B321E610EF
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 17:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B321E610EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A02A286467; Tue, 29 Aug 2023 17:02:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 18:44:51 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 38de1018253a2de85653659430d3dee509d68fa2
X-Git-Newrev: 73adf9831be13a94d0fb14d9d9e9a9de86a17fde
X-Patchwork-Hint: ignore
Message-Id: <20230829170204.A02A286467@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/yaml-cpp: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=73adf9831be13a94d0fb14d9d9e9a9de86a17fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
