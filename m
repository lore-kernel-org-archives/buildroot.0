Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B587C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D75BF40256;
	Tue,  3 May 2022 19:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klgbMmY-SNhs; Tue,  3 May 2022 19:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3132401C5;
	Tue,  3 May 2022 19:14:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3F4E1BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2F6682F77
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIlt-36r4hht for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:14:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F29F382F49
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:14:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B721885089; Tue,  3 May 2022 19:03:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 21:14:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df0a0ae9d98ed477b7f9b827b3747397d35eda03
X-Git-Newrev: b5b28c942b367531527cae48ccadf639e33c0e85
X-Patchwork-Hint: ignore
Message-Id: <20220503190350.B721885089@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysdig: fix DRIVER_NAME definition
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5b28c942b367531527cae48ccadf639e33c0e85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When I wrote the previous commit, I was not fully focused and wrote:
-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME.)
Which leaded to DRIVER_NAME to be empty.
So, it was not possible to use sysdig due to the following error message:
error opening device /dev/0. Make sure you have root credentials and that the  module is loaded.

Fixes: ea86757e51cf ("package/sysdig: bump to 0.29.1")
Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysdig/sysdig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 76cabcaeca..318746d44a 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -28,7 +28,7 @@ SYSDIG_DEPENDENCIES = \
 SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
 	-DBUILD_DRIVER=OFF \
 	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
-	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME.) \
+	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
 	-DENABLE_DKMS=OFF \
 	-DUSE_BUNDLED_DEPS=OFF \
 	-DWITH_CHISEL=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
