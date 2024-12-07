Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8A4E7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14953606D9;
	Sat,  7 Dec 2024 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7NeCR-KuYn5; Sat,  7 Dec 2024 20:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1917A606E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1917A606E5;
	Sat,  7 Dec 2024 20:34:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2D0FECA
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E09B3606E5
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXJOeRsGkI69 for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 20:34:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAD41606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD41606D9
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAD41606D9
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:34:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso834161e87.3
 for <buildroot@buildroot.org>; Sat, 07 Dec 2024 12:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733603684; x=1734208484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwmEHKArEaOch3VShXJ+abVh7c9YbbvsqDRyTCzcxCs=;
 b=exqXoVBenNsi6VbK5kq6mV20bl+bqmiTNw1Rk8qYZWIR5poRyKY3nZYLGvf23NY3yY
 cPLWj0fQ6nt5DGfPI/RgY37Taa3t6wQSibaC/5P+05jcCYpBBbJJsVxY3Itl/PMBFMPW
 pCqJSSEOd16vdn05wXnL6I0TGmU0K8moTNyeCeJ83zPWWf9c4H9bjyjVE7dL1Xod9Zm1
 PePTu4zKiwboxPZJhOz7p7/UeL65dCNHlEiLa+B9OAi8RhMjpRNUDfEsbw9glU2zYevy
 SL3l/bBqJ/OLWl7JrKdOBh8tN0e1S+2FJk2s6FXc0dmir/CfuPMmshItJNHio17IxBzE
 r3GA==
X-Gm-Message-State: AOJu0YxN0cyxi5YyBcd1v4ju48Pq+vPzdb/hWE8CbODc4FU0Y2O8Etlp
 AFtzRS2W229i43lG/k6j8QLzfWRCOHHcGCOK0kI/CyS+eFI9JWWnN98dIax3
X-Gm-Gg: ASbGncutbk1QFGb2GxbaaocoRBJZ7hI7Cv3PKTPiU/iZOR+tLF5LTs7JLuKIMnstdLL
 LRXwDr0ngjRf2loO+99AX1Lr9t7m/sjlacPkZtbmm8IeXBQXjE6CLNOcHJFnJzvEpxev9cCPzQL
 ehxDzyg2iRaQG5Lvv1Z/RaAwKT+L5GJqEF7Aqtlt4fCnujjgNsmrzFcYay4Ou7xmF/16i5UQ3wH
 VDy0vITXRA9GylaTHt/QJNLjAhDRJuJYlhCG/LsV8m49b74xohrRMkdCpwq
X-Google-Smtp-Source: AGHT+IHAEaP7WOf7sRjLFWs6U6UnptBE7ArtVsfBwijuVwa6pePAD5EXI8PTS4UarfDwTe+xA3kMsw==
X-Received: by 2002:ac2:44db:0:b0:53e:350a:72a6 with SMTP id
 2adb3069b0e04-53e350a749dmr1615294e87.53.1733603683549; 
 Sat, 07 Dec 2024 12:34:43 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5401b7ad992sm35800e87.18.2024.12.07.12.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 12:34:41 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat,  7 Dec 2024 23:28:52 +0300
Message-ID: <20241207203438.597639-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733603684; x=1734208484; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HwmEHKArEaOch3VShXJ+abVh7c9YbbvsqDRyTCzcxCs=;
 b=ciiQvNKAhAKmN0sqRMoQnl2+ZzyC5KOKJrUQI4teYhNbvMq5CfKqM2s6YfTUqwJHWq
 AAkbjR0ZM4XX8AFXBtk6GNoI4zHKrbqNec6glaFYUgRGvFm7k7VszjyEWwCz7RB7nvoC
 Y9aTKo7IuXImRBSyBMWsgJyt57KUjoNVcqR8/RglGWHasF43gqLDQlajOLDEC3xiQoqt
 UJSHqupl3g06p8jE83LgUTA33Y5eWHo0ZBTp291MDKDCh0FFC7qkQb8bpL3qTB0sOZml
 6iF4IwoqDLQjq/kUKnEl8QZCf36J/gPWzvghyWCIJbx0Mod5SLSz1ZaJAll6jqpB4lEF
 bLZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ciiQvNKA
Subject: [Buildroot] [PATCH v2] package/elfutils: enable zstd support for
 host package
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

Buildroot fails to build Linux kernel configurations where BTF support
is enabled together with zstd compression of debugging information.
The reason is in host-elfutils zstd support being explicitly disabled.
So enable zstd support in host-elfutils by default to fix such builds.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---

v1 -> v2: rebase and update commit message

I already tried to send this patch back in August. But it looks like it
might have slipped through cracks. So I rebased and re-tested for v2.

 package/elfutils/elfutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 8738af7751..1a1aca37b3 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -12,7 +12,7 @@ ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_CPE_ID_VALID = YES
 ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
-HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
+HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz host-zstd
 
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES
@@ -26,7 +26,7 @@ ELFUTILS_CONF_OPTS += \
 HOST_ELFUTILS_CONF_OPTS = \
 	--with-bzlib \
 	--with-lzma \
-	--without-zstd \
+	--with-zstd \
 	--disable-demangler \
 	--disable-progs
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
