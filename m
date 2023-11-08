Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DD2C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 16:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBBB040042;
	Wed,  8 Nov 2023 16:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBBB040042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvYoFDla1YfN; Wed,  8 Nov 2023 16:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80C684114E;
	Wed,  8 Nov 2023 16:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80C684114E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 142101BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE5F7400A4
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5F7400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cfi7YJJPIGkF for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 16:29:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5CD340042
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 16:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5CD340042
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9232C86D09; Wed,  8 Nov 2023 16:29:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 17:26:00 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d797aee1411b5687b19f50a1c6b8ece5dbe5b671
X-Git-Newrev: 7742d220c23730bfbe950d34d8ad78ecc9a04702
X-Patchwork-Hint: ignore
Message-Id: <20231108162916.9232C86D09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/azure-iot-sdk:
 fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7742d220c23730bfbe950d34d8ad78ecc9a04702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Disable provisioning client when building statically to avoid the
following build failure raised since bump to version LTS_01_2022_Ref01
in commit 06bb3640c13191f7515f2140c2207f5b7a2cb7ab and
https://github.com/Azure/azure-iot-sdk-c/commit/1de399fd4875d16eb78e8193778238b9762ed44f
which enabled provisioning client by default:

/home/buildroot/autobuild/instance-3/output-1/build/azure-iot-sdk-c-LTS_01_2023_Ref02/provisioning_client/deps/utpm/src/tpm_comm_linux.c:13:10: fatal error: dlfcn.h: No such file or directory
   13 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/894188649f66d9917e1ed94989ebe307102ab28c
 - http://autobuild.buildroot.org/results/735b96c842796f309c33a0545eeb2e8f8d1f75ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce0d4efa7660ba7155de27c8928b7711d3600890)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 42fdd56b48..fef8dcccd0 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -14,4 +14,10 @@ AZURE_IOT_SDK_C_INSTALL_STAGING = YES
 AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
 AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 
+ifeq ($(BR2_STATIC_LIBS),y)
+AZURE_IOT_SDK_C_CONF_OPTS += -Duse_prov_client=OFF
+else
+AZURE_IOT_SDK_C_CONF_OPTS += -Duse_prov_client=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
