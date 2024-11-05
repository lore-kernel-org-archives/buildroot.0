Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD43D31767
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 16:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521D080A7B;
	Tue,  5 Nov 2024 16:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcphUxiE_OI6; Tue,  5 Nov 2024 16:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6237580A7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6237580A7E;
	Tue,  5 Nov 2024 16:50:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 863D43B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C4C80A52
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cPJm0Fuxjpt for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 16:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7158E809EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7158E809EE
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7158E809EE
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:50:00 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-83b430a4cfdso269857839f.2
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 08:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730825399; x=1731430199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lIppbeNpyIMrHcljeeGV1h0TWbWHCkuzo0gb/R+4oAg=;
 b=LZhqqPPhUxwvwbphyZH1JSenqOYEHHDTHNjafJNmvzUixsQKJqAr6/FvVQxzGdtcBp
 MQ5ncFFW7eOai1QssI5UPsRuMZaVqey6UEOzOyqZzBpKNzyZVzlDHrX+7Ipcwdari+ah
 JD36NSJta8boJON0bm/6zt5ZEnljWtVjGv3w/qaplaNBdrgkY8K8S+acZuEh81xJyN5q
 DPzIYgsA84cnSOIvf1E5zcpnIHZ0gnvEVVykLyjMpQB3AoA5/2l+JvUaL21C71zW/W9f
 jDUXJPUjHcFbhvfJjcKjJRX1DvUV+jaorZtLwgQT3KEYWl55Ul7qw2N75poQaVgcQfvF
 r4FA==
X-Gm-Message-State: AOJu0YxoTwGkLPgjnXgqIqfegZD30QlRnnGYVhy1O7AUL1KZd9vn8qM3
 VA1Kq8e5lS0hEYbbaqezVXquZ5c8LtYMDO4guCBwJ/4f/LkAIerQwQoasw==
X-Google-Smtp-Source: AGHT+IF8P57EF0v1Miul6wIA+z8y5svCl581uivCQ1fIbVzRuEPR+Wi68xQz6L6KAk2cMvJHdJ92rw==
X-Received: by 2002:a05:6602:1555:b0:82d:129f:acb6 with SMTP id
 ca18e2360f4ac-83b1c5d8e3fmr3865830439f.14.1730825398928; 
 Tue, 05 Nov 2024 08:49:58 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67cd14a6sm272111539f.47.2024.11.05.08.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 08:49:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 09:49:56 -0700
Message-Id: <20241105164956.1382995-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730825399; x=1731430199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lIppbeNpyIMrHcljeeGV1h0TWbWHCkuzo0gb/R+4oAg=;
 b=Oef9SdHKakr9MAsIefyvT1a6rFeLiHE+ogjRAmIWrWXbMdpMbBsWkfLgPbKSUDEtPa
 7spiw1Y7cWNJYV4SSVsMzlKTInMuXEb6fDvIdMn352OBHdYr9j2jcqhcdLrfFWVnOtjb
 F0ol6YAj9TyykAt6ffCb8jgba8yt0iYL6uZUBnMyY81T5sEIENwWkuhZggq2HJQ1rph9
 QDqHs4oZryTzkyDrI58PAu2WadOJYhteH8XWyQNe84ZWJjhT4bnBJzAPSoodho0JcWpV
 Syl2WT3/YB2HofWs0u87w2JzoF4oU95S6l/gmA4Gd6lLkO0bLDGGfgGyMPc4BwYpVXXE
 R1/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oef9SdHK
Subject: [Buildroot] [PATCH 1/1] package/python-tomlkit: use poetry setup
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
 package/python-tomlkit/python-tomlkit.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index 0b1d32c374..79138d69e8 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -7,11 +7,9 @@
 PYTHON_TOMLKIT_VERSION = 0.13.2
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
 PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/b1/09/a439bec5888f00a54b8b9f05fa94d7f901d6735ef4e55dcec9bc37b5d8fa
-PYTHON_TOMLKIT_SETUP_TYPE = pep517
+PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
-PYTHON_TOMLKIT_DEPENDENCIES = host-python-poetry-core
-HOST_PYTHON_TOMLKIT_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
