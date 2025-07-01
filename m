Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1CFC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 16:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4909784317;
	Tue,  1 Jul 2025 16:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NT6bKcb0v5Za; Tue,  1 Jul 2025 16:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 780728434A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 780728434A;
	Tue,  1 Jul 2025 16:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2F4C179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88808611E7
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAg76BcMY420 for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 16:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68BC7611C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BC7611C9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68BC7611C9
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:06:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso58415665e9.3
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 09:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386010; x=1751990810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XKsqKSTMpu7NGAvc1TaBN+wujv9CaUKz4uMmTuH2fno=;
 b=TdzuJaXeZwzhjqU3B8Hvk+JiiPKttRS6FVy15U+NbjAw5SsStg95FO3kHVERTngllG
 gHl/oirRPjrKfXy3rqN/hBzJ23CqP4Uo23/lKeNgt695FlYKCUx3kWO+8ry3GpIwuYwC
 vG/Gm3UU33XwOBNAFHP8cYnJ+XEgFFuAs+q5f5rfYEQTs0AeKG+BUZrSbetbhahT0PaD
 q14Vtm6lVVTGQa+xmaCeg5rhcjE5tEIvcOo2GKa82jzcyia2G+tI10DyGm/7URQEBhJx
 9Y7O4CU/RZkQFV8WheuURfqG/y7NMfy+N7VfeHZBSYaG/86d/EkkML/zQY3GwzqozN3Y
 1UJw==
X-Gm-Message-State: AOJu0YzPiXRBxsyEfZklniiYrAtSrLvrSE8yeN5j0UlsrkZdqG2c3wNu
 Dr7Rts+9qaqDTyNMUxbUkdm3F7DgSD1i7FYEYm43tulvWxMMpC8As8oCgb8z0l4M08ZO4CdXBFT
 pqQPT
X-Gm-Gg: ASbGncuObKu3LUdBut5NtUldokGm4sNeVAL+4l1T/eTqVKsBARpEVLFhMYvBKuwUrh2
 caPogCqGBHiq+UAmBmLUTnQXyKkrG8j//BAiOtIf2aSxoMUEyQpiGbDk9iIvD/zx8vOzqVY9aof
 SjIPsHXRc3cxVFyVv5kPOdH+ERnf7dY8c6CMgad92Teke0wfVqxdmjHDkcfhjstfIAznxCEcZ4M
 2mByCJF7FjgAwzHMQ2CCjOWiiM2/dQSwfB0z9mVm4zf0hJW4CFs8MoLaHC6LV9XlV9+Qa3BC9pZ
 Z7RoOLq1IZNshJjGYOIys9Lw9qG5qcTjtVg4x8JE2K6/sA+Dg2D4hPV/FSUkfIXba0waNY08Zlm
 uO1mu9ZJBC8dBoy5e/Q==
X-Google-Smtp-Source: AGHT+IHTfiE14PIm8H9LkMkvtSTz9o7b/xjnucnECF8A6pR5U2Occa29F0f3vVJlJtVsKxYuNyQmYQ==
X-Received: by 2002:a05:600c:6986:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-4538ee278d6mr173588385e9.13.1751386009366; 
 Tue, 01 Jul 2025 09:06:49 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453966eb3e0sm110699045e9.28.2025.07.01.09.06.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:06:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Jul 2025 18:06:35 +0200
Message-ID: <20250701160635.1271205-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751386010; x=1751990810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=XKsqKSTMpu7NGAvc1TaBN+wujv9CaUKz4uMmTuH2fno=;
 b=VXiil5tH0huMnJ1UYmyikPX8MXfT50CiNRAGCdad9TeJiDsYRTztx1gyteIIstUcjy
 CifePfryjSnf6i1LcbOWeN56IzJ0GBs/yn+83d1LfYSjvj3PpYZv7W/pv2u6zgKLDVp+
 sPTW4La/oFoKns0wfFXRBvs5QyqbnKCGYz2PAOI5mkFuUQeGZPLRUdqIFUpS4SF9nOpp
 cmEcTHs0/g//1ObGJIAI8w5oBkS1K3Vvd2qjg6gHc1MXFqlT6WSTwmKQTdkwarwuKxWz
 v4VyIbE1zpFfnZStcs0I7J3dLVwspN3ob/2FIsXtXVwLzpaMEaQRscN7IkhB0T1RDER9
 bLZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VXiil5tH
Subject: [Buildroot] [PATCH] package/tinyxml: add patch for CVE-2023-34194
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2023-34194:
    StringEqual in TiXmlDeclaration::Parse in tinyxmlparser.cpp in TinyXML
    through 2.6.2 has a reachable assertion (and application exit) via a
    crafted XML document with a '\0' located after whitespace.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...e-assertion-via-crafted-XML-document.patch | 33 +++++++++++++++++++
 package/tinyxml/tinyxml.mk                    |  3 ++
 2 files changed, 36 insertions(+)
 create mode 100644 package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch

diff --git a/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch b/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
new file mode 100644
index 0000000000..802d964e15
--- /dev/null
+++ b/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
@@ -0,0 +1,33 @@
+From: Guilhem Moulin <guilhem@debian.org>
+Date: Sat, 30 Dec 2023 14:15:54 +0100
+Subject: Avoid reachable assertion via crafted XML document with a '\0'
+ located after whitespace
+
+Upstream: https://salsa.debian.org/debian/tinyxml/-/raw/2366e1f23d059d4c20c43c54176b6bd78d6a83fc/debian/patches/CVE-2023-34194.patch
+
+CVE: CVE-2023-34194
+
+Bug: https://www.forescout.com/resources/sierra21-vulnerabilities
+Bug-Debian: https://bugs.debian.org/1059315
+Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-34194
+Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-40462
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ tinyxmlparser.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/tinyxmlparser.cpp b/src/tinyxmlparser.cpp
+index 8aa0dfa..1601962 100644
+--- a/src/tinyxmlparser.cpp
++++ b/src/tinyxmlparser.cpp
+@@ -1606,6 +1606,10 @@ const char* TiXmlDeclaration::Parse( const char* p, TiXmlParsingData* data, TiXm
+ 		}
+ 
+ 		p = SkipWhiteSpace( p, _encoding );
++		if ( !p || !*p )
++		{
++			break;
++		}
+ 		if ( StringEqual( p, "version", true, _encoding ) )
+ 		{
+ 			TiXmlAttribute attrib;
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index c6150b13fe..2f57b8a4f1 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -17,4 +17,7 @@ TINYXML_CPE_ID_VERSION = $(firstword $(subst _,$(space),$(TINYXML_VERSION)))
 # 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
 TINYXML_IGNORE_CVES += CVE-2021-42260
 
+# 0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
+TINYXML_IGNORE_CVES += CVE-2023-34194
+
 $(eval $(autotools-package))
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
