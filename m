Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E14C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:22:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13BCA60F12
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13BCA60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D308D83E5D;
	Fri,  3 Sep 2021 16:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YEFLYPz_ncwR; Fri,  3 Sep 2021 16:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC5780F79;
	Fri,  3 Sep 2021 16:21:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9700A1BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93F4580D96
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id us7olzaLSgJd for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:20:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFA2280D88
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:20:41 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id g184so6016265pgc.6
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1e+TjQ5E/oH7/8sE+dNUb2Rj/cZfHlOI7LfccoUooM=;
 b=TUvvmaytj4aThJv6sMyt7PZq6qEwOVY7gy5/g2iGUPAE+ydCcfv/Pm9jJzCSGQ9nT+
 iIBG+CyR404EMIvGZZwALCCleQsWCUVYdtzDMNa/fqqCwXMl1Y6j11R++uymMZ/Ei3pd
 CSx1e1VThCN1CnrQ20e29nBnEqcXb8yqg4apWmDzGazCaUmGS+uFPkk9fWy07yq9zDtv
 P8Hiz2s8w0oVxS1Fwl3Gmr966vFTNhjP4ObisLHpy06NWeKWVIwIQG8j00htLRaQm9qn
 slYhkA3ffGqMGomjitYCltWDm9gOK/HfhfKU9YgaeeF8m9+5s7Hp9vOWnPZwADwl/T3Q
 OniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1e+TjQ5E/oH7/8sE+dNUb2Rj/cZfHlOI7LfccoUooM=;
 b=IlND5hF8CCraqo6mGu9X/pKMwRAIytbQ1FqjYLDFUCO59ziqPTieuAdYzvpV43CFYV
 vO3JfzmZq+oLZD/GLzmTolwLW8DcQEJnGC8n36xQP4yz53B98n7mwFYYbURBeMDw8I5A
 p7muvK+8MtAh+mVDPIlU4HEnJFmatZdjRUzfqpvVk6oSAJbC7zF5UhmcJBqeU0w84ssV
 RvYedF+Fct33X1dtdNkT2ytaAWH0HGQduKQ5yXyjo3sekT4zuG+2f4GvGcEdVcjTDuj8
 /M4RZnI37uVo+b1mGKyI8M5deCCJTPayYiqt9FfFIacwNrqp8eVVzJ64lc0Ibvk40CRv
 TTyg==
X-Gm-Message-State: AOAM530lhsmL4n9QmpPzqfvzQd4EYiuj2z8SnSJt6DkzeLezobu/rSAS
 i1R/KmRzslss1DUZHxrLVXbcisiOR6rhaQ==
X-Google-Smtp-Source: ABdhPJw3+GXrRbmISQqJmbRKhGTcrGkiPiY7FWqeENffz0f/cFUjrh8x1PIrICJbuJrJOVLA/3lbLg==
X-Received: by 2002:a65:648b:: with SMTP id e11mr4262648pgv.138.1630686041015; 
 Fri, 03 Sep 2021 09:20:41 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q7sm5586184pja.11.2021.09.03.09.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:20:40 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:20:27 -0700
Message-Id: <20210903162027.1935040-8-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 7/7] package/gobject-introspection: Add
 QEMU_USERMODE_ARGS support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Now that the qemu package has the BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string,
the gobject-introspection g-ir-scanner-qemuwrapper script can pass that string
to qemu.

Add the QEMU_USERMODE_ARGS to g-ir-scanner-qemuwrapper.in and unconditionally
sed @QEMU_USERMODE_ARGS@ with BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS.

Fixes:
http://autobuild.buildroot.org/results/2e9dbc0d36600c09fa9e59ab1b1903c9f40661e8

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gobject-introspection/g-ir-scanner-qemuwrapper.in | 2 ++
 package/gobject-introspection/gobject-introspection.mk    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
index 5ece75d0a4..e434502e2b 100644
--- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -5,8 +5,10 @@
 # Use a modules directory which does not exist so we don't load random things
 # which may then get deleted (or their dependencies) and potentially segfault
 GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
+QEMU_USERMODE_ARGS="@QEMU_USERMODE_ARGS@"
 GIO_MODULE_DIR="$(dirname "$0")/../lib/gio/modules-dummy" \
 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
+    ${QEMU_USERMODE_ARGS:+${QEMU_USERMODE_ARGS}} \
     -L "$(dirname "$0")/../../" \
     -E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
     "$@"
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 81938b14df..23d6a8231e 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -84,6 +84,8 @@ define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
 	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
+	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
+		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
 	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
