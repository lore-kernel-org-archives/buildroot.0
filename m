Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D13E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6370260F6F;
	Sat, 11 Jan 2025 16:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrRLRe1saWmv; Sat, 11 Jan 2025 16:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C075610C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C075610C3;
	Sat, 11 Jan 2025 16:51:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63CC8942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A2AC40654
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhqgNYcXuSm4 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:51:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23CD3401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23CD3401C2
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23CD3401C2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:51:45 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-84cb9c4aab6so96778739f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736614304; x=1737219104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zGg0sruXG9oY6t0ZrNiPHGWoV6XG7wAJm4XB4ZIDuU=;
 b=PDomYwYSLkVTsXMNP8vxXNGwYfcgBGDDUSiWpdIyoOfVIMtz3Bbv9hrNIfPtyNL7Lh
 CFGiON4y4e4zDnEZMlSUWxa9TBjHC3Kmr5CCafLjyZII/DTmtE8xdhqKUaOJvJb+Y/j/
 NO7Z4HKVF86uCA79y8RioLgby3yL+ZDYlZ6aXUkkIEsY+IK7egfk3ZXsjA2z5ZoNErW0
 dhR6Z341F+0uCZ7UByMvYzEq03GH8Jtu6w58kebJz34ufDBErLQiRV+HYMXGEKh7HrPW
 NEEyxPUxTQ4vWCKID2JVGJ0iLSdGEAIvD1A+14RdvQrlO5xAqyMtHP6T8suEhMyEZUvF
 2aAQ==
X-Gm-Message-State: AOJu0YzTYUn98fMyNPu8iwtW/CIOD1b5wEErAC8xz5O1X+uwhk7Z+j5a
 quTHbLfCgZ/w9EfWSiYJmQtGmzSJQeKSiGW9gLr1X6gge5+9cb/897NgawHmKQw=
X-Gm-Gg: ASbGncsIb6Rv/ivKiU6jfdCo8jozBPyKlJdG97R9FDFi1+MqaCYVgSiLPdzm0rYybCI
 AWTWtaHBdrrlBElLSTIvwj4aEGiTcowJloF6BGOOuW1cGwDfDWRaMkQGiukkCYaO+DDL6Pmkevg
 cutfwwQw3f+w5/cOoBOL4cb7OSn4UMhKLWEO4VpnKQqP32JXY/3WWhRVeu5Q8x+PJIXi4Qlx01Z
 QLQy1cGFTJB7SCM72X1y69hqd3yLa30+ZlK5+FehpfPoBZF+mOAK8fXWf0yHTOdm3s1aVB6X6pO
 9Gi01GLo+nIp72Mx1G7e5bcPV6PHDYE=
X-Google-Smtp-Source: AGHT+IGLWr/ODs9uzYjHLsHSpAfk+n04W7zaS+2FMiTbtBA0YmhAmFVrrKVPNyTL2HyRGtX5NUrtsA==
X-Received: by 2002:a05:6602:3e99:b0:849:a5ef:bc8b with SMTP id
 ca18e2360f4ac-84ce00952b8mr1563287439f.4.1736614304439; 
 Sat, 11 Jan 2025 08:51:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb1b4besm158807739f.17.2025.01.11.08.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:51:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:51:42 -0700
Message-Id: <20250111165142.2890748-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736614304; x=1737219104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0zGg0sruXG9oY6t0ZrNiPHGWoV6XG7wAJm4XB4ZIDuU=;
 b=F3+zli0LdviXUpo9eZl/GFea626OLhsbBULN6MGwkP5bRpctgBY5Q3dMjvImYHLPbT
 YiZT0rE8muez8RG+pW0zP4HPaTxPGnYwlK4DRvrQmuV2xQRNA3tDB75hZVSIsF+dMRLb
 6dVo2iC1cD2fBOSSH2gniV74H/Dnp4icaH46NOsiD9ttvbtPnVw0iYK22QlIzsk/bEm0
 czybo1TIbaCUo0vD7PeimzxBUOSR0CzJqJ8VL17y7ChZZjpEaO5kvkFpDS7UW6NY0nt4
 +Ox80pN8C4DTMqOKtiAuBuzygnOPN08wZJ8qeThGeIBliKF2Bo3hm5qIOzuTfMFK+B4N
 dpmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F3+zli0L
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to version
 0.18.10
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

License hash changed due to year update:
https://sourceforge.net/p/ruamel-yaml/code/ci/e27f5be8d0d23672f33a7fa3fb620c583b94eab5/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 94a0d43544..b2a5be2b6b 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel.yaml/json
-md5  964a8e48646e26533d8e5f03cff99dde  ruamel.yaml-0.18.6.tar.gz
-sha256  8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b  ruamel.yaml-0.18.6.tar.gz
+md5  e21d9748f618fbf6bcbd5ffe663b0654  ruamel.yaml-0.18.10.tar.gz
+sha256  20c86ab29ac2153f80a428e1254a8adf686d3383df04490514ca3b79a362db58  ruamel.yaml-0.18.10.tar.gz
 # Locally computed sha256 checksums
-sha256  e84ff196f03668af751abae0c4cbd9169aa365121f50c30bb9a329666ab6260a  LICENSE
+sha256  0ce9ad6a9d4f0829296a72c77d07795dd67f42751e2922be56c051d39ae1c011  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index 83a4aa12e8..34697e2581 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.18.6
+PYTHON_RUAMEL_YAML_VERSION = 0.18.10
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/29/81/4dfc17eb6ebb1aac314a3eb863c1325b907863a1b8b1382cdffcb6ac0ed9
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/ea/46/f44d8be06b85bc7c4d8c95d658be2b68f27711f279bf9dd0612a5e4794f5
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
