Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D3C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 11:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A35083104;
	Tue, 18 Oct 2022 11:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A35083104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUuHDKj0YHj3; Tue, 18 Oct 2022 11:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA86830C0;
	Tue, 18 Oct 2022 11:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EA86830C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C8A01BF34D
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 11:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2BC160FF3
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 11:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2BC160FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qojd5iXEfX8 for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 11:02:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D10D60AA5
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D10D60AA5
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 11:02:10 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 12:01:57 +0100
Message-Id: <20221018110157.35331-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1666090927; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=WNqY0a7A0YZ8Fap+FASveQaSmTH3OMmg4laJWFZ0QH4=;
 b=eI+kVHZCsInGwXIn06sFpFIvON0cgmWr8K3e0EBvpT5iUewmh7UL+biDmKoqT5/zmj2dR0
 ObgCtHcKKxPKo3nXh5/vF8rNmT3dQDQvl9HMx1KMStP660mIpTv4JoPihTuUew0ATWqP1k
 qB6PihTAsjh9yOuqpm0cV246YjHAOGM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=eI+kVHZC
Subject: [Buildroot] [PATCH 1/1] package/umtprd: add patch to fix output_dir
 make dependency
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Object file targets need to depend on the output_dir target.

Upstream commit:
https://github.com/viveris/uMTP-Responder/commit/d84216a678edaca81c0899318231cdcca2100d38

Fixes:
- http://autobuild.buildroot.net/results/c7ce975d398190fc191ccc03813f8ec0b3464c7d/
- http://autobuild.buildroot.net/results/0331fb9cf2748b16440ef830d09452a9812f5217/
- http://autobuild.buildroot.net/results/a1b1de9e2f764ce22f23d8a8ea88f7ddcf2969a9/
- http://autobuild.buildroot.net/results/7c7dbe03d769dc5f155fc14102f6591855605640/
- http://autobuild.buildroot.net/results/6cd90b7877520669d9ab9c9fadc9fa36912963b4/
- http://autobuild.buildroot.net/results/186689fc9637ae1a8330d7e19057cd1b3c9a841c/

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../0001-Fix-output_dir-make-dependency.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/umtprd/0001-Fix-output_dir-make-dependency.patch

diff --git a/package/umtprd/0001-Fix-output_dir-make-dependency.patch b/package/umtprd/0001-Fix-output_dir-make-dependency.patch
new file mode 100644
index 0000000000..fcbca6b000
--- /dev/null
+++ b/package/umtprd/0001-Fix-output_dir-make-dependency.patch
@@ -0,0 +1,46 @@
+From d84216a678edaca81c0899318231cdcca2100d38 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 17 Oct 2022 16:39:56 -0600
+Subject: [PATCH] Fix output_dir make dependency
+
+Object file targets need to depend on the output_dir target.
+
+Fixes:
+make --shuffle=reverse -j1
+cc -o obj/mtp_op_truncateobject.o src/mtp_operations/mtp_op_truncateobject.c -c  -I./inc -lpthread -Wall -O3
+Assembler messages:
+Fatal error: can't create obj/mtp_op_truncateobject.o: No such file or directory
+make: *** [Makefile:19: obj/mtp_op_truncateobject.o] Error 1 shuffle=reverse
+
+[paul@crapouillou.net: Backport from upstream commit d84216a]
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7c98b63..c28e186 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,15 +7,15 @@ objects := $(sources:src/%.c=obj/%.o)
+ ops_sources := $(wildcard src/mtp_operations/*.c)
+ ops_objects := $(ops_sources:src/mtp_operations/%.c=obj/%.o)
+ 
+-all: output_dir umtprd
++all: umtprd
+ 
+ umtprd: $(objects) $(ops_objects)
+ 	${CC} -o $@    $^ $(LDFLAGS) -lpthread
+ 
+-$(objects): obj/%.o: src/%.c
++$(objects): obj/%.o: src/%.c | output_dir
+ 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
+ 
+-$(ops_objects): obj/%.o: src/mtp_operations/%.c
++$(ops_objects): obj/%.o: src/mtp_operations/%.c | output_dir
+ 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
+ 
+ output_dir:
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
