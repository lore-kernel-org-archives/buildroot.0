Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D917C001DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47BCA41862;
	Fri, 21 Jul 2023 21:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47BCA41862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffmX_rycyOCd; Fri, 21 Jul 2023 21:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7654E4017B;
	Fri, 21 Jul 2023 21:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7654E4017B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AEDF1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 039C5418A9
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039C5418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uhdXudwWCSo for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:31:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF94641870
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF94641870
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD71B7FB00; Fri, 21 Jul 2023 21:31:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:31:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c978d782d92d4623156ba7d88d375de43f7ba5b
X-Git-Newrev: 9613092610729177f060bea62708fe3d81c0536b
X-Patchwork-Hint: ignore
Message-Id: <20230721213111.DD71B7FB00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yaml-cpp: fix library name
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

commit: https://git.buildroot.net/buildroot/commit/?id=9613092610729177f060bea62708fe3d81c0536b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
