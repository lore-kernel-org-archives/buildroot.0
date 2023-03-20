Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E971DC6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 07:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D8FF8141C;
	Mon, 20 Mar 2023 07:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D8FF8141C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHZdAEw7n0hG; Mon, 20 Mar 2023 07:34:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E68D81405;
	Mon, 20 Mar 2023 07:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E68D81405
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DDD11BF37F
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 07:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E2C181405
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 07:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E2C181405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvjgwaFdWdOp for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 07:34:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0987A81350
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0987A81350
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 07:34:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id m35so6773793wms.4
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 00:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679297665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDWrsxqfxVBMxTrbuhuYDYv9OEE2D4DQKW2Pc/ub47c=;
 b=lpN3G2Gq0WfVx3T6RzgKAMmmvtSmORx6wQM671GQTo9nYCaPHaKgaCIxqrIC+2vny4
 wzXB6BRvpWfJ3Y6MV/ny3fmGgP51t5iXTbOA7o0eiOZWCl+Awv8L7jJXP2B7VH2DnfUa
 gJX7J6YUZVMO+EU2mhKZ2Ij8BW1zUcfNy+Sy+1WdeLvPb3YlPuIwC7Ec1/WceukyhOXu
 xX3NJlstolktF7dkGEGgLOqKhMcQtuO++CAyp4KeB1FPt68vAkBtBzcfJBUqOg19xzdq
 mO/GO+zlT/gArC0HfbkXV+eI2Z2N57DPLW0gsmmdV+3oC7RbGbBoSvoO4eavQR0hbEX4
 SBow==
X-Gm-Message-State: AO0yUKVttDy5hXrmsA/Ilt5DnsH+MvHOxPiw7EBIROi/tRROpXv1oxCv
 wfUWpXdZstKACmz/I6hc4UqxeCVB/2s=
X-Google-Smtp-Source: AK7set/ghH8vNA1UMe8ihZCef2mFM5U1AUoEumsuf0J5WEK0C4Oq6o0w/Vr2Anh15CT8EHhvsIL6TQ==
X-Received: by 2002:a05:600c:4452:b0:3e1:374:8b66 with SMTP id
 v18-20020a05600c445200b003e103748b66mr30731690wmn.40.1679297664743; 
 Mon, 20 Mar 2023 00:34:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b003e209b45f6bsm16064759wms.29.2023.03.20.00.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 00:34:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 08:34:19 +0100
Message-Id: <20230320073419.707352-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679297665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UDWrsxqfxVBMxTrbuhuYDYv9OEE2D4DQKW2Pc/ub47c=;
 b=Kh7sOI0PQyr+K/Wd7Yq8IJy26u9kv2yG0VtxUvjBUSwzflkujYdvmXgLuG1Ja6xNls
 Btx0kolcrqX0T0fBhUbbtUdh+CdqYpLEnDwR7K86u5lfi5w34ySruLLykO6GC8oVLO01
 Ir9+Iu6on03RMW3nYFEZm0RrxgVi71NGvU69IE06SkBZZgdy+TSYOrsyK9MyMtCTrF6m
 8v2rpimsl1lfI4N1u3HzAsLN8n+G/UX/mdw549noUyOHeko7NLtVkMUtdnxnWZPbWpwt
 D+0SbLd7WL6udKIj2OviCNvHPeC6bGnBFgxB4NVPi3iE5QDNUsNUM9MDL4B5Ns9ehbUU
 BQTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Kh7sOI0P
Subject: [Buildroot] [PATCH 1/1] package/agentpp: security bump to version
 4.6.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixed (security) [APP-70]: Memory leak in MibLeaf::set if same OID is set
  twice in the same PDU.
- Fix the following build failure raised since bump of snmppp to version
  3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:

snmp_pp_ext.cpp: In member function 'int Agentpp::Snmpx::send(const Agentpp::Pdux&, Snmp_pp::SnmpTarget*)':
snmp_pp_ext.cpp:1172:47: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
 1172 |     status = snmpmsg.loadv3(Snmp::get_mpv3(), pdu, engine_id, security_name,
      |

Fixes:
 - http://autobuild.buildroot.net/results/d7347b8b3953596b66da6ca6d85f084fb427934c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/agentpp/agentpp.hash | 2 +-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 99aae70263..527414eed5 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5f2cfe98fd1d50683e02c65fccd9423351254df427e5825e4f321c488a9234eb  agent++-4.5.4.tar.gz
+sha256  e09dc2d40277d468c18f1539ad18f43e0c3a95b10fad8a02184e9ace8bac0d67  agent++-4.6.0.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index d020228e44..0ef549426e 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.5.4
+AGENTPP_VERSION = 4.6.0
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
