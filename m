Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31282C0218B
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2EDE60751;
	Fri, 24 Jan 2025 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wsnOeOHPtE7; Fri, 24 Jan 2025 19:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 052236079D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052236079D;
	Fri, 24 Jan 2025 19:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E66B944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F060041A70
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZYI4rJmapvF for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:38:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B348A410B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B348A410B4
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B348A410B4
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:38:33 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844e12f702dso66198239f.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737747512; x=1738352312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9myzJWP9/a5UPTSkLEAJH5JS1HPWbZXA8trcyiKEmrs=;
 b=rAAtHZixv/re4Ty3CsFptcummFLu8z9u3RjjdHencUwCokLITeyDD5g+VqxCuhgG57
 8HKr1bpwPiq1r1jvAM/Cl6qBNL/nMF0Iv7VBz+PUf0UOduyv7r6v3xl9yyl7YrACDrL+
 IAknXHvNJfxYwxr2PjXYTpJPVv+Tc0zTJ1ToXqekFQs6yKIdnFTnnkfYs9uOFiw51JN5
 tQLDip90yKv9sYiStdrQDx+zGsKZE9MLkVJntyW+WmO+SjR43avD6yOd2OAL0qAoLYEQ
 c2OTkdEQRwj4FK7IcWWRJbUi2XY9uFHqxCzqN2Fd3Ep32Ik4z50CA1aQ5J9HHwQLn97A
 h4Yg==
X-Gm-Message-State: AOJu0Yz6Jv3Tfyn1w5N4dou4YrjCR02QJT4Gh/dvOcaqmksKCv7B14ri
 mPte3gdqdO9G7w/EVyAI6epJ5cUzHxeMS50z32Qaazc4dpBvUUFOUcf3oXjl
X-Gm-Gg: ASbGncuPTRkach978thvNvARyQRQ+v7ja/xru0annV6TiyY9P7im+liuPlY+kSjcEjm
 XRUTfFGSTv4YRaj2rdDbRVxov1rRrmrSD2rPGC7KqpYOeSISA01ya7P0c+pXlvQmK6Ml7iLF2Jj
 HWtPz+C7aqU6I+NP2skIye5tVuFyaeMLidvyALUDRpmfrJAB/3Q/jtb/eBg9pHatJA1mkX6yq0G
 M1PW0+s/ViPGPFqtqls+fSOO3z4LQPradPBJo344ZBBNHjH+IJKoC6jc4nlEAbhaT4kAqaJNZVO
 jwV35btvetnFa//5SuXGnOVFqlQzfjyJy4E1Z3OPwaBzSOECTSdKvyw=
X-Google-Smtp-Source: AGHT+IHeEubb8AnTV/G3S2zjMRAe+hzx8UvMDZu8um1JDRcQto25V7WbLqQ1DwWU/ZT4BEiysuyNsw==
X-Received: by 2002:a05:6602:143:b0:851:f176:97fe with SMTP id
 ca18e2360f4ac-851f1769d97mr1329024939f.6.1737747512355; 
 Fri, 24 Jan 2025 11:38:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1dbb1532sm802892173.139.2025.01.24.11.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:38:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:38:29 -0700
Message-Id: <20250124193829.3818109-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737747512; x=1738352312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9myzJWP9/a5UPTSkLEAJH5JS1HPWbZXA8trcyiKEmrs=;
 b=JMW/NEpcAkwp88/Wtf4iZzS7Q2RL/CKzu+Xh00n6hUZjrJ0oIZd5GE/wW47FptrDvz
 6mkW7fQbmzdx18ckGs4iMjMqgVl17yUvQIna8JmhZ6DuQnW2MSSqqkZVX/rlGeE0vL9Z
 Ibngxwwcgyr0XRb+hkuAkV6BhE46WSJhcZ5eTCsLrSp0dIVtr0jtIQkx6CxGhPri5O8m
 oxsR+xzb+viNIR0MqDAR9Je2bx+6kXRNh/Vf2HOG73sTucUo3ZgyWJ9aV1lN6LU+2jsL
 xoZit7wd07hVWCKS1OP+eeTWS9EzvSGIikw8ihCh/Aycf99lyuUz/g1vcNsraMsPrbLX
 ZTCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JMW/NEpc
Subject: [Buildroot] [PATCH 1/1] package/python-legacy-cgi: bump to version
 2.6.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-legacy-cgi/python-legacy-cgi.hash | 4 ++--
 package/python-legacy-cgi/python-legacy-cgi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-legacy-cgi/python-legacy-cgi.hash b/package/python-legacy-cgi/python-legacy-cgi.hash
index 063483a1e8..53af4ef691 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.hash
+++ b/package/python-legacy-cgi/python-legacy-cgi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/legacy-cgi/json
-md5  82a61ea4905ec03f07cf24c586623fa7  legacy_cgi-2.6.1.tar.gz
-sha256  f2ada99c747c3d72a473a6aaff6259a61f226b06fe9f3106e495ab83fd8f7a42  legacy_cgi-2.6.1.tar.gz
+md5  5750721070ad829796ef830308e76907  legacy_cgi-2.6.2.tar.gz
+sha256  9952471ceb304043b104c22d00b4f333cac27a6abe446d8a528fc437cf13c85f  legacy_cgi-2.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
index 8e6e3e7bd4..457463d9dd 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.mk
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LEGACY_CGI_VERSION = 2.6.1
+PYTHON_LEGACY_CGI_VERSION = 2.6.2
 PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
-PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/48/96/ff14ad0f759f2297a2e61db9c5384d248a6b38c6c1d4452c07d7419676a2
+PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/ad/2e/e1860989bc6cfdecba66db37f2f783636b97a1248ac25fbe864b6e931c22
 PYTHON_LEGACY_CGI_SETUP_TYPE = poetry
 PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
 PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
