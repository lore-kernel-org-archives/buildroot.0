Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E845E7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E38660714;
	Thu,  9 Jan 2025 21:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3W73Su1xALNc; Thu,  9 Jan 2025 21:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B2D8607EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2D8607EB;
	Thu,  9 Jan 2025 21:52:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A14942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C243A60714
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8_2VhLZNhoY for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:52:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8FA160ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FA160ABB
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8FA160ABB
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:52:15 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a7e108b491so9745095ab.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736459534; x=1737064334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+HXkF43VwziLC8tyNVskoD0LvXxoiIl1slQVWPuKYhI=;
 b=kigszLmZLSIIkMpRLXaLUXvlAk3BUM/D6KjM87lQQb4zTk6FVXdyhB64yykcBcnd9N
 MCQ1OT46ayq4PxpbrH6fo8124UhGKO5A0i0dzr00l78Tx5w4lUSZyqBHHsS9HeoI0qnR
 IzmQ6LEboiMWzHajbVI6BZPTRSGD7SFmb5ngw/YBrtUW65VSpy1sOni8eKOXvg1S4DE7
 8Mw3TifXH6xkWbF5eh83FckRX+wa0tP6FLjAYbX3w/dqF3KXX9zYGm8H/hUefos0kmgN
 eK71MlUuHq429GjpSIbi6yjwhs6YAyBqtm02VkhrPKF73NI6stvrqTic0HF8L1WQ9Xaj
 NRCQ==
X-Gm-Message-State: AOJu0YxbBI+Ka3fQM37efx65bYw0SLxfZ1Pe+wK3fs1+nNbjYIhwWm6p
 PxQdWeU+T+T8WuAgBwC23IgEBwwKPLoKrW7+JyzmV+r1ePLLl9wvDsReKG5i/4s=
X-Gm-Gg: ASbGncuWXBc1XpmvEj5e/Z71Ap5j2T/6gE1hhG4N/33rTksvDNCEqQC1n/YYfsgYZXR
 Sq0t5IaJYqyofh4RXsWxD46yn//GdD9hHaZz9Ay8AzsEsm5pdYUUkdgX43aBCOSzBZDkaDAINNb
 50uhiBrWgYlfkUlL+9iw5VIYALvthgzTI+gaauoo5GGm0rWlh+lnEVmQZbUfhMfnp2eZlqNeVBS
 SPHqFxnznT8FGokWmMW+zyubazUXoCW+BwoeY+hHGwnk6fxeRvdp3L//jx1x2BOBUbmzuWgOPj/
 cpTs0j2ref8UhIlX8cfiV+xVV3krPSo=
X-Google-Smtp-Source: AGHT+IHgQFhY0y7S1r6S18uDOSfUC81FNlP4YGaU0yT+i3Wh6AyQ2unbOAsd1IECZlk/YuMnQE1eEA==
X-Received: by 2002:a05:6e02:1c8d:b0:3a7:e0c0:5f25 with SMTP id
 e9e14a558f8ab-3ce3a9a477fmr65204765ab.4.1736459534592; 
 Thu, 09 Jan 2025 13:52:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adb3dc4sm5924695ab.22.2025.01.09.13.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:52:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:52:12 -0700
Message-Id: <20250109215212.2424478-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736459534; x=1737064334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+HXkF43VwziLC8tyNVskoD0LvXxoiIl1slQVWPuKYhI=;
 b=JFrvfgeswOp6pXStnOC4+LEc9uT7y5YjC7yP/WdpdShXRPEA+/o9oZjQ5ZZxNgxBPx
 Q5Ozwer8ZBtrMikmSgnw5zLg0idP/iYKMhM4p58E10afJ7EDgC0yRZurvkWaObupcJWd
 njFKIVz1aSZi6UtmmHuaLjjJRQ7qOylfLCZk182CWO+4bqGw4qnOJoWGfIt8/9Nwzyeh
 /pZj77A/m5NBo6YKTZOmgJbcLUy57U+Fgff9KFEtfZRv8ODfb6Z8AZO40LNvJGtpgej8
 CAJVyJeVf8HaS2K/hSsNotAPdeIRifalaBgPik5xdSRl1oIM3g0TevZe67pHK9LHvp9X
 HTeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JFrvfges
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version 3.1.5
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
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 2b32f5cce4..a89c63a0f4 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  02ca9a6364c92e83d14b037bef4732bc  jinja2-3.1.4.tar.gz
-sha256  4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369  jinja2-3.1.4.tar.gz
+md5  083d64f070f6f1b5f75971ae60240785  jinja2-3.1.5.tar.gz
+sha256  8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb  jinja2-3.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 780b693281..9b95b3212c 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.1.4
+PYTHON_JINJA2_VERSION = 3.1.5
 PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/ed/55/39036716d19cab0747a5020fc7e907f362fbf48c984b14e62127f7e68e5d
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/af/92/b3130cbbf5591acf9ade8708c365f3238046ac7cb8ccba6e81abccb0ccff
 PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
