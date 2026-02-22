Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAACC636B7
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 20:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294AC8126E;
	Sun, 22 Feb 2026 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OM4NvfoXBMUn; Sun, 22 Feb 2026 20:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10242811B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771792470;
	bh=CimYClF4Klnr6jjM56H1pzC391t1zZ37oGzk9rz45yE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iQQLHTzx7ni2lB3bbK9k+VNs7ZJLvjqtrFwUSWZYq8D3wq+QAMXZB9eLmucRECzQt
	 4qFYLho/gFXqOWugsnMGausaIgQOdleD+L3OefYm31/QCCjpMcNETSDGwSCR27dpAK
	 Pe5OYgu4D7JMg3ZohS5fc5UMziLQ2pEhBHx6brBY0LQgtMspdO51fKlShFrNSPLAyi
	 09OKD3EK3cFfCDAGjCEsmukPPu8ZIY0yQKDMiu+YbHR680Yzzi7Dn7FZlOzZassyvU
	 pKscll8b7/1DfNaFmb4XTPt/Z754qSHtnkWEiVmiyLUdEBO2q9VDtYEFBekIUSI/+2
	 lE9YV4+uU6wmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10242811B9;
	Sun, 22 Feb 2026 20:34:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2DC01CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4772811A3
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6W9HsNdseuy8 for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 20:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C66481196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C66481196
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C66481196
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:34:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48372efa020so28643825e9.2
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 12:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771792464; x=1772397264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LEvGoSME3rzGKGB5BoxstFggN+/QT4ZOPjLl8JSwKL4=;
 b=FTdC4Atikb14sSBjj8xokQ0OarApj4iB0id8XG3mjFlJD8Ix54rJVr/XUXVBYjdGfT
 Y8tn+FFDYwu3MjKqL45COYeTAeh6A1v4iF5kDIPLNTN9OOatQ9BsSyPkQiwxVxzGBTOT
 nHWBVLsNaDzSTZ0YtkvxxLZmN5qutnbKDmpOfAlugDJAxPP7YV8xYs7BqcgmteLQNb4H
 duHQ2jBeX17BFse4jgCuMQJhqI4HhQvFkx9FI6uJ2SG2wafuSag2qWJf1DTdSRYcnD72
 r5rI1pYu4tJOeNHMLxxwazc5TB3Ha+Id7sDHaydZQp+XIOxDusRy2del9X3kuxE7POnA
 sS0A==
X-Gm-Message-State: AOJu0YzH+nXm5jnbCFh568a851YQOpvGfrPXax+Gt8sWRQYOTVB6+V83
 etPtOKq+aMMcufDCfZyeJixocMb0wFzmbcG4pLlgXPSCsg3AiY67l1dMWvYHPOTbApo/jE+O4RQ
 o5via
X-Gm-Gg: AZuq6aJntLkbUv3SGOYLibmHjKtWPByOPKQxIFJUFZBKa1N3EA/oHsbgFUQMyuvvh/8
 yqvS4v+CbeEeuKqQNuyaESLEq5iD8S7iTGjrKna8DAlxR6SRmbZWYbP26GrPk/096yoMlMPXMbo
 lQgzdQqM22UY884ObI4DCkWogdgN5tuesQlJi7KgUXXd8IBjbAUEs7t2sAhCqoIJXaa79ktOMjg
 d3b1JghhmqsmIAccXdHMs47BeeBr7l4g7w1+HNQWiVN63IDfOlky1qRJoT7hXmHIgrul7Tll/FF
 FOLy6d0JoEey4roshpw7ALmhMVKch6NClQcnqHnjRPvOohMX0txjzKlrouiLT90COKe8OULbXb3
 6C5Bs0sRnmGHMlCZOJxGEOuyFUS9zGfsFfP8oCXTBmT97ncxRIm69a4JCs4WmfipOdC3fLDQcjK
 i1Jv2TlREVJKFiSKs=
