Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5040FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB0FB6072C;
	Sat, 20 Nov 2021 11:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhRDXQhgabIo; Sat, 20 Nov 2021 11:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1296F6070E;
	Sat, 20 Nov 2021 11:19:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDC681BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9C50405EC
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1ySCaVSX5tX for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:19:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D483C404BE
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:19:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d5so22867756wrc.1
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 03:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U38R9qWiUvMkxABn872fDzVUP4O5eDPnNOZKXatC/6I=;
 b=Vgi1Adctm85CajSUR6DjjX1l09dKejHnoE2az/9ID6T/ymZSknwnnLWj+NA3FhBRZl
 b/kERp8tHIN3+pJEICbxBrFi7lxMORBZukHFY3gN9m90EUo78tnvn2ZedM/k9v2QsCgJ
 KjDHAlmCTI+iVgv2P35zht8Qd6onvEpg1e1GX+hsi25n73jf4/Uyi5pIs4+Sf7AhP//N
 SchLZ+ggkYCRyKAo7HQgtp1c861v9j5r2OgWzlhB17D9BrL0o7iINk6KazCt9b9t3sj1
 8Gb33y0y5TcMXZ5N73lpVv68+SzbzncIVoyP+oTBV4BI83NBvkL3ET3W6auza4Lh54ok
 qZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U38R9qWiUvMkxABn872fDzVUP4O5eDPnNOZKXatC/6I=;
 b=NsfPJJ9HxtZXUyQneiRzjlGXDtR2CXtn7+QYcfgljXqRzv4KwhCraOoIqzjMd3SHoG
 eT10QG95VdAY2y29RCFsCc+KUBUdqY4yODr1XyPyX6gY5IcE26sCe78JHm+GOzT8z5yH
 Kv5LKsJAXkCaES11G/IjTYdmu2hYuj6mbmNT4IewN5/Oz2HFFbWO0YMKgMnmGWYKIEuV
 As6e3DWE7Bc/4F92dd1RrtdMpKucqbiwDWV7dz7C6ttXH0HR4gC5I/xMJdaizfwTetQI
 coGm9Kziu8rhwIZTLeO4ElbOqXm5k5a/K3SrNU3oiujvI8XeiDYPIHTORxcEgLhH4Y0u
 Zk0A==
X-Gm-Message-State: AOAM530KI5UeItyXj8EmlTmFfRYJAgOh2KUcD/Ci7Sl6q+kDeFKlQv+p
 5vga7B/Bu7Wdz/lCREd9N6ihcoFoWlY=
X-Google-Smtp-Source: ABdhPJxdcxx0YsWdliV2dq/Nws/LiwWTBgOZ5eHQD3/v0KWKnJTEVkuOw9vCQB2DNpUuCEKJmjt8KQ==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr16715123wry.55.1637407188697; 
 Sat, 20 Nov 2021 03:19:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h2sm2466365wrz.23.2021.11.20.03.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 03:19:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 12:17:27 +0100
Message-Id: <20211120111727.2884761-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cycler: set license to
 BSD-3-Clause
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License is BSD-3-Clause since the addition of the package in commit
e96c1b244e4283f5c8596728423c4d3b8a6487cb and
https://github.com/matplotlib/cycler/commit/a1c8a50ce79d37517d58552d8f0ee8f41f4ba9be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-cycler/python-cycler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
index 4f1f40191f..fcdcb148a1 100644
--- a/package/python-cycler/python-cycler.mk
+++ b/package/python-cycler/python-cycler.mk
@@ -7,7 +7,7 @@
 PYTHON_CYCLER_VERSION = 0.10.0
 PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
 PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488
-PYTHON_CYCLER_LICENSE = BSD
+PYTHON_CYCLER_LICENSE = BSD-3-Clause
 PYTHON_CYCLER_LICENSE_FILES = LICENSE
 PYTHON_CYCLER_SETUP_TYPE = setuptools
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
