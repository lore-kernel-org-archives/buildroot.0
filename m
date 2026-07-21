Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ED1C44529
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737B7408AC;
	Tue, 21 Jul 2026 09:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttM8jFjYvyLV; Tue, 21 Jul 2026 09:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECEA4408A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626796;
	bh=KLLBCsMjzE7Kvb0VbsEU0uPleRO7iu3m2Cqxfq+gbm0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSFUutOG5WSrH/oTKmM06VqcfY43iosCnOAt7uVv/SETYFPA3WLrvE28L74lfOK8P
	 U8a0eZxXGTtdB3fqtZFoiTFlHCjYMLwiPicuBuLEFp0jDQbISK0WGDfEfcTn7A5z81
	 VZkTB0mRlKyV+NeT4eIocbiEnyKi9v0mKOm0+i5f9iP8J6Z/6Z3EtHjBIUlDcxGcuk
	 CPQZmp9N3+cY/1my0w020bZ/+w/h+CfVR3UPuivaA+Wg3Vu7LAnCKrlbX1q47rJ1AY
	 Gab+mbKPt0nRHkXMwHpz/ttLTegGNzB7GdWsjJTHLpI5CrDuZ/C1SKyzpIvn+M4s2y
	 nRlfysXYoICPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECEA4408A9;
	Tue, 21 Jul 2026 09:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 674FB42A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5936380D82
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MDDLDyshecw for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 642CD80C0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 642CD80C0C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 642CD80C0C
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso34852355e9.0
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626786; x=1785231586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Wz9gzzm84g1fYZVacKgT3qwJP0zNfVIaq1F1ENRbPyw=;
 b=bmPOOUMaGun1eI89faccKkjLrwRcfLSBuiazjrTbsXYqxg54nYcM9IetuyqHAr9av3
 vrBG/qOc84osSvL/GT1ZT1NfvHB+0aUcEPDURGsgMeU918Ap4r5ZWcBpgodjCnnBDHkd
 oFu+t+P7a52f+WAuGU8GSIz9FmwfDR2qVye1osQl4HN5W58KlCd3M9gAOeVeCKa8WdBW
 B9f0xHSroP7rXRYpVIfcp22DPrTdrR88JO3sUqLJkL3Gu6d6e1hMOBVOIN1wTGieANKW
 hXAlhG7K868/DH0LgFGwBcoOVLar8WncH+AMqVQOyMvUrDgB6wXp/UQDIykAJW9IGt8m
 6Yqw==
X-Gm-Message-State: AOJu0YyQ8IUDzc6yEjl6cJ39hfdPVTsRy0A9nlb4bvGFVGqQk8ac2iVh
 UFDbQuw+JnNafLdRIRKcPUZC+e/mGs8wz1tjqazGPVBLvEHPLfD5+X5zyU4SAQ==
X-Gm-Gg: AfdE7cnIqA6Io8cVfKUrkjN8Z3vK3xhOuw3WHwrJCE+Gafviz6sUv24llIbnWKk0+4w
 IZtpY4pBX/KPx9kSSe3tHf6wU2tHgQAK2rL2tZlM9fgsz5Gm4pkiIQ4s+W++RmbQTsE7o9gA1eI
 9qFoYDqD/xH9DbklDA7F6sDudQvlV9pHB/+FgMAqFDxvY69RlJm0YJ2VhXAorivDqJ9xYjBTLlB
 qxSO76ni/j6BabuunOInaW+IfSNgIMsBu55TU4Esy9dEPHR1ZxpYFN00vae+WHyXHRJXAk6/Kef
 siVHamXITw00CHUouBUE9p7ceIMtoi1QnkXQMBlZjbK71Sgj3Qs6RHdfpfD+LPuWtnj5sFVgQkq
 RJiobhx5gF4dDa5RKoCvXp3yW5l0xKeI1HvK6lNCS0xJF1T1/dlni+Chf/LGEnbv2vtYm4PoU3q
 8vI2nWuVkkpWvrJZhrz5uGCuet0BIPxVHZtA==
X-Received: by 2002:a7b:ce84:0:b0:495:4487:61af with SMTP id
 5b1f17b1804b1-4954a51659emr137470545e9.36.1784626786221; 
 Tue, 21 Jul 2026 02:39:46 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:45 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:31 +0200
Message-ID: <20260721093932.282565-8-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626786; x=1785231586; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wz9gzzm84g1fYZVacKgT3qwJP0zNfVIaq1F1ENRbPyw=;
 b=lZnHofX3rKHwR6vhxEJSHVfJARQVqajOd4m2TADMpgSb/+ldcwk75qrbi40PzBn3t1
 QMSoYyDcLPUunOxEiYFIY6R7ARiItuw8CgRUSMuGqL7BZSTjtBJwGCjNUoANSB6Sr3f5
 6EQQlSJuOlkE2G7tdyp7OIa/AzAaEudWi3Eam8p43mJhZoJ4LRgknYpktsTl2WhV7b+z
 3tPekbA9zK3Z7spshrIyvLjYjLWIh7lIcGq2qAy8tm54k5AcRSEh9fZqJUFCsMEM9WqH
 p2Dj0EjrFLcfrJeyU1nptUyeSB5Lq5TtRmNFeblnIyv75qvtzLOxN5pT571rQg7r8vD9
 X48A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lZnHofX3
Subject: [Buildroot] [PATCH v3 7/8] package/hare-xml: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/Config.in              |  1 +
 package/hare-xml/Config.in     |  8 ++++++++
 package/hare-xml/hare-xml.hash |  3 +++
 package/hare-xml/hare-xml.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-xml/Config.in
 create mode 100644 package/hare-xml/hare-xml.hash
 create mode 100644 package/hare-xml/hare-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 5cdf0c13d..1d0dac96c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1883,6 +1883,7 @@ menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
 	source "package/expat/Config.in"
+	source "package/hare-xml/Config.in"
 	source "package/jansson/Config.in"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
diff --git a/package/hare-xml/Config.in b/package/hare-xml/Config.in
new file mode 100644
index 000000000..469a9907a
--- /dev/null
+++ b/package/hare-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_XML
+	bool "hare-xml"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides XML support for Hare.
+
+	  https://git.sr.ht/~sircmpwn/hare-xml
diff --git a/package/hare-xml/hare-xml.hash b/package/hare-xml/hare-xml.hash
new file mode 100644
index 000000000..25c1f3c1d
--- /dev/null
+++ b/package/hare-xml/hare-xml.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  56703cc20f70878a02f37967385e9af3659733b31c91c5f34cf819d235a20a28  hare-xml-0.25.2.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-xml/hare-xml.mk b/package/hare-xml/hare-xml.mk
new file mode 100644
index 000000000..be30fd934
--- /dev/null
+++ b/package/hare-xml/hare-xml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-xml
+#
+################################################################################
+
+HARE_XML_VERSION = 0.25.2.0
+HARE_XML_SITE_METHOD = git
+HARE_XML_SITE = https://git.sr.ht/~sircmpwn/hare-xml
+HARE_XML_LICENSE = MPL-2.0
+HARE_XML_LICENSE_FILES = COPYING
+HARE_XML_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
