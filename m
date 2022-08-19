Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A38CC32771
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED7041CF1;
	Fri, 19 Aug 2022 15:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED7041CF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7CnEzvQvA0go; Fri, 19 Aug 2022 15:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F2EB418EA;
	Fri, 19 Aug 2022 15:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F2EB418EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 087BE1BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D68094034D
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D68094034D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ar7VYG-vyVKy for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF81F4035F
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF81F4035F
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:30 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id x5so3543121qtv.9
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BexaqVSyozuDVPgWGQjlECJhTHc+JCnjMCGRfl6icKU=;
 b=gkntYL2B0kWmir/dg3nnDB9iWnHG7OXS/Xsw2NqCzZNuxyVvW0vMTPiTqYoOadtSRc
 Fipq9zWrTYt1BzGpz18auwX+DWye6cCWybNUVh9OsxgB9vds2mmUX8k3Qkn0xfXDQdNB
 1JZ7ZfphYFWD1x5O9Mz6I85rFBlVahJDJJRKvzpJZ5rbgpB5uzQx5vcvQNovgk4YfucQ
 yWRCckB3zC3GsfZlTUMgcEKPb/VlExSAs6nXkxvogVOaLo2IcpC7OpH+BIbxoLkfDMyl
 wqy8CA7PLqLE3XjaBqZGNdlEFfnPj0r279rxBFjx6DAdarWhllbpdBYu55S30XlBOJ7M
 F9EQ==
X-Gm-Message-State: ACgBeo2XchmEr++peoegrvWhcsEy0BgWcKjtYUtSZwyN1lqUhv/cU8qs
 zeeTtV0IkmES2Nib5en89UZ6xkheCSrcLQ==
X-Google-Smtp-Source: AA6agR74uQ3eADcMgDXR8CM3gva2FXgFzpMXaSqZVO8eNHvqP7/iDCzNyTC/fDWgqcaCnJ8coQByKQ==
X-Received: by 2002:a05:622a:54c:b0:343:5a1a:9ace with SMTP id
 m12-20020a05622a054c00b003435a1a9acemr6903128qtx.546.1660922309490; 
 Fri, 19 Aug 2022 08:18:29 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:29 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:33 -0400
Message-Id: <20220819151734.926106-9-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BexaqVSyozuDVPgWGQjlECJhTHc+JCnjMCGRfl6icKU=;
 b=cDLvXyW0KLljDbw0z3L0V27OdtVnTReM82YhDU1XaP9bNIYuuAuibl7WmeIJRb3kwH
 azd92gzweO2ockA5CyvjSscw7KmP1Ty+XdwbP0CYSFvTbDDeKQVoBgOW8ncEU+AQP55j
 7fcpMIY2VTOC30nIAXJ5mdMYNgCG1TtBJLb4sz/ME7i2Yo70q009SjntOu579Qgq8Ohf
 7zF+sDS42DlaEkFdZfKe9SAdQARseGigVuAG8Az3PPT9ow7f4mBSFfpRePpF+SYXMy55
 qmjXZEF86en2XN429xMq2lm6RcqBZnU6elBdLMXa763oYduSTkz9OVmPv00SrDDoJejp
 jeYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cDLvXyW0
Subject: [Buildroot] [PATCH v3 8/8] package/pkg-autotools: patch libtool to
 support ARM FDPIC
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch the target matching code in libtool to understand
arm-*-uclinuxfdpiceabi targets. To avoid the need to run autoreconf,
this patching must be performed in the configure script.

Without this patch, libtool refuses to build ARM FDPIC shared libraries.
This is especially important because NPTL thread-local storage is broken
in static libraries that are linked into dynamic FDPIC executables.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 package/pkg-autotools.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b6224b349d..60e70a6e2f 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -87,6 +87,16 @@ define CONFIGURE_FIX_POWERPC64_HOOK
 	support/scripts/fix-configure-powerpc64.sh $($(PKG)_DIR)
 endef
 
+#
+# Hook to add support for arm-*-uclinuxfdpiceabi to the configure script
+#
+define CONFIGURE_FIX_UCLINUXFDPICEABI_HOOK
+	@$(call MESSAGE,"Adding uclinuxfdpiceabi to configure")
+	find $($(PKG)_DIR) -name configure \
+		-exec grep -qF 'Generated by GNU Autoconf' {} \; \
+		-exec sed -Ei 's#((\s|^)linux\*\B)#\1 | uclinuxfdpiceabi#' '{}' \;
+endef
+
 #
 # Hook to gettextize the package if needed
 #
@@ -269,6 +279,13 @@ ifneq ($$(filter powerpc64%,$$(if $$(filter target,$(4)),$$(ARCH),$$(HOSTARCH)))
 $(2)_PRE_CONFIGURE_HOOKS += CONFIGURE_FIX_POWERPC64_HOOK
 endif
 
+# Append a configure hook if building for ARM with FDPIC enabled.
+# Must be added after other pre-configure hooks that might regenerate the
+# configure script and overwrite the changes made here.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
+$(2)_PRE_CONFIGURE_HOOKS += CONFIGURE_FIX_UCLINUXFDPICEABI_HOOK
+endif
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
