Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79423C5AD5A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 11:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA6A811C9;
	Wed, 12 Aug 2026 11:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gtzc9pmAt2u; Wed, 12 Aug 2026 11:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1511811B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786534397;
	bh=JQnom5h8mYV2xm4F1DFK5o5AV6/BwLzdHi4YuVACPCY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=S3KQqFLvoLe7e+k54n/SGFWrXYyWNgATQPeqBEPE7LQBqW2AOaFbtmrjTh91Hl2ii
	 lAoqVM2wIqQ9EW6ihi3iToprC0p7nIRiuNikS7/GjNXUJT+aL9MKdofQKvgQGLDxH8
	 NGBaoeqbboiQIIMlI4wkxzIklVhYzkCjyts5zPn5qGNkcRfKHYoNxaUdSfbzEYwOGD
	 EDj1SaxTnaEiGSimNRB1nOTCT+f9YrtYWWMu1Cgl/hfblaq1EBegEqx0fugFHNuVQt
	 nG/P97trxQpIfTSm86srFAewiRvuxVP50z0l3N8jHj1txFCn1ujH4hd0A4iu67xyIp
	 NYBm/0E4ij60Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1511811B5;
	Wed, 12 Aug 2026 11:33:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39CA91F41
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 11:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B3A940856
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 11:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BaPJKd0oJym for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 11:33:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02BAF407A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02BAF407A2
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02BAF407A2
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 11:33:14 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so452598f8f.1
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 04:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786534393; x=1787139193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RIwgvUfcwe2Q2gIn4Reh3M5JHxg9gVGH0JjwQDAeEPQ=;
 b=CJqqJNds4DilfBwLXiLxLFqIyskDJsgZJ8tpvOvMcB6qY73KfvXo578MNTxVXqrSbF
 dCyoxQNTFgbX3ayJD41CAYKcUtHpNLdkv0tl8+9u0NBfV+mTkp43NMeAFRffajxSTTjl
 Vp7tpfW8S1/TQ09vnkVifHy1jimzXiK3FwzBnhSmJMwE4HVq/PufXWXMkfONw0i8k7iv
 ikwng5QtdWBNgTbb4Puity/NSfBPbaIwfzr54E8ytDbr5tKtkoeKXFM7vJ+px43zHbqr
 xbiK/w1pEFWGIAuDI8s+9FPOzT70GfpbicbSP7YPJqej1uUFvO8xlW9lcufNXjmeCfD5
 03Ew==
X-Gm-Message-State: AOJu0YxED0ZolyfXyL8dABz5hsny/sK2MYgG86LYGIWi6HUYaJ1zscHC
 Jpj+R+NzquZEM6T34vOQGoR7f/09OOgN5JIg4oQPMUl772HcZBhgbGveZfMD1Knll5A=
X-Gm-Gg: AR+sD10OMmIVlGb6+sMn4pXrmK09LcU/dZNkHBQcoGfItSLyDH4ttGIJzvfscgZ3tl/
 bXM9Ci6aEXobIKPZnsQbi+tcZJP6RgfCDB6qKvYq6Brgvo34iJCwCZs8BvZjo5yF9dPuVAnPF3q
 AfcPTb15gxDCLcSK8IBVzN6hgnI4T2qLnNMg+m60KsYQnAjOlOnB00nfMEx+E6CGiAVkf7B0W8o
 3iPYKanWutVedU7331nQk7bsqNpkWNZEx2K6rhyNWYy/RHEi5meX4e2XeDjB/1GlnKbU3PcH1cB
 JFFxEjzhQd8e88VQFJsAlWzW09u1OFPLFHsFG78NzoSPIu7gkVAhWfnFTEKdknsTsiBjGmI2eGd
 CRmzi+8icZTPADhX9j+6WFiRrEQcipmO0LyEL5y1fqTdfUxgLtGAYEAWFOJ7+W0kXGNdBHpSbXO
 iBks9KwjvsqBEyB1RkbAWVnriH4ymEPvWwS6r8paRm9DOjasCAf+XxCprbgkKUj3LlHg==
X-Received: by 2002:a05:6000:18a9:b0:47f:8ce7:8684 with SMTP id
 ffacd0b85a97d-481528bfcb3mr6113259f8f.6.1786534392337; 
 Wed, 12 Aug 2026 04:33:12 -0700 (PDT)
