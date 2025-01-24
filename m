Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C9C0218C
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 11:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AE56FB59;
	Fri, 24 Jan 2025 11:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiPLwKAZEUKQ; Fri, 24 Jan 2025 11:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 732A46FB52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 732A46FB52;
	Fri, 24 Jan 2025 11:34:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E0294A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E8E081761
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmQ7yyVwlZdv for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 11:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A45A81801
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A45A81801
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A45A81801
 for <buildroot@busybox.net>; Fri, 24 Jan 2025 11:34:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436249df846so13147705e9.3
 for <buildroot@busybox.net>; Fri, 24 Jan 2025 03:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737718477; x=1738323277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ErnkSyJAH0SpEhnUjhzSDJAyKLuN5f3uv9Utm0T+yg0=;
 b=r1CZiLBCULTAD8RsULmxL9D6669sgX8y3pfJCQ+yPbxQHR/zQksjOwbrXJRZrcnSs0
 VWNMngessKdxQmUTiK4apKjl7FeD9p3ajBxAMpWZrVk5VjvrWfk7UgEpvMVcUz3wr7FQ
 OVEXOxcLiwPmOL7bGVKsVXZpVoKdA4wi8BLDyV2XrWIKCVuh53eMXcX05A5rMM/cH64k
 SdESkoOXhKQnCU7atBJpW1WCNrFMJc9+CKOE+qOFqgQKy+00uaftMNE/xgDoTceKe0CU
 saw76kpf4AqRYUcshMjUmaDvyasrM6dU10fzsyXGK2bKkdMSXzZf15WKymr7JN3zK9kN
 58xA==
X-Gm-Message-State: AOJu0YwfpLtIwBFPrUQQxlzYY9lEE6OANwfTpeAXLd02GEMgpMFcUyyT
 nNbhOpUUfLsa0g261oFvFt2tr/xvc56/rNriyxDbZVm716TwVhErCvg/W98MFrUojInVNB/Hawc
 juw==
X-Gm-Gg: ASbGncv8u/BIGAzZ/e2rOsDv2JMtteI2smVAnGDTp2F1iYaL+IK0WOQB4LVnowxoo0o
 0T77kYW8JgAvkhvZswbiXFaQ52N4Q1R6mRQ+O+7D5ihtAVrF0AUNHYbZwxdR6FFhgT/EfLY/77N
 z2+cq4iWuP0R/qpbLRptF4Sg9UknvRfnQ9tMpj3/SzUgk7Lo0/i5O5bnE0B4v3umKuH/TdI6+9h
 bLCmc+xTLDceSooKI7uV/aOX+EGaDDTDojQA/0NfrfUlrGC1ypg66XlWvXOzvjsZ9z6bq3e46mv
 8rAkQsaKSG8HYb2nTDwE290KKszdhvCLgWhJuCw=
X-Google-Smtp-Source: AGHT+IGX0zEV1w0CyhkkG32G8o+Wmbkrs5bwunaKrfXWI1PQ+fQcrX3LzHBzcZIQm9v06bMVDX8Uxg==
X-Received: by 2002:a05:600c:4fc1:b0:437:c3a1:5fe7 with SMTP id
 5b1f17b1804b1-438914340a4mr246642625e9.20.1737718477102; 
 Fri, 24 Jan 2025 03:34:37 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d5easm2382668f8f.25.2025.01.24.03.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:34:36 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 24 Jan 2025 12:34:27 +0100
Message-ID: <20250124113428.2808219-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124113428.2808219-1-francois.perrad@gadz.org>
References: <20250124113428.2808219-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1737718477; x=1738323277; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ErnkSyJAH0SpEhnUjhzSDJAyKLuN5f3uv9Utm0T+yg0=;
 b=AYo+oT6cpHxvzo94F9IkH/PV17Qem5zr+GUh7hHmTgIMU/riNM+26WSOYs9rVikEnP
 GtjlS0LrQDQ8wgarGR9wzpArvUeH1ger+9ECToNyft0iLF2hc0m+n0/EtOqlJ5pKl+xn
 CzIY2Wy3sv+4ykEm9u/eD21MGnl2yaXkQC1p8JfrLW3xKlwQXnIh5wOf760SoBGY1XD7
 xQFc14hPnNB31IeO/O94y+w7PtZj3Oz/rsNfm/5Drqc5U40js5zIWmRQ6mBqUGA2n/iX
 3aGtr09CWRA0b0TvIoflukJqupGWNnwmP4E4jJrphLHL5I09+nwodouuLPnEc/Wv1hxr
 /8pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=AYo+oT6c
Subject: [Buildroot] [PATCH 2/2] package/lua-periphery: add test
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../tests/package/test_lua_periphery.py       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_periphery.py

diff --git a/support/testing/tests/package/test_lua_periphery.py b/support/testing/tests/package/test_lua_periphery.py
new file mode 100644
index 000000000..5b93e36e3
--- /dev/null
+++ b/support/testing/tests/package/test_lua_periphery.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaperiphery(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_PERIPHERY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("periphery")
+
+
+class TestLuajitLuaperiphery(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_PERIPHERY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("periphery")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
