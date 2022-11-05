Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914BFC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 10:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 259C94046A;
	Sat,  5 Nov 2022 10:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 259C94046A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzSKeLXQV8e5; Sat,  5 Nov 2022 10:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 373684038B;
	Sat,  5 Nov 2022 10:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 373684038B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB81A1BF4E6
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C557F60AEC
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C557F60AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcFL5K9sQFMu for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 10:03:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A2DA60AC2
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 10:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2DA60AC2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB2FB867D8; Sat,  5 Nov 2022 10:03:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 11:00:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e72e109964bc1c70a0bad6243cef09baeaf645b4
X-Git-Newrev: 06bb421e6bb9bd30352f3b1b6bd91d1eb640d927
X-Patchwork-Hint: ignore
Message-Id: <20221105100354.EB2FB867D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nodejs: bypass
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

commit: https://git.buildroot.net/buildroot/commit/?id=06bb421e6bb9bd30352f3b1b6bd91d1eb640d927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 5bee082f14..06e29d0255 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -86,7 +86,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 ./configure \
+		$(HOST_DIR)/bin/python3 configure.py \
 		--prefix=$(HOST_DIR) \
 		--without-dtrace \
 		--without-etw \
@@ -209,7 +209,7 @@ define NODEJS_CONFIGURE_CMDS
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
