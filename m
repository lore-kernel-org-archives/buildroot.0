Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E6C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6003E40179;
	Tue, 30 Apr 2024 20:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP5VtTHhR5qy; Tue, 30 Apr 2024 20:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179054028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179054028D;
	Tue, 30 Apr 2024 20:34:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F41F1BF3E1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3797760A50
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jdzn03luIyw for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4B216086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B216086C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4B216086C
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:34:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41bca450fa3so28438145e9.2
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 13:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714509249; x=1715114049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=avqqWwdfc/pv7yUXksYActVPmkxfUh5MYDzY4bC9nWo=;
 b=NfJ3O47yBKcc9jv3uIwbKyCBE+QS6Sx+uHl478w5se2W2q5JJwDsxDDDZMg37UfWCW
 rK6yqdf6UvSSqZQL7xU7EbQPl3ZXXKzJ+sVYqIqsKC7uXeQ8Hl1iLBtJxk1cAzF+U0dp
 g6Duyo51QtlWyJgq1PpSXEJgwTj3KX5Sfr/b/eOkBrZ50kXo4lIIjb7csRr4eBbljpSv
 hsC02ju+SR7WydUqWXvlqCRVvpDb2M2oJnJKCV7mHJgjA5PVEWPJ/BOife6g3BUhyPI8
 JCfAV6UgzGlv3IxhDUIKA+BOP42puDqSsG7muJR0+IEPKbg0j7nM3mUpyGuoSTg54f1m
 hq+A==
X-Gm-Message-State: AOJu0YzsPXFHzKgZbBMSCCz3y16crBnIs8axb/DPfLnCUBqUswMJ/+dB
 BEnHjYfmQDn5kpRo+H9sFtxijHZqly2IcxTUOy3Bxh8sltkveUS/OaXXqEc7
X-Google-Smtp-Source: AGHT+IHAGgkE6vunHc+Wps9uG6oW9nZA6v8sU5A7+OLaaADqeZy4HJegSfW5K/wfA26oThLzqTDs1A==
X-Received: by 2002:a05:600c:1e09:b0:41a:7065:430a with SMTP id
 ay9-20020a05600c1e0900b0041a7065430amr433718wmb.41.1714509248560; 
 Tue, 30 Apr 2024 13:34:08 -0700 (PDT)
Received: from KJKCLT3928.esterline.net
 (192.234-180-91.adsl-dyn.isp.belgacom.be. [91.180.234.192])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a7bcb49000000b0041b5500e438sm20347wmj.23.2024.04.30.13.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 13:34:08 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:34:01 +0200
Message-Id: <20240430203401.74587-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714509249; x=1715114049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=avqqWwdfc/pv7yUXksYActVPmkxfUh5MYDzY4bC9nWo=;
 b=j0VRNt78FZB5tB+547Pv8REr/4Saowgkiv36vVrGIOA+HtSTv8LJaKlLk3MRqu9CAV
 0V5XkObEje/HYSPVgYv0yJAv9parPGmpZ30HUrGC7GKablkHOV3fuykZrkxYRhQXeHpL
 K8h9kJm6xPBaSs4xFvh/qJ/A2UzMkbmWqPsmqRB906W50y15S080+Pa4mIZ9rdIsQs6K
 +/nlu54Bp9A7fpBBr/wllPm18CKz4qOqYatLnGF2BtFIag24m9mNJstwehh1ZU7I3QQ7
 hWJ6ldIklWM1vRf8VBgHtxeHy1XTd4QW+ZuvaMabPcgSX2iGD958HlFptkpujonqnn02
 /RHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j0VRNt78
Subject: [Buildroot] [PATCH 1/1] package/agentpp: bump to version 4.6.1
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

This version integrates the patch to fix building without v3 so remove
that patch, there is however  another failure when linking the library,
debugprintf is used which was removed in snmp++, so patch that.
This patch has been sent to agentpp.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...mpx-fix-const-nonconst-type-mismatch.patch | 51 -------------------
 .../0001-fix-Snmpx-linking-without-v3.patch   | 37 ++++++++++++++
 package/agentpp/agentpp.hash                  |  2 +-
 package/agentpp/agentpp.mk                    |  2 +-
 5 files changed, 39 insertions(+), 54 deletions(-)
 delete mode 100644 package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
 create mode 100644 package/agentpp/0001-fix-Snmpx-linking-without-v3.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b336ce7a3..5c77b2cb8c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1188,7 +1188,6 @@ package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
 package/smstools3/0001-fix-Makefile.patch lib_patch.Upstream
 package/smstools3/0002-fix-build-with-gcc-10.x.patch lib_patch.Upstream
 package/smstools3/S50smsd Shellcheck lib_sysv.Variables
-package/snmppp/0001-fix-build-without-v3.patch lib_patch.Upstream
 package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch lib_patch.Upstream
 package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch lib_patch.Upstream
 package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch lib_patch.Upstream
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
diff --git a/package/agentpp/0001-fix-Snmpx-linking-without-v3.patch b/package/agentpp/0001-fix-Snmpx-linking-without-v3.patch
new file mode 100644
index 0000000000..9d680995e8
--- /dev/null
+++ b/package/agentpp/0001-fix-Snmpx-linking-without-v3.patch
@@ -0,0 +1,37 @@
+Trying to use the Snmpx class will give a link error on debugprintf
+When v3 is not used due to debugprintf not existing anymore in snmp++
+
+Signed-off-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>
+Upstream: sent to katz.agentpp.com@magenta.de and support@agentpp.com
+---
+diff -purN agent++-4.6.1.orig/src/snmp_pp_ext.cpp agent++-4.6.1/src/snmp_pp_ext.cpp
+--- agent++-4.6.1.orig/src/snmp_pp_ext.cpp	2023-08-10 00:05:42.000000000 +0200
++++ agent++-4.6.1/src/snmp_pp_ext.cpp	2024-04-30 14:44:03.371532441 +0200
+@@ -1035,8 +1035,11 @@ int Snmpx::receive(struct timeval *tvptr
+ 	fromaddr = addr;
+ 	fromaddr.set_port(ntohs(((sockaddr_in&)from_addr).sin_port));
+ 
+-	debugprintf(1, "++ AGENT++: data received from %s.",
+-		    fromaddr.get_printable());
++	LOG_BEGIN(loggerModuleName, DEBUG_LOG | 10);
++	LOG("++ AGENT ++: data received from ");
++	LOG(fromaddr.get_printable());
++	LOG(".");
++	LOG_END;
+ 	debughexprintf(5, receive_buffer, receive_buffer_len);
+ 
+ 	snmpmsg.load(receive_buffer, receive_buffer_len);
+@@ -1070,8 +1073,11 @@ int Snmpx::receive(struct timeval *tvptr
+ 	fromaddr = addr;
+ 	fromaddr.set_port(ntohs(((sockaddr_in6&)from_addr).sin6_port));
+ 
+-	debugprintf(1, "++ AGENT++: data received from %s.",
+-		    fromaddr.get_printable());
++	LOG_BEGIN(loggerModuleName, DEBUG_LOG | 10);
++	LOG("++ AGENT ++: data received from ");
++	LOG(fromaddr.get_printable());
++	LOG(".");
++	LOG_END;
+ 	debughexprintf(5, receive_buffer, receive_buffer_len);
+ 
+ 	snmpmsg.load(receive_buffer, receive_buffer_len);
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
