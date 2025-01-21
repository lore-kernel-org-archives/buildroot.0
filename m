Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF62CC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 22:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7AD607EF;
	Tue, 21 Jan 2025 22:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKULac4NED8Q; Tue, 21 Jan 2025 22:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77A21610E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77A21610E8;
	Tue, 21 Jan 2025 22:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4440FD7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18CC14078C
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HI6wIfx9UMTI for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 22:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05261408E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05261408E9
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05261408E9
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:28:11 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844e394395aso180725239f.3
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737498490; x=1738103290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L95F2CJYFoOr/D3MHnGcMWwZvzvvz+jY/LuBIOJdMLM=;
 b=TaOiUR7wfrBVEmd2gwPxeqcJrcqo25nNdVujTWbBF6KPXqptIM6U+c+dJYPHCQ/92E
 PXD29+JQryw5u4npsImv5Pom1tyBHigD8dB+kSUm7bRrwAtdh778jiAu8aNz4nqOcj1L
 6q0VrK8O6hRFjaiHdu281l6g1hA7UtsxC9mnDzd9J5XEFdRWMFFwbr7wCVrJvARHo7Bt
 CWKiPT+mwTtbyc8qg/wAK2qMFW5VbMwN5i3qCDp+vs1F5OEY//LKNbfPJfl1ScxLDTzD
 /dbbQZLoXOmwjZJeVhIMI0v5D3/ghkJotAd1DdBxb7sv1ajLeP+ST0lEHx3+67dCjJgj
 hobA==
X-Gm-Message-State: AOJu0Ywa8wGEiYEg5P4G7DppPcbUwapRoF7Xt72xfiL8yTJevMb5/bhJ
 IBoOXL03C15pAH0wvZ0u3FNt6NfmuLDkeP8ycUPDjLYQ3tgXTfejbBNQ907x
X-Gm-Gg: ASbGnctcYUVUpkLGkeJ10lYOphxHX75MlgSim+M0+iBMxZw1DXqNtbdk+a53L8n2rwN
 8DV3Xh3P0YW6IjLZjWV6lbFL0caHA7vO+UJmePoTZETvt6UP2CV4zgamGTMXfTyQ2gwnOtQFd3I
 67TnExPf6TlpWp4UUGgUo1m8Sa7jYiwDIzX3EzzBfjk23OxFgmo0tVCZk7qF6A/lhG7c+uArjcu
 iWTWcb6Kvx94DSfhgw+1D+5tld9GJinDECw4fMZ02IzAEv3cH3G8wMjnEsP0K29Yyy7KJ3RmR0S
 +JzolosY93ttT5jjcNyWWW2T6Ra0yDnvqx6dPDN7Iyj1
X-Google-Smtp-Source: AGHT+IFe4DMvBFxgW2nVQUgakj+Z+GZPO+/JjNhMVMLJHk4uNpMAAJ+z5eX0UpSP9ujst0TRLjKbNQ==
X-Received: by 2002:a05:6602:3e94:b0:843:e667:f196 with SMTP id
 ca18e2360f4ac-851b61ee917mr1839443139f.4.1737498490388; 
 Tue, 21 Jan 2025 14:28:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea82253879sm3045825173.53.2025.01.21.14.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 14:28:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jan 2025 15:28:08 -0700
Message-Id: <20250121222808.3149231-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737498490; x=1738103290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L95F2CJYFoOr/D3MHnGcMWwZvzvvz+jY/LuBIOJdMLM=;
 b=L3vdjDV0BwGGt+DI4X2NwOjbXs40f9KspMRy0GABJI+v1FcqNIv+3nlhTK0yihMCbQ
 Pf0ZsVy+N3xA0YUzn5g5yxzpkHbx55NtKsGA9xGvnedORhiK7CssOZLVbaA2kn4aEjwr
 Pzp/DQ+mNA0Io6wamkRtad1vwdN2i2tqwpuNuREAF/C0W6dDTaF582PI73643iTkAo6p
 AGBxR9R9Q4p14i/gkkunJ+zfqWL/OxOcdbVVKuPjy2RAUYdHydgV7RimYhdLlfsbYcQU
 8U56+Vkzm7BHp7fijQZeupirDh1sXcCpx2Cqoh/0dhQIgPSwOovj4FwK5FXMiy2gO/LY
 LfVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L3vdjDV0
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 5.1.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 53c4ceead3..6632246af8 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  03ec3e0f2d6cbcb9eb11c629ca1c538b  Django-5.1.4.tar.gz
-sha256  de450c09e91879fa5a307f696e57c851955c910a438a35e6b4c895e86bedc82a  Django-5.1.4.tar.gz
+md5  272e951dbc4ccb7854c5a69aa5650749  Django-5.1.5.tar.gz
+sha256  19bbca786df50b9eca23cee79d495facf55c8f5c54c529d9bf1fe7b5ea086af3  Django-5.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 4facc6b6c4..81d526ca35 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.4
+PYTHON_DJANGO_VERSION = 5.1.5
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d3/e8/536555596dbb79f6e77418aeb40bdc1758c26725aba31919ba449e6d5e6a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e4/17/834e3e08d590dcc27d4cc3c5cd4e2fb757b7a92bab9de8ee402455732952
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
