Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D3C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 12:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E98C4096E;
	Wed, 18 Jun 2025 12:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFPLFuFSmkvG; Wed, 18 Jun 2025 12:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 089D240941
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089D240941;
	Wed, 18 Jun 2025 12:32:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4E8B16B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E5A80648
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAc1zF3Nawym for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 12:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yuce.kurum@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D07F880F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07F880F75
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D07F880F75
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:32:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so4205839f8f.3
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 05:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750249950; x=1750854750;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7hXvrvsN2d5lnORGQP93rHiT42aw2R62bf8f6bBqYJw=;
 b=oy3fwOXP7tW5h+XwCizoS8iOQ3l3A1+dsGq4M+Xag2CSBfqzENvU4oLegAGriMpCFB
 kmdJG9goGf9DPpE0sNQI1C52fqKAQ0tf/xhF6GWuyysVPx8RatdF2lT8Z2ltayEuk2OA
 9wi7KfOCGnA9U4dbQgWugC/AfXA9HsBPGbf6XjfuRSJbB+Ye9QLteEqHlL7ajjwvW9ih
 NIrNFs3q1IetjvFFU4Lj2rvBmuNaQNln8okTgPIHAw8o+8hbK5tCQyjho+gpCOW2wh+f
 VX/UaacJurGUaC9+eURZVnZVIfNrS43ahYYRPXzNrmRy6+qCYGm7nlF5o5mLg+iuv5r4
 swEA==
X-Gm-Message-State: AOJu0YxrNqpyEbqIxZmRtpfIwE4M9zI61vTkGamwbPbMjURz0v78MIQr
 W0a7PJ0DzMlg7YL7lQyGWSQdQ49XpIYbGrqImyfBzxJZQMbDOj0nQ0E0T3n/m5ywQho1+2L3RGc
 l94iw0Jc=
X-Gm-Gg: ASbGncvFgJ9lGL+tAc6lCfYWF0gSgSKOn1rnI8Hpskqg0za7cwwzuhQ/Xx9YRr7JxSv
 S+gHcjNSvV8/Ta3CukzdQLNyXWW7fDBFKu89auG9aSJK93C4QtB7Dip9mSTRvF91aJJB/kqwGH+
 Bvp34W2rhxWBeNNdZo4VLJ42ONuHZ9w0J/UkObmvScKodO3BhZLE1dVBwX1zRV5YLrjVnAeBju+
 XdA0PBjus7UQ5FWNsDy+6WpOod307QFCuVQfhzabYcGF8a272ucUdqokoJWdoIHg/pok9lKK5Z0
 lxPYpl3AH5S24+1bc82dVZUU//5EoQP+4IYH6+6l8h9cw7zXV5cygL2tk1Cv0+FMvE/RT47zBoG
 KjWO/TcCNV9eUYuT5y9FPdvaP
X-Google-Smtp-Source: AGHT+IFx8OPNozN4huvkVkD54c0s46i8RYsx9FTiIHfWiyKpPmWHuLxbENEX7AJT7kypPkNH0lx95w==
X-Received: by 2002:a05:6000:144e:b0:3a4:eb92:b5eb with SMTP id
 ffacd0b85a97d-3a572e998a0mr12266260f8f.50.1750249949360; 
 Wed, 18 Jun 2025 05:32:29 -0700 (PDT)
