Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EEDC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 17:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3885A80FF7;
	Sun,  5 Jul 2026 17:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63S5iunBgMt7; Sun,  5 Jul 2026 17:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 397A180FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783273280;
	bh=OKIx1dV5gOSi5zFT1tmfsk3yhqHBOWNhToqlY6R05sQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AcUT6zmvWDGUr/2VYc9bObRHUKUDOqG17tOGQcu+qSgWhC1dP7agiCaJhe4chdzqf
	 TVS3k31egWvfaMV7bEMZ6Wf2GhvoGFpagiVWbXaxuxA079+DfppCbQ4UZzTOXgkYkt
	 a2/+06PGCmzgfeQ4vSpadvCY07E0+NSXBAmVBJJduSwi9ocJJrG0fC2m79fKi8vY5n
	 rpHxgT9lfuc8hQbzXWfzfjAOFtiY0qbONZAUiYPNvGFo5R4MAsI7lZoyQLNK4deai9
	 5JEYTemAFTs00zaydvOVo8BdvkE9xQM5FvDjYdKFpuyXL27VaHa0hy+Zwk+1VpMo+g
	 KH7Xi8DntyxzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397A180FF8;
	Sun,  5 Jul 2026 17:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE74CF2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C48F480FF7
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgXRK4GoRrHz for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 17:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5AC180FF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AC180FF8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5AC180FF8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:41:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 162D7A4C172A;
 Sun,  5 Jul 2026 19:41:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60850)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgQqB-000000002qP-2zBD;
 Sun, 05 Jul 2026 17:41:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Sun,  5 Jul 2026 19:41:15 +0200
Message-ID: <20260705174115.3252273-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783273276;
 bh=7oaYyUPHwK7uNUxdr4ze1FI14PcE7P5lPrVuRHQrGIs=;
 h=From:To:Cc:Subject:Date:From;
 b=pZMQBzd7TzZBdRYgmMKbYp6TQQSf9A6fJSFOqUtBh0u7u7NmtPW+Wz4g2iMmoyLLv
 SK768UgaLsDJVbVqwLbgG/Att0EtAdJkqwuPbAzN593vE8as6xoKQd1EejGlZZKcNU
 aeuAfC/+Mtey53+AVVW6Fg5HENqXId30PUfVSIcI2pIH82V26JMA3tzF887z7d+8he
 zEYAbDZfyJVlJQ8jbOIlW/Q0oWMpNZ8YxUJcJ8UrZWLmeOd3yYrnT2n5SaFoUIYfwK
 0Y8M1/Emm/teQW4IxYvnEbNBTv1AV/JYKqq17aZMDAvcr34A+Qei7nHj8Wraqsqk9e
 E5HY7FgqLrTrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pZMQBzd7
Subject: [Buildroot] [PATCH 1/1] package/jansson: bump version to 2.15.1
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

https://github.com/akheron/jansson/blob/v2.15.1/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/46f300567e725f5d557496713ae2846013a90ebd

 package/jansson/jansson.hash | 4 ++--
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 747f9e4420..af376253d4 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
-# From https://github.com/akheron/jansson/releases/tag/v2.15.0
-sha256  a7eac7765000373165f9373eb748be039c10b2efc00be9af3467ec92357d8954  jansson-2.15.0.tar.bz2
+# From https://github.com/akheron/jansson/releases/tag/v2.15.1
+sha256  f9aa4b3ec8496fee69db94f06f3d76fd4a26b012ee9bf1e917078c2cd2841881  jansson-2.15.1.tar.bz2
 sha256  150d90904cd8de73609bb177b42edd3867b07b4b7b786dbba319f30de39fcda2  LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index e60bb1aab6..29d43c9a0c 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.15.0
+JANSSON_VERSION = 2.15.1
 JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
 JANSSON_SITE = \
 	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
