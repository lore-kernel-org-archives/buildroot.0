Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A8D31778
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27205406EE;
	Tue,  5 Nov 2024 18:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osNokO7NntJU; Tue,  5 Nov 2024 18:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9AFB406F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9AFB406F5;
	Tue,  5 Nov 2024 18:09:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D21A720EF
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E8040042
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0acTUfRqHvCD for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 902BD40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902BD40139
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 902BD40139
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:09:00 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a4c303206eso19985435ab.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730830139; x=1731434939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tr0AN300uixRbJ6SiWyb0hSD4N+TBxnSj/g7qAITXjo=;
 b=N0GskYK13MbYedVci3j15zVB+DS9/9ZlAtHCS1BLB2nURA/hy2adiB2JFDTs2n7H3m
 g7zC0l3u+2vb7NNglN1NT29/5uP5JXO29c2NZwzO/AhL401cnn1GixIghqQWxEOb/JCP
 tmDy/WCtl+G0dZ4z9JDDjIzVrQlozwdObKU/E3FT+9Cptm2mmgdml87FD899RLJwfCsa
 V7k4jcY3rJO/CJUpVEBm8/M/YJNG8hgzmefYW5sR1DuBwpE+65Y/6hMVZgNHg6sigJOn
 coYs0OwSGaaIL7ZmDHLx3Yknib9KWtbPyYI4+89YVxRG2cIOfooyERbCt5TgS1oTpTXT
 lXng==
X-Gm-Message-State: AOJu0Yyv1jujx7btjjXuqBCt/AzdhgF8Eyi+YDgsQhj5e5IhLjNf6tiv
 0EPy7V3MWmEEqQnUN0DYHa26GKOaTGzckIrkK7VrPo1mi6I2T9fLsqYXxQ==
X-Google-Smtp-Source: AGHT+IEXML4qKIi/IcpaL9TweVRy08wOU2zj3l+tRMaU8x3rFWfUJ7RMccEPMpFYKvJw5MdnUMMHBQ==
X-Received: by 2002:a05:6e02:216e:b0:3a4:ecdb:d61d with SMTP id
 e9e14a558f8ab-3a6b02c72e1mr181368705ab.8.1730830139263; 
 Tue, 05 Nov 2024 10:08:59 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a9a2a2c8sm29645045ab.70.2024.11.05.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:08:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:08:57 -0700
Message-Id: <20241105180857.1411063-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730830139; x=1731434939; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tr0AN300uixRbJ6SiWyb0hSD4N+TBxnSj/g7qAITXjo=;
 b=gTXUOjjYtlQE+estBGg148H/q3VINXUtu0KiU+0E2+bM6FEiWJzQ5gp+kHodw7PUA5
 Iap5zh9yRR8Q6AOVeO6zwJLMbfvBgUmZuRR4BojWS8Fj9LQ2zinhwap/nR1W4okOxmUe
 C3T3gYqNf+bdDSDG2ciRsOPBdjZwXY8mghaZ0KHwxeFbf1NHXNAbIvuhw1AAEpAnbB3/
 qFGfgkj83iJ+HWBAriwUSZcyjM3I19VdJthVQIqFGWNWHTb6pAyHNbWNtPH5JdCTJ8Cz
 9cO+voE7eUCv1C0yMaCYGptEzDt+1X0bKLR3muT9kpSnwtnPtaqpSH4Zr/Xohck512dd
 9JRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gTXUOjjY
Subject: [Buildroot] [PATCH 1/1] package/python-legacy-cgi: use poetry setup
 type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-legacy-cgi/python-legacy-cgi.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
index 63a6b1c971..8e6e3e7bd4 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.mk
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -7,9 +7,8 @@
 PYTHON_LEGACY_CGI_VERSION = 2.6.1
 PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
 PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/48/96/ff14ad0f759f2297a2e61db9c5384d248a6b38c6c1d4452c07d7419676a2
-PYTHON_LEGACY_CGI_SETUP_TYPE = pep517
+PYTHON_LEGACY_CGI_SETUP_TYPE = poetry
 PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
 PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
-PYTHON_LEGACY_CGI_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
