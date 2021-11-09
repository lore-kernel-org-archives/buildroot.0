Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ED1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:04:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B2761151
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96B2761151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651F760817;
	Tue,  9 Nov 2021 17:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Poik8diaRt_r; Tue,  9 Nov 2021 17:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3E6160866;
	Tue,  9 Nov 2021 17:04:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 962EA1BF37F
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83322403F0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h86XAovn4Dq9 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:04:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D474A403EE
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:04:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c4so34197634wrd.9
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShbLd/QJuKu4IPo0k3h8VrCbXtyOnTPJtfvlUq9F70w=;
 b=FkNKLW82dFaRarMsDA4k83L5iz9FU7HqAQ+4mwPwXxfxAGMCMxAGqlczYiGj3ZD/Jf
 ZE0EXxf9WbKSggBudd6UfmR7zySKyJaJ8AlMHF6rA2YHE0esYD2U7IWVy5/MhXAFjBTK
 v6w35Hg1Z9Tpy+tZZskZELC/49Ez5v8ekwGk8bgFczEnyHAaw/ossjkHPCoBZRpT9cvM
 +FnwOKN6CluEG/mi1rBglux9bYlUWNwGuNY9hefPlxCKIvkMH/NMo5WKC3ngqxKVCasl
 IsHqYIwTq9zC07+v0NlCd6XAQ5Nl6Jjj56GHlM5bWMX1m8ukx2kXsRbSZG+swFxV2Fra
 h6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ShbLd/QJuKu4IPo0k3h8VrCbXtyOnTPJtfvlUq9F70w=;
 b=4N121MiatkwCfdtF7emkJwlUvayr0xH2ajKGo9+5WLeNNbtpZi7ZsDy1ZRmLP6CXeC
 A/b9f9SqH4nq3LBusD/cyJ50hme4UYDjMXXwGsCDZDfIhsmNqa4ttskCAzJFszNNKVdj
 dY7BAqs0nC0j7NHzxKqNWVRCR1W3xTQY9MmgcjPtf5wEH4UIEQ8/sukKjBX3yidN8fwq
 zP0aksc4DL51ddW4XF6JYPehHy7oR9k0W2rivT6yTU33WYzpdIx3sr9/49WF80e+5oww
 AzKi+69TPAXINLoPpgfBrz36viAW3bCJCRewOneLNo0nFqngtzrYj6pX07JrSRg/dxbM
 oprg==
X-Gm-Message-State: AOAM530tueD7xklNaRdE9G4M4kwZDADt0onNI7PxGv55YdrPIShLQgkI
 OkXh3nX13isfNuMBsHZleqL/6g7kLYnxKg==
X-Google-Smtp-Source: ABdhPJwY9DAffspwGIPRLbQ1GjEZQo6ogZexYNwnG9Nk7Aqm1mANvJRyoBL6TMS4728hsclShlVQMQ==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr11435958wrw.118.1636477464033; 
 Tue, 09 Nov 2021 09:04:24 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 by smtp.gmail.com with ESMTPSA id 10sm3539712wme.27.2021.11.09.09.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:04:23 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:04:20 +0100
Message-Id: <20211109170420.1948423-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] core/pkg-generic: also list files installed in
 images/
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages install nothing in target nor staging, but install images
(like the kernel vmlinux, or a bootloader boot blob...)

If we want to apropriately account for the files installed by each
package, we also need to take images/ into account.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ab48240283..5626af1d87 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -276,6 +276,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
+	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
@@ -402,6 +403,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 $(BUILD_DIR)/%/.stamp_installed:
 	@$(call pkg_size_after,$(TARGET_DIR))
 	@$(call pkg_size_after,$(STAGING_DIR),-staging)
+	@$(call pkg_size_after,$(BINARIES_DIR),-images)
 	@$(call pkg_size_after,$(HOST_DIR),-host)
 	@$(call check_bin_arch)
 	$(Q)touch $@
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
