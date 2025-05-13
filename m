Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3FAC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 08:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5123340724;
	Tue, 13 May 2025 08:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xh1Kgg4rlP6B; Tue, 13 May 2025 08:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E7AC40D28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E7AC40D28;
	Tue, 13 May 2025 08:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CDB2150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DC55607A8
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGB1ect_DsZg for <buildroot@buildroot.org>;
 Tue, 13 May 2025 08:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB7C260B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7C260B0C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB7C260B0C
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:10:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso33739775e9.0
 for <buildroot@buildroot.org>; Tue, 13 May 2025 01:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747123800; x=1747728600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hdWYi1XQfdQpmDPlkFSS6Kvy9noJCsSRJXZhzGBkeko=;
 b=Gl5CfFDAJjYhr+zDYWAqUKUfvwjiVQtkRQvxKoj6yeryUy1ngKd2Q4z7dMaD+R1Ur6
 k2cjKM9r58z26H0TLld+eYB502VWmlPzjEdVnVwnz3m2JvLOcobPhNCxm7jkUw14xjzP
 bOqQANYE9Qzdd99fhDaoDmOnUVjKB760E/7zJijqK3mCl2Wyy2OQ+gvWJdm75Yu7xX+I
 ybM2aBb/5BrVnzMZ3eAyCRNNVL3Uct1acpjQvIBv7UOWC7O6snjALNLzm5iXnazm4D1O
 EW30h6jv8PJRyXRH7AEPxoOPYJlka9ha0F6EMk37/I/jdOf+q0b2EhUHq5Bf/HwCDFOr
 th2g==
X-Gm-Message-State: AOJu0Yz69sJvfnEHLac3bHg3GChvJCtGn4DpUI4x3sxoSt+VFz+VJMo1
 NjT4LQkZadK4kAiOJ0oLAtb+uo8d3GLNlIkctGO8VqvQRuOg5tH0siYLnZKdVm2Xl3sEoTM3esM
 Z5b4=
X-Gm-Gg: ASbGncvanKCC9CQ0w6g7bZa2U+1+0HhQOBEFr2pAEcTKW5rMQdfST2vVPL74hd9zEvc
 rs0LHFrSbIH1PN/Ebk9jePHV+Sj6U6hnimWcJTFoE8bn1jwhpIGZAPv7dLLjsVITlcHR/fg19le
 WkN/4YEpHZX83yT9X9sTm1MU0bCfxN9m9L2si6fNvGR49+R0ySZ59dHkLw3bFbTiZe83zQQirXX
 H0Lp3I2ZLsu685XxSv/psLPLv6noUhqzkqjrACZGh2SGmQjcHjH/b2V7T7LKJ+KCtcurvUPZ6u8
 ecdUlHU2YTcyd8naLJDEjcoKfoEiTqk7LICUvZyDGvCa3tDSS2ZqWJ/HlHAzGqrIPw4eZnP2LOW
 ++HbSyGlVOh8h0GyeOXDdll9h1cgv+H6AefhFksPNp0C13BfedmbIoQ==
X-Google-Smtp-Source: AGHT+IHd5yCZZyNs/W8aFn8sYISutaacUP1WHByQKymNeIY27VLqppV35LnR2C3VlvkRrxwS03ruGw==
X-Received: by 2002:a05:600c:6488:b0:43c:fffc:786c with SMTP id
 5b1f17b1804b1-442d6d6ace2mr156353405e9.19.1747123800494; 
 Tue, 13 May 2025 01:10:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de
 ([46.189.28.43]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd34bd84sm198530565e9.22.2025.05.13.01.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 01:09:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 13 May 2025 10:09:56 +0200
Message-ID: <20250513080956.1578804-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747123800; x=1747728600;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hdWYi1XQfdQpmDPlkFSS6Kvy9noJCsSRJXZhzGBkeko=;
 b=TGz9tXZKw5bd5FB+Z3cQl+j8dEuCAwnS9ngE7xg9gnP19NWfcjgWTMqk1/ifbT5jxy
 ReNrPn9zldkRgtK3eVM9wi/VxQzepANx6qNCpExkUckf70pFsPmzWGlM1PvvdgWG/iyP
 bSXecQ9hYQ8ta8dnVNsKDX+qPmzLx35l20B+M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TGz9tXZK
Subject: [Buildroot] [PATCH 1/1] package/connman: fix CVE-2025-32366
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

In ConnMan through 1.44, parse_rr in dnsproxy.c has a memcpy length
that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
than the amount of remaining packet data in the current state of
parsing. As a result, values of stack memory locations may be sent
over the network in a response.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-32366

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...Address-CVE-2025-32366-vulnerability.patch | 41 +++++++++++++++++++
 package/connman/connman.mk                    |  3 ++
 2 files changed, 44 insertions(+)
 create mode 100644 package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch

diff --git a/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch b/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
new file mode 100644
index 000000000000..9651b2dfe473
--- /dev/null
+++ b/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
@@ -0,0 +1,41 @@
+From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=EC=8B=A0=EC=9C=A4=EC=A0=9C=28=ED=95=99=EB=B6=80=EC=83=9D-?=
+ =?UTF-8?q?=EC=86=8C=ED=94=84=ED=8A=B8=EC=9B=A8=EC=96=B4=EC=A0=84=EA=B3=B5?=
+ =?UTF-8?q?=29?= <ioerts@kookmin.ac.kr>
+Date: Mon, 12 May 2025 10:48:18 +0200
+Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
+
+In Connman parse_rr in dnsproxy.c has a memcpy length
+that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
+and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
+than the amount of remaining packet data in the current state of
+parsing. As a result, values of stack memory locations may be sent
+over the network in a response.
+
+This patch adds a check to ensure that (*end + *rdlen) does not exceed
+the valid range. If the condition is violated, the function returns
+-EINVAL.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 7ee26d9ff886..1dd2f7f5d47e 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
+ 	if ((offset + *rdlen) > *response_size)
+ 		return -ENOBUFS;
+ 
++	if ((*end + *rdlen) > max)
++		return -EINVAL;
++
+ 	memcpy(response + offset, *end, *rdlen);
+ 
+ 	*end += *rdlen;
+-- 
+2.43.0
+
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 5d515c296319..c9637eadf5aa 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -16,6 +16,9 @@ CONNMAN_CPE_ID_VENDOR = intel
 # 0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
 CONNMAN_IGNORE_CVES += CVE-2025-32743
 
+# 0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
+CONNMAN_IGNORE_CVES += CVE-2025-32366
+
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
