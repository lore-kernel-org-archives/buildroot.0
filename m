Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A90DC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 07:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD51A60634;
	Sun,  9 Jun 2024 07:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msX1WF7MZJ3g; Sun,  9 Jun 2024 07:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8CD76065A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8CD76065A;
	Sun,  9 Jun 2024 07:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80CAB1BF3F6
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 07:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79D4640106
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 07:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MnULVsC25zS for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 07:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95028400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95028400F1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95028400F1
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 07:54:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-35f1691b18fso635212f8f.2
 for <buildroot@buildroot.org>; Sun, 09 Jun 2024 00:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717919685; x=1718524485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFECqvl7Zg09+/56Jl+2/AU6miHJGev2/LQrye4jECI=;
 b=a0OXPRVEVYLkhbMOsSiNhYqNnCXGM32MJfF62OxaccwADgyksCsdSKw5ygyV8V6E6B
 hlaeenC/TjZRfPxo/nJ3CcqSD7Dx9iWFCjiKwa4VM1SgT0I9MJjTT2uuFYjiTLlsd5gY
 k8WLbT75Iq7IO+jtzPuJwvn0mAxMsAQ8DCy6IEWj09SlDLjsNhFyMfsG3YrI1pkP6mT6
 BiM3RByZJKaGyIl1qIM0FH174CCWRYXvHaGN9hpEFZL78vso7Ld1sQzNDu49C1yMKIjF
 IZzbBKyFIEK1W5MqyHEkjnhK99EAri31VcQGsPnpODg624uI4uiSjqjho+nO+7kuCnc6
 eVqQ==
X-Gm-Message-State: AOJu0YwHBNGskPe+dNSWfY6kxCE9e6eM5Fpx0JiSAsIzjAZETpM+WM+3
 X66otddFzC5nEZXbofLUD45wNKKMh17ZdK4/obJOh+v1StiB/dxQ+Dk/3w==
X-Google-Smtp-Source: AGHT+IGlmTlPhO4U2JxObwqprhO1759nkjP6vpE000jfS+OrxCSjIPEhaaSc+qi2S7vezHHmXtjVsQ==
X-Received: by 2002:a05:6000:1fa5:b0:35f:22df:8d9a with SMTP id
 ffacd0b85a97d-35f22df8f9amr153087f8f.69.1717919685355; 
 Sun, 09 Jun 2024 00:54:45 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d297b3sm8039359f8f.11.2024.06.09.00.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 00:54:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jun 2024 09:54:44 +0200
Message-ID: <20240609075444.747339-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717919685; x=1718524485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sFECqvl7Zg09+/56Jl+2/AU6miHJGev2/LQrye4jECI=;
 b=CjEGjdPIEYlVbn8gAcS4eHTyW5JaChcnnXOgePBQ6zcTk9kPMzxNXWoapHAHQcsvyO
 8mCIXUtbujURoFIpERTjzYWGOrSQpEU3XICOFIfXNpB03IwNHohdBJrJRqJVrGtnofhx
 OqpUr0bQkcnc5jU0962L11leFTYUEk6VL2j3sqv/Bzwp06wJZeMQSTD4j1H8QeHnVe5I
 RwvZE9G7vqdA5uOP3j8OIrCITVOZsP47SiBO9JiyPwLC6NAUulAM/t0+vrtnb/WwNstl
 gnQdBK0C+vKpsjs2lcabJ2n6hyGDSAic4O7Zx0PiYzBofAMo2NdhaCsVgG3F2R6kkKJr
 RD1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CjEGjdPI
Subject: [Buildroot] [PATCH] Makefile: run PPD and RPATH fixup in
 host-fialize
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
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the gdbinit is generated and installed during post install
hooks, either from the gdb package, or from the external-toolchain
package. When using per-package directories (PPD), the staging directory
of the either package is stored in the generated gdbinit, which is not
going to be valid when all the PPD staging dirs get merged into the
final staging: it would lack any library installed afterwards, i.e.
mostly everything would be missing (but the libraries from the C
toolchain in the case of an external toolchain).

Similarly, all the RPATH will point to various PPD drectories. This
does not cause any issue when the final host is aggregated, because the
PPD directories still exist when we call programs from there (e.g. from
the fs infra, or from post-image scripts).

However, we knew that would not always be possible to keep the PPD
directories: we have the prepare-sdk rule that runs a cleanup pass on
the RPATH, and also applies the generic PPD fixups.

When we introduced prepare-sdk in c32ad51cbf2a (core/sdk: generate the
SDK tarball ourselves), we did not yet have support for PPD for the host
directory, and especially, we did not have the host-finalize rule, which
was only introduced in d0f4f95e390b (Makefile: rework main directory
creation logic) which kick-started the introduction of PPD.

At that point, we did not realise that the rpath fixups from
prepare-sdk, would be better moved to the new host-finalize rule,
because that had no impact unless one would need an SDK.

Later, in 25e60fbe1cab (Makefile: fix SDK relocation for
per-package-dirs), we eventually introduced the PPD generic fixups in
the prepare-sdk rule. Again, we did not realise that those fixups would
be better placed in the host-finalize rule rather than the prepare-sdk.

While fixing the RPATH in host-finalize is not critical, fixing up the
PPD paths actually is, as the gdbinit case demonstrate.

As such, move the PPD fixups to the host-finalize step, and while at it,
also move the RPATH fixups.

This now does not leave much to do in the prepare-sdk step, and that
could very well be moved to the host-finalize rule as well. However,
some people may have started to rely on prepare-sdk in its 6 years of
existence, and the little script it installs is not needed unless one
really needs an SDK. So leave it as it is for now.

Reported-by: Casey Reeves <casey@xogium.me>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Casey Reeves <casey@xogium.me>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Brandon Maier <Brandon.Maier@collins.com>
---
 Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 3bef434466..6c2a2ccddb 100644
--- a/Makefile
+++ b/Makefile
@@ -594,14 +594,7 @@ world: target-post-image
 
 .PHONY: prepare-sdk
 prepare-sdk: world
-	@$(call MESSAGE,"Rendering the SDK relocatable")
-	PARALLEL_JOBS=$(PARALLEL_JOBS) \
-		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
-		$(TOPDIR)/support/scripts/fix-rpath host
-	PARALLEL_JOBS=$(PARALLEL_JOBS) \
-		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
-		$(TOPDIR)/support/scripts/fix-rpath staging
-	$(call ppd-fixup-paths,$(BASE_DIR))
+	@$(call MESSAGE,"Preparing the SDK")
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
@@ -719,6 +712,13 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	@$(call MESSAGE,"Finalizing host directory")
 	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
+	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
+		$(TOPDIR)/support/scripts/fix-rpath host
+	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
+		$(TOPDIR)/support/scripts/fix-rpath staging
+	$(call ppd-fixup-paths,$(BASE_DIR))
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
