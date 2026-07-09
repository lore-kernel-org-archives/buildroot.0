Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A2EC43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 14:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0741640E65;
	Thu,  9 Jul 2026 14:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01D6ZedXu_UZ; Thu,  9 Jul 2026 14:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 827AB410C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783605734;
	bh=wgKTigReG5fd9MxV96gPqRr6PH6b/DJAWzkXBG0zS7E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QU3bumxl63V8eutus5pbaVkg9FWoK2KlIUSdNQUpLkzYP5gDOuT4rpMQXfhTHdIos
	 QuhO8UrGv9MtTdORaB/IGE63pUdOOnqjtQEp1J5yIpPZnX6OfxeF1k0VrazMGfaJex
	 6zc0yPLVqUrj2ajMXzrXkSgtztvUkb0Gs4vnZ19Zo+SSeSePcNy9M8uZWM1ASyGdSD
	 b7rJgcplNXCrdhfOqtjMkx/YCZ0YZWv82qKb7UDTDuYnecCtB9mIJS46dybSq5PTde
	 rJzD2GZFGt51JQmTgC/FxjH32qSlSaeTJ7KHvEHirgeY47DtIgzQ+AdZzD95b9xPCo
	 v0bxugO7A2jbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 827AB410C1;
	Thu,  9 Jul 2026 14:02:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA1FD320
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 14:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBFD6410C1
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 14:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DVwfqceuKKQ for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 14:02:12 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A41740E65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A41740E65
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A41740E65
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 14:02:08 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 48A8FBDE830B;
 Thu, 09 Jul 2026 16:02:04 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Thu,  9 Jul 2026 16:01:42 +0200
Message-ID: <20260709140143.449145-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783605724; bh=2X2mHpY+rWqojpYvDmTUYzjqf04p6PMJLeLHmDu3pOo=;
 h=From:To:Cc:Subject:Date;
 b=oKoaWhA4/TN3qN9C2UuGmbJWRNMOZF89ghE19nKgfOLPUWx7+YHUvfJkEZ/Q0RZIh
 OggfHC0+ILtYAjFMBEMTMRSHfPrmJPgBzeRn1iNPhX4Ib/DA/Xq15HeozyXaldPeo4
 9b8pu0kmRqWICth0x5Eeaymm9fLAesT01HoWfrTA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=oKoaWhA4
Subject: [Buildroot] [PATCH 1/1] package/mpd fix build failure with fmt
 12.2.0
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

Building mpd with fmt 12.2.0 fails with:

../src/net/ToString.cxx: In function 'std::string ToString(SocketAddress)':
../src/net/ToString.cxx:80:37: error: 'format' is not a member of 'fmt'
   80 |                         return fmt::format("[{}]:{}", host, serv);
      |                                     ^~~~~~
../src/net/ToString.cxx:84:29: error: 'format' is not a member of 'fmt'
   84 |                 return fmt::format("{}:{}", host, serv);
      |                             ^~~~~~

Root cause is an API change in fmt:

Made the <fmt/core.h> header equivalent to <fmt/base.h> by default. Code
that relied on <fmt/core.h> pulling in <fmt/format.h> must now either
include <fmt/format.h> directly or define FMT_DEPRECATED_HEAVY_CORE to
opt back in. (https://github.com/fmtlib/fmt/releases#release-12.2.0)

Implement the mentioned workaround until mpd adopts the new architecture.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 2014488520..feaf3d4e84 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -27,6 +27,9 @@ MPD_CONF_OPTS = \
 	-Dsidplay=disabled \
 	-Dsnapcast=false
 
+# remove this once mpd has moved the minimum fmt version to 12.2.0
+MPD_CXXFLAGS = $(TARGET_CFLAGS) -DFMT_DEPRECATED_HEAVY_CORE=1
+
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 MPD_DEPENDENCIES += expat
 MPD_CONF_OPTS += -Dexpat=enabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
