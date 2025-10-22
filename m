Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA0ECCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 13:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC60D60A70;
	Wed, 22 Oct 2025 13:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YghoKVYM9Df7; Wed, 22 Oct 2025 13:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D6760A7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04D6760A7E;
	Wed, 22 Oct 2025 13:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 880EB70A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 13:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79682813F2
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 13:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlhaAvbdCTvV for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 13:39:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C4EC8135B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4EC8135B
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C4EC8135B
 for <buildroot@busybox.net>; Wed, 22 Oct 2025 13:39:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b456d2dc440so1125489566b.0
 for <buildroot@busybox.net>; Wed, 22 Oct 2025 06:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761140390; x=1761745190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g0jg3pavPqz2AsVnOkr6MVPHMUH9CmOq0PrEi+HywMc=;
 b=ELJz12CTwH9mP0tHD5j7k0siZauPjEmacOH0GKIq7C68McDIvTZABc96Qd1OiQz1es
 9N3fQqnm+hGJyWIEFoXHl3+u2NjkrZbzyq1+RupmRtRQ0ko6dFvlveYm5uib8wwW1Dlm
 gwT/HVZKm9ARs5nm59At5a/l0AN53im+bhX5FLXuV0phS0T8ZB6lPf6f/+QOdEWwk6Lj
 jh/U+vG0lSq0Q82jdIdA2dOlsRv/oXhL90Ze3+DwrTAHJ85HeFZJ5acmz8nFdxaWG05O
 YjJI79LEMnJntCNAEnTnWc/NOS6aJ6V9RjEWRH0YKkyoKwFdw6ovcNEQZWzTzyNM2h0X
 bdGQ==
X-Gm-Message-State: AOJu0YyKo0vRbVM1wsnLneWQTmlqmsNhCGpjv1Zzr1BIBNA+ht3yIGqM
 FOl8yhl+VdElMZwk4IInZXdY9yLIVcA6czTg67DCbxe0Zb9R9RXKyMomhIXyGyiMRuWeyDIRyqY
 rRjJUpw==
X-Gm-Gg: ASbGncv5u94elxTto2G2M/3Abd6ZHt4Rfht6Wf2pEDR0ZQ/X66W602b7q48lKwn1MRl
 34SVMNXRATeQN/IWQs4IaYXtVx5hvCPXnimb9OEY8yjcGPlYJ0u5DfK2ZcOMC4LTCksaihEz3h5
 7y9nappiSDHf76cnO6OjUMRzKFacseIdiCQoRW2U9FlcLyx3BoXmollHfqaRtaGbKndvuvIxRao
 k9estlTlp+b06ToIE/vPBdYWQhH2gA6gjnoYSXudCYbRzQkiKLrAYG98igg55S0xUR/ITgCoAOt
 sH/z9RvtMeitpIX4ckrIpNa3DaDBa6la0sqhdLOnDUuyrxx/NdFUAUB7IX5I5j/hcDxylPAqN+6
 kHoalsBWvLvrBUvHROlbG+TcnFi1xCcVYEvLKkz7zoxbiBZfqrjjP7/GR9ZsIQlTWjQSNWOp1bV
 KWyWtpB9baLFhMd7K89r9qiShMO5T7pw7jj4qeAaUXYj5m
X-Google-Smtp-Source: AGHT+IH3B38Mu9fZCwVJ/hgUxDm4yKIf+CkJSHMynVNvf3n9kYeL/j1sWm+AqhodIge9pQF9u25J/A==
X-Received: by 2002:a17:907:7f0c:b0:b45:a84e:8b88 with SMTP id
 a640c23a62f3a-b6475609d7cmr2502733666b.58.1761140388925; 
 Wed, 22 Oct 2025 06:39:48 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da33c6sm1332450966b.2.2025.10.22.06.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 06:39:48 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 22 Oct 2025 15:39:46 +0200
Message-ID: <20251022133946.230811-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1761140390; x=1761745190; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g0jg3pavPqz2AsVnOkr6MVPHMUH9CmOq0PrEi+HywMc=;
 b=Su+XvhpId5ocMxCCD+AoKg8xUvdg7TexGQmJYZhMfH7F7UjXfLcwqe6iIQPqyD2CKI
 s8d6wD2bksB8wz2rOc59WjnZxqq6Lt9dfz0lKuyVA7VsgDrFY7h6M7ft7/ECOx5goWLx
 8DxieDazs9jjfMKMU1WeJQxDjA8zgWj8Lag1CnFY/fplkE7kf9eW/94lNCf1bhfJ1rd+
 gS3DPgksUU+1v5Xh1itXUazy0VK1R7sIoJSLX4V9iUvx9KyYFoZdQAY0v1LO8ybS/VT8
 SQLRzs4jWuNNGtFDEmJfgYyZJocgZYhG/uyyDIVLJ3/WbQm4mv/X13+l7VBitHv+PLsQ
 uDRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Su+XvhpI
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.51
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 6a682a741..5394bb10c 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.43.sha256sum
-sha256  7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7  gtk+-3.24.43.tar.xz
+# From https://download.gnome.org/sources/gtk/3.24/gtk-3.24.51.sha256sum
+sha256  0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e37867c49c5f905a4f  gtk-3.24.51.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d6d7c64a5..be24869d3 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).43
-LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
-LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).51
+LIBGTK3_SOURCE = gtk-$(LIBGTK3_VERSION).tar.xz
+LIBGTK3_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
 LIBGTK3_LICENSE_FILES = COPYING
 LIBGTK3_CPE_ID_VENDOR = gnome
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
