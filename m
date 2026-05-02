Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F27CD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 17:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1160610A6;
	Sat,  2 May 2026 17:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMwQDDRPv1i6; Sat,  2 May 2026 17:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6F666109A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777741380;
	bh=oWOgePKDf55Hp0qMsGUU9mzaPmk/ubZB+uA0uly0vRI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l+Ri1uSDoM3ga6cTMIoJauiXpfozBet4SyhzI2PoCJeoQW1DmAOv+4nPF+wk9uA9A
	 Gv1T1W9sJ14HzCeluXSfF+ORFuHPt4vV10ZCdK0x2nhQ37FWmkW6VpQsmFRektP5Xx
	 IB3FtKPxLVwDkZaWw0vLfTlsBfpiBuZDX3k4SQTWsqFN0ZMjYSRNvPSM0PTbi+QAob
	 Gbo+oVvwS4AHIIZ4lDdVFlMv0h+CzKiWuAiykHCrM1ZGG+qZKQHGqE2t1MgQEKy7sp
	 c+v8eTaaupumKUW6bj8M+inay27XxH3wliBnXj/WxvhedMqI7dlm2EdCYbTKiZixH8
	 BnjI/7H9rzziw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F666109A;
	Sat,  2 May 2026 17:03:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24DAC127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 17:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2263C6109A
 for <buildroot@buildroot.org>; Sat,  2 May 2026 17:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fb7XcmaXt2U for <buildroot@buildroot.org>;
 Sat,  2 May 2026 17:02:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6346761099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6346761099
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6346761099
 for <buildroot@buildroot.org>; Sat,  2 May 2026 17:02:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94460A4C0246
 for <buildroot@buildroot.org>; Sat,  2 May 2026 19:02:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44856)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJDjx-0000000039N-2wJv
 for buildroot@buildroot.org; Sat, 02 May 2026 17:02:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  2 May 2026 19:02:53 +0200
Message-ID: <20260502170253.2852221-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777741373;
 bh=h+xgkumJ+VVjFYBbytMLvf6Hcw5PTW0yBHpo1U70sWY=;
 h=From:To:Subject:Date:From;
 b=eCq59wwsRG0I0K84GHCNH7ldEnsp8pYxmvX1th0cwECHeB0aPnO5RSH3rtphl/6cF
 N9TO2u2cYOR1naEV7wbxqd4upTrd2iDkWknwHtiSJl3JS8kpTqPLMq+88uy5bRQ1IK
 Er8pDpSbZP50tq1AtiQOabXvvD74w7Gr4VeRjr6x7wHnwy6swS0mMNX6SKSq2lGn0F
 J5mfJAxJ3hYbrmLjMxf9Dx25ek9cnzE7/j7s92JmQYuavw5A308aTwfLEo9yd8LP3m
 1Oirv48R+vMp/NKJJcVnfNieiDBtgItlS/LflADvkZVb8NqKagpTFVxCEnQ5ngZpLr
 8RTyaxMAlYRzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=eCq59wws
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: enable parallel build
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

Buildroot commit 7643670052a7adc1c2a5f275664774c6d50e6a3d disabled
parallel builds in 2012.

Upstream fixed the problem in 2021:
https://github.com/net-snmp/net-snmp/commit/855e1c28dad53d6263c6c0c302438d2dc3128cc5
https://github.com/net-snmp/net-snmp/commit/9ea3d8b93c9bb7da7fea13ee6c92356a6b82a5fb
with version 5.9.1 which was added to buildroot with commit
83b4337354014a5425a0ee081b94d4d0991f8d47.

Tested with -j100.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/netsnmp/netsnmp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 4d3367e12c..0ec4cfaa76 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -38,7 +38,6 @@ NETSNMP_CONF_OPTS = \
 	--disable-manuals
 NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
-NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 
 define NETSNMP_USERS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
