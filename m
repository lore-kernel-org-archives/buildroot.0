Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B68D0BB5B
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1151D4057D;
	Thu, 24 Oct 2024 04:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VikjFWbEPLLe; Thu, 24 Oct 2024 04:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6BC405EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6BC405EB;
	Thu, 24 Oct 2024 04:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 079862073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA28608A4
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5DYfY9tJCLY for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17F54600B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F54600B6
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F54600B6
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:51:55 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83a9cd37a11so19781639f.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729745514; x=1730350314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=by4bBFI2PBaCFXmlcZZIEhJZ7zaIJP+1c0IYcp71lTU=;
 b=MLtA7LwarF5O5wDV3yMtnuRz27jbDaGMiIIxqBaR095GQhIrcJEUu5xUxjiNXRw2Ar
 ZmUNfSHKTM/rq/6WEsnXS5QvcjeL8pF1Yr3y+pKPGHOzbkCwdWf4znr7BVPptAPBbPs8
 xke4DLDx8Spce27qcVGYn/o6NHqtJjyvvxStjWyxiIqAYuiH3OHNRb4KWJ0NqVoNcpUZ
 X2n3NBmUgBXMq3QhtrW8koWyjmCOUlMMhGYe91puLgr57FNdgtW51gmFbw2dqVvPJIwG
 FrOntEo8g0OSzI8Jex8BtXEjING/LHu0vHH+wcWlYQwguND35kLJnDV0nPZmQpaRz59Q
 +cDg==
X-Gm-Message-State: AOJu0YwehzoCxpW6im9tkI32sEJorDk120F3NkWoylfRvGy0YHc78mEY
 hmo8GvikLmskFeiZCF3UydX3rJ/4hQI8Yd8Xwq1TnB+xFzzRGgy9s8gvJw==
X-Google-Smtp-Source: AGHT+IGpIf1roXQdUrCRcZqmI0WGQlpnevsuOt45MvnwShVLp4qkh8mdM1GFgSLY4lh3U5GBqWmLOw==
X-Received: by 2002:a05:6602:13c6:b0:83a:b79c:66b6 with SMTP id
 ca18e2360f4ac-83b0401eaccmr103261039f.2.1729745513798; 
 Wed, 23 Oct 2024 21:51:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1c64383sm265567039f.25.2024.10.23.21.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:51:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:51:46 -0600
Message-Id: <20241024045146.3378632-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729745514; x=1730350314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=by4bBFI2PBaCFXmlcZZIEhJZ7zaIJP+1c0IYcp71lTU=;
 b=miavX4AFMkqVXVEf4O3GLYTPEJcedRZo21I0H2xTHAL0WtQMyHndDi9hqArz9eXut5
 rwTqJIv+lxLRYC9YbPnt4U5G0S4/mv8qpsPSl2AAP9v7zBgEQMctV3ZtnXjaSbZCmN1x
 IL/YSy53/Up1zlYodJMwsB39IRcVntdESjqJ6fmLo4HvLntV9vLCGEe9bv8YAxiGIxog
 343n6kSoMTs0GrqCH+T03HeY4tZkhe1T9iwrSvFxHyfcBd1U70fpMMMooGjpQmJABIho
 ZuuiWz0ibhszCfofYkWQHe7iQftwYHS+nMbukmrNU7n4Q1qo5lLrzst++UQ+eS+qz3es
 /uzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=miavX4AF
Subject: [Buildroot] [PATCH 1/1] package/python-humanize: use hatch setup
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-humanize/python-humanize.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 196645a28f..4915da2cef 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -7,9 +7,9 @@
 PYTHON_HUMANIZE_VERSION = 4.11.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
 PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/6a/40/64a912b9330786df25e58127194d4a5a7441f818b400b155e748a270f924
-PYTHON_HUMANIZE_SETUP_TYPE = pep517
+PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-PYTHON_HUMANIZE_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_HUMANIZE_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
