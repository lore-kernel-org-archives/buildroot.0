Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4ADC6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 17:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5721D6101D;
	Mon, 20 Mar 2023 17:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5721D6101D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGsUPkPz0I5N; Mon, 20 Mar 2023 17:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD2E607A4;
	Mon, 20 Mar 2023 17:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD2E607A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A872A1BF307
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 17:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD89404A5
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 17:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FD89404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ugu15GKHaIg9 for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 17:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEEC40298
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FEEC40298
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 17:17:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o40-20020a05600c512800b003eddedc47aeso2569727wms.3
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 10:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTeFwkaSFrpHniGTxqfX53srO3E7JPFAiBTyj1tIyE0=;
 b=TNR4g8ATuEZDwfWKVO5MT1UbQ9ZPtXqsHgEpx/G14NvZmdjppYuumT3hspUJx+idFL
 fzRdBROgQuEyKJNgOIGE8BtSLHYl7TZfKWT6EsJlEA8i12vw/LfLurpc33SF8HbBl/bM
 VtEi1z6mjzczLqvfUCdbBi3sYX3w0shJ5YQWCj9BALYYafB0bysSq/gFSKUjZ//qrsg9
 LcnSCd4N9BWh03VXZtpVDJaMgAAYOxY+Jdp9ZLlrfBSAHTjm670nx4+uOrxDId//RZOu
 SoYDv4w/+vaTPEGNUS10JSrdUemetAQflhsosHe52AeDknCZRF3XKfcLAzxObAmtnr54
 Hg6A==
X-Gm-Message-State: AO0yUKXKzdsaAjodmHHJ0++nVVaWSx+6lC6zSkDFypWd9wrHDPNwoTbO
 nD6VFIkzg6KEsZ0SxUDRO8Px1LOMX30=
X-Google-Smtp-Source: AK7set8+gMUlsM20DUrS4rMptRR0dhi/jAf9NgYP/H/Es7Gu6m+82bNTDaGNW3YKffalLp8wnr1mtA==
X-Received: by 2002:a05:600c:ad3:b0:3eb:2b88:9adc with SMTP id
 c19-20020a05600c0ad300b003eb2b889adcmr221498wmr.25.1679332658449; 
 Mon, 20 Mar 2023 10:17:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c22c100b003ede06f3178sm4962190wmg.31.2023.03.20.10.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:17:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 18:17:33 +0100
Message-Id: <20230320171733.1077811-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679332658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TTeFwkaSFrpHniGTxqfX53srO3E7JPFAiBTyj1tIyE0=;
 b=KYfpZd2YyLzhh7c9Tl96KrqD+r2ZRJoR325WtLb+AccNJ2iokLut6oQu4DjaA4RDy7
 hqEKOn49HjNskzL+K187DvFS636nkjyMRKarxWlIhrl+fa5ZSVTdZmg+M7F2NmVfRn7m
 hvYpYI5Zvp3l76LQpohShsaN6hDNiHM7ftehXsEA/iGNr2sBlIixdQAXt+QRt5oHX7Xv
 +VJRJn0DhevLSJfrB5HMIIrBu/v9pnCBGJPdMMelVOfXa0qPLJSQ1bW9R2tnxcH/NWDb
 lISqPTkjkJn/9JHPCMpElA76VY3fNTAzDTenieUL7hJHekPl6JIVJHk2klR4FPrBcUAe
 uKtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KYfpZd2Y
Subject: [Buildroot] [PATCH 1/1] package/snmppp: fix build without SNMPV3
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

Fix the following build failure without BR2_PACKAGE_SNMPPP_SNMPV3 raised
since bump to version 3.5.0 in commit
e011fa0415883b9d44df616cfaf6956e1a11da88:

msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
  263 |   if (m_target->get_version() == version3) {
      |                                  ^~~~~~~~
      |                                  version1

Fixes:
 - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../snmppp/0001-fix-build-without-v3.patch    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/snmppp/0001-fix-build-without-v3.patch

diff --git a/package/snmppp/0001-fix-build-without-v3.patch b/package/snmppp/0001-fix-build-without-v3.patch
new file mode 100644
index 0000000000..4e81f7bfc1
--- /dev/null
+++ b/package/snmppp/0001-fix-build-without-v3.patch
@@ -0,0 +1,43 @@
+fix build without v3
+
+Fix the following build failure without version3 raised since version
+3.5.0:
+
+msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
+msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
+  263 |   if (m_target->get_version() == version3) {
+      |                                  ^~~~~~~~
+      |                                  version1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to katz.agentpp.com@magenta.de]
+
+diff -Nura snmp++-3.5.0.orig/src/msgqueue.cpp snmp++-3.5.0/src/msgqueue.cpp
+--- snmp++-3.5.0.orig/src/msgqueue.cpp	2023-03-20 10:49:30.629000853 +0100
++++ snmp++-3.5.0/src/msgqueue.cpp	2023-03-20 10:51:36.880664304 +0100
+@@ -260,18 +260,20 @@
+   m_target->set_retry(m_target->get_retry() - 1);
+   SetSendTime();
+   int status;
+-  if (m_target->get_version() == version3) {
+ #ifdef _SNMPv3
++  if (m_target->get_version() == version3) {
+     // delete entry in cache
+     if (m_snmp->get_mpv3())
+ 	    m_snmp->get_mpv3()->delete_from_cache(m_pdu.get_request_id());
+-#endif
+     status = m_snmp->snmp_engine(m_pdu, m_pdu.get_error_status(), m_pdu.get_error_index(),
+ 		    *m_target, m_callBack, m_callData, m_socket, 0, this);
+   }
+   else {
++#endif
+     status = send_snmp_request(m_socket, m_rawPdu, m_rawPduLen, *m_address);
++#ifdef _SNMPv3
+   }
++#endif
+   if (status != 0)
+     return SNMP_CLASS_TL_FAILED;
+ 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
