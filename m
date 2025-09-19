Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138C9CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 13:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8C7814C1;
	Fri, 19 Sep 2025 13:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPvjcEq47_84; Fri, 19 Sep 2025 13:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABCB81547
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DABCB81547;
	Fri, 19 Sep 2025 13:38:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD61C150
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAFCD81547
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nszBo1bhOK5K for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 13:38:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.50;
 helo=mail-ej1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDC57814C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC57814C1
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDC57814C1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:38:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b07e081d852so417459166b.2
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758289121; x=1758893921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B02GNJboapnKvOVFfKwXXh2QMGaVQonj6DRNfqcJ5+o=;
 b=JLnlRWSdGnaGJrcc8dFqss9GhgWxxko8xpWxQgj/b70pqCvcpam48T2OYcKWqlQBAv
 WQfMMcOY1CSryGPIIMfoibOLkUZpluN6AKDUaNGV+BBwisZgdEnX0I2pZ41/Ckz+dWdl
 RzBJz84nJkGPU1rF7X07x4WrGc19We4rkAlWYM6frFqhnLPfLgY7y1dQ7oVBcQkM2FdZ
 /utZy4W6+frE7XNt79f0OUeiNCXFrVr7f6KlRWSktrxp8Nc0Oq84ZOlYrzWiD5SvdrYW
 pEGe/ejEZOp/V4kTGjbHBzB9pNNmQAsWlAXLdxGG3tvk28lkUalx3lJ6mUC+FSs1xX/R
 wVaw==
X-Gm-Message-State: AOJu0YywHXXKjEA7TdUjrsbxa/gHxd8cI/w8Fs3f8iAMyyjekYuSMcv1
 ldukivhjjZsawYrazW/mM+tLcOBl2BTl2bKUggeZHHSfrh72rp8dsQcxAQSb5A==
X-Gm-Gg: ASbGncuKZlaoAPEYfc1G00us5khaGhESNlDjmqKUQlyGOak2TWL9dqzwH8jg6agYYNR
 A+2SzhlR6YwWmIGzmTua1+BK46ArjrbXR0nR96FjEdgTeNG6mWQ1VylPqjGlchWluDZgdssRg0n
 AI5DHrrq0fWiNlei4v4jH6a78ia8Fcor2WAyFfYR7CFt7OWJOQ828Z4TfxHg2ACy6Jz0a5e42dC
 caXAewQvFdMdl3OIDdEx/UaTbiUQGjpqXwnFkLQma+zZdKEx+sPstunKlXUATkr61FVJJc82cuE
 TIR9jfSQc+6HEYpg7JS//P1F1LuHiHCP6Xj47zcdHetK4OVJicQ6G9O3RAzGLoBH9ggpJrB9DXS
 Gp/fFaIDycdZQwn7T71F6bV69tjLGATTx7xEPZ0bNgKXIOQ9hDJBZiMz/ehrNzfmUN2uFMSIFxl
 3Mc0Xtlo8LIiwLrsAw1ANjttVUPO+NYT6xKW31R3tMOGgr8XSKRoBUqXdhAC4+UWwiqpGOdrr6P
 VzQ7sYXCeRsjbHeUq+0
X-Google-Smtp-Source: AGHT+IGB3XbDr9jePg5blXlCM5TVHE9ZafKGe4oD6sh+qKZ8kjcidar1aDZl06c3UKCPV5jAyHOH4A==
X-Received: by 2002:a17:907:2d21:b0:b23:f884:fe72 with SMTP id
 a640c23a62f3a-b24f2ecdc8dmr331310966b.41.1758289120355; 
 Fri, 19 Sep 2025 06:38:40 -0700 (PDT)
Received: from
 codespaces-b7c665.m1k4x3cq3poebda54cltipn05g.ax.internal.cloudapp.net
 ([20.61.127.52]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b1fd2814abdsm442638466b.108.2025.09.19.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 06:38:39 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Fri, 19 Sep 2025 13:38:37 +0000
Message-ID: <20250919133837.7065-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] utils/test-pkg: allow to override the default
 build directory with an environment variable
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Currently, there is one way to override the ${HOME}/br-test-pkg default,
using the --build-dir argument. But when doing frequent test runs, it's
just easier to force it with an environment variable, so add it.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 utils/test-pkg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cea7ace7cb..32b2486b61 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -89,7 +89,7 @@ main() {
         printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
     fi
     if [ -z "${dir}" ]; then
-        dir="${HOME}/br-test-pkg"
+        dir="${BR2_TEST_DIR:-${HOME}/br-test-pkg}"
     fi
 
     if [ "${random}" -gt 0 ]; then
@@ -271,7 +271,7 @@ Options:
 
     -d DIR, --build-dir DIR
         Do the builds in directory DIR, one sub-dir per toolchain.
-        If not specified, defaults to \${HOME}/br-test-pkg
+        If not specified, defaults to \${BR2_TEST_DIR}, or \${HOME}/br-test-pkg.
 
     -p PKG, --package PKG
         Test-build the package PKG, by running 'make PKG'; if not specified,
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
