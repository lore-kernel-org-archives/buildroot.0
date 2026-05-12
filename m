Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B5FCD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 09:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D002821CE;
	Tue, 12 May 2026 09:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1B_bG-QsJZe; Tue, 12 May 2026 09:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6945C821BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778578283;
	bh=Vf+YdATDq6uuXX2OxeMFi7mXKYcKSj67lABvpBJH+hc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=J6RT/bU9JwSPZ/Gfv0cdq2hYS+uaBVBHyxQu3P2bYO1dm9rN1Db0inMLKf3fjXFua
	 7F1H+eYh13U6ftYk6aSBOrbkhUjN0UL8o2s/OwbiDrOn98ZAbpyDmSqXUJQgKs1egj
	 4n4DN+2xlKbZcARX4yKeK3SDAMS2ajZabRvnHelcoP3WoeDqHrCL8auZnjAeQ/Fd98
	 q5RonkekIh+LNx5K4cpuI1oHgu8yiIYeE0M55RDKf+y97OCnh++e9d7FfO6FmxjyZU
	 WRh4qULNSxEfim6ai4ioxHL9dcFsECRmsQFaeaQpTKA2cYASF2xPegefdh+PgjSJU4
	 1rLa/YyCqVzXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6945C821BE;
	Tue, 12 May 2026 09:31:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EDB7223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2135940E50
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgyZwGm_rDv6 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 09:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AE7140BE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AE7140BE4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AE7140BE4
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:31:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488ad135063so42562755e9.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778578278; x=1779183078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGaCjAYRwBxlosLc/3IFZANuriHmErlMfIADepuee2E=;
 b=NT6+xurYYKDYW8NWOGbSiBVjg5vjAeZG1lCSKX8bRbTGSWlcONx9pTf45sLIY9e9Ad
 RPLkih71jmq+BC4/ItV5YXmbvKszNnluDauH5z39lvSuNnROoWq+UIUZI3Qsn+mGhOsT
 2aDhPHHpe/HaXKQi21yNPmkJ47mByOQqbb0NP9w8I3Kz0GgNbefpJIX4JdHy98D04eIy
 gRiwl1A1DV29RCrAmCASw58053BkpNbvVR+JXYCTVDXYjNVLSbMyzXwOyJj2+kubFz8w
 MplWX6QzbhF8KpC3xfUzT69jGs+/HmQsE+YiTv+oz7v96AnydZJHNCc9OO/zOspzuOKZ
 BNnA==
X-Gm-Message-State: AOJu0YwW8kMg0t6EmTIytHF7GUIAzZHBLJz8ziPc0be6c3lU3CPnPAzO
 qdtFpzmMmSQunlGCyVSnkhWbtheconrfimlXmLLf4KJ1v5DQ4nFVzDRr3PhVGsNCBQjsSg8RGVN
 S7tQq
X-Gm-Gg: Acq92OGQKezvilitsjj3S49O/OzpF6yJu43sXSweMzoKc4ird1v2l+GLvY5ZYJzAo1a
 VCPouPOAdFZC/rVqx7m064By59saN7AiS2d9llsh3JiV2niSn9akRpANvbok50+vDXgwaa6lt3j
 rbCbSHILeHvGfKdtonYlQ8YJZneKjsJdjtc5wkpie1Ej7kt2QwJ7DbABINDlvgxa+Za7FMgMdll
 9wV5qJhEXCL/8tgVxnZeRpLcLloWZ3chlSOgflc9v/akBgt+OgDRh23KHOZoTWlv2428Awu8JSN
 e/lnveiHtQnvvLb38PaN7vi1M5xDMv8OG6t/ulKQiCijrs42exaJpjsWafjHViMvlgBiLPWT2q3
 /CU4cRqO+LGSNjKI6QwSkbVub2r3PXAGzt8/tJEj7loYUYEta4MambAtK9NYq8bL7iJHiHgqS8s
 KbZbrLw7RFsX/i05yd1DV5VbRW1us8pO/U5+g9sz/Bvx5+
X-Received: by 2002:a05:600c:35d4:b0:48e:74dc:999f with SMTP id
 5b1f17b1804b1-48e74dc9b4cmr233850945e9.6.1778578278220; 
 Tue, 12 May 2026 02:31:18 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48ec8184114sm1881135e9.36.2026.05.12.02.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 02:31:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 May 2026 11:31:13 +0200
Message-ID: <20260512093117.154895-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778578278; x=1779183078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bGaCjAYRwBxlosLc/3IFZANuriHmErlMfIADepuee2E=;
 b=M/kyGctUZ6I6EZ0jt0KKzTvBQR0BLUvs2EabyRLHNcwV1GImL140jyYxopMEs9c0Of
 1ZoD5pJTS0lMfuVGBCweQYTHdk6pk1t9BjNjoqpnZb+znio6ztCJviafLLY/ZvCGrLEv
 SgLWLBhm+muLIYo1DrwfwdZxFOkaCHSFTJ+VXesbxmGvFiqheu7UDxZqin7tzPrRPPgt
 GGolQeRi3E962EvxTpQsZzjQ2mvZIgPNph8W5BWfqh44PkQIEJMqCL9do5n1lKTuoflS
 2zqacDxYmcD7gu/U4TFceIBb3TN+LZR+axJoBRi5ZUlRXYb1aG2jWtKaPzoL5dlUH7G5
 3gEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M/kyGctU
Subject: [Buildroot] [PATCH 2025.02.x] package/sqlite: patch CVE-2025-70873
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

- CVE-2025-70873:
    An information disclosure issue in the zipfileInflate function in the
    zipfile extension in SQLite v3.51.1 and earlier allows attackers to
    obtain heap memory via supplying a crafted ZIP file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-70873
  - https://sqlite.org/src/info/9766b47beb9ec72f
  - https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sqlite/0002-CVE-2025-70873.patch | 30 ++++++++++++++++++++++++
 package/sqlite/sqlite.mk                 |  3 +++
 2 files changed, 33 insertions(+)
 create mode 100644 package/sqlite/0002-CVE-2025-70873.patch

diff --git a/package/sqlite/0002-CVE-2025-70873.patch b/package/sqlite/0002-CVE-2025-70873.patch
new file mode 100644
index 0000000000..a5b8c901a5
--- /dev/null
+++ b/package/sqlite/0002-CVE-2025-70873.patch
@@ -0,0 +1,30 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+Upstream: https://sqlite.org/src/info/9766b47beb9ec72f
+Upstream: https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a
+CVE: CVE-2025-70873
+[thomas: backport to 3.50.4]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ shell.c |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index de401b89ec..e2640fd874 100644
+--- a/shell.c
++++ b/shell.c
+@@ -11184,7 +11184,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 667ee8d70e..1335d0dbb2 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -13,6 +13,9 @@ SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
+# 0002-CVE-2025-70873.patch
+SQLITE_IGNORE_CVES += CVE-2025-70873
+
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
 endif
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
