Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0E6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03ECC83A47;
	Sat,  1 Oct 2022 21:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03ECC83A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mj9NocmwzPaU; Sat,  1 Oct 2022 21:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C6D783104;
	Sat,  1 Oct 2022 21:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C6D783104
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0FB1BF4E6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 357BD83104
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357BD83104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6Vr5uWjX2W8 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 21:42:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71DA81A12
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A71DA81A12
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 21:42:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w18so2976485wro.7
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 14:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zRMAnHR+lMOUy52fRvHtbkEpJy5p9S3EmJFRD5ziPlw=;
 b=u6ZoZe6wpT6FedRaRpYLt5hxAx2uFcwOvbDPDpYLLYHg4dA5r53kGFrIpUgJFHWtnG
 Uk6BPIp9WeGhOMIxA8cypYLBTWzhEC3x9Z1fdE+lhqm3LQtNrI+Ecl7ADkUH2GbDpBMV
 sgW7rhh87OJBWVEb631haqNtfa+Xc/iC6OyXtWAJSCADw911Iv7n0g2eHQ9qbKNC2PAh
 0ZLtutlLvKf9Qd3amLiqf83ugT4CCErvoc8+YIQXoSMUm3uaw9B17CamSCABZs/oP96+
 Ax8Y9jZAEZxorjeX8k99Om3/82CsOwUpIxouGck10i42KBhCnZQ49+eewZSQILd+ht7l
 OOmA==
X-Gm-Message-State: ACrzQf3RdN/PWtCtfblbl9ExrWw3RcumkZ5Lhql1fI/kwPfpsaTC7X3N
 aUYoTj6xGIwoKejx/PXapwKkUDecRuo=
X-Google-Smtp-Source: AMsMyM5wEkGQJXhMWUqx0edi1GYj7iN4nMu5s36HZZ1bdOuSWmBF9LgYjddhkCNOk4ZWIw/qD8LNSQ==
X-Received: by 2002:adf:bc13:0:b0:228:6d28:d489 with SMTP id
 s19-20020adfbc13000000b002286d28d489mr8701329wrg.668.1664660519441; 
 Sat, 01 Oct 2022 14:41:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003b477532e66sm14436924wmq.2.2022.10.01.14.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 14:41:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Oct 2022 23:41:56 +0200
Message-Id: <20221001214156.37988-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zRMAnHR+lMOUy52fRvHtbkEpJy5p9S3EmJFRD5ziPlw=;
 b=dEd1s4nJ8yeraLINr7fHr3wuGzgbOxJyJ0EW+AW/9oLS9L3f8eC0WR3P5dWYRp2M3t
 mFD/ciQrqhKXw67UQXm4ksiLbXz7Wnd5Lgxp6ZUdc5RxI/L7ygiVTdQM6kdknL2h0NEw
 J/K3Lvp/W6gZzrj28oAgKKaHO0YdvEblmy7+RuW54jwwy6Kjb3CmNUMR1aXHqtP6+BZm
 T+Gwmu/U1AGg/1bd0qcCGc88cZI9nZuxOkpfo+nWasLB5s9gRI51ey5WhYBHV65r3wtU
 cJxqSypU6YAokA8wbWK6G1J1fCD+GnJzQunnn3YMal+byPMcbOrr4g7Dux1baAaIE/QB
 Bp5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dEd1s4nJ
Subject: [Buildroot] [PATCH 1/1] package/libdnet: bump to version 1.16.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Refresh patch

https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16
https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdnet/0001-python-makefile.patch | 6 ++++--
 package/libdnet/libdnet.hash               | 2 +-
 package/libdnet/libdnet.mk                 | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libdnet/0001-python-makefile.patch b/package/libdnet/0001-python-makefile.patch
index eae22b2f14..e5526482ed 100644
--- a/package/libdnet/0001-python-makefile.patch
+++ b/package/libdnet/0001-python-makefile.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] python makefile
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 [adam: refresh for 1.14; make it git-formatted]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Fabrice: updated for 1.16.1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  python/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
@@ -15,9 +17,9 @@ index 1a74ef2..59fe0f3 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -11,6 +11,7 @@ $(srcdir)/dnet.c: $(srcdir)/dnet.pyx
- 	pyrexc $(srcdir)/dnet.pyx
  
- python-build: $(srcdir)/dnet.c
+ 
+ python-build: 
 +	CC="$(CC)" LDSHARED="$(CC) -shared" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build_ext -I$(PYINCDIR) -L$(PYLIBDIR)
  	$(PYTHON) setup.py build
  	touch python-build
diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
index d322a1cc29..c31ec90596 100644
--- a/package/libdnet/libdnet.hash
+++ b/package/libdnet/libdnet.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  592599c54a57102a177270f3a2caabda2c2ac7768b977d7458feba97da923dfe  libdnet-1.14.tar.gz
+sha256  b151c4913758ef80daf4558361b4f2680a37b01d59272625bb78c77183062c63  libdnet-1.16.1.tar.gz
 sha256  6b46ec86e290066c47b6607d322135b3c473566e7225ac23d35a7c0588a82da6  LICENSE
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 4c58ea20a5..1e75dae323 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDNET_VERSION = 1.14
+LIBDNET_VERSION = 1.16.1
 LIBDNET_SITE = $(call github,ofalk,libdnet,libdnet-$(LIBDNET_VERSION))
 LIBDNET_LICENSE = BSD-3-Clause
 LIBDNET_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
