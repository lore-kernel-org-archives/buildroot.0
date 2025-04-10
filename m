Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F2C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FD1241739;
	Thu, 10 Apr 2025 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0W9zlIaxPiE2; Thu, 10 Apr 2025 20:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DC44125A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55DC44125A;
	Thu, 10 Apr 2025 20:18:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA77108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE48A608F6
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5kIIaM_Tv8w for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 20:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D05D61081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D05D61081
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D05D61081
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:18:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso730259f8f.0
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744316328; x=1744921128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Smtc0jllqWgudQEvMsfxl6Dhu3bDF8OCMbVuMk7yZpM=;
 b=uypv4aKCH7iiYJJkzsV9CLHtrPyQ/ax5IRtM2K2C0sYLfnaC/coCwVRFvsB5YSZUW3
 2vC8xXZIw4aQNVxALFZ48/sl0x+Cew/hFkXJj3bsq/NbHLwI9aSpvruosyb7dWz2avzl
 3aG9wXFL6Rr18vzWPIkk/nSY9wV3OBdWjRPYaB5BNvCLPB0vYlpCQCrdbZGugK2icTtH
 UUslPelMHZbtuGz56MeJx6nrLK8Qawlnxg/j1O2lb5yCVSQSxtv513Y2XBxCb9RkHlqY
 jOc+/A+Fo7RWfXCZjCKcu4fm7Xl2sM7vKKmmVhtkStQmBuL8AFqdo95QWgYXN6z+qw1g
 sMPA==
X-Gm-Message-State: AOJu0YwX/kFNFuA8/bxCDdbGH29hI+b3Qx1jfXdyO/vjNg2Gc+yW5m0C
 pUVZeuuPh572mhpxCFYJhupCAmIzo0cAQH/71SZM33mNCp8NNZKGnOxWmj4PnZWKB393VScPx9d
 L
X-Gm-Gg: ASbGncudf6C3Ty5sA4n6/mb6LpYiDSNG3QkK4EVLvfm3nBJdDF/V2KZcSkVE+YamBlp
 fHxlOO8sBvJ1GoHB8GP++sKo/bQfsehp+rAy1j4eXjF/tJDDBSH06n1xuk26hvgTa+QMgrhy3S8
 OOc6RKa2UpowNFGSbK/TIXeY9TZkGdI5fNQV0qKttYCrSyx9y3/Ue+OiRRM9MwK7gJGJJWyS43N
 Cuh7h2GOUNfnUTfE+gP9ZrRbGSLg1OB7Oif3BRzctNyFesjTy7+cwBW9ute4zw+IquOxGaq1Lrf
 cQe3WFSy3j1BXx21jj/zREalQ/Fl3i3AeWaSCnlAu6WhUyBV8+stJTo=
X-Google-Smtp-Source: AGHT+IGDnS1wf24n8bYG+FoRAYN2i+65NpD4X0wniaguyVKUlEr6RXj+mSDGjy7dLipDm7WXYBLr6w==
X-Received: by 2002:a5d:5f46:0:b0:38f:23f4:2d7a with SMTP id
 ffacd0b85a97d-39eaaebc709mr50470f8f.40.1744316328098; 
 Thu, 10 Apr 2025 13:18:48 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89362cecsm5777173f8f.11.2025.04.10.13.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 13:18:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 10 Apr 2025 22:18:01 +0200
Message-ID: <20250410201801.1150764-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744316328; x=1744921128; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Smtc0jllqWgudQEvMsfxl6Dhu3bDF8OCMbVuMk7yZpM=;
 b=TKhdb/2wvydZu7lJ7C2keYa9+CAV6O9g2BHN4Yv/vh386T8DHakbgvzf01vTXHrPGj
 e62JvFX8O/Uo7XdHKkheR1UqpRqVsQQV2L+xZ4nCVADOw4d3e28UDy0FWRhUSdk9ZWXy
 aa7bZwzkuh8N59ua8+wuEjlfY4wJ611EjmGDm6YhxPIYTv+3Y/1fE+6wCgy4Vvil1n4T
 OsMgpTaBiUCzft4zZizBOV8/30Ro3fNZvgUa2JlLYofv65gJf8nhUFiz3FqvGWOdWFtg
 e+i9fczXkfZT+lGCzt+AZRreGxPPIUgwjolGCHFShgH2M8163vdxRLuvRe6GVvCQT/Vs
 Fnlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TKhdb/2w
Subject: [Buildroot] [PATCH 1/1] package/augeas: add upstream security fix
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

Fixes the following security issue:

