Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE38D31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2452B40513;
	Tue,  5 Nov 2024 17:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZI0X93pi-Mo; Tue,  5 Nov 2024 17:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4BC24038D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4BC24038D;
	Tue,  5 Nov 2024 17:44:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D80A1723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C54EC4019A
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlDqjgao01vc for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B676140042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B676140042
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B676140042
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:44:13 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f37so235568439f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730828652; x=1731433452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MWzLaMdiZKS4CEowVfJaoDLMnCu0kztG9phaodQ2K30=;
 b=a+r9mOr7ze2z2dwjPZtKPZ1zyB1ICZaSHnzal4jkuZRX6Am38DSNbYAxjffWfD/ZUS
 oEMILFfQ+AhrMQ/rZrB715CBR+aDfHdVENyaznLV3K3FNjO/9FEMunebtq0ikHikvKwi
 DBoTvLLjmDjJ8JqzWSR0OrY3Ow/YguS25OG2pGxuA1apBlSGv982ENycKPsIunTDUHOn
 eIhPnvYYm08VYQpJRw3G+iPdFWwE5SNdMCVPg6803Ujluwj++6JJUhMFH7eyCZdCGOLS
 5NW0N33t22rghuzmR9Y+KlbRJ6J6Js/wC/SJCHVSGicviParKpPB4JxTfMiMGxAbhw/7
 4+qg==
X-Gm-Message-State: AOJu0Yx87TjIGmePjJiFD+fU3/Yq5wJyiYvkUIGrXWvmlzBdBi3gzB0M
 glUZBvplIEVO5NaBdF8i8yZyup5glFuwAlSWftjNqVhElCj0uWggm5ic5A==
X-Google-Smtp-Source: AGHT+IGMkwwOrHMd+hbabktWXbZCWTIRJ3b+ZrgpoNYShJNQ4RzG/t9UUcht2FWUvt1qXotktZd1jg==
X-Received: by 2002:a05:6e02:1567:b0:3a6:b445:dc9e with SMTP id
 e9e14a558f8ab-3a6b445de24mr167988215ab.4.1730828652588; 
 Tue, 05 Nov 2024 09:44:12 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6c34a7741sm18039965ab.12.2024.11.05.09.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:44:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:44:10 -0700
Message-Id: <20241105174410.1397628-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730828652; x=1731433452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MWzLaMdiZKS4CEowVfJaoDLMnCu0kztG9phaodQ2K30=;
 b=GnRWkyaXu54/De908chXdtB+9/foO8yeJtObgAxMliHokT4CCCOmWg/3+H10DnwWO/
 yA5033kHaLyr7jySrjbMyrmJcsORXvKHctPCsZWz5i4Mn06PP0v9pbwjceZuFM2ZBgUL
 9mVLsPwC05IG9HCKGbXMGOJLGoEkBmKNEnGfp0yjRjgELNMdkVEt7jfhyGJranDDOcnN
 twrO/fo1Qt108bAtACdo7a8Rb72A7uzDvQTk/Id/9isAS0+7uqvmuLBaX0zGYKhUZCBo
 ThQMn7dhpoEziICAj+fH5CEm7CtTmEywUHtmLXl4wMvE85wS/f7Tn8OT8mCup/mcdwdi
 sNlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GnRWkyaX
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: use poetry setup
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
 package/python-zeroconf/python-zeroconf.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 970633c269..973339b418 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -7,12 +7,11 @@
 PYTHON_ZEROCONF_VERSION = 0.136.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
 PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/82/e4/17075a9f1951b031dfd92d57916505574e0d1eab3f2fb7deecabd2be581e
-PYTHON_ZEROCONF_SETUP_TYPE = pep517
+PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
 PYTHON_ZEROCONF_DEPENDENCIES = \
 	host-python-cython \
-	host-python-poetry-core \
 	host-python-setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
