Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2EFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53B9440129;
	Tue, 25 Oct 2022 20:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53B9440129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMz4dvSpgnm5; Tue, 25 Oct 2022 20:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFB0400D1;
	Tue, 25 Oct 2022 20:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFB0400D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACF871BF977
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88B0A400D1
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B0A400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUxEUQ6yIkaP for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:57:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A00814000B
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A00814000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8758D87084; Tue, 25 Oct 2022 20:57:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 22:56:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 196cbd98010ae0145cfe555fa835e761b40b23fd
X-Git-Newrev: f073cf7547e6bef74768aee1aef67f3b28bee8c0
X-Patchwork-Hint: ignore
Message-Id: <20221025205740.8758D87084@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: bypass configure shell
 wrapper
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

commit: https://git.buildroot.net/buildroot/commit/?id=f073cf7547e6bef74768aee1aef67f3b28bee8c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure file is a shell script which searches for a predefined
python binary and then calls configure.py with that.

As we already call configure with the desired python binary we should
call configure.py directly so that the expected python binary is used
and so that the shell wrapper doesn't throw spurious interpreter
validation errors.

This also avoid spurious errors due to the configure shell wrapper
missing supported python versions, for example this fixes:
Node.js configure: Found Python 3.11.0...
Please use python3.10 or python3.9 or python3.8 or python3.7 or python3.6.
	/usr/bin/python3.10 ./configure

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 05456e3443..29a10b900f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -88,7 +88,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 ./configure \
+		$(HOST_DIR)/bin/python3 configure.py \
 		--prefix=$(HOST_DIR) \
 		--without-dtrace \
 		--without-etw \
@@ -200,7 +200,7 @@ define NODEJS_CONFIGURE_CMDS
 		LDFLAGS="$(NODEJS_LDFLAGS)" \
 		LD="$(TARGET_CXX)" \
 		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 ./configure \
+		$(HOST_DIR)/bin/python3 configure.py \
 		--prefix=/usr \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