Received: from localhost ([37.101.131.182]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4c10asm6625240f8f.20.2026.08.12.04.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 04:33:12 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Aug 2026 13:33:04 +0200
Message-ID: <20260812113306.353838-1-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786534393; x=1787139193; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RIwgvUfcwe2Q2gIn4Reh3M5JHxg9gVGH0JjwQDAeEPQ=;
 b=E4y1NXCwrvQUiTKyumOhdl7At09Qlt9sb8KRBG00nadMaOAfZGTa0g1j+OGUS7yJ6z
 2z03maoVtWTzpP1rwscY8lyH+WeqYiJtvojTh1YoePkj5rvu+Mskj2WlC10RSYrTgq5q
 /IsvLuNeB9RMcL0CRIM28x9bvktixB6yCo2S8PGDuLNC9ln3Ybn8qPn5iIbF2udsW8ni
 cdgqdghKbcA51vWig3yo1fVtGKJLqQbrTq6aMGH9jcWxiN+Bp2lgduVEj6pXVogmZZ53
 r2EbC3kynjoj7+Y5lnAPbD4gejFr/FU2rLgQxi4LmnK5w0x1AHftuzmydHJd+BS/ePTl
 jFjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=E4y1NXCw
Subject: [Buildroot] [PATCH] package/ser2net: backport security patch for
 GHSA-cgh5-39mg-vhfr
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
Cc: Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- GHSA-cgh5-39mg-vhfr: Path traversal in authentication via unsanitized
  username allows auth bypass
  https://github.com/cminyard/ser2net/security/advisories/GHSA-cgh5-39mg-vhfr
  No CVE ID yet.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 ...0001-Fix-authorization-path-handling.patch | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 package/ser2net/0001-Fix-authorization-path-handling.patch

diff --git a/package/ser2net/0001-Fix-authorization-path-handling.patch b/package/ser2net/0001-Fix-authorization-path-handling.patch
new file mode 100644
index 0000000000..a90130844f
--- /dev/null
+++ b/package/ser2net/0001-Fix-authorization-path-handling.patch
@@ -0,0 +1,89 @@
+From fa6c2a8840cbc8d7622e46ce12ba15ecc0fb51b7 Mon Sep 17 00:00:00 2001
+From: Corey Minyard <corey@minyard.net>
+Date: Thu, 23 Jul 2026 10:51:25 -0500
+Subject: [PATCH] Fix authorization path handling
+
+The username is received from the remote end and thus untrusted.  Make
+sure it doesn't have any characters that can cause it to escape the
+directory it is supposed to be in when constructing a path.
+
+Reported-by: TristanInSec
+Signed-off-by: Corey Minyard <corey@minyard.net>
+
+Upstream: https://github.com/cminyard/ser2net/commit/fa6c2a8840cbc8d7622e46ce12ba15ecc0fb51b7
+
+Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
+---
+ auth.c | 42 ++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 38 insertions(+), 4 deletions(-)
+
+diff --git a/auth.c b/auth.c
+index 95c80b4..53c3186 100644
+--- a/auth.c
++++ b/auth.c
+@@ -185,6 +185,40 @@ handle_auth_begin(struct gensio *net, const char *authdir, const char *pamauth,
+     return GE_NOTSUP;
+ }
+ 
++/*
++ * Construct a secure authorization path.
++ *
++ * filename must be at least MAX_PATH.
++ *
++ * "username" is untrusted, the rest of the data is trusted.
++ */
++static bool
++construct_auth_path(char *filename, const char *authdir, const char *username,
++		    const char *format, ...)
++{
++    size_t baselen;
++    va_list ap;
++
++    /*
++     * '/', '.', and '\' are all parts of things that can modify the base
++     * path.  Don't allow them in usernames.
++     */
++    if (strchr(username, '.') || strchr(username, '/')
++		|| strchr(username, '\\'))
++	return false;
++
++    /* Get a good base path ending in / */
++    baselen = snprintf(filename, PATH_MAX, "%s/%s/",
++		       authdir, username);
++
++    /* Now append the rest of the path. */
++    va_start(ap, format);
++    vsnprintf(filename + baselen, PATH_MAX - baselen, format, ap);
++    va_end(ap);
++
++    return true;
++}
++
+ static int
+ handle_precert(struct gensio *net, const char *authdir)
+ {
+@@ -228,8 +262,8 @@ handle_precert(struct gensio *net, const char *authdir)
+ 	}
+     }
+ 
+-    snprintf(filename, sizeof(filename), "%s/%s/allowed_certs/",
+-	     authdir, s);
++    if (!construct_auth_path(filename, authdir, s, "allowed_certs/"))
++	return GE_AUTHREJECT;
+     err = gensio_control(net, 0, false, GENSIO_CONTROL_CERT_AUTH,
+ 			 filename, &len);
+     if (err && err != GE_CERTNOTFOUND) {
+@@ -258,8 +292,8 @@ handle_password(struct gensio *net, const char *authdir, const char *password)
+ 	return GE_AUTHREJECT;
+     }
+ 
+-    snprintf(filename, sizeof(filename), "%s/%s/password",
+-	     authdir, username);
++    if (!construct_auth_path(filename, authdir, username, "password"))
++	return GE_AUTHREJECT;
+     pwfile = fopen(filename, "r");
+     if (!pwfile) {
+ 	syslog(LOG_ERR, "Can't open password file %s: %s", filename,
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
