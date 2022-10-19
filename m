Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09688C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 22:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DEB040470;
	Wed, 19 Oct 2022 22:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DEB040470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaF9CJ2sSiA0; Wed, 19 Oct 2022 22:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60DC840439;
	Wed, 19 Oct 2022 22:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60DC840439
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95FAD1BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1A4160AE1
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1A4160AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71El2TlmvqUC for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 22:01:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F280760B51
Received: from mail.h6t.eu (cloud.h6t.eu [167.235.55.38])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F280760B51
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 22:01:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D13542147CD; Thu, 20 Oct 2022 00:01:09 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 00:00:19 +0200
Message-Id: <20221019220019.8418-3-moritz@h6t.eu>
In-Reply-To: <20221019220019.8418-1-moritz@h6t.eu>
References: <20221019220019.8418-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666216869; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=uYlYGkuj4x8tuVGIuylriY9+NZEUdu3jzsd7zwdmUHE=;
 b=1cJnowVPDvjnw2Xaa2XQpygONDPgC0x8WvRPP3O+yfgW4D4lv4G4W1oE1x3XDwy3mrUyPQ
 mNkSN+/Ld0hwcBk/6LwvauOSRBYrMybwvIjqyKg/EZ6UpDTL9i33Fp6WfVxb+IFCP0mqcA
 zEQan2t9hNSnXMTQLjvkHWl5XjE+PSA5+EBCzk/AyrGJZ8sncIkTeRWdPyaGCR6pcuJsKK
 P1k2SPJqFYHIQRis7qIJCcCCGBkqLkRNjjAiOb8rY2yn9Sg99zX2UosCLC6n3nWjYhhv1I
 o7AmnwC6x+jNTKP+RSPwHn/52BYBqLXLNdEmzYl0ZBALMfL/7DNIQkoG+Mn+Nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=1cJnowVP
Subject: [Buildroot] [PATCH 2/2] package/pkg-cargo.mk: generate debug
 symbols when BR2_ENABLE_DEBUG is set
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

Adding -g to RUSTFLAGS enables debug symbol generation in rustc

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
---
 package/pkg-cargo.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index e0556252fa..7ce7867f67 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -51,9 +51,15 @@ PKG_CARGO_ENV = \
 # and should be removed when fixed upstream
 #
 ifeq ($(NORMALIZED_ARCH),arm)
-	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
+	PKG_CARGO_RUSTFLAGS += -Clink-arg=-Wl,--allow-multiple-definition
 endif
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+	PKG_CARGO_RUSTFLAGS += -g
+endif
+
+PKG_CARGO_ENV += RUSTFLAGS=$(subst $(space),$(comma),$(strip $(PKG_CARGO_RUSTFLAGS)))
+
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
