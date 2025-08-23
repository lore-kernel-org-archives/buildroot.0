Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEB9CA0FE1
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 15:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A9861349;
	Sat, 23 Aug 2025 15:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNuy9LXg5agq; Sat, 23 Aug 2025 15:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29B5461342
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29B5461342;
	Sat, 23 Aug 2025 15:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70D4271E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62EFB4147F
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOdLgHhvQMZm for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 15:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 656B841465
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 656B841465
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 656B841465
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b0d231eso16917605e9.3
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 08:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755961547; x=1756566347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSQqVwM+1LVlc/mU1H4h3TAPD3FaT9rNVpkX4QCzQZY=;
 b=Fa8Co1mg8xK45fg9pogLEcq7+7BTNls7sZgEcnLjSFfGj6ZHOD/VQcRJa7LdUfbUvl
 H3mWHcOYi0x6h4Mgjk5JDEKgleFKTuu1gv9A713nzgQNWQXOhWZbNTqtidnjVIu57asn
 gTtB/nhiDm5AUrYZEsdTRPGafBbspxzrJ9JaIapa8myNz0vLLcEWRT0LITTrWuQJfd5w
 FC7O/r2J679UUIU+EIkQHFo3a3GHH6weISURt+X/LTUCpgY2QyjhPhskh0s1ERwcVgjr
 lM5PL+1NstgnVZquV9oEjNongMYSS/xTzeD+HIUKws6EuKyl7tsvQcokYt0bPYVT5xxQ
 dofg==
X-Gm-Message-State: AOJu0YwHD9TfY6DxqJIR30ShKA6WIDkHxa+ib2IsBq2ulbxh9CTi28Me
 TrGwdPdmv+k6aUbntsKTwb6KfuCvNNYdDtRzUSd5RLDA/f1ntrXeTGIzOudgG5hOzhdCXXa5iox
 Hs6de
X-Gm-Gg: ASbGncvGcHYMLXAyOTqgv5B0ZelVezQ+JADrjjUhZpeuewBy9AlAw7TjC+XNUX5xxSR
 DpbFz2s1me5v8H0a5VMyXSvLBTzIu1Pyx8fuKiaUfUIUe2cSgeKgVxAO6R/vPdlQWpFk5cHdYpN
 iwNMy8GLnbek4yVKgRvwnSDuWbmKVLpj/P5libDWdYwqkVx6L6RYkx2dGln9tN2K3H1fY1eCYtw
 K5EkdXYj5Ej6mQoMkgYRpo5OaBg0I51gjP1HEOx6cdR1tLpNLy8iSqkt9+y8gGQOYvvBOtJJIjb
 c+Lzhlk9WUPvUj2fEbm8Zhjx8VHLtn88yNTbtEHhoJq4eX+05vM8MyqS6jxSRfSZWLInqC+jFhK
 EYoLcvhFw6bqT8ZUp8PZLvIeJ2qZnD5BlkJ5j2zPYmqVZP9Oh4dkyG6UzChlrPjnI+/FZJbHOzs
 MLV/okvbbaBUANqvM5F1+9
X-Google-Smtp-Source: AGHT+IGlc3xrsUHSMAiGR7MNSHRSGYOM32VCoAWznIRMTMIO5bdZS6rgAIbkclOqXKOk34yLR03mSQ==
X-Received: by 2002:a05:600c:3ba3:b0:456:24aa:958e with SMTP id
 5b1f17b1804b1-45b5755a6famr25789105e9.0.1755961547352; 
 Sat, 23 Aug 2025 08:05:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711d9f389sm3833503f8f.60.2025.08.23.08.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 08:05:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 23 Aug 2025 17:05:42 +0200
Message-ID: <20250823150543.3233205-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823150543.3233205-1-romain.naour@smile.fr>
References: <20250823150543.3233205-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755961547; x=1756566347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSQqVwM+1LVlc/mU1H4h3TAPD3FaT9rNVpkX4QCzQZY=;
 b=yRr74h22Z0WKrg6GQykWoZHK3W/JL0XJgQ08mUwRc5KpgVbsCIA7T8clLkPGosuUQ0
 wUtMoTejusB4aeZXAhcyEgcloGBKTlgqS0Eppw1rCzgsjQ6BqsO3pjdop5xiDKSeUnMr
 uw0ANkeh8DzpSHQ3gBoFD9nE6VGrVhmHjfOz8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=yRr74h22
Subject: [Buildroot] [PATCH 3/4] support/testing: TestLibCurl: replace
 thttpd by Busybox's httpd server
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to remove thttpd package from Buildroot, we have to replace it
from TestLibCurl.

Busybox's httpd server doesn't report server identification, update
TestLibCurl accordingly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294712

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_libcurl.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_libcurl.py b/support/testing/tests/package/test_libcurl.py
index b326f9308f..076a5388ca 100644
--- a/support/testing/tests/package/test_libcurl.py
+++ b/support/testing/tests/package/test_libcurl.py
@@ -8,7 +8,7 @@ class TestLibCurl(infra.basetest.BRTest):
         """
         BR2_PACKAGE_LIBCURL=y
         BR2_PACKAGE_LIBCURL_CURL=y
-        BR2_PACKAGE_THTTPD=y
+        BR2_PACKAGE_BUSYBOX_HTTPD=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
@@ -45,11 +45,9 @@ class TestLibCurl(infra.basetest.BRTest):
         self.assertEqual(out[0], msg)
 
         # We download one last time, showing the server response. We
-        # check we can see the OK status and our thttpd server
-        # identification.
+        # check we can see the OK status.
         cmd = f"curl --no-progress-meter --dump-header - -o /dev/null {url}"
         out, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
         out_str = "\n".join(out)
         self.assertIn("HTTP/1.1 200 OK", out_str)
-        self.assertIn("Server: thttpd/", out_str)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
