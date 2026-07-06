Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345EBC44500
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 04:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A016087B;
	Mon,  6 Jul 2026 04:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfexZVQhsEOt; Mon,  6 Jul 2026 04:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 261756087E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783313553;
	bh=m+RJiWmV435kWiKxoYSu7qtWM7WNSNU4c9l0N8KaRgk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RF1/RQ8OmwdBnIRPz+BfijYcOFKnRuoxzBIcSKXDGtwb5vR9vp0y8iv7nayK52cOn
	 O4Vvy8MAv21rvAmHMaB+IvqPFCJ4RVT5PKBKT+uDOMDFUvOXPP7aHvfy4d/Vlj74jW
	 OjDlAyl0E+hLes1Un3jblWjER0xIBNM/BiQlccy8R/AV9nd1PkOHV/1XSejFfL8+JI
	 uYY2QnrfdvKNE1EMjbxD/qwNiYSbiC43tgAgNqpw2fCr3JKTwyp0S4kBR7IW5nHj+F
	 Zrz2g5z5mXomQhd27cqjwvZq20kXEtcc/xLgGmr+7RV+ONapCLIHaRqkzwpvS0zYbl
	 GO0WN/izTjLBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261756087E;
	Mon,  6 Jul 2026 04:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09FA2316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E438940A38
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFRlYfXF1uDq for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 04:52:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11AE2408F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AE2408F3
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11AE2408F3
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5aeb59d54b1so2087587e87.1
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 21:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783313548; x=1783918348;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ohBU5Hhi0Pf2pWpqR9Ij3EsXboz4KmSHwlw1cnVcFrA=;
 b=GAxq7BXHAtSrJ4MQMEAGKUiAnz1CJzYBjuK6Wku9yFWPJ6rwmXEXJHiuUB7dkGZOrk
 vBpcRnnSUH2n6M/NAnpbMvMGgcOvpPf3CBRgDwiobSYAMRaC9ILcX8lCMsOr7saTGZ0u
 19A2pY5aCryvaM64aVYLBoGm9zcWPPpxTb5tJeLhr5q2jjJWd9e3uapLHARR7n4kbaIw
 7VM0i1q85Vk1OUiPANimH98Sif7ZcxhQw7u+C+QrwSJb+a+fV5Fi4TU0jO3NzdfcT1ko
 U6/AxsiOn9r5JtKHHZjwd1yGS4EAJbjxC1E6lyTvpNYAmu+C339iSN/PEnevFtRB5A4m
 ymug==
X-Gm-Message-State: AOJu0YyOSuQPIR9YopZx5T7pXhXSgBnSWG6BKJx/JCd1JaWbdmaFJ1uc
 Pr15cgXZEgdxWFcKaxN1Y5ZzvDD/jfjmdNTd64BFytM5xybV/znUgjF3UIfD6A86QcA=
X-Gm-Gg: AfdE7cmFnHndRWMeT/FAR5hMpop0zpOt7rcROR0aNtgc2ZoE20JsNFvAhlwvn47ubUp
 r+Ae7sfMkCK07DrRv6TAeUWjQ8sZxiy48uTsRPgSUoc2JlROE/WMrLY3G1re8k6yanTjoFFrQdu
 KvHtZHR4mIVdaysMWmuZaanZxD/F8OT5mMJ1vK3eCi/iqYXVYiDB8SU6evfisOF+JX1WBAie95w
 CQA4AjEvJ1IoXeaA1PE1jZ1bie9ETteWTq+queFBMTmZfAiJOH2pyMcrqwLM5t4efbLhudQTznI
 y2Mag6xZC4OSd+GHVV3sBsZTjuxySc5UErWfv2A0gIWp5oD1VBvx9t2BsyYGrzcL34MF1lJWITO
 VsRAkBtO4jOkMH+h4qWPscCfvvBYAFDV7It6kKagjE2Nv3s10prP6p/J0BRE1O0y9ZEfmttO5cW
 gtBi6XkmLttDliouo79TMtLkSnSYNdCz/CQIpdF15Y
X-Received: by 2002:a05:6512:1355:b0:5ae:b259:75a1 with SMTP id
 2adb3069b0e04-5aed5086f24mr1495602e87.12.1783313547632; 
 Sun, 05 Jul 2026 21:52:27 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b4ad1887csm16866441fa.6.2026.07.05.21.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 21:52:26 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  6 Jul 2026 06:52:06 +0200
Message-ID: <20260706045206.2395575-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706045206.2395575-1-troglobit@gmail.com>
References: <20260706045206.2395575-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783313548; x=1783918348; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ohBU5Hhi0Pf2pWpqR9Ij3EsXboz4KmSHwlw1cnVcFrA=;
 b=mKbVPKvUjHgPygC9/Ov+UY2noR2VE7IktDoJsH/bcvxq7dqyqsFSkX6bi+/QaWkJ0a
 Cpxzwur0yaPb5t9qOiScBXM6pylK6yW3CPGfRzQKmxKId5bGht59MDR6Yeb4vxOx0++4
 TAUQudgfbxEYuJb3XZmegxZSPvQbQXTSB2wZ55AlbOSWnE1pt+ndVFrl4gkj3dWZurZL
 MDQvacaM4rTP+eXoLYaSQEx7FFzV5hWEIP5dB7at9bZk0ofqMzcgWPlKWZqXcot4n1Cu
 a6bpZlMgyWm+csJsOeUj9ZGi5yOHXM8YIRRefNCIxKTxLmIb+2ABKxSyGtk+fbtiyLeT
 RN0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mKbVPKvU