Received: from yuce-lenovo (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e09c21esm204172215e9.17.2025.06.18.05.32.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 05:32:28 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:32:26 +0200
To: buildroot@buildroot.org
Message-ID: <aFKx2lzT2l+lmXtM@yuce-lenovo>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750249950; x=1750854750; darn=buildroot.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7hXvrvsN2d5lnORGQP93rHiT42aw2R62bf8f6bBqYJw=;
 b=UXl3BjIjDCxcJh/iaYKyxc5jUJsJBA5sWY+Fz10x2uXUBnu2YZjs7UOsVf1wO4LcRz
 KyhVczYBnXCUd2pQsNfSlU+x48wbzC28FmsQaayI8036kYvq/ivrcVcZnCK8oM2fiewi
 SLsamneLriAA2vIUgqvfvgZlt+URTQHbME0K4RI4V9ibFBoy3SaIRUsk+SMImWjZZYaT
 ZyGeia1aZfBrogyVtdX+QzX5DQP/A24Duq5D3uCZtANdKVT6r4oo2ZVINoKE4wwhWvad
 w0CH+6EwtGgrilJ4hf5gMaddzH+hEYGOPf4rppvPGBgYUnw71IQ8Ph/1vKuRRBs0sKPO
 kIyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UXl3BjIj
Subject: [Buildroot] [PATCH 2025.02.x] package/jq: security patch for
 CVE-2025-48060
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
From: Yuce Kurum via buildroot <buildroot@buildroot.org>
Reply-To: Yuce Kurum <yuce.kurum@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security patch have been fetched from the Nixpkgs [1].

Fixes the following CVE:
- CVE-2025-48060: jq is a command-line JSON processor. In versions up to
 and including 1.7.1, a heap-buffer-overflow is present in function
  in the jq_fuzz_execute harness from oss-fuzz. This
 crash happens on file jv.c, line 1456 . As of
 time of publication, no patched versions are available.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48060

[1] https://github.com/LordGrimmauld/nixpkgs/blob/df21c79bfbb4d5ea50a49231bb8f91ab7afa051d/pkgs/by-name/jq/jq/0005-Fix-heap-buffer-overflow-when-formatting-an-empty-st.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Yuce Kurum <yuce.kurum@mind.be>
---
 package/jq/0003-CVE-2025-48060.patch | 50 ++++++++++++++++++++++++++++
 package/jq/jq.mk                     |  3 ++
 2 files changed, 53 insertions(+)
 create mode 100644 package/jq/0003-CVE-2025-48060.patch

diff --git a/package/jq/0003-CVE-2025-48060.patch b/package/jq/0003-CVE-2025-48060.patch
new file mode 100644
index 0000000000..f2905274f2
--- /dev/null
+++ b/package/jq/0003-CVE-2025-48060.patch
@@ -0,0 +1,50 @@
+From d73a79035e1d24011a3363d52bf36b4eaea67aa6 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sat, 31 May 2025 11:46:40 +0900
+Subject: [PATCH 5/5] Fix heap buffer overflow when formatting an empty string
+
+The `jv_string_empty` did not properly null-terminate the string data,
+which could lead to a heap buffer overflow. The test case of
+GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit dc849e9bb74a,
+but another case (`0[[]|implode]`) was still vulnerable. This commit
+ensures string data is properly null-terminated, and fixes CVE-2025-48060.
+
+CVE: CVE-2025-48060
+Upstream: https://github.com/LordGrimmauld/nixpkgs/blob/df21c79bfbb4d5ea50a49231bb8f91ab7afa051d/pkgs/by-name/jq/jq/0005-Fix-heap-buffer-overflow-when-formatting-an-empty-st.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+Signed-off-by: Yuce Kurum <yuce.kurum@mind.be>
+---
+ src/jv.c      | 1 +
+ tests/jq.test | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/jv.c b/src/jv.c
+index 6e8cdd3..3303286 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1121,6 +1121,7 @@ static jv jvp_string_empty_new(uint32_t length) {
+   jvp_string* s = jvp_string_alloc(length);
+   s->length_hashed = 0;
+   memset(s->data, 0, length);
++  s->data[length] = 0;
+   jv r = {JVP_FLAGS_STRING, 0, 0, 0, {&s->refcnt}};
+   return r;
+ }
+diff --git a/tests/jq.test b/tests/jq.test
+index 10b20e3..680706b 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2042,6 +2042,10 @@ map(try implode catch .)
+ [123,["a"],[nan]]
+ ["implode input must be an array","string (\"a\") can't be imploded, unicode codepoint needs to be numeric","number (null) can't be imploded, unicode codepoint needs to be numeric"]
+ 
++try 0[implode] catch .
++[]
++"Cannot index number with string \"\""
++
+ # walk
+ walk(.)
+ {"x":0}
+-- 
+2.49.0
+
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index dbd69f0b16..e21e4376ea 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -17,6 +17,9 @@ JQ_IGNORE_CVES += CVE-2024-23337
 # 0002-CVE-2024-53427.patch
 JQ_IGNORE_CVES += CVE-2024-53427
 
+# 0003-CVE-2025-48060.patch
+JQ_IGNORE_CVES += CVE-2025-48060
+
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
