Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C825BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 10:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4544027D;
	Sat,  5 Nov 2022 10:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A4544027D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SdFHO1kfWDqJ; Sat,  5 Nov 2022 10:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279024022A;
	Sat,  5 Nov 2022 10:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279024022A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 645C11BF330
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D3CB8137A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D3CB8137A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YinHg-nPiObS for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 10:05:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81B1D812FB
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 10:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81B1D812FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CC4E86818; Sat,  5 Nov 2022 10:05:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 11:00:22 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 645b4fb5149d5a9ef53346458c7492847e256bb7
X-Git-Newrev: abd03c74f80ca7f2f40797efd546eafb6d134eec
X-Patchwork-Hint: ignore
Message-Id: <20221105100501.6CC4E86818@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/nodejs: bypass
 configure shell wrapper
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

commit: https://git.buildroot.net/buildroot/commit/?id=abd03c74f80ca7f2f40797efd546eafb6d134eec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit f073cf7547e6bef74768aee1aef67f3b28bee8c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
