Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC54C001E0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9BB612B8;
	Wed, 26 Jul 2023 21:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9BB612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTEc-fHrxmD9; Wed, 26 Jul 2023 21:37:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 462C7612B2;
	Wed, 26 Jul 2023 21:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 462C7612B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16C0A1BF980
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B3941E75
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B3941E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFqsdd4cwa60 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:37:30 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA68641E74
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA68641E74
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-348de515667so847925ab.1
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 14:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407449; x=1691012249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=THGSlgw8OPYdfiGL/gvKYDLrGQ10YnsQrLAJ994tyEE=;
 b=AWzPORYPdG7YRokUEF6Ongv04RWRyjR3EgZe1O0b08X3i7VT6yDhslah/MzHYI3zfv
 nDo1ePhoQH2JH9D2XGIrKh1Ybnf+ywVl8QTUVWepAVpxbwxKlf9qwXEZZ0OyJ8whIARF
 nIZDCt169NsSoU/nEkdOySxFoiNlvbKIDiAVhCMMi5ozc2Y8XvH7gmCvzYTlSIpHEuyJ
 8vGjc1N9sIHo2DOpK1EwoetkGpf7MDvgsDBWlj0q6xPfBmKD/odgkfd/Ep+0v/Jjg+f3
 N3kRfqAgJmw4vVTAFUEG0IkUD2Q4V5A8782EFT6ELcerzmm9LDMuuRC0O20ZILnu9EQr
 VsaQ==
X-Gm-Message-State: ABy/qLY/VbSQmtVoJ5SI/0/28Xr/I8+QAvfMog8/FN2fWz0X0+/pbu3k
 VRpmKC5f9sK0AkDXRp8WjhFC7WmzdHF+nA==
X-Google-Smtp-Source: APBJJlFz21hXlqv3C87QkbsMRh5FeNgvxxVSV6CI+1pQy6LWe52lPmRY9cpbKpf5EbepC8esjP6vKA==
X-Received: by 2002:a05:6e02:ca6:b0:348:ba80:5a37 with SMTP id
 6-20020a056e020ca600b00348ba805a37mr3050181ilg.0.1690407449207; 
 Wed, 26 Jul 2023 14:37:29 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 u3-20020a02cbc3000000b0042acf389acesm4353726jaq.71.2023.07.26.14.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 14:37:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 15:37:25 -0600
Message-Id: <20230726213726.20750-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690407449; x=1691012249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=THGSlgw8OPYdfiGL/gvKYDLrGQ10YnsQrLAJ994tyEE=;
 b=bAkVvyqqFtByddurN8t13wNNAPRAzlBkBNnCUpkzYslqec+mzYqwoQhnP9WKwV8Ahw
 GqXmidaTlVgrG/tRbhX0/3UZIcaWRqlWqd3if5c2ApoaBry0BeXaL6V1ALVUN3tqIHm2
 Va1JTwBXVR5iPDMyEIMaWB0Uc5YHQSOeidkg4iVzLIi/uE6Gc0JUYRvzAn9BJW7xb7kz
 j5y9/keFbArRadUG7glMJUZZJneZLcB0JXwB7MSdNV1W3fE8p73mOyGypEdsH6FTPEel
 Tefqk10dbzSReAIilMZQHj+9lHQiTep/W0CgLODdmdmfYc/90fOaKwfhtYpOM6wR60hl
 IcfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bAkVvyqq
Subject: [Buildroot] [PATCH 1/2] package/python-maturin: bump to version
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index d1344f2744..698b763a55 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  7ed1234824ef2b0c919c6d24550540bf044fe992612b322a6abda1253f5bb500  maturin-0.14.13.tar.gz
+sha256  4f8ce543728abfd83885935452d2189f8847445ead501cd8609f74c8a2b1ae0e  maturin-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 7781a1070b..4ff11e820c 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.14.13
+PYTHON_MATURIN_VERSION = 1.1.0
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/a9/a9/bcff9592d7ad68052432e6369bd310606e2ddeb9bcc0b52d5f69e4140290
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/7b/78/2814bc0e46a96861aab337fd0404e7937acdb4ce187da239224ab4560d35
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
