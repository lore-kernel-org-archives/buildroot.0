Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AB3C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 22:36:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F12A960E78
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 22:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F12A960E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3BCC60632;
	Mon,  9 Aug 2021 22:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6UQsUGWjF75; Mon,  9 Aug 2021 22:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C8B60794;
	Mon,  9 Aug 2021 22:36:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A12241BF3CC
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 22:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F2E94020A
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 22:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXyDNL_ak8Yr for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 22:36:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA30E40350
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 22:36:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z4so23449171wrv.11
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 15:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHdW5JwnusOWP8VcyID+iQDPcPkCcG1EEYigm9c53wg=;
 b=Q+as3O3uKyjsmCqWNRM1cnyypxrnLpmeTD2xtwlM95HOFHdiOUGNKyciMUrIgKpnMP
 qNhFA2ZJqCnEcJQb5ItoEY1ecgrwWyW3rkl9Q0CH9vgA/tK8iRBW4jwbJrIZzjFaJAP7
 Xz7kAkO3bDdTFro1DeaxK5wtuAfxNRX+m4XfqSuF+eaRheM+n4h2S79yf6St1/LO2B+3
 rd2FWc/CRf6Ekw2PdPcSd7f2pV3b76ZuvENtnTBq5p3J3v1Cg0EKv2FSBiUJWyROa0c+
 boYZLrDbBDCtDpFoP6zwSt7YtLuGlpyvhAyqs17dVYZQqwMATMB1U45e05nd+XsjJDQi
 K0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHdW5JwnusOWP8VcyID+iQDPcPkCcG1EEYigm9c53wg=;
 b=Ez04GZN72yXBdsK8mm5u/6KR/EmkFkiN8z16lEYuU8xhQq+5r1nQIGhFiO+oIuxfmJ
 +5/AuiewFVyaX/IRlfmMC9tmdcz69apdD52prkchUkhM0+eBW32hu+yl3AUNunyzEzxy
 13u1IFR3PpiCq1o7Wn/zN/I/uE/e1cm0d67reS/DnA25R/VTRXQNZ08mnHUuiauVDQkd
 2dlEUZVaRJZEPrLecA6DaKyZJ/kiuuvd+qEhTJGjKe1BEUhFDfmcDweXd2mHyaK2TQBZ
 krRa4brQqdX+tfZYcBHDrqA8nyodnW+6hHzIeqfKNU204uLs+ZI4aLSU/8mOxkgbVXrK
 ephg==
X-Gm-Message-State: AOAM5322DL+wCteaE1I3HQSrQujKyS12HtQ4SOtYmk+CkIYS+akng+mu
 4AnLJliZCLCFlYoJfOHrYVAq06sFaFtrFg==
X-Google-Smtp-Source: ABdhPJzowiHkEnFeDab+sqKaMzMzo5y7nAN6p0Yc5JYI0oo5aSHQtCrUPXznC8Gx53IxLeYarpzN/g==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr26936687wri.128.1628548561873; 
 Mon, 09 Aug 2021 15:36:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id t1sm771919wma.25.2021.08.09.15.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 15:36:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 00:35:47 +0200
Message-Id: <20210809223547.2961300-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 exec_prefix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

exec_prefix has been removed since version 1.66 and
https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a88b1ac548516ab25140a2e9dea8cac894bbac93
resulting in the following build failure with rygel because libgee
installs Gee-0.8.gir in
output/host/aarch64-buildroot-linux-gnu/sysroot/share/gir-1.0/Gee-0.8.gir
instead of
output/host/aarch64-buildroot-linux-gnu/sysroot/usr/share/gir-1.0/Gee-0.8.gir:

Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file RygelCore-2.6.gir: Failed to parse included gir Gee-0.8
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

So replace exec_prefix by prefix

Fixes:
 - http://autobuild.buildroot.org/results/b04b27bbb84fa6ab9a8441e7bd94aad45226dce9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gobject-introspection/gobject-introspection.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index fbc545b3c7..f56d0c5eff 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -127,11 +127,11 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 	# By default, girdir and typelibdir use datadir and libdir as their prefix,
 	# of which pkg-config appends the sysroot directory. This results in files
 	# being installed in $(STAGING_DIR)/$(STAGING_DIR)/path/to/files.
-	# Changing the prefix to exec_prefix prevents this error.
-	$(SED) "s%girdir=.*%girdir=\$${exec_prefix}/share/gir-1.0%g" \
+	# Changing the prefix to prefix prevents this error.
+	$(SED) "s%girdir=.*%girdir=\$${prefix}/share/gir-1.0%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
-	$(SED) "s%typelibdir=.*%typelibdir=\$${exec_prefix}/lib/girepository-1.0%g" \
+	$(SED) "s%typelibdir=.*%typelibdir=\$${prefix}/lib/girepository-1.0%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 endef
 GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
