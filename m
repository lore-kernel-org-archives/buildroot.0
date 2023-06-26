Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8D2EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB87408C2;
	Mon, 26 Jun 2023 16:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB87408C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMJ29j0lYZiC; Mon, 26 Jun 2023 16:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7AD741909;
	Mon, 26 Jun 2023 16:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7AD741909
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D82521BF37E
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE57782214
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE57782214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMyQ4gHDLYtx for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:12:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39A09821A4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39A09821A4
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:12:22 +0000 (UTC)
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E12E1E0004;
 Mon, 26 Jun 2023 16:12:19 +0000 (UTC)
Date: Mon, 26 Jun 2023 18:12:18 +0200
To: katz.agentpp.com@magenta.de, support@agentpp.com
Message-ID: <20230626181218.7676f022@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/meQXZhCehgb5DrDx8dWg/wP"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1687795940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=BMphv92QGI0hLywQJRF0K7QzrcdgzhSlkItHZHYo804=;
 b=WRLES4L/ejWKprpwXYBNAOzH5JtmL/1/ZF+4SVj2ejakBsVlQu/aICwDFYHimz1bt/p4S+
 6iIJCc7DcS678e6LdpiRqqIbIpRMesnhjvQBB9D/KlZ3xwWrTSAgzb+dBl1OZLKziKBx6K
 gYHVhWVJNgGKcTAN8AR0Qv1DWoSgCx9rldilteRFJPN9lgBjpM72YR0owBBjhz4MqbF+wk
 7TJcCZXUguRou/f35ZeQN4ing2Ol3nGGtSwNsI5YLWDUOo0/i/541Re7EJ5NLsM6Zzeyfm
 uGf01MUTU4uG0GScMf2/q7ADGDG1MhQuRrpygeqItoBpxgEI9IBNjyXKE5iT0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WRLES4L/
Subject: [Buildroot] Agent++ 4.6.0: const/nonconst type mismatch build
 failure
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--MP_/meQXZhCehgb5DrDx8dWg/wP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello AGENT++ developers,

the automatic testing infrastructure of the Buildroot embedded Linux
build system is reporting a build failure in AGENT++:

snmp_pp_ext.cpp:1217:26: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
 1217 |   status = snmpmsg.load( pdu, community, version);
      |                          ^~~

This is due to a mismatch between the SNMP++ APIs and AGENT++.

This failure is happening since several months and was happening also
with version 4.5.4.

Here you can find info, including logs, about some of the failed builds:

  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/
  http://autobuild.buildroot.net/results/d7347b8b3953596b66da6ca6d85f084fb427934c/

I have prepared a patch against AGENT++ 4.6.0 that fixes the problem
according to my tests, please find it attached.

It would be great to have this fixed in the next mainline release of
AGENT++!

Best regards,
Luca Ceresoli

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--MP_/meQXZhCehgb5DrDx8dWg/wP
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-Snmpx-fix-const-nonconst-type-mismatch.patch

From 7e541e6dba8d4976bbb490838a09b569f38b047d Mon Sep 17 00:00:00 2001
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 26 Jun 2023 17:45:00 +0200
Subject: [PATCH] Snmpx: fix const/nonconst type mismatch

Fixes build failure:

  snmp_pp_ext.cpp:1176:28: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
   1176 |     status = snmpmsg.load( pdu, community, version);
        |                            ^~~

Fixes:
  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/agent_pp/snmp_pp_ext.h | 2 +-
 src/snmp_pp_ext.cpp            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/agent_pp/snmp_pp_ext.h b/include/agent_pp/snmp_pp_ext.h
index 7c5a6783ee70..d8a46060db98 100644
--- a/include/agent_pp/snmp_pp_ext.h
+++ b/include/agent_pp/snmp_pp_ext.h
@@ -807,7 +807,7 @@ public:
 	 *   SNMP_CLASS_SUCCESS on success and SNMP_CLASS_ERROR,
 	 *   SNMP_CLASS_TL_FAILED on failure.
 	 */
-        int send (Pdux const &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
+        int send (Pdux &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
 #endif
 
 	/**
diff --git a/src/snmp_pp_ext.cpp b/src/snmp_pp_ext.cpp
index 54a29ec8ea28..b61cbf056246 100644
--- a/src/snmp_pp_ext.cpp
+++ b/src/snmp_pp_ext.cpp
@@ -1203,7 +1203,7 @@ int Snmpx::send (Pdux &pdu, SnmpTarget* target)
 
 #else  // _SNMPv3 is not defined
 
-int Snmpx::send (Pdux  const &pdu,
+int Snmpx::send (Pdux  &pdu,
 		 UdpAddress  const &udp_address,
 		 snmp_version version,
 		 OctetStr  const &community)
-- 
2.34.1


--MP_/meQXZhCehgb5DrDx8dWg/wP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--MP_/meQXZhCehgb5DrDx8dWg/wP--
