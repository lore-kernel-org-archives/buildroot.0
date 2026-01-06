Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F30CE9D46
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D68480C75;
	Tue,  6 Jan 2026 15:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOKiEJK7pXms; Tue,  6 Jan 2026 15:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6869580BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767712299;
	bh=Y6K/Rmegdh9E23aMEBfDhw0m1h3ajzekcYsH+8fa+QA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=afjLrgzp0ADsLLlRmOLAI5YP1sqv62qYgJulDoFaWfctbimV8hzGR7dCypMoCSV26
	 hGaROq08Oia/5aQzZPaKVdSeHqleUJm53IRNl/LUc/4CxVL9pgZN+VG4HWt3QO4fw3
	 xeDqxnVlLOEileRie4TOrtA6GUznSTR+wiIaG64Wj/6b1m60Wp7UX7fhqSMU+ad0x4
	 R8UaOk1ImHfzqOXcUtTv3GusHZ4IF0jNJOZw8vu82+A9KWTN2WKdHT3ZPHdd/lFu1F
	 YWLC0JBFwbebT3P+guzaYFOoTTrB96mz6SotpC46ne+7PDOIA62YJY9dCe/Lid7kYy
	 jIb/t0rowtrIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6869580BFF;
	Tue,  6 Jan 2026 15:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E25BDE7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C937580B9E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5OrF4H0aYDD for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFD3880A5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD3880A5E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFD3880A5E
 for <buildroot@busybox.net>; Tue,  6 Jan 2026 15:11:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so11371015e9.1
 for <buildroot@busybox.net>; Tue, 06 Jan 2026 07:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767712295; x=1768317095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dNFMKttjUdvlUX0MogIZFt2UfA5YE06J3GYij5m690=;
 b=X5Emodau7nx5mMGNjUGVcxDOh5YSZ79XcPwIp/EqPFyrOmT7i+ahS/1c7PxlGi1Dgj
 jQNaXwtDp4Q2n6TiUouQ+BeEiS9raCtsHowKtnmFasqLWlTyUca1OCURgLezYEira7Qe
 bUXtuOpY2iQx4bW/E5x3HNPjBFnFhZptHCgCd5kh5WNQp8N6DZ5h5an6vXOqex8U6O5J
 1xWZSfYcGKxuYhZvyrUjZSIM4QCnEf+xW0L52wX5s7XWqlJH/D8Nt9yrisfISJPM0+jO
 yYgvsfg1U3qvgxwV1LtIS3QTboWYPTfl+OgHdTV3YCFVRIOwmhrzzUHO0Ixe2J6sIEge
 DT1g==
X-Gm-Message-State: AOJu0YwNITg6LlygMKnNABZERj7mUdkjbaUHAA47rbHqhYJ7HglHZJZU
 RIjVKYTguIdBGdPVnhyORHvFURSsYDnYRVtn1P8I1h/F62fJhJ3lTJooodt6k5oUiCubrJYtc8n
 qughv3A==
X-Gm-Gg: AY/fxX5T3sJjLVgJ995LsQxZNmq9aC3sztGoNsRvpzw4xiBlhIPflNmo6ir6FtAeHPn
 G/MQ64SP9WaomZPcUPCRr8tO+wmNj6QS3lsP++uU/vm+SVv7TEvmZR9tT+AMicCyZXRWJH9p7vI
 xj0YJgrACd3Azfcy1r/iSXUeaOG/VFY7Imr/zgWbpMtry5sY/kbGgK/QJDS/pDr9cZlletMD2ia
 3BuzNaMhX7cyjbcb5dhG1BeKOBeXQMTL9VoerbcTMxsxu6JYx1OOMNwTe8mTADMqzeHDrUwxWBP
 ET2u6Nt+KPiXcxdNLaojxmfAGu56t6r28zelVBXgFy6jhTu3kKhRoraMwiij6gI9vKJOF2wM3L/
 ph+htylvwBeGoQTml+tcvum0+BsHRgI31rUqomSWdjDZLFgVJZY614fbXlnX/n9gaaoGI5wJFXA
 m+WS8diQlI01/roM/rckXon80XW8riTWA5igL1xvCThTl/7A==
X-Google-Smtp-Source: AGHT+IHcOvc9AyEzCS+8aq5yq/oR5aeQeQD4ZBSfHvnYbjTaKqAiNMAKUZB1+9woL/Mtm37xgFjPpA==
X-Received: by 2002:a05:600c:154e:b0:477:9cdb:e32e with SMTP id
 5b1f17b1804b1-47d7f0732c1mr37570725e9.9.1767712294521; 
 Tue, 06 Jan 2026 07:11:34 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653c61sm46976755e9.10.2026.01.06.07.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 07:11:33 -0800 (PST)
To: buildroot@busybox.net
Date: Tue,  6 Jan 2026 16:11:25 +0100
Message-ID: <20260106151125.335294-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767712295; x=1768317095; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dNFMKttjUdvlUX0MogIZFt2UfA5YE06J3GYij5m690=;
 b=XUHN9euFGhnZtxcTrmat8SML1SrnEpvupXbmPBpjl6rZoLZt+RPAZYOhRn57nz/JG1
 rplXZL5i81bI/6gMoxaGo/m4UC8lM8GRhPLkoaDwiUbAu9bhJEBBDEvqBSks3zGdQEo/
 EPmvdz9fcBGN090SNBC4A15j7fZfPxiQhyqX/6jsv+rjirfDGja/q1ZZAW8fi0bfgbOT
 3BbBqIWiAgdn1FakSOJF770jGZFhLIKAReQ0Xbn6irRsb1pzgMki/JrliNgQCrBbV/P0
 7oDB+UUKdhfyzv4dibKE7Afq+ZbZrUrD4YluijqvngKhuAJj0DiuQgsjoYRiLyf8lBjd
 ECdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=XUHN9euF
Subject: [Buildroot] [PATCH] DEVELOPERS: Drop support for some packages from
 Francois Perrad
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c9eb94f5..a4b205231 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1153,33 +1153,25 @@ F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
 N:	Francois Perrad <francois.perrad@gadz.org>
-F:	board/freescale/ls1028ardb/
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
-F:	configs/ls1028ardb_defconfig
 F:	configs/olimex_a20_olinuxino_*
 F:	configs/olimex_imx233_olinuxino_defconfig
 F:	configs/olimex_stmp157_olinuxino_lime_defconfig
 F:	package/4th/
 F:	package/cgilua/
-F:	package/chipmunk/
-F:	package/cog/
 F:	package/collectl/
 F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
-F:	package/graphene/
 F:	package/janet/
-F:	package/libgtk4/
 F:	package/libtomcrypt/
 F:	package/libtommath/
-F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lua-inotify/
-F:	package/lmdb/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
@@ -1188,16 +1180,11 @@ F:	package/lua*
 F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
-F:	package/mstpd/
-F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
-F:	package/tekui/
-F:	package/wpebackend-fdo/
-F:	package/wpewebkit/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
