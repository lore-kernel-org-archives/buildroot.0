Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C8EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 22:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0D560B73;
	Wed, 19 Oct 2022 22:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0D560B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QJMD4OPWVL4; Wed, 19 Oct 2022 22:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 891CB60B51;
	Wed, 19 Oct 2022 22:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891CB60B51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 013891BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBDEC4016F
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBDEC4016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a63TgwzdrqR2 for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 22:01:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D4C4013E
Received: from mail.h6t.eu (cloud.h6t.eu [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96D4C4013E
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 22:01:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8DFC2147B1; Thu, 20 Oct 2022 00:01:08 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 00:00:17 +0200
Message-Id: <20221019220019.8418-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666216869; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=snnhWiw+BHK6WS7IpnhunQgyHCWLQNlLedutF5yfKNU=;
 b=A0CkpVMWT6Zyezi7t+u5qy+qHuIirS82cE51l12HUfQ2DKryfospay24kdySAb/0HkhGbS
 mkDGf39aMUMsqAWu5bjCx6dWWOQlaouJ8PJ7wgPCWVybfgj7NXHOvOkf/yf7Lya6dtfo7r
 BjsSKMQA47amr8sjV7uyfLY6hEYjlGap9B7uXY/AFgdf9PmPimeRrR2TN81OXTQAKnmPBC
 hgaHp+CpRlcRs7Rod3KuQmErgY5jfD0rHHi9bA9ZgxEHJNFErtUSu9I+L4OkaJsqOO38tI
 l7qeTRzeTsouZNdLZyWkkNzMeFa1jUHwA97yRkjgfKepPI5UcbOKaZD/mEOCYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=A0CkpVMW
Subject: [Buildroot] [PATCH 0/2] Improve handling of debug builds in cargo
 packages
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: moritz@h6t.eu
Cc: Moritz Bitsch <moritz@h6t.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Moritz Bitsch <moritz@h6t.eu>

Cargo supports two build modes: debug and release, where debug is the
default.

In debug build mode most optimizations are disabled, resulting in slow
runtime.

It is also possible to instruct rustc to generate debug symbols
independent of build mode, using RUSTFLAGS.

Moritz Bitsch (2):
  package/pkg-cargo.mk: fix handling of runtime debug builds
  package/pkg-cargo.mk: generate debug symbols when BR2_ENABLE_DEBUG is
    set

 package/pkg-cargo.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
