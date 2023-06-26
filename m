Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28694EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B23E641590;
	Mon, 26 Jun 2023 16:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B23E641590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDBj-7EQRdWH; Mon, 26 Jun 2023 16:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E577140A6C;
	Mon, 26 Jun 2023 16:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E577140A6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 437F41BF37E
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EDE46137C
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EDE46137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEdGiUcUvzGq for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:21:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA59661324
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA59661324
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:21:06 +0000 (UTC)
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id D5A82E0007;
 Mon, 26 Jun 2023 16:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 18:20:57 +0200
Message-Id: <20230626162057.562236-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1687796465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0GIiMcCbdJBy3PQBY/xPtIUYE4lJ4rf3K+k5uTwz9Ho=;
 b=QNkkJv8jW6IdKbSopj9FeF2NHjuyTi4+0jZfmWUDBCOTJhJsbmQH6OnpfoZmjYPqBpJt4s
 6Yo26uXICqJW9/Jj4u69fsb/QELBXvBzB2QDYtCpQhq69H+C2E7WBJarSEU+eGWbqq++dh
 Hii74pUbJBO849aOBpFSvHlMAoXq5WZqR6wbBLnIB1VUkPceDm5bEVNbD5x0zVhDqRbo5s
 gcwlqqMbxK0AsAqyHVUgt6Q+6T3R4bNZToaqhAFX8NlldEMkBhDC/CL0baG+D5Ube3Go1s
 Y08+K8Ag0WhtjlBL0DIAqaZIlvx6MrnoNFrXs2qxB0g8vuFL0XwjsR85vsQLWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QNkkJv8j
Subject: [Buildroot] [PATCH] package/agentpp: fix build error due to type
 mismatch
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was supposedly fixed by commit 5f06ecf5e151 ("package/agentpp:
security bump to version 4.6.0") but has kept happening so far.

No public place for contributions, thus this patch has been sent to private
e-mail.

Fixes:
  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 ...mpx-fix-const-nonconst-type-mismatch.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch

diff --git a/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch b/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
new file mode 100644
index 000000000000..52c7ca965343
--- /dev/null
+++ b/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
@@ -0,0 +1,51 @@
+From 7e541e6dba8d4976bbb490838a09b569f38b047d Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca.ceresoli@bootlin.com>
+Date: Mon, 26 Jun 2023 17:45:00 +0200
+Subject: [PATCH] Snmpx: fix const/nonconst type mismatch
+
+Fixes build failure:
+
+  snmp_pp_ext.cpp:1176:28: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
+   1176 |     status = snmpmsg.load( pdu, community, version);
+        |                            ^~~
+
+Fixes:
+  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
+  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/
+
+Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
+[Upstream status: sent to katz.agentpp.com@magenta.de and support@agentpp.com]
+---
+ include/agent_pp/snmp_pp_ext.h | 2 +-
+ src/snmp_pp_ext.cpp            | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/agent_pp/snmp_pp_ext.h b/include/agent_pp/snmp_pp_ext.h
+index 7c5a6783ee70..d8a46060db98 100644
+--- a/include/agent_pp/snmp_pp_ext.h
++++ b/include/agent_pp/snmp_pp_ext.h
+@@ -807,7 +807,7 @@ public:
+ 	 *   SNMP_CLASS_SUCCESS on success and SNMP_CLASS_ERROR,
+ 	 *   SNMP_CLASS_TL_FAILED on failure.
+ 	 */
+-        int send (Pdux const &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
++        int send (Pdux &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
+ #endif
+ 
+ 	/**
+diff --git a/src/snmp_pp_ext.cpp b/src/snmp_pp_ext.cpp
+index 54a29ec8ea28..b61cbf056246 100644
+--- a/src/snmp_pp_ext.cpp
++++ b/src/snmp_pp_ext.cpp
+@@ -1203,7 +1203,7 @@ int Snmpx::send (Pdux &pdu, SnmpTarget* target)
+ 
+ #else  // _SNMPv3 is not defined
+ 
+-int Snmpx::send (Pdux  const &pdu,
++int Snmpx::send (Pdux  &pdu,
+ 		 UdpAddress  const &udp_address,
+ 		 snmp_version version,
+ 		 OctetStr  const &community)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
