Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88941CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC7A606C2;
	Mon,  1 Jun 2026 20:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tT7RiMPViHp2; Mon,  1 Jun 2026 20:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75F5060729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346877;
	bh=Z6GDRAmN8eraVW0QH8oAmCPBBrM+jfjR7llyV7uyBI8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJx4DM7ejT/UUmjy8938GDI2Biv3vy2uAGmXfiJs9HCzrTXCERJTquKejNDAdygrn
	 UEMH9sOlulruS+p06ZPbpu67xCl4EGzDEaAZn6wlWb4pKzBacf/MpsXLARBSGA5/r2
	 9AVG7EjnVp8nvew2CmaPyslUsj9WMTWCh7zUiGUaJ0te87LKO3uwYnU4Nw1VSK5GzF
	 s3YoaUivsVmQyCi/0oDFm2v1SvF9ZU/tSGEYb/XKyOHie7Acd5yaPwthX6c47pjRWT
	 JO7lF0wvc9ARj06BpuYOyhEhA5wYSsaSkIgO8rpXo0TdJY+PzlxLEAINjdcOYru0QE
	 +lI2UGJHE+Csw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F5060729;
	Mon,  1 Jun 2026 20:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B697F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51951409BF
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmtWl9Y1A0MQ for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:47:55 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8DDA4094C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8DDA4094C
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8DDA4094C
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:54 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3966c0d5ac9so23630581fa.2
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346872; x=1780951672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yiujKNTTXQ5V/X4fm6brIoWjKkEuCijxZKIb2kc0OGo=;
 b=q5+3OOSz2q6KxTVzAku9g8lnVQDYHgk4lQxj7ZqZoFaYpTb7SRA0a5uzqi3qr5ermM
 2guGfivoX12+sUVV/Nm4Xvcb2uqgxbgob5bb7h8ITMyHbI2b+JYA0YYedVbGLkc7xjbV
 8lMur3SnoVmxgNI762+hkOqdeyw81t4qbmIFosumJkh6qpZmsuwt9U/O2SvAA2Ug/Rh+
 IMa2/9iYoj7oTA9ojEJJch5LFmjsIm4SGDzMhUcFXpEDkyBCOIEuthPsKNiiHfDVe4m7
 RBRtPzAoJlzFiAkNt354FXTLfiMgKPFhwUwvkn5bchSgy6TSmUIn7KgDu18QMCB5wvzo
 WHwA==
X-Gm-Message-State: AOJu0YySMaI26jkIo8OTw6pyS6CgYJy8wKuFxst5xobwn8Cj6+14IydZ
 T7fx7Bl9ptn0NU0G5Rf0s1E0QcaMaLlVDO01ttlJ9413gnqathCF47Pc/vol+yJTfbC5dY/Y9bW
 ScTurbtKnZA==
X-Gm-Gg: Acq92OFqSFWDUvqgVVdE+AACHMcoaOu0BsnjNB2dZ2B3gj8JxsjBLPXNtGrM+/tyP2n
 T2NYQ/XAma7/avuZfcofdNIMJMe1sc0fN37JKKwM47taHZNAxn4xISdRaVlWhOwfYIHmenIC+8G
 +Dn0ebVh5sIqCjKo2EVgTkOoKia5Rgufx9w1BLI56gGSDDqVfI+FHNOVM7gx0ruUWTdCtRLYaZT
 DTAOLhxp1T7gbfRKVEJu8C4xdUXqELGStDXGZqL4mxJN3WuJqBGPxgLWQfCuoVVrxPmWeuRaAxq
 160PjUozJBgE04J7qrLvJ2sLvssyDdRi9vz85YWvjgaAywqDin3SIFmttBiNJu4ttdRaieAuGgN
 FTmcDvbA747RgcJ+c9S14bRoNq9+jof96wlUKZPoKCcxmbiSBnXfCwQw7DtOfcyjdO952KaLdOC
 ln19aD8TsN53XyqB/Yws/iJIW9Osz/dTe11nuV1P8VYQnuoH9o6WWUc4VCUa3yNg==
