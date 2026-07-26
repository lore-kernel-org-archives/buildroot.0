Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA760C531C9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 17:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21085606B3;
	Sun, 26 Jul 2026 17:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDB7iZeA7-d6; Sun, 26 Jul 2026 17:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6689606A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785088474;
	bh=lWviW626FOGXCZe5xqnduSk2p1JVTUpJvRnn0wLBH+4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzFzNYfhEoFVLSPlFxeg/7EIpjm9Q1vpmXNWiWXtQ4L7f35aK9Guvfl1KRP5Eamhz
	 +aOmbyGmiGNBeWVmZ6GdBBcJyqRHzYzjgcaMDr2A3Y2lMyim8O3lAR+5r2C7jnTNRd
	 lA9Go4BSyA3R1QJA/XpxYcHvWQwX/DEKoDGMh5kdo/0w80nmehb2Wh9a9yDPEkXWzX
	 OvRVk5gtzon9iYKrRmBNWATElX2LILel6OT5LHcFhCvbtl+ATMlPLg3Ju/4JRUdWtl
	 LHPRzxPmNCzA5JzCb1/2HNZ22pT/oSJu3e7s8oipke40L7b/INXpIOkUOEAkTKMO98
	 /WxB2Qez5/8Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6689606A5;
	Sun, 26 Jul 2026 17:54:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AC97357
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 17:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CEB74007F
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 17:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkAD4NbWnShD for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 17:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 144F640051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 144F640051
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 144F640051
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 17:54:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0445.dip0.t-ipconnect.de [91.58.4.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8750A4C427C;
 Sun, 26 Jul 2026 19:54:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37208)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wo33J-000000004Uv-37lo;
 Sun, 26 Jul 2026 17:54:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 26 Jul 2026 19:54:17 +0200
Message-ID: <20260726175417.4001365-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726175417.4001365-1-bernd@kuhls.net>
References: <20260726175417.4001365-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785088457;
 bh=4rPRRlxB7X6C1kHuzWeHtW6SqkR+9p6yYmL7aW1CqGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=F3/gAIU7katER9Y/dlKMHb94YbV7MAy/9ZQ4R01C9gGai9yLqQk55hoBCg7meHTUw
 tMNYb6R1RB03sTbjvYfmXev045/7odlQy2mJFtfJB31LymOyM73NWKPSwzbpb2Bnos
 gjmd0qOyqTuWJhQFhBWPYeNlier47+w/CmaNRGn+Y9h6u3AsScq0w+i4SxIMRldqlG
 JZ5cu7tzPpY99Cy7Z71M/pzzFX1ZA7irgA+Sz69f+k/+SdYPgIiRxKS+g/gDy8wbu7
 9e718HAZx2Y3UFORQ9Tl2u5RNMfhwHEWIlMDHY3CYMQxlB9tW2xaE2gXsam5u7mR8u
 gt2Jtw5Zwi+IQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=F3/gAIU7
Subject: [Buildroot] [PATCH 2/2] package/jpeg-turbo: fix libm linking issue
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

Buildroot commit bb38f6f7208497cf5a4df922e833492001170111 bumped the
package to 3.2.0. This version first included upstream commit
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/ed00e0f4b39291e954958b96a8d941ca4a9e03a2
which removed the dependency to libm causing build errors detected by
the autobuilders.

Disabling the build of tests by the previous patch of this series is not
enough because the build will fail on other tools like

[ 98%] Linking C executable djpeg-static
/home/bernd/buildroot/output/per-package/jpeg-turbo/host/bin/../lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 src/spng/CMakeFiles/spng-static.dir/spng.c.o: in function
 `spng_decode_image':
spng.c:(.text+0x4c62): undefined reference to `__fpclassifyf'

so we still need to link with libm to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/981/98114d4ea7afe62bb4cef934a06bf289d863ad3f/

Bug was reported upstream:
https://github.com/libjpeg-turbo/libjpeg-turbo/issues/907

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ad732a23e5887a8894907fcf96d534d646f2a377

 package/jpeg-turbo/jpeg-turbo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 36a0260f40..82b3f03bdc 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -45,6 +45,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
 JPEG_TURBO_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-lm \
 	-DWITH_TOOLS=ON
 else
 JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
