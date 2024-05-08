Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B92BC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 06:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B172605F2;
	Wed,  8 May 2024 06:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWPlpy4bHf_P; Wed,  8 May 2024 06:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF6836060C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6836060C;
	Wed,  8 May 2024 06:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B516C1BF860
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 06:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEEA3404C4
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 06:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHbGyehDTAc7 for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 06:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BEF240436
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BEF240436
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BEF240436
 for <buildroot@buildroot.org>; Wed,  8 May 2024 06:50:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so4793505e87.0
 for <buildroot@buildroot.org>; Tue, 07 May 2024 23:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715151043; x=1715755843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eIJiDD4yJt6kQH4GO8YnyvXr3TYrsE+eA0V0ujTq8Uc=;
 b=ddOKfTzV4S28G/+whs8xhFI90viN9xW8BDMMDudaALkBuj7/0u0U7hdakjAuNUL6We
 Q5CixX7YuUJEvtEwc1yJcahf4OPa56ghqhew/SeU9o/sjNgO1rLlbek2ElrAEWePJXu8
 VDmClkKjGfEGPpv/OB0HiWI3btuAURfoNk79yZSbHlVjN5/kuqvXiZKOE1E7LXMAiu4U
 Gsp3ka+Lu8WY2WtbdTxxycdQfp7SdbHCjq+mQJNjyWTHYzjuMiUBhfN0FGqdbBPgRZEX
 Yc+ThPdb6fkzE1+zYyNQ/7uVDwQhqD5pYfP/D6FurwbOoXU5ZYm9dk9xvAUEs5FZ67gf
 aECw==
X-Gm-Message-State: AOJu0Yzf2mTZR2hxa3/mzoaOxZ5njozR6yjCior850PsPyJcW0kXmB2L
 IG5OvCPYN6NLbFOr+uALmbMKEBfRvfjqOUKKLomhM7K8C9TbOVQr0CoGjA==
X-Google-Smtp-Source: AGHT+IGE9lRO/KTHHM4gZ8LoM3rA1ZcBzj0W9qBdMQ+GXtqgqXyJfqd3Vyeo030jVv0deymJ/RxjKA==
X-Received: by 2002:a05:6512:3a95:b0:51b:43d4:2f18 with SMTP id
 2adb3069b0e04-5217cc5118bmr1304439e87.46.1715151042237; 
 Tue, 07 May 2024 23:50:42 -0700 (PDT)
Received: from KJKCLT3928.esterline.net ([144.178.111.91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87c254f1sm11401125e9.14.2024.05.07.23.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 23:50:41 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 08:50:39 +0200
Message-Id: <20240508065039.6060-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715151043; x=1715755843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eIJiDD4yJt6kQH4GO8YnyvXr3TYrsE+eA0V0ujTq8Uc=;
 b=N1w1igafXm9fzgK6hhscE8ZokDlaSsW8azDRnXHD4h7MruiJ8XlAVNdZJkKnodNTHD
 wfE96CkqhBUOT7r3Ry1WBqWdoIqoXHZG05rGlZaH1q6u+0rynvq21OB5kkJJdZ0NyN1r
 QLilmOre8fbRrvEv1A+1mlgoywHPutEM66ODfwArgsR0gNPJ8KIOZsK43ejc+9f3X8N7
 MqZUFwX+a0vm5CdSoEkYJ95+uLvfIuYLBXIT+1uGMgkiaOHajFhtcREDyTZT7WSzvGzP
 m+mXseK6j3xAkxuY1VEaX1ICbxlGymKr7cAB3F6qH6CqFefM5DH3lwU14r32+zl7jP02
 aPdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N1w1igaf
Subject: [Buildroot] [PATCH v2] package/agentpp: bump to version 4.6.1
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 4.6.1 and drop the linking without v3 patch as this
version integrates the fix for that

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
Changes from v1:
- Drop accidental change in .packageignore, this was for the snmppp
  version bump
- Drop the patch, the failure mode here is not strictly related to the
  use of debugprintf but rather that the buildroot build of snmppp
  does not define __STRICT_ANSI__ but in my application using agentpp
  I use Qt which does define this, this rippled through and causes a
  mismatch between the function definition used in the buildroot build
  and the function my application wants to use and link against

 ...mpx-fix-const-nonconst-type-mismatch.patch | 51 -------------------
 package/agentpp/agentpp.hash                  |  2 +-
 package/agentpp/agentpp.mk                    |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch

diff --git a/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch b/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
deleted file mode 100644
index 07981eff3e..0000000000
--- a/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 7e541e6dba8d4976bbb490838a09b569f38b047d Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca.ceresoli@bootlin.com>
-Date: Mon, 26 Jun 2023 17:45:00 +0200
-Subject: [PATCH] Snmpx: fix const/nonconst type mismatch
-
-Fixes build failure:
-
-  snmp_pp_ext.cpp:1176:28: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
-   1176 |     status = snmpmsg.load( pdu, community, version);
-        |                            ^~~
-
-Fixes:
-  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
-  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/
-
-Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
-Upstream: sent to katz.agentpp.com@magenta.de and support@agentpp.com
----
- include/agent_pp/snmp_pp_ext.h | 2 +-
- src/snmp_pp_ext.cpp            | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/agent_pp/snmp_pp_ext.h b/include/agent_pp/snmp_pp_ext.h
-index 7c5a6783ee70..d8a46060db98 100644
---- a/include/agent_pp/snmp_pp_ext.h
-+++ b/include/agent_pp/snmp_pp_ext.h
-@@ -807,7 +807,7 @@ public:
- 	 *   SNMP_CLASS_SUCCESS on success and SNMP_CLASS_ERROR,
- 	 *   SNMP_CLASS_TL_FAILED on failure.
- 	 */
--        int send (Pdux const &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
-+        int send (Pdux &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
- #endif
- 
- 	/**
-diff --git a/src/snmp_pp_ext.cpp b/src/snmp_pp_ext.cpp
-index 54a29ec8ea28..b61cbf056246 100644
---- a/src/snmp_pp_ext.cpp
-+++ b/src/snmp_pp_ext.cpp
-@@ -1203,7 +1203,7 @@ int Snmpx::send (Pdux &pdu, SnmpTarget* target)
- 
- #else  // _SNMPv3 is not defined
- 
--int Snmpx::send (Pdux  const &pdu,
-+int Snmpx::send (Pdux  &pdu,
- 		 UdpAddress  const &udp_address,
- 		 snmp_version version,
- 		 OctetStr  const &community)
--- 
-2.34.1
-
diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 527414eed5..7c94f4b1b0 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e09dc2d40277d468c18f1539ad18f43e0c3a95b10fad8a02184e9ace8bac0d67  agent++-4.6.0.tar.gz
+sha256  3287218cf6eaa3744b3788afd1e7d72e7a9508d45741243178404f6b47edd86f  agent++-4.6.1.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 7616d3eb0c..3756d0ca28 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.6.0
+AGENTPP_VERSION = 4.6.1
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