- CVE-2025-2588: This vulnerability affects the function
    re_case_expand of the file src/fa.c. The manipulation of the
    argument re leads to null pointer dereference

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-2588
  - https://github.com/hercules-team/augeas/commit/af2aa88ab37fc48167d8c5e43b1770a4ba2ff403

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...rror-was-set-yet-parse_regexp-failed.patch | 77 +++++++++++++++++++
 package/augeas/augeas.mk                      |  2 +
 2 files changed, 79 insertions(+)
 create mode 100644 package/augeas/0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch

diff --git a/package/augeas/0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch b/package/augeas/0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch
new file mode 100644
index 0000000000..0716211387
--- /dev/null
+++ b/package/augeas/0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch
@@ -0,0 +1,77 @@
+From af2aa88ab37fc48167d8c5e43b1770a4ba2ff403 Mon Sep 17 00:00:00 2001
+From: Alexander Bokovoy <abbra@users.noreply.github.com>
+Date: Sun, 30 Mar 2025 12:27:04 +0300
+Subject: [PATCH] CVE-2025-2588: return _REG_ENOSYS if no specific error was
+ set yet parse_regexp failed (#854)
+
+parse_regexp() supposed to set an error on the parser state in case of a
+failure. If no specific error was set, return _REG_ENOSYS to indicate a
+generic failure.
+
+Fixes: https://github.com/hercules-team/augeas/issues/671
+Fixes: https://github.com/hercules-team/augeas/issues/778
+Fixes: https://github.com/hercules-team/augeas/issues/852
+
+Signed-off-by: Alexander Bokovoy <abokovoy@redhat.com>
+
+Upstream: https://github.com/hercules-team/augeas/commit/af2aa88ab37fc48167d8c5e43b1770a4ba2ff403
+CVE: CVE-2025-2588
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+---
+ src/fa.c       | 2 ++
+ src/fa.h       | 3 ++-
+ tests/fatest.c | 6 ++++++
+ 3 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/fa.c b/src/fa.c
+index 66ac70784..4de5675b9 100644
+--- a/src/fa.c
++++ b/src/fa.c
+@@ -3550,6 +3550,8 @@ static struct re *parse_regexp(struct re_parse *parse) {
+     return re;
+ 
+  error:
++    if (re == NULL && parse->error == REG_NOERROR)
++        parse->error = _REG_ENOSYS;
+     re_unref(re);
+     return NULL;
+ }
+diff --git a/src/fa.h b/src/fa.h
+index 1fd754ad0..89c9b17e9 100644
+--- a/src/fa.h
++++ b/src/fa.h
+@@ -81,7 +81,8 @@ extern int fa_minimization_algorithm;
+  *
+  * On success, FA points to the newly allocated automaton constructed for
+  * RE, and the function returns REG_NOERROR. Otherwise, FA is NULL, and the
+- * return value indicates the error.
++ * return value indicates the error. Special value _REG_ENOSYS indicates
++ * fa_compile() couldn't identify the syntax issue with regexp.
+  *
+  * The FA is case sensitive. Call FA_NOCASE to switch it to
+  * case-insensitive.
+diff --git a/tests/fatest.c b/tests/fatest.c
+index 0c9ca7696..6717af8f4 100644
+--- a/tests/fatest.c
++++ b/tests/fatest.c
+@@ -589,6 +589,7 @@ static void testExpandNoCase(CuTest *tc) {
+     const char *p1 = "aB";
+     const char *p2 = "[a-cUV]";
+     const char *p3 = "[^a-z]";
++    const char *wrong_regexp = "{&.{";
+     char *s;
+     size_t len;
+     int r;
+@@ -607,6 +608,11 @@ static void testExpandNoCase(CuTest *tc) {
+     CuAssertIntEquals(tc, 0, r);
+     CuAssertStrEquals(tc, "[^A-Za-z]", s);
+     free(s);
++
++    /* Test that fa_expand_nocase does return _REG_ENOSYS */
++    r = fa_expand_nocase(wrong_regexp, strlen(wrong_regexp), &s, &len);
++    CuAssertIntEquals(tc, _REG_ENOSYS, r);
++    free(s);
+ }
+ 
+ static void testNoCaseComplement(CuTest *tc) {
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index ac4bc7d0be..88e96a91bc 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -14,6 +14,8 @@ AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
 
 AUGEAS_CONF_OPTS = --disable-gnulib-tests
 
+AUGEAS_IGNORE_CVES += CVE-2025-2588
+
 # Remove the test lenses which occupy about 1.4 MB on the target
 define AUGEAS_REMOVE_TEST_LENSES
 	rm -rf $(TARGET_DIR)/usr/share/augeas/lenses/dist/tests
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
