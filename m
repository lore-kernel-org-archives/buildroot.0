Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D9CD98D8
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AFE760ED2;
	Sun, 14 Jun 2026 15:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzS4ytL8t4mr; Sun, 14 Jun 2026 15:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC7960F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452435;
	bh=LS42nl5IRq1o30kPuM9O0ouB70LUn9ohHYtVSGAmjkg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NlaZiZWJGEaYjQlsYWucuL+8LemaZrwHVoWkyCoDNQ4FtedwMt4w7qxo8P2yskwhV
	 +roJj8QRk34PVtGLcejWtfNMnDaNZqy0yQG/dgmtadaBaVT84qGZOkRX56L3zDs8bp
	 lfeU15G5LGa/AYRtzWa75S8M/WoGTSiJ6Oy4v+EVjKrnxIgHUCga4kR6hrVBb+UC11
	 VQSph9dEs6VlrPfKGikpQVyDC4DblUhBGQwEicYIy60dkkolVuXfeRCDdpiNzcxF+V
	 nNXR5zO4KE/0T/bQdUXJK2isK/JHutUdd1JgSIQiUXif62uKyhHBEFlrtTFSp2hJuQ
	 N38D0LTGvVQSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC7960F26;
	Sun, 14 Jun 2026 15:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21F80DE
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1402841045
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYHetsJq9xjs for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:53:53 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 165EE407C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 165EE407C7
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 165EE407C7
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5aa63628d26so2285696e87.0
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452431; x=1782057231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uVgjvceP5Dy4TkD6K6lWp3IEBk/hqDa/J5cYrj5q/z8=;
 b=SJhuADG7KSDBBPsiB47sbz3UxwNqtPfRibfPXYL+0lB+e8CSKARSJP5eNKfJMRjofp
 iOCBztnJM8Kpho0K8gGrcAwNYZhboY+zgJ5xr0TKDGHuGlNpajbdvxFczjwyVuPhijmA
 2YRQ2TYN3PCUzzj/ifmPC2VomlVoCWRL36HlLe0UD2FtWSzP8PYz1CZJr+1//SstQo5K
 h9qWmdOGkoG07q5K+mnvxBe8stCbH0h9lIDw1mLyPLHmqaedzn4xeYJVF00pe+qoRTVL
 S91wzukdStruBiYDirl8tG0MGdh9coVVkkGy9qq6Nvv4mMA32kTH94m7kn/uL10qQIR3
 /PSw==
X-Gm-Message-State: AOJu0Yz2KyE6iFSFCK6KQ+TZpcepAb+0a7hWtGYo2MnU4UBkLRHpJF5b
 qJ4eKdhlAL0AZgnmpZ9RBPwCI0Dd8BGXi+4EGz67bUFB9n74bzhQ5as2l0ewPXV2nfTlJGdA7/e
 mYw/Z9IskBw==
X-Gm-Gg: Acq92OFZ6sFfRZnb0W44vSf/aJIjuhu4ch5fmbHmcwH1FWVL9PKnFfM2JUxDQ0GMvJa
 k7Q1m5E0ALBF4ZXyweyK3rVT+7mZLnJxQFEBBstq+tOX8jP3yRuN16IlntV4DawijQFRdI/OdS6
 Zl8QsDyO7sKRq4BM8bmaCoJP7FQu5mhKg/AFOYxIb1J9MxgblsA7Ze614zlKUJsUHKF22NoAQwm
 AsgKAUh4xkxx0YlRSNXUAle4WQIHpG/yfEiqHKkPHNrp4mx01aBtu5XAP6qUTTQAS+wtj4FCWuP
 t5jcb/Xd/u04ShiuL33Fq9C33GJAuPTu3EBVlN/Sds5YNN3ZziA2/QpDmLf0hPOE7Q5cZqNNt8i
 G/Q9uRTC7eoxbEX2Kht/7giHUTDgW2+T7eKn9vFTpjW4mtNDo9CMFV+/D1LsafKGglgHNFFoPRd
 +58VFOukxANX2WzwR/3zFHr+NybiWKptLfS1RJoJf5V3hJoyul+NE+p6NQ9feOfpj/
X-Received: by 2002:ac2:5594:0:b0:5aa:6a5c:be3c with SMTP id
 2adb3069b0e04-5ad30da1264mr1408992e87.14.1781452430790; 
 Sun, 14 Jun 2026 08:53:50 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5ad2e1717b2sm2058692e87.36.2026.06.14.08.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:50 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Date: Sun, 14 Jun 2026 17:53:24 +0200
Message-ID: <20260614155328.304282-5-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452431; x=1782057231;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVgjvceP5Dy4TkD6K6lWp3IEBk/hqDa/J5cYrj5q/z8=;
 b=VmE0egUkgAVlpVh/vsrSBvnjMr5EsojrIYOtN1Jz0ea0iFCBbWJxnWIHX811mEG5cY
 bPyKRgI1eSasBb4qzdIMi9Jf6qFAfg2Aq+o0rM5RFmwgqd8NbM9NIrbdrc1hZjPYhpN1
 XpTaS/SVS8gyGm02PHk7K+yB8idTXF7I9FDhQM8Cc+SP0uxDAPMAkQG7Vjo+SbjHt9OT
 zsdqyCRYD+v0I5Z1a6H9DjlwUn9w2rr6/fnANfQbyWCj3CHxVFEhGnBX9JL7JFNQFhXI
 0lvy1eK+Kf9Dkn8mE3YwNXiUWizU63iReBvAIneILv78ZQusTMciE5EWzQ9JnwwbB6LG
 xRiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=VmE0egUk
Subject: [Buildroot] [PATCH v2 4/8] package/{skeleton-init-,
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

v2:
 - Unchanged

I don't know systemd well enough to judge if the legacy.conf from
systemd should be used over the buildroot one.

Norbert or Sen, please weigh in on this!
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
index 3223915d40..9e77ace2f8 100644
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