X-Received: by 2002:a05:651c:54c:b0:394:3edb:eb82 with SMTP id
 38308e7fff4ca-39664e6171fmr38288591fa.1.1780346872228; 
 Mon, 01 Jun 2026 13:47:52 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-39659de42fasm27782341fa.19.2026.06.01.13.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:47:50 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Date: Mon,  1 Jun 2026 22:47:30 +0200
Message-ID: <20260601204735.888967-5-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346872; x=1780951672;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yiujKNTTXQ5V/X4fm6brIoWjKkEuCijxZKIb2kc0OGo=;
 b=01U/sNN5EXFtjeSU4TLaOCstHJC3DKPSVFuu96EMChWbS1KDc7TwaIU6EyqGrj2Pwn
 YLDMcC42649FavZZZIv0X7XJjexBAIBfwPSy9qrQGbjyZhF4khUJFbraP7ziRPgiYfMl
 A3fl+iOwNv8wNSxrtoMy4CLiCsjZNbZj5J6gzTwDz1tOO3+4gloMXxry21iuBl/dNhFZ
 NeuFKHoJLLTxpoNl+YJtaw6/xks38d5q5ajdRWOKGOG0MvINv1sMk7n9Lbafg7o2ZU/6
 6gDVVK44P11TmhpfhSEI0Yja3GRDfjhRoaLkHSHwWjneclaRJ4RLYmvwR3oxGyYElCc+
 0r3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=01U/sNN5
Subject: [Buildroot] [RFC PATCH 4/9] package/{skeleton-init-,
 }systemd: Install legacy.conf from the systemd package
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

systemd since version 257 installs legacy.conf again, but a different
version of the file compared to buildroot.  version 260 will once again
stop installing it.

Move the buildroot custom legacy.conf to the systemd package and install it
from there ensuring the expected legacy.conf is the one installed in all
cases.

Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

RFC: I don't know systemd well enough to judge if the legacy.conf from
systemd should be used over the buildroot one.
---
 .../skeleton-init-systemd/skeleton-init-systemd.mk  |  1 -
 .../{skeleton-init-systemd => systemd}/legacy.conf  |  0
 package/systemd/systemd.mk                          | 13 ++++++++++++-
 3 files changed, 12 insertions(+), 2 deletions(-)
 rename package/{skeleton-init-systemd => systemd}/legacy.conf (100%)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index b312fe33e4..e06890fee8 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -93,7 +93,6 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	ln -s ../run $(TARGET_DIR)/var/run
 	# prevent install scripts to create var/lock as directory
 	ln -s ../run/lock $(TARGET_DIR)/var/lock
-	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
 
diff --git a/package/skeleton-init-systemd/legacy.conf b/package/systemd/legacy.conf
similarity index 100%
rename from package/skeleton-init-systemd/legacy.conf
rename to package/systemd/legacy.conf
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9ce4f8fef2..428f49e4db 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -670,12 +670,23 @@ endef
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_INIT_HOOK
 endif
 
+# During the deprecation process of sysvinit support systemd has gone back and forth
+# on installing the legacy.conf file and to which extent.
+# Override it with a customized version.
+# See systemd commits:
+# - https://github.com/systemd/systemd/commit/5ca9149464c100548701ab0839712c57f67e2652
+# - https://github.com/systemd/systemd/commit/fcff83a5347679bde1e3bff1398cdc557a432f9d
+define SYSTEMD_INSTALL_CUSTOM_LEGACY_CONF_HOOK
+	$(INSTALL) -m 0644 $(SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d
+endef
+
 define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
-	SYSTEMD_INSTALL_MACHINEID_HOOK
+	SYSTEMD_INSTALL_MACHINEID_HOOK \
+	SYSTEMD_INSTALL_CUSTOM_LEGACY_CONF_HOOK
 
 define SYSTEMD_INSTALL_IMAGES_CMDS
 	$(SYSTEMD_INSTALL_BOOT_FILES)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
