Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1FDCA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1EF360E04;
	Mon,  1 Sep 2025 08:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTTEL3NnqDXh; Mon,  1 Sep 2025 08:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D016D60DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D016D60DBF;
	Mon,  1 Sep 2025 08:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57D92169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E54960DBF
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKhtQKV0IIva for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EDB460C20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EDB460C20
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EDB460C20
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:48:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1846247524; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Sep 2025 08:48:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1ut0DD-001Zox-0U;
 Mon, 01 Sep 2025 10:48:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 10:48:24 +0200
Message-Id: <20250901084824.376006-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AdBne9gHGqeJaPOnuVRi2pI2S2sQxEQUZv/dEg1iBU5cL97qJinhpL05Bivi8l1nXYjeSAFnE3ILIvO8FAKbTep3m+yqvc8/mR0BR8JmtrpmNxonIeZcoBm65Mtx0mEo/RokYy1Nhj3EI/N2/Q7/JaBfeZq0Cf8wxxdpq3vURMMlwwuRoSm72FTJXM9ZcJozzXbAIiHX1Dntb0+2kVqxTcg3iGKG8OKGcmSnipE5blgwIDMyEsXjwLObXMZr73Cn+ioT9ctcUpSn6Ot36HEYWnkRdApZVXfrcefchdmKnKn6Xe+ILFAAT+fF+Udt74N3II+yw2pY7VtA1NIpHTKW5Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=QEpkzHzKvdcGamvpo5wUG+xcNv2ZDsMQsqKt4ZuLDIM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=AdBne9gH
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/wipe: autoreconf to fix configure with
 >= gcc-15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes https://autobuild.buildroot.net/results/9d4e2f156d76e2acc83e3a25adb5e5cf0705e7c6/

configure:781: checking whether the C compiler (/home/buildroot/instance-0/output-1/host/bin/armeb-buildroot-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0 -D_FORTIFY_SOURCE=1 ) works
configure:797: /home/buildroot/instance-0/output-1/host/bin/armeb-buildroot-linux-gnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  1>&5
configure:794:1: error: return type defaults to 'int' [-Wimplicit-int]
  794 | main(){return(0);}
      | ^~~~
configure: failed program was:

 #line 792 "configure"
 #include "confdefs.h"

 main(){return(0);}

Wipe uses a very old configure script where the compile checks are missing
the return type on main(), breaking the configure step with >= gcc-15.

As a workaround, use AUTORECONF to regenerate the configure script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wipe/wipe.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 83a8c87587..f6134ba55b 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -9,6 +9,8 @@ WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
 WIPE_LICENSE = GPL-2.0+
 WIPE_LICENSE_FILES = LICENSE
+# configure script not compatible with >= gcc-15
+WIPE_AUTORECONF = YES
 
 define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
