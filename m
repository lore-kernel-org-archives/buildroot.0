Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492BFC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5E241561;
	Tue, 30 Apr 2024 20:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAe9SR4hInVX; Tue, 30 Apr 2024 20:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60A404028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60A404028D;
	Tue, 30 Apr 2024 20:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E66D1BF3E1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560EA81FDB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mE8IPDcadBAn for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:37:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF7F981FD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7F981FD9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF7F981FD9
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:37:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34da35cd01cso727687f8f.2
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 13:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714509436; x=1715114236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=msQPvhMgeC7tcxbBtO4KP4mrbUvKk3Y229UMUbaiEfg=;
 b=OmD0ch8exLCfx8TtCN46BIrF+XsNO9wFaESr75Rj9ljX2tpWm9GVEzlSVLTOpl5WwS
 hoVpQ/kbcXmeLZcl5DPwI1J/ybZih/1W5qB2mme2+WXw4QGnscqPVyPO9srpu+Jd4xS+
 nKy4eG0fONm4HQ/Qtif3VgJVpVAxQdJzH3EnUvIxnJna7/pd8lqyo9DiYddajJvFJMua
 E1SFk3Hp/ntUtFWCbM9nHUaGdd3KIs5pzZJ+nwxnaMFyl07V5DvZ4LfKleykpAsWxaBh
 zeFoJXTlOI4ox5jNu6L2oti2hAw+DgoSpNUqMsDSyopv1VgIOnNwnUUZuThHuzESPIQ0
 HNuw==
X-Gm-Message-State: AOJu0YzhSNP755c0olSPM/fJnMX06UZBWzplrQSLujDUIPllwKvtbV6Z
 MlBJtIdW7Q1xYBOrR+PQlrzF7UiJBMA9RqZIaBvhrZLS8iCzrhVr7g0PDAhu
X-Google-Smtp-Source: AGHT+IEQZIbhxWcWxkR/bAoKJN/Rcj3Z2F6mq/bV2zXVOLqK66DNFSaUIY/szLscYugO2vAC6LaiQg==
X-Received: by 2002:a05:6000:1205:b0:34b:e34b:3187 with SMTP id
 e5-20020a056000120500b0034be34b3187mr600851wrx.54.1714509436293; 
 Tue, 30 Apr 2024 13:37:16 -0700 (PDT)
Received: from KJKCLT3928.esterline.net
 (192.234-180-91.adsl-dyn.isp.belgacom.be. [91.180.234.192])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfa2cf000000b0034c5be9fb6dsm12009819wra.65.2024.04.30.13.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 13:37:16 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:37:08 +0200
Message-Id: <20240430203708.75367-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714509436; x=1715114236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=msQPvhMgeC7tcxbBtO4KP4mrbUvKk3Y229UMUbaiEfg=;
 b=klNzHOo/NbMxwSe+Hl67S5v1egWKyRSI87bNwkxM0EifLKKiiYXHboEeehH/vIUO73
 lkzBdsJOy2yTJGBxpRBE7buuRRA46ZdEHTEiMylzEd+fn2l2TT7uhcMESKuKZM/NCAAK
 l4WYletz9IUtZSQftl7skIuVQs06jioTGqF3gVtZP52A5G74L4+UO5edCUmHrRBS08TX
 I8GgmxbXhNQKM3J1F8dMTAIivWKMZjixQpvFbOKuv8lVlTriVL0pJN1E5A+rC8YgGMM2
 L3FOeEdXxh0luz3Cgemnlw4Wm/vh84mdNv4aSuLTrXYUBl7YaDujWepvKRnBKAvGHa27
 51uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=klNzHOo/
Subject: [Buildroot] [PATCH 1/1] package/snmppp: bump to version 3.5.1
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

Drop non-v3 fix patch as this was upstreamed

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 .../snmppp/0001-fix-build-without-v3.patch    | 43 -------------------
 package/snmppp/snmppp.hash                    |  2 +-
 package/snmppp/snmppp.mk                      |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/snmppp/0001-fix-build-without-v3.patch

diff --git a/package/snmppp/0001-fix-build-without-v3.patch b/package/snmppp/0001-fix-build-without-v3.patch
deleted file mode 100644
index 4e81f7bfc1..0000000000
--- a/package/snmppp/0001-fix-build-without-v3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-fix build without v3
-
-Fix the following build failure without version3 raised since version
-3.5.0:
-
-msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
-msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
-  263 |   if (m_target->get_version() == version3) {
-      |                                  ^~~~~~~~
-      |                                  version1
-
-Fixes:
- - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to katz.agentpp.com@magenta.de]
-
-diff -Nura snmp++-3.5.0.orig/src/msgqueue.cpp snmp++-3.5.0/src/msgqueue.cpp
---- snmp++-3.5.0.orig/src/msgqueue.cpp	2023-03-20 10:49:30.629000853 +0100
-+++ snmp++-3.5.0/src/msgqueue.cpp	2023-03-20 10:51:36.880664304 +0100
-@@ -260,18 +260,20 @@
-   m_target->set_retry(m_target->get_retry() - 1);
-   SetSendTime();
-   int status;
--  if (m_target->get_version() == version3) {
- #ifdef _SNMPv3
-+  if (m_target->get_version() == version3) {
-     // delete entry in cache
-     if (m_snmp->get_mpv3())
- 	    m_snmp->get_mpv3()->delete_from_cache(m_pdu.get_request_id());
--#endif
-     status = m_snmp->snmp_engine(m_pdu, m_pdu.get_error_status(), m_pdu.get_error_index(),
- 		    *m_target, m_callBack, m_callData, m_socket, 0, this);
-   }
-   else {
-+#endif
-     status = send_snmp_request(m_socket, m_rawPdu, m_rawPduLen, *m_address);
-+#ifdef _SNMPv3
-   }
-+#endif
-   if (status != 0)
-     return SNMP_CLASS_TL_FAILED;
- 
diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 74c6a3e98f..b66056ef40 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  43a433bd5f6fd67add5a26add6521ca664c41aead438405658ed57483664b4bf  snmp++-3.5.0.tar.gz
+sha256  034553f7cb75d7ce1fe70cb3ba06e88587b6bca4fa062d10344ce4555a1395f7  snmp++-3.5.1.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 9f1916dd66..966bb340fd 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.5.0
+SNMPPP_VERSION = 3.5.1
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
