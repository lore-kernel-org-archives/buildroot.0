Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F3F4BB8A
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8118361469;
	Tue, 24 Feb 2026 20:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSuTee3oppGz; Tue, 24 Feb 2026 20:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C33B60ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771966353;
	bh=fiy+moXdQEdFDNIx1TwzW5XssBbKZOZEt5yzniVi738=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aeU1r0ZVnF9xGnVU8cRn+cT9CoVjnN6JUIPT8UciX/Vvy5Ez5DkxvSBZuUS9t1UkN
	 NOEwDgYxmaZDG3kyRATO5u1LTVHhhhRserQ9gQn5JV0h26T0FhuYvRXHcJzA85H7GH
	 RguMsdlTULmxPyXgIa9MrHWs7C4iHSxBSDQSIKrmcdRHmJLETjA8g4PpT/qamNvvJz
	 ph/cZEvsL3RhRKX3Nicf1xaal3t6eyIzvYdG3j6D+k6m49OSZEKOIpqGbVflB6IQ61
	 YGZsu3J1ymbBKc9Tl0zbVDlXN7e9/idwvr8M4T+Wjv4Xpx/QUkrAaw75stIbggu4VS
	 X/3quuzsAQekQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C33B60ECF;
	Tue, 24 Feb 2026 20:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4536C204
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 20:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B0AD408AB
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 20:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKuJ_UcPsulu for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 20:52:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 219F3407BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219F3407BA
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 219F3407BA
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 20:52:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48378136adcso35873895e9.1
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 12:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771966349; x=1772571149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=trgvM8+cbwEtDSWFsINFTboiNJjn8GB66aSrR9RmSlE=;
 b=BPS6TKJNI98nNVUSCX3n1rCxO3uIbKgItvG/xmoyZY/adXrAMlHnh/nOY5D8Fkh1kU
 cbDYuvbWlrlc1iCGNei8uYL7RPIN6KpL8J44Krx1CHY3grlnbCMOREXy3JNKdpKazqQt
 kANcVldEEF6DZse8DcebTbPpa/OwX6ZLC6FRwkgFe0beK6Gg9IpzNnmFk+JJY6ttlCtY
 6U/exRgMVUlcIlysYOWjoad3SjxiWLp80cZeslsN8R15oMJA+by2USWD1vVt3HIXjl2Y
 MgH26K0n22UaRVGjLcRJjHb71nZK8DBzW+8SSAl/GSoS8y3qrhvJ656RF8Tj6AT75MGI
 ujIQ==
X-Gm-Message-State: AOJu0Yzmu4XXMWBwUtf4M8pCLHn7vBK2blMmKEYTd8rE25WlWRHcPGhv
 rM4l72emCNtt98VmJduOkAIm96QQGzO+kHa0U36WBF9/SQh/NWWdJeG2/ruWvk1bZl3W14Lv+rT
 CY7bn
X-Gm-Gg: AZuq6aLqDV8U7P/3lweG8kL17niRlZXWeP55zUTfDLBvodOXgu9YbI8avOV9gBMzp8G
 XsO+HqZXL8uUQki8KIikvWkcJufVi8AA2eg79GAflNrSA+d40zpYIFPPiLdZ81amzyMh/EusVXq
 hP0TELYidvFchFbqMQlPxilm1xOaw/5mGxh8NtO7Bg8r8CMBKTPGKMKe4sMYRlCBcXB7fTSPUHB
 ufBJIRICbAlGr7RLfnOaYj8FFHpuqH+qDA3nACU8QMOMic6kCj/ufCR2Z++kvia99POQU66U9ER
 vSIL+xSc+BkO+Fe12VPzSbz6QSsj2+blu5Sji7XjF4G3ax4p6l6jvuQ2LljvWklS6rWJc6CBV73
 4VrATHrUPaYD7HCQh+I2w+hYvNw+z+13IF+zc6zN5g9z99Jc5lF3lf3he19oTAe+0k5zFLsGEk5
 uwcF55aSEmNvCJsmk=
X-Received: by 2002:a05:600c:5306:b0:483:8f0f:36fe with SMTP id
 5b1f17b1804b1-483bef18a96mr2747305e9.1.1771966348632; 
 Tue, 24 Feb 2026 12:52:28 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bfa015sm29467891f8f.8.2026.02.24.12.52.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 12:52:28 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 24 Feb 2026 21:52:27 +0100
Message-ID: <20260224205227.263450-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771966349; x=1772571149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=trgvM8+cbwEtDSWFsINFTboiNJjn8GB66aSrR9RmSlE=;
 b=JG03bBIbsZJPD5l1D/Iys6L/l8LJ63U5IwqCt9Ur8GpRSTy0gghJjWyLdYpatP4XVf
 usaEs59ZDT/oxMgVtzGwSTWVUdVj5vmRhKYzDqWkSj4hYZ8DGQyhV0/iSIVqwcE5DlLN
 8RNpU0pN8+j2PGeyaSSvWFQ3xn/z7xqrq650aEKstQeyvP3ie7RrrRM3Rj4tdFtnKB6n
 EFtGlPtb0Qp3ZtHzKggc69/W2vwawVgL+qu1+xTR3ilDfR5vDtrAcHV3l0rDSveAD6MI
 14gJ5j3T7jaGnhcl9JZm1DybiAB+v0vuduIwW0K1VEc7eC+wAYCthwq9Pnxk9OqJpQ5a
 Dx1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JG03bBIb
Subject: [Buildroot] [PATCH] package/tinyproxy: add patch for CVE-2025-63938
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

- CVE-2025-63938:
    Tinyproxy through 1.11.2 contains an integer overflow vulnerability in
    the strip_return_port() function within src/reqs.c.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-63938
  - https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...r-overflow-in-port-number-processing.patch | 41 +++++++++++++++++++
 package/tinyproxy/tinyproxy.mk                |  3 ++
 2 files changed, 44 insertions(+)
 create mode 100644 package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch

diff --git a/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
new file mode 100644
index 0000000000..3b14a58fb6
--- /dev/null
+++ b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
@@ -0,0 +1,41 @@
+From 3c0fde94981b025271ffa1788ae425257841bf5a Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 17 Oct 2025 22:57:39 +0000
+Subject: [PATCH] reqs: fix integer overflow in port number processing
+
+closes #586
+
+CVE: CVE-2025-63938
+Upstream: https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/reqs.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 52135a03..a562c68a 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
+ {
+         char *ptr1;
+         char *ptr2;
+-        int port;
++        unsigned port;
+ 
+         ptr1 = strrchr (host, ':');
+         if (ptr1 == NULL)
+@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
+                 return 0;
+ 
+         *ptr1++ = '\0';
+-        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
+-                return 0;
++
++        port = atoi(ptr1);
++        /* check that port string is in the valid range 1-0xffff) */
++        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
++
+         return port;
+ }
+ 
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 6656a752a6..c5e975d8ab 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -11,4 +11,7 @@ TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VALID = YES
 
+# 0001-reqs-fix-integer-overflow-in-port-number-processing.patch
+TINYPROXY_IGNORE_CVES += CVE-2025-63938
+
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
