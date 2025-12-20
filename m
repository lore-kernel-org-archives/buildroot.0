Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A051BE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EE660E47;
	Sat, 20 Dec 2025 21:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PysQkTAgUO2I; Sat, 20 Dec 2025 21:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3C560E46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266952;
	bh=R87UTBowpoukx/pSh1SboPxdUsgQeYrzK7RhIMqR5tI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jRkRO08P/WHCfg0jLvSvDSZ/BQCinNasWAimXqH+XuEKshMKLkQ0/xwSo2hUvz3vZ
	 K2Wmoh4qjNJJsXJ/5Nl+lugb8r6t8dmleLG6zq6zY2CApoxpx8IBjjV2l7Q3YS0GB2
	 JOsFQ/Dpe/2YRMronP88rzET9iMaXF19xz7N9Ikqyjrc3ycNVxFGEsoT9TmfkTYA9e
	 hUbfatnvTmnCmJpib6DGKbYAvR+IspzQSqZLJEx4Q/lyFGjuFKfKHgxLmJh74iWVI1
	 cRk26fgV0YN1UFV63Yj4jRSXV0pGBXVIym/L8F1inhylM647QKeK/S3LYaBkE2ytuJ
	 M3KQ/KoGKUNpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3C560E46;
	Sat, 20 Dec 2025 21:42:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B133119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D57C406DA
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-4ZwITRVFNu for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:42:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 755CD405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755CD405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 755CD405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51ADEA4C4DB7;
 Sat, 20 Dec 2025 22:39:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-2ZIm;
 Sat, 20 Dec 2025 21:39:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:45 +0100
Message-ID: <20251220213946.1088820-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266797;
 bh=2iiwy40VfUWiDmv6RtLRaCk/qljdPW7vzCxr6FLCLmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BFiK7FIfQyYidDHp9S9TPbN7xZTVNPLb7tegrQXMOwTtetcTAjxn12cTZ3wzFQn0u
 Jl8/5zNCxKLFnhLPldy35BwJAg/6L7dNQxkHgtRyS3HGDQjdRqT5eNU+GFj7N53ryS
 o87r4dCPVrtl3k31CZiik5aSibBR+acN1w+I9rqG+Ue3G5RgD+A2WSBrE8J8x767fC
 9Qtc3vDSoEuuXRk6IappxUK84fJvD/N4fm7k0iSCpkL8ms35sOi5ULvjRoPdFsp75L
 uWps+dywinv0bfJy9UFA+wE+PdDJaQSoa3dXkm0rfBj1gzworDq4DpGhWhvPzD8fkz
 CbpVxxmszaxyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BFiK7FIf
Subject: [Buildroot] [PATCH 14/15] package/python-minimalmodbus: add md5 hash
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-minimalmodbus/python-minimalmodbus.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
index 635090fae7..ee688e49d3 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.hash
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/project/minimalmodbus
+# md5, sha256 from https://pypi.org/pypi/minimalmodbus/json
+md5  a981b31df61c7dd9fa04d0def72f8486  minimalmodbus-2.1.1.tar.gz
 sha256  c3f5a56e107d537e4bb420f7e735841ab2939c8ca6fb528f5fe4124571315b64  minimalmodbus-2.1.1.tar.gz
-# Hash for license file
+# Locally computed sha256 checksums
 sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
