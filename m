Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D57D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 18:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 189DF81F67;
	Thu, 22 Jan 2026 18:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5cM9RqPA0UG; Thu, 22 Jan 2026 18:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C273781EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769106442;
	bh=dhL98vzBRCl3tmW5VdzABkj+K5johwE1sv9NgeoSKUY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HfbrIDLBDjoI68gwtuxpYhDi5D8eXCMnz1RUqKr/9GpOT08CULnNAh8ZSy+N/hyK+
	 mEOc5rcG+DHlN65kNnkab52aVlKRjWr0OjtiB2+jxid3xKG2MMASkU6MY96Mt5BzUH
	 0T/ORljzIcPq92GB6i+7xbmqm1kM6Q/Le3/uWN0UGg1OxcOMAzm8GpbeWEJOjmBYni
	 KjUXu0kcmBwhhb7SiszyEuG2uFcEsdAtN+qk0EmfYphL77pYPVZ5+aHibzLIqnpuHu
	 8GYWvSJiiWPf/GcQCvw+07wgEF9ozJgvfp5D1llEp4chwSGjTT4eNPb1wtLbRF2R8i
	 mHc6tOCOUVDCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C273781EC1;
	Thu, 22 Jan 2026 18:27:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6CD3158
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6CA360598
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlxLN1611d97 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 18:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED149600B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED149600B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED149600B8
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:27:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DEFFA4C4626;
 Thu, 22 Jan 2026 19:27:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45850)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vizOj-000000000pG-1Fjf;
 Thu, 22 Jan 2026 18:27:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 22 Jan 2026 19:27:13 +0100
Message-ID: <20260122182713.998581-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769106435;
 bh=TTLXNfPAlK7q4YNZT4hhhQ6i/ktXWOxhtS6fJJa4WFg=;
 h=From:To:Cc:Subject:Date:From;
 b=Ad//O/7vJQHZRVS8Xqni99JGNrQzWMeDNVSKNhvYfpqkHgNAq07iQPpCIo/1mdKaC
 cSPR8IKp6Z/gr5oHg57s3dyJ2fp+0LISDUY0oRKcLYNBXF9yrO4jOONp+8Sxdy15lv
 MT5gaDSpRGiG8G7NacWelTq4g6VHZ+nje1ypheskxGtZlPtOw2h2FohkB37lWQFtba
 fW3V4E/VW/maAFCyn5PT9MItvWMfyZU7eLx3jt68GW5fEVE8A/F4gnq9ZViwZEH73p
 ns6MVydHOHsKC603HLNF9b4cMfrxC9KjP3d4TRGnYJBvjkSUfJHbTxgjAvCDOTUmUp
 zq2OLxeUnJW1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Ad//O/7v
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: drbdmon needs sync_1
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

Buildroot commit 99585db1e896d7a75e204335af86f0725a30d357 bumped the
package from version 9.21.4 to 9.33.0.

Upstream added std::atomic to drbdmon with commit
https://github.com/LINBIT/drbd-utils/commit/3baf945732fc144043822b50a2a03daad0994d44
to version 9.25.0 causing build errors:

/home/autobuild/autobuild/instance-2/output-1/per-package/drbd-utils/host/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/14.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 MessageLogNotification.o: in function `MessageLogNotification::query_log_changed()':
 (.text+0xe8): undefined reference to `__atomic_exchange_1'

Fixes:
https://autobuild.buildroot.net/results/741/741606000c26bc994f243b0b865d26ff25592caa/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/drbd-utils/drbd-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 657f9fafd8..82baba975d 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -20,7 +20,7 @@ else
 DRBD_UTILS_CONF_OPTS += --with-initscripttype=sysv
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_HAS_SYNC_1),yy)
 DRBD_UTILS_CONF_OPTS += --with-drbdmon
 else
 DRBD_UTILS_CONF_OPTS += --without-drbdmon
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
