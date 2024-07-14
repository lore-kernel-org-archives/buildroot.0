Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B311C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E389C811C3;
	Sun, 14 Jul 2024 09:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lZPeXHhhW71; Sun, 14 Jul 2024 09:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F37CE811CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F37CE811CF;
	Sun, 14 Jul 2024 09:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8594D1BF576
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72ADF811CF
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abKRrghM5arh for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:01:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF515811C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF515811C3
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF515811C3
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:01:52 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52ea7bdde68so3594460e87.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 02:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720947710; x=1721552510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQgNCV8zi3y/vMt78FcI+e4lQfbRitntiTvi2qeTGqs=;
 b=moExzI5Ks4zpLQzAQhkK/eyU/CGopcCIiK/tu5lFpGuQf7hAQsHZ3++wklyF/e9rJP
 qqEe2cYEhtjcAJepiRFUYielddoGGWMd1CirlrzgIUjw+kas2UACMHhsMNih20LdlpY/
 Nqa3ErjTCv8yVq7ZQPEc9hkL9CJsqe8+D+/Stv82SYPZuXydYP4wD6MfK9nUU3VOQwo/
 y/DUVAt0NytO5X0zpIkvPOCAsho0RBe40g5q2m4yz99ww7ftOBaUUt8c+8n3EGGfXUuV
 8NEGmrD6AhMf+6uUiasYZuIVPUEmPe5hWsJz7L68J6AcltJqQlIR0CcynI0CaAZHtHXR
 HpzA==
X-Gm-Message-State: AOJu0Yw2xsaZm1s164RkJmUdV+8UVOozgwNQhSGSB0zijrhTOn2eEaYm
 Phh4v+I/W2SLxprokghjpLq9y0HBuH3ADaOFyH0XkTp4xTnSt/zhS7MM+w==
X-Google-Smtp-Source: AGHT+IEOU8IsTCFxTNTm9ooG4UTKL+Rei2+j+m3NswWJm4ahLhk0Om0b7AftdGltCMwvkkLSVQdefw==
X-Received: by 2002:a05:6512:476:b0:52c:db22:efbf with SMTP id
 2adb3069b0e04-52eb999547emr9059273e87.16.1720947710029; 
 Sun, 14 Jul 2024 02:01:50 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24f36e1sm421498e87.72.2024.07.14.02.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 02:01:49 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 11:01:39 +0200
Message-ID: <20240714090141.407553-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720947710; x=1721552510; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dQgNCV8zi3y/vMt78FcI+e4lQfbRitntiTvi2qeTGqs=;
 b=dzFNCoGGS0cWXnt217t5FwZ3M1w3wJxyR6XtXJYnugs/1fUhEoDBOxXmD1kMf7us7m
 p/c/KgR/7v6eeMsrDZ8FqS/icBmGzsU/yFZPXvJFowjuBWAYJBcgDfA5pkmcIrO+TGYD
 wj+xzC2c/IWnKbrbAYWYPx4srJgavAWnj9wAiOGbCfs/KKyOudb03DL3RduaZpaWa3mX
 IE2dsGoYI+MLHPrWRTjNqF0oDAky5l+78PDOJg4ebsI99FxXQwRQ89fhP3xU+cvjJDzz
 pLflIVrQ+79FontlyTkRn84AScMiu2Mb7JqfyS377FcrduXKs0SoHq2Lk49yz0jAjKNM
 G99w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dzFNCoGG
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for package/qt6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 DEVELOPERS | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e48ba20aa4..c76e4a4b33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2822,14 +2822,7 @@ F:	support/testing/tests/package/test_python_mako.py
 F:	toolchain/
 
 N:	Roy Kollen Svendsen <roykollensvendsen@gmail.com>
-F:	package/qt6/qt6declarative/
-F:	package/qt6/qt6languageserver/
-F:	package/qt6/qt6mqtt/
-F:	package/qt6/qt6shadertools/
-F:	package/qt6/qt6tools/
-F:	package/qt6/qt6virtualkeyboard/
-F:	package/qt6/qt6wayland/
-F:	package/qt6/qt6websockets/
+F:	package/qt6/
 
 N:	Rufus Segar <rhs@riseup.net>
 F:	package/agent-proxy/
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
