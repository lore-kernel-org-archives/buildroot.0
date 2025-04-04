Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF79FC36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 15:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71F5A40884;
	Fri,  4 Apr 2025 15:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pW7b1YyQv5r; Fri,  4 Apr 2025 15:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82367409DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82367409DA;
	Fri,  4 Apr 2025 15:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E08531C7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 15:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C72EF40F98
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 15:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wtk5-2OI7lem for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 15:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C3CD40F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3CD40F3B
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C3CD40F3B
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 15:42:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so359540066b.0
 for <buildroot@buildroot.org>; Fri, 04 Apr 2025 08:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743781334; x=1744386134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6ydVhVR5l+ZO2/mAol962GkZtoXyS7hmJiKR1tw6v8=;
 b=IRHsrLq4HuMVUyozAbUiYv5yTovw9qsU7RoM6o38SnhfNiRU2xGZ9jK9WwlqUIWMqk
 vgk80KdsAGM7DI3myLYqNnuuA50WV+GU4/GgxYuuDLYF+7mbKdtit5PMEYkYe3+mRlSm
 ZCRilLrC+RoXNWo4Fq09qhmqWZZglPyM22TwYmN0PjzGfJYva4M+hYGLb7pvXzQTsvKP
 3+XyLbDgpuQBFU7/Y8hQYRXq8Bf0UvRwZhVlDddiYbJrKg9HyL9ydD4ech5zvBKKsLg5
 w6enn9zM7i3nVIBXnHNL/qgERsr8zDS4ONzbVnpGuQ5U4X3cpugKXBGWAMeRlHgEarGU
 jIHg==
X-Gm-Message-State: AOJu0Yy5Z/2XWxQzkA1x9onBof/TOavUKvG+3KgbgEIa1sdXPFxdBBpl
 sWiRwyqcE96WLothKicJ97GyMR7u3PK9kCzK4O/VNVhAR7IF/RRWeQ15T/E03qRKybeb8puooUR
 n
X-Gm-Gg: ASbGncvI/J4JQa3kKaiNCruUBKHsSzwEi1NEx9YZ8O3E+PCP6eN3sa+6X075IIeCYay
 3LhRj/5nGA/u7/1nsmK5r41akr2MskJH2G7FgJW/OQdiHlWJeKuheaUQV98kZcjDcWLNhbzOB5B
 mEqCyUv1/MA3GVA3krpK5jieSDGek+MFo8LZ9577S5H3a6PaiT534bDY84uUjlDj61MSShtsr4u
 rBGtAFwQ5dg0jMfyYnnyIt6xFkr2ICCh+EMImL4LtgN7eP3YJZzHe5+hdi6NpmSOJD0NSeT/HIx
 6I3m8BLJkh/fjbK9fBb3dmGZ/Yw+O7ylS7eigUwUsyDlJU5r/aPooyZg7v4=
X-Google-Smtp-Source: AGHT+IFuOkN15YKjUX1vsnfCIQPy+VwlOFnQzf5YP45iTUYemOofiCaDgg9F/7A1XDAGCHR2QM1fEQ==
X-Received: by 2002:a17:907:2ce3:b0:abf:6f87:c732 with SMTP id
 a640c23a62f3a-ac7e7226254mr4133766b.20.1743781334456; 
 Fri, 04 Apr 2025 08:42:14 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfe5c5d0sm274050466b.35.2025.04.04.08.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 08:42:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Fri,  4 Apr 2025 17:40:44 +0200
Message-ID: <20250404154044.49664-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1743781334; x=1744386134; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/6ydVhVR5l+ZO2/mAol962GkZtoXyS7hmJiKR1tw6v8=;
 b=Bu1btShO5M8HibwjypJ7TEPOwnxu+YG5NSsZKLh/bCp3fxA2eptp8TOdAahhbt++22
 b0KFQWAhBqQmvv1dsRdNQ9mUGZfXmbX2NVTW6UO/seR+ZtQRr8U1lUNUMZONrmheevrR
 5sznOhk1+3LHFMxzgXLhHg7oYHNtak8c9TbDVCDafM8xA+fP+PmTKRx4gxXKcBUlNLXI
 6npt0eHukEqQbBumAfUi7DzOgDPKjCvF4ATfeodPctBFoBrl1HTzkGe9KTIAxIV2ZAHR
 zzbqBpN5Na+xAwrjPsVzEdimmMI4hOVl5rJ7BUuyHlMNPp2cX+rXMss2UdwVs8OD0PSK
 WtxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Bu1btShO
Subject: [Buildroot] [PATCH 1/1] package/dillo: remove trailing slash
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

Commit f2a862fe60 (package/dillo: move to github) changed the source
site for the Dillo package. This change introduced a trailing slash at
the end of the URL.

This cause an error when running `make show-info` with `BR2_PACKAGE_DILLO=y`:

```
package/dillo/dillo.mk:46: *** DILLO_SITE (https://github.com/dillo-browser/dillo/releases/download/v3.0.5/) cannot have a trailing slash.  Stop.
```

This commit removes the trailing slash.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dillo/dillo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 5a823aa4a3..802be84717 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -6,7 +6,7 @@
 
 DILLO_VERSION = 3.0.5
 DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
-DILLO_SITE = https://github.com/dillo-browser/dillo/releases/download/v$(DILLO_VERSION)/
+DILLO_SITE = https://github.com/dillo-browser/dillo/releases/download/v$(DILLO_VERSION)
 DILLO_LICENSE = GPL-3.0+
 DILLO_LICENSE_FILES = COPYING
 # configure.ac gets patched, so autoreconf is necessary
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