Subject: [Buildroot] [PATCH 3/3] package/mini-snmpd: enable optional .conf
 and ethtool support
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

Both libConfuse and ethtool support is relatively new features.  Enable
optional support for them, including an example /etc/mini-snmpd.conf

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mini-snmpd/Config.in       | 17 +++++++++++++-
 package/mini-snmpd/mini-snmpd.conf | 36 ++++++++++++++++++++++++++++++
 package/mini-snmpd/mini-snmpd.mk   | 19 ++++++++++++++++
 3 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 package/mini-snmpd/mini-snmpd.conf

diff --git a/package/mini-snmpd/Config.in b/package/mini-snmpd/Config.in
index 1f61cddbcf..de83944528 100644
--- a/package/mini-snmpd/Config.in
+++ b/package/mini-snmpd/Config.in
@@ -4,4 +4,19 @@ config BR2_PACKAGE_MINI_SNMPD
 	  Mini SNMPd is a minimal implementation targeted at small or
 	  embedded UNIX systems with limited resources
 
-	  http://troglobit.com/mini-snmpd.html
+	  Enable BR2_PACKAGE_LIBCONFUSE for /etc/mini-snmpd.conf support
+	  with an example file.  Also enabling BR2_PACKAGE_ETHTOOL adds
+	  ethtool-based interface statistics.
+
+	  https://troglobit.com/mini-snmpd.html
+
+if BR2_PACKAGE_MINI_SNMPD
+
+config BR2_PACKAGE_MINI_SNMPD_INTERFACES
+	int "Number of network interfaces"
+	default 8
+	range 1 256
+	help
+	  Max number of network interfaces exposed in IF-MIB::ifTable
+
+endif
diff --git a/package/mini-snmpd/mini-snmpd.conf b/package/mini-snmpd/mini-snmpd.conf
new file mode 100644
index 0000000000..4679a8e43d
--- /dev/null
+++ b/package/mini-snmpd/mini-snmpd.conf
@@ -0,0 +1,36 @@
+# Require client authentication (SNMP v2c)
+authentication = true
+community      = "public"
+
+# Descriptive MIB-II system.* values, shown by snmpwalk
+#location      = "Server room, rack 4"
+#contact       = "ops@example.com"
+#description   = "Acme Gateway 3000"
+
+# Vendor OID tree (enterprises.*)
+#vendor        = ".1.3.6.1.4.1"
+
+# MIB poll timeout, seconds
+#timeout       = 1
+
+# Mount points to expose in UCD-SNMP-MIB::dskTable
+#disk-table    = { "/", "/var" }
+
+# Interfaces to expose in IF-MIB::ifTable
+#iface-table   = { "eth0", "eth1" }
+
+# SNMPv2 trap sinks
+#trap-table    = { "192.0.2.1", "[2001:db8::1]:1620" }
+
+# Emulate the respons of another device
+# custom ".1.3.6.1.4.1.11.2.3.9.1.1.7.0" {
+#    value = "MFG:Hewlett-Packard;MDL:HP LaserJet 1020;CLS:PRINTER;"
+#}
+
+# Map ethtool stats to IF-MIB counters:
+#ethtool "eth*" {
+#    rx_bytes   = ifInOctets
+#    rx_packets = ifInUcastPkts
+#    tx_bytes   = ifOutOctets
+#    tx_packets = ifOutUcastPkts
+#}
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 99bef47477..9873ad2dee 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -11,6 +11,25 @@ MINI_SNMPD_LICENSE_FILES = COPYING
 MINI_SNMPD_CPE_ID_VENDOR = minisnmpd_project
 MINI_SNMPD_CPE_ID_PRODUCT = minisnmpd
 MINI_SNMPD_DEPENDENCIES = host-pkgconf
+MINI_SNMPD_CONF_OPTS = --with-interfaces=$(BR2_PACKAGE_MINI_SNMPD_INTERFACES)
+
+ifeq ($(BR2_PACKAGE_LIBCONFUSE),y)
+MINI_SNMPD_DEPENDENCIES += libconfuse
+MINI_SNMPD_CONF_OPTS += --with-config
+# ethtool interface stats live in linux_ethtool.c, only built with libConfuse
+ifeq ($(BR2_PACKAGE_ETHTOOL),y)
+MINI_SNMPD_CONF_OPTS += --enable-ethtool
+else
+MINI_SNMPD_CONF_OPTS += --disable-ethtool
+endif
+define MINI_SNMPD_INSTALL_CONFIG
+	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd.conf \
+		$(TARGET_DIR)/etc/mini-snmpd.conf
+endef
+MINI_SNMPD_POST_INSTALL_TARGET_HOOKS += MINI_SNMPD_INSTALL_CONFIG
+else
+MINI_SNMPD_CONF_OPTS += --without-config
+endif
 
 define MINI_SNMPD_INSTALL_ETC_DEFAULT
 	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
