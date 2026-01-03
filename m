Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8D1FC6165
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 00:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3EC80EFB;
	Sat,  3 Jan 2026 00:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akeSZV6z4zpG; Sat,  3 Jan 2026 00:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5BA980EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767401189;
	bh=Q20EqHI9ktyqZf3zTDvj4Vr8GlLs31XEJoiWvmf8JT4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KboG+GsvK207e4M5vb4CsuIDyNZKtqx/E/NORWeUzn3h8pm6PZMi8BC5GgTcuFidr
	 NaZCQ3QVLlkYqXjvv66fPFV0vZlUdDKneQizzWZsmphagN+WXOMSsLo2k7DXD1XIrD
	 fHKMERA8Oh/kthuc2xPgvC5evG9dgS2ax74h5TupRNxLwlkkQZqn6y2hKkdk4f8n+E
	 RwRWINxU+bby4l5F+SMXQfn9tvHEVYqe/2uYhgtef3QL5s64l2c2LptVqAarqWI2bc
	 +KxzBd+EUzz0UeDRHxdIwlSoTbcD5Tt9KpInau/rn33MB62EK+PrkazeDgmWr4dwNV
	 ZZbOoM2GmOiJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5BA980EC7;
	Sat,  3 Jan 2026 00:46:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2E3E249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A5FD406D7
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7M3ExXqf4Br9 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 00:46:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8C6D40469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C6D40469
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8C6D40469
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:46:27 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-4503ee5c160so7174494b6e.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 16:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767401186; x=1768005986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+q4yEpZxkFjm00pkn7iFESMyojjU+WgZlHeRzMMfeE=;
 b=HGZoJJdt9jsnu4XaVmieHT2uhfFSEnBNXaGSYDBorn36Go0sW2YJffBAKK7U2z7+Wm
 OeYXsyJ5yhL5LmCdv/AEiPZp+blqXStwy48+k5bVj2wbzx+9yvX8PbvbFULRgAcpuabX
 sa7IzeCygfcOz1XY3VeNJFI9jtvhkIGhuTbU1/tt4ZGlNw2/p4phzII/ryOTsDCBVIs+
 8oxX8LVFvimnZJJWYWPmSyXIp72AjKdh+KUDUfVXexSymi4fyx44ybCBJuI9YeIBb4yZ
 LyLQb/4hUC5w1kz9etLlXyPaczB9UAq0inepYAYOsKJKlAnXgvIjWt483cN/fKWNG8UT
 0jqw==
X-Gm-Message-State: AOJu0YwSAYHbwzgwznLyboCBH5pfiMy6kl08MRHdomOf2TBI4c7fEjEl
 C0VUpk7E/T1fZ2OduSEHADEkenjKMjc9Hf6jdVsLznHh0Gyr8wYbMqlL3XNVcLp3RNg=
X-Gm-Gg: AY/fxX7ohLe02aUYDyViHnk0+owFC/BXUHZWK4286cXCP2l5fmlE9ZM+RkXXHoyPD1+
 wD++KYokhXfG+IND3QouaScW+PAUdOTh5D6Ra30SCgLWhLtOaqP9Yo6+G++xP6U6lHfwYNbSYIU
 BRbnejF1tijGStrC3W4qQZVykDXPh9MLrJMUr17I0rBbkq5uS5w2nIjosmlj/gQYVoOl8HtjT9w
 b97MSPJe+Jj9NwDs57+/xmknYIxXc2NPSmKIwFOXLEEfATt2k2B56X8JhVWPiVdu5EaPGuAuLjW
 VXd+E2bc7sxFGpQssm+LvR9LeC8rs7iElXN93p/39EYjbyzVyHHY0BFcxZj+0EI65M1yxanrH9D
 F7NxV/dZKMBtI5fp7udXJRampstOdeGim5eY2YlUs8tdg2GxAYtyriDKdMsfgwiXhFkCxl/B4hg
 A0qVMLx0H3J05SPa7ztU+Ti2xGgAYWulrrcpCOLr1BZXQxX2pmpgbEFUEoEtjku4nPjZY+8j6Vo
 7sl4J+R0iUeaHSTcqY2uzjFPBXGlRj1+uW5LDsj858DS+XwZyauPu8=
X-Google-Smtp-Source: AGHT+IHqpPblSp41a5QXzuD6MR8Ou/M2ff8/GxqeX36HIsFz3kPwdagwhQWGF2WrxHE80jR6Icawmg==
X-Received: by 2002:a05:6808:30a0:b0:450:caf8:ebc8 with SMTP id
 5614622812f47-457b21ce1a0mr20770558b6e.55.1767401185798; 
 Fri, 02 Jan 2026 16:46:25 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d571dsm29341415a34.17.2026.01.02.16.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 16:46:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 17:46:22 -0700
Message-ID: <20260103004622.690344-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767401186; x=1768005986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p+q4yEpZxkFjm00pkn7iFESMyojjU+WgZlHeRzMMfeE=;
 b=gejBJUzuDMLR7YFRUFceuWzwBLATuid3yYUw5ZsLEjxhRmTmUtlVbrlvbTIPmVxLnx
 r0XXSiPOsvsELOJytzIq93opqbhMBMF9+68E2GdMEDHrEdDxMYlrUSnFOkaXOKqhdaXL
 /vOR665oLBQMquLn1XmchnXJCl+cKpj6sXYpFdrTL1t/u0C3cHZaTWLxBdzPJxeUBA/i
 Ef9MqCWqXKgRW2Zbgt7tVruniq1WxN8+0G9mVQyKozKorhLFKcTZGjqmViXrR0DgWltr
 c3YLefubOlcMa+E6B7ynseusO+KCACk5zTOZiDC/1yU6UhXDgjdXMmVir+z4kPgAjuS7
 33Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gejBJUzu
Subject: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.54.5
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
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index be19fc1900..191b74b1e6 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.2.sha256sum
-sha256  03cffeb49d8a1879b621d8f606ac904218019a0ae699b1cd3780a8ee611e696b  pygobject-3.54.2.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.5.sha256sum
+sha256  b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585  pygobject-3.54.5.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 0d96c299cf..9386b6fed8 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_GOBJECT_VERSION_MAJOR = 3.54
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).5
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
