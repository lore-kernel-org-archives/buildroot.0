Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD68C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 19:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59F660BEE;
	Sun, 21 Aug 2022 19:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59F660BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyJBsqn3bEi3; Sun, 21 Aug 2022 19:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16CEA60AE5;
	Sun, 21 Aug 2022 19:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16CEA60AE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A72E71BF421
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A62781A92
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A62781A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEGKD49UJTCu for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 19:01:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB185819F3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB185819F3
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 19:01:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 4FE0020004;
 Sun, 21 Aug 2022 19:01:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 21:01:52 +0200
Message-Id: <20220821190153.233016-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661108515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+I1kwHzwuSoglxbwP0Q8EhG9om7OQ95T27J48Eq3Jpk=;
 b=gUzcO7P+/nrA5MmBuiWCI1LBsuHecQzT0q3qQFsZon7mif2ELARtmgcqo1oziFZtZ8ZMsY
 sesleLB/fNgSQXffJOvyDg4x787xf2ddvaW0dkORTPt8YMMUA/HKcUBIKv6zYvlmIAn0o9
 3WOQsnxxqsh3gY5V3MXNEbxQj0YJ47poIdbD7b2AAnghMGcmUj4GzZGkJMlc5l4OUAKUys
 2yuoSHS2aloOVAE9kYMVjy/NVX2SAfAT2NzhLIqUjuQr85R1waY4gQ+AsbUEiqKffF5u1L
 MqraPnuMTOPyWiV5LlahbohsKIYg1Svv0GmqIJHgooehdMRVWseQ+Tkto6utIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gUzcO7P+
Subject: [Buildroot] [PATCH] package/Makefile.in: only error out when no C
 library is configured when building
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fda53f0791f5657d41735a40a29df3c8d0e8ae79 ("package/Makefile.in:
add detection for the lack of C library") added an $(error ...)
message when no C library is available for the currently selected
architecture.

However, this error message pops up not just when building, so for
example, the command:

  make BR2_HAVE_DOT_CONFIG=y VARS=%_LICENSE printvars

no longer works (this command is used by the pkg-stats script).

We restore a functional behavior by doing the check only when
BR_BUILDING=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ff60f85092..43d214bcbe 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -53,7 +53,7 @@ else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 LIBC = musl
 else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 LIBC = gnu
-else
+else ifeq ($(BR_BUILDING),y)
 # This happens if there is a bug in Buildroot that allows an
 # architecture configuration that isn't supported by any library.
 $(error No C library enabled, this is not possible.)
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