X-Received: by 2002:a05:600c:8717:b0:480:1c10:5633 with SMTP id
 5b1f17b1804b1-483a9635abbmr87766005e9.26.1771792464481; 
 Sun, 22 Feb 2026 12:34:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a4305ec6sm67639415e9.28.2026.02.22.12.34.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 12:34:24 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 22 Feb 2026 21:34:23 +0100
Message-ID: <20260222203423.272780-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771792464; x=1772397264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEvGoSME3rzGKGB5BoxstFggN+/QT4ZOPjLl8JSwKL4=;
 b=OfEHmFFFgvpdtc88gFh3Zk/C2jTLNVNff7ZHHsOy1LBNkOFnCYb9jZzo5YcnLu9qwu
 3gJ1thzqmtIyCb+YlYzAoBUaosR2PfSr4uZB277/qifxoXOfjaAEsj7Ag16Lwbjejs7d
 +lGq/ODbJQnd8IqwvF70IzfjY1qG1J6TsiyNfuIo+OxaJJtvDE21aJesBHm9nTi+Gv42
 r0+rzVFrWDoqTUrlvdOITMyXF8SXiXsqsAjacpr49c90xYzoTq4wKMS00uw8kfyDZhRC
 33OaRGTk8Psjg/bEgoUrx6yp/dPU/xjdK+IelVGmT/wVrdkKIlEcU066PcYZt49Ywe6+
 DUxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OfEHmFFF
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: add patch for
 CVE-2025-68615
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerability:

- CVE-2025-68615:
    net-snmp is a SNMP application library, tools and daemon. Prior to
    versions 5.9.5 and 5.10.pre2, a specially crafted packet to an net-
    snmp snmptrapd daemon can cause a buffer overflow and the daemon to
    crash. This issue has been patched in versions 5.9.5 and 5.10.pre2.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-68615
  - https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...d-Fix-out-of-bounds-trapOid-accesses.patch | 32 +++++++++++++++++++
 package/netsnmp/netsnmp.mk                    |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch

diff --git a/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch b/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
new file mode 100644
index 0000000000..a937b53644
--- /dev/null
+++ b/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
@@ -0,0 +1,32 @@
+From b4e6f826d9ddcc2d72eac432746807e1234266db Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sun, 2 Nov 2025 14:48:55 -0800
+Subject: [PATCH] snmptrapd: Fix out-of-bounds trapOid[] accesses
+
+Fixes: https://issues.oss-fuzz.com/issues/457106694
+Fixes: https://issues.oss-fuzz.com/issues/458668421
+Fixes: https://issues.oss-fuzz.com/issues/458876071
+CVE: CVE-2025-68615
+Upstream: https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ apps/snmptrapd_handlers.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/apps/snmptrapd_handlers.c b/apps/snmptrapd_handlers.c
+index 6cd126f266..afd93ed0fb 100644
+--- a/apps/snmptrapd_handlers.c
++++ b/apps/snmptrapd_handlers.c
+@@ -1112,6 +1112,12 @@ snmp_input(int op, netsnmp_session *session,
+ 	     */
+             if (pdu->trap_type == SNMP_TRAP_ENTERPRISESPECIFIC) {
+                 trapOidLen = pdu->enterprise_length;
++                /*
++                 * Drop packets that would trigger an out-of-bounds trapOid[]
++                 * access.
++                 */
++                if (trapOidLen < 1 || trapOidLen > OID_LENGTH(trapOid) - 2)
++                    return 1;
+                 memcpy(trapOid, pdu->enterprise, sizeof(oid) * trapOidLen);
+                 if (trapOid[trapOidLen - 1] != 0) {
+                     trapOid[trapOidLen++] = 0;
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index a79c13c611..1c7e406a4e 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,6 +11,8 @@ NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
+# 0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
+NETSNMP_IGNORE_CVES += CVE-2025-68615
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
