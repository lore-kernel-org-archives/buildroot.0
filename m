Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15624CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 19:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD214117E;
	Thu,  9 Oct 2025 19:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLIKuUEdiI27; Thu,  9 Oct 2025 19:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E710A41184
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E710A41184;
	Thu,  9 Oct 2025 19:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C41E4119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0A21613A0
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3BAmMNbfTTK for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 19:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61C3F6139F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61C3F6139F
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61C3F6139F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:17:11 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo261789566b.0
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 12:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760037430; x=1760642230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCqqyAQErX/zQ2t/BC0/85NPJxbnbZWAuk1e9BpG+Sc=;
 b=P7w8/ggEM2UG61OPWSqO9s8Odtci797pxyE8VkPZE6hCn5hUfZbM4b8VYvgxiWJ/VN
 JV1YfvfGB5MoqM50b0jsiXYcTlelpR4q3kc36dvn8DrTdbMigJVepyReT/6q9CyFBhbx
 k3PBTJYGuSxEzLhfFDF1gv4tbTtC0kjRUe+U0zafnFNJGitVVITU8moXwBp5pKyAroZR
 y7OiUAGSX/sZ5NzehrsLcTZ0gCwKf39OGMTLU9yUCEaR+oPzn4JH37uDXq00zEMdeHDq
 70+GYZg2HqPRT2Z234ypBeW4UOlMMu2I2rsyAZOYKInQPTMsuyuJBTLh61XZH3s33YND
 1Luw==
X-Gm-Message-State: AOJu0YxcOP71PHIeGegZ6s94Cf6CwdRjvxtVcf4W252F/INN6L1h+7bG
 Frxn5mixQ6q7EalSJzM+aethEE7oipv/X0LG79GKgHuUBOvupkXmqV2Wah8CPoITrKiCf30XKtK
 TA0mT
X-Gm-Gg: ASbGnct0R91hu9fO4hSscGj5cfEabOo+mLLbPa4F4KebFqK3liuvdQuq7ilj1QlYvXf
 1gl7xHCtK+t/yg4WFrkcFDugHBlQpsnvVFmJXlHYqbdTMWXzBPl/b0RQHhSBTaPEz8iWpzDLXAB
 phP3xkPXOWGEhLSei66SjuowUlLEM8SHLWnn53hpS82ohYVXokUnYB751J3PZHG/18hqlY4RHA9
 UXOvbJQ9SH/PVnuP77mHZ35ZM90KlsulQF3kF3CJe5SogKmrI7div+QayVOZBfm6HmNh6KLfT3A
 lYH2aFyRiRt4GdJvVMtnuEf1dl07GNO5Ai4K9TTrTEno3lNWeUW8TNxsN2V0h9T+1MYF7LB+49w
 iYoAyZuu45Vd97twJmQPGO0lwGjqDb67MtRDkS0Li
X-Google-Smtp-Source: AGHT+IH0zf3m+D0kjNKgJ95FPWYoH2mpjCffqqGhKjMUHMiduL1KKg7+7ds9OtFov84FLCBM0gj73g==
X-Received: by 2002:a17:906:c155:b0:b48:549f:6d9e with SMTP id
 a640c23a62f3a-b50abfd68c8mr948162266b.49.1760037429653; 
 Thu, 09 Oct 2025 12:17:09 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12978sm37960766b.44.2025.10.09.12.17.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 12:17:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 21:17:08 +0200
Message-ID: <20251009191708.3411-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760037430; x=1760642230; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=aCqqyAQErX/zQ2t/BC0/85NPJxbnbZWAuk1e9BpG+Sc=;
 b=X/93oVVzKbqn/0yhMhGQ9c01oHNKL//9L72PrtsI1I+qytIh1ji1k1/0wKpYVGuz1E
 wK7BfPFc8nCLs9U3RnaF6H62is/UhM5HqyKOMjV2Z5kP2KCcOMN+1yeZ3z5agY8mgaAO
 KQVOfoN8+R1o+tI/vP82/fBHMmEtGHH3CycSsuOXLF7WDGNY/4L3BDoex3oWZ7F3jKKP
 U3NqW0iVj86JafPu9IyQVpUKbdhSn4slygpfUyyQ0PKP7gce34Hw1k0ociEy+hFcw/AE
 n2NszPsMytLntT9qpicEMpH10BxLfFu55ROusXdZMyrplbIoga1AkmunePpLAyLCnAcf
 pdhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X/93oVVz
Subject: [Buildroot] [PATCH] package/squid: add patch for CVE-2025-59362
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

Fixes the following vulnerability:

- CVE-2025-59362

    Squid through 7.1 mishandles ASN.1 encoding of long SNMP OIDs. This
    occurs in asn_build_objid in lib/snmplib/asn1.c.

For more information, see:

- https://nvd.nist.gov/vuln/detail/CVE-2025-59362
- https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch | 52 +++++++++++++++++++
 package/squid/squid.mk                        |  4 ++
 2 files changed, 56 insertions(+)
 create mode 100644 package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch

diff --git a/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
new file mode 100644
index 0000000000..695ba0255e
--- /dev/null
+++ b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
@@ -0,0 +1,52 @@
+From 0d89165ee6da10e6fa50c44998b3cd16d59400e9 Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Sat, 30 Aug 2025 06:49:36 +0000
+Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
+
+Upstream: https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0
+CVE: CVE-2025-59362
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/snmplib/asn1.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
+index 81f2051fbe7..2852c26b220 100644
+--- a/lib/snmplib/asn1.c
++++ b/lib/snmplib/asn1.c
+@@ -735,6 +735,7 @@ asn_build_objid(u_char * data, int *datalength,
+      * lastbyte ::= 0 7bitvalue
+      */
+     u_char buf[MAX_OID_LEN];
++    u_char *bufEnd = buf + sizeof(buf);
+     u_char *bp = buf;
+     oid *op = objid;
+     int asnlength;
+@@ -753,6 +754,10 @@ asn_build_objid(u_char * data, int *datalength,
+     while (objidlength-- > 0) {
+         subid = *op++;
+         if (subid < 127) {  /* off by one? */
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = subid;
+         } else {
+             mask = 0x7F;    /* handle subid == 0 case */
+@@ -770,8 +775,16 @@ asn_build_objid(u_char * data, int *datalength,
+                 /* fix a mask that got truncated above */
+                 if (mask == 0x1E00000)
+                     mask = 0xFE00000;
++                if (bp >= bufEnd) {
++                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                    return (NULL);
++                }
+                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
+             }
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = (u_char) (subid & mask);
+         }
+     }
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b021170d9b..d445f005b7 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -11,6 +11,10 @@ SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
 SQUID_SELINUX_MODULES = apache squid
+
+# 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
+SQUID_IGNORE_CVES += CVE-2025-59362
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
