Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (unknown [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51015FA3741
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 00:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1513460774;
	Sat, 29 Oct 2022 00:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1513460774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4zRsF5vvkgs; Sat, 29 Oct 2022 00:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBC0E606C0;
	Sat, 29 Oct 2022 00:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC0E606C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 328241BF239
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 00:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1896E606C0
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 00:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1896E606C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYrd90HAq2Ul for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 00:04:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 378C4606A9
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 378C4606A9
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 00:04:41 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id g13so3782508ile.0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 17:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GOd05CLCiLA5CllEDY6QKLgBEnNx6EZotkkKEUAeu8=;
 b=KV7d0mszO1ndr27BIVEJ4NopjCQLGnrgm9/HaZuLSlx9g/vs5Lk+uNvVDHuFphdEgE
 GnPEabXcw9A9ZehjjiHZGq/0KdJ6U1vccw2/9QLfiUEDoyALOsZrue0pz3zDGGi4MGgV
 B8JmGd+irigkrF/8eTlDPhZGdJZyECcskedJOqVSqqbEAuf5Mj+VipFcjgu7O2tOrO+Q
 Bt3KiZibgUCt0peQmngeIP2a4MLQ9AtbBBA6bosCtPVqIybp+ZDkgc48bKUBmzDR/Nqu
 pxIQSYMp7Ww3McGcexCHYPPfcLT6yAcAnuggAUty5nCooCa0+qbA2JnfAjXOi14QpFwh
 AAKQ==
X-Gm-Message-State: ACrzQf1cEWYMES0DXnJpsMJshqZpoF9dubXklY/FAF6+GHi9ofwQLQMZ
 kqzK89OooE9d8rLGkmj2wJORLrXtoSU29A==
X-Google-Smtp-Source: AMsMyM7vaYZJw0EUEsD3Z4/2DOMlFCN1tZQrFWaSmS8uWzG1cGAU0m4Y+Y66ndwZSQVUVez5CgoXxA==
X-Received: by 2002:a92:ce8e:0:b0:300:8bd3:879d with SMTP id
 r14-20020a92ce8e000000b003008bd3879dmr884303ilo.285.1667001880057; 
 Fri, 28 Oct 2022 17:04:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05660215c900b006afe1d84207sm37859iow.25.2022.10.28.17.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 17:04:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 18:04:37 -0600
Message-Id: <20221029000437.1305667-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+GOd05CLCiLA5CllEDY6QKLgBEnNx6EZotkkKEUAeu8=;
 b=Z5bl5GF+p0alKSSVNPxcEWjS/DuO3M6LlmKnn59VZ8c2MCdL/gOFk0gl4GDwY5/OU0
 3rKjRroJvPsAuW3bmu5axe8C4vAnz2W65odWpdicp7PH58g50MnJVF/7GXH9nUTRKL4v
 P/WqqO3wZlsS2PQNCycmisLcc4fdpxVMMF+w3Hvq7gwBnVust6QeEGDAmMGRXlcPlK5U
 z78Y06EOKZcnrO7f+pZkNnPYnHQ9O9u6TaeuDc5gfhnbLfvA0CBKT7o3SZyXB0NMEz2a
 orKhh7lTEvCO/930h7JT+22GjIATolNWZ7KzO2GhV8eKB4coJUUcH4oh1MAdCNptlwHJ
 Hgkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z5bl5GF+
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: bump to
 version 2.12.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
 package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index 8b44318307..efdac39007 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5  797273eb5f0ef9e95fa92c6a933cf4ad  aiohttp-session-2.11.0.tar.gz
-sha256  0fdf39600f6a05c4943ef6c7b099071ca9854413111a26761626244be5015dc4  aiohttp-session-2.11.0.tar.gz
+md5  b89bde69f6f3c61a991ff408d2733838  aiohttp-session-2.12.0.tar.gz
+sha256  0ccd11a7c77cb9e5a61f4daacdc9170d561112f9cfaf9e9a2d9867c0587d1950  aiohttp-session-2.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 3d59b75e3d..55bf0e87f3 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.11.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.12.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/3b/a7/0b97b9a2e3a553a86a6703f86b0e9b1afb2b262849700e8f80015c0f643f
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/34/87/8dbc1385c875497d6bc16c9d94e25dbd8ff62599843b73fb4048ba74c867
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
