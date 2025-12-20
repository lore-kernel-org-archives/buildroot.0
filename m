Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815D1E668B8
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A814092F;
	Sat, 20 Dec 2025 17:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMntqoizAPRl; Sat, 20 Dec 2025 17:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3074C408C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766252077;
	bh=3LyCJvi+7ni3ektBYiPbHW043JFguGo4Er2iJUDJRQo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=m1zshNFwVnWTNM9dS1IdRa5b7o2LFRhTbEDyVmpkXXZz7mCM0KtI8T0trh3nmq13q
	 6ArWnsXP1lOhdMJPqkAIx2CO/ITZbxJ+iTZ6F18kfSqunOTENht23yr2rcS270daVq
	 TSQP2rqRo/prHzOogLQ+2n2TyYh9TNmpM6ebSvcWjoh6xVtY6mS3NgJlD/cqHQCry3
	 qfB+JjfMv+rc//UL1ulvba8Q/oJL7q+iRIvAA+BUvGijvaS2NrZt5KCopZYNRZtNCS
	 gZutx9kzISn5BxCDPeB0oMr1nZSvVtHK30mRnuiDiG9tdLXhEkafQ8Miqkk+FqBZCw
	 vtqNdRpSIJ+ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3074C408C2;
	Sat, 20 Dec 2025 17:34:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED7381A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEA8E810E0
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aq7mWbvIdEon for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7828C80FA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7828C80FA1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7828C80FA1
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 17:34:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4325cb7d985so145869f8f.0
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 09:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766252070; x=1766856870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8TxgJuZCjkjXrlPeA0I2BmI0LyTchgFlvUucRTHTmKo=;
 b=nCq90HeigV+eifvpm8ltp10tSAqjd+5P4IvRbmYB7Fa8pzDFxW9paUT6cdSTcg0J2J
 5xZmpLA0Bf+21ZjyDH/RULDO1iCIFIyt6YdgtYLBTxV12g711mFTgE0enmc2dYhPwwkD
 +10LSFQ2Wi2/zUNbtmnbSgQ3Ivmlpz4iGBiTyxikn6YS95yfcgiifqPNGsKgiyEbMcBH
 S7MqlE7MqsMRKZ+c0flOBjzSCY1XkfXMoeXhpP8rfGNyE2mV2d1jv+tZ9KThqoQ8gft9
 3tUoXxXEQ9mYRJ9k+wVZtZxaGdaL7mjDV49hGVeGU2KUg3LoBcpBPR+Yl8TwlODAVB5B
 A7ZA==
X-Gm-Message-State: AOJu0YypBd4OfebCXbj7p0KywGGJ3psXEvbxEilwH4cXmd7MwUAqwoWA
 biAu6HFhq3B58Uwo4C6VREbw4ThAOdaz7MW/xS8zJE9IQ1f4S++kjvAIE6PyUMMBArh9b7xzraW
 MAqS+Wg==
X-Gm-Gg: AY/fxX71btSBWCoAG7sDFVnxvGxtSfcIoZhV67SDaC+oW9bDCy6uk0WHwlsRC6mpqA3
 oHi8ilHN2uHzATiT57nitYjHR59/huZ+BjYq8v6b66bp+bO2/6953PWq/xJrzd2DVKIvoJDo/HU
 TJGoNUhp0zHIfDasxZzay52ExgxD15gN08w+pNU6ZWuExnXvPdZTGeuszvFgpu3ZNKCRrj0cDnG
 UINRbICs//m60HxegH5BKRIdr9KTx8H364kOYKHX0BOY070AVAfXMIebG80+41OgM/zA3ZHyJys
 CsUWbOgojOEWuxDIV0PvNVEER9m7Ds9MTextmxHDEpf83FwWtZE8RlSrhvVbPgmTR0AP/R3pDOK
 KBieoxF0QGvF4qoNasSaDjZS0KI5NGa8RN3wLdp3OYFxFd014RkFu9QpXRJYGgfRbpbEYwG1n5b
 zPHqmvs3Ccc8jHRwryNrJalq/OaN8B6u3VyEo=
X-Google-Smtp-Source: AGHT+IFNi2yGDvjnZKfhSc3TyYAfs7kFRMV12NRhbl8UhbYtc1jxfLWE/hPnFu5ol4l5V83RRfS4XA==
X-Received: by 2002:a05:6000:26cf:b0:42f:ba58:6599 with SMTP id
 ffacd0b85a97d-4324e4fd943mr7161602f8f.35.1766252070182; 
 Sat, 20 Dec 2025 09:34:30 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4325dbc522esm1036447f8f.11.2025.12.20.09.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 09:34:29 -0800 (PST)
To: buildroot@busybox.net
Date: Sat, 20 Dec 2025 18:34:11 +0100
Message-ID: <20251220173412.433583-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220173412.433583-1-francois.perrad@gadz.org>
References: <20251220173412.433583-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766252070; x=1766856870; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TxgJuZCjkjXrlPeA0I2BmI0LyTchgFlvUucRTHTmKo=;
 b=Fg1tdGkokmiWUpFvVk9v9x+0SjBji3nO+VRd42XGf4Z9TW45FBKvsT7gIY/GZRec9d
 1WkPXIEtV3sbc9ifk99XnFp4rkJ0ufOGd7OXpJb5N/3i6aan1OoXc/btUKooWyS2L9Kp
 ztc5m0zJtuohSmwXfdGrxGJg2dr5V2KLwW+CUJSGTFFy29ZwiGWz8ClBk8rwROqyu7e4
 1oDN/8vEwPArWEZ4+xaR8rdqz0Z0DSifro3k/Gbo3ZbGtqvLXNcQNKKZLZiRcNBkFEWs
 bBpPdRHAoDB+Byew0A9iZbINmHl6oqQWwLWC6jer/phTLSKyTDQbWOC7YYLdfh1yyQ83
 TtPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Fg1tdGko
Subject: [Buildroot] [PATCH 3/4] package/janet: new infrastructure
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                             |  1 +
 docs/manual/adding-packages-janet.adoc | 59 ++++++++++++++++
 docs/manual/adding-packages.adoc       |  2 +
 package/Makefile.in                    |  1 +
 package/pkg-janet.mk                   | 98 ++++++++++++++++++++++++++
 5 files changed, 161 insertions(+)
 create mode 100644 docs/manual/adding-packages-janet.adoc
 create mode 100644 package/pkg-janet.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5ac155572..20c3550cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1194,6 +1194,7 @@ F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
+F:	package/pkg-janet.mk
 F:	package/quickjs/
 F:	package/rings/
 F:	package/tekui/
diff --git a/docs/manual/adding-packages-janet.adoc b/docs/manual/adding-packages-janet.adoc
new file mode 100644
index 000000000..3b39da7ba
--- /dev/null
+++ b/docs/manual/adding-packages-janet.adoc
@@ -0,0 +1,59 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for Janet packages
+
+[[janet-package-tutorial]]
+
+==== +janet-package+ tutorial
+
+First, let's see how to write a +.mk+ file for a Janet package,
+with an example :
+
+----
+01: ################################################################################
+02: #
+03: # janet-foo
+04: #
+05: ################################################################################
+06:
+07: JANET_FOO_VERSION = 1.0.2
+08: JANET_FOO_DEPENDENCIES = libmad
+09: JANET_FOO_LICENSE = MIT
+10: JANET_FOO_LICENSE_FILES = LICENSE
+11:
+12: $(eval $(janet-package))
+----
+
+On line 7, we declare the version of the package.
+
+On line 8, we declare our dependencies against native libraries, so that they
+are built before the build process of our package starts.
+
+On lines 9-10, we specify the licensing terms for the package.
+
+Finally, on line 12, we invoke the +janet-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[janet-package-reference]]
+
+==== +janet-package+ reference
+
+As a policy, packages that provide Janet modules should all be
+named +janet-<something>+ in Buildroot.
+
+JPM (Janet Project Manager) is the build tool used by this infrastructure.
+
+The main macro of the Janet package infrastructure is +janet-package+:
+like +generic-package+ it works by defining a number of variables providing
+metadata information about the package, and then calling the +janet-package+
+macro.
+
+Just like the generic infrastructure, the Janet infrastructure works
+by defining a number of variables before calling the +janet-package+
+macro.
+
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Janet infrastructure.
diff --git a/docs/manual/adding-packages.adoc b/docs/manual/adding-packages.adoc
index 10acae0b1..437271662 100644
--- a/docs/manual/adding-packages.adoc
+++ b/docs/manual/adding-packages.adoc
@@ -43,6 +43,8 @@ include::adding-packages-golang.adoc[]
 
 include::adding-packages-qmake.adoc[]
 
+include::adding-packages-janet.adoc[]
+
 include::adding-packages-kernel-module.adoc[]
 
 include::adding-packages-asciidoc.adoc[]
diff --git a/package/Makefile.in b/package/Makefile.in
index 5ebb5f9ba..bc4d0a7bb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -474,3 +474,4 @@ include package/pkg-golang.mk
 include package/pkg-meson.mk
 include package/pkg-qmake.mk
 include package/pkg-cargo.mk
+include package/pkg-janet.mk
diff --git a/package/pkg-janet.mk b/package/pkg-janet.mk
new file mode 100644
index 000000000..e368faa40
--- /dev/null
+++ b/package/pkg-janet.mk
@@ -0,0 +1,98 @@
+################################################################################
+# Janet package infrastructure
+# see https://janet-lang.org/jpm/index.html (Janet Project Manager)
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for Janet packages.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this Janet infrastructure requires
+# the .mk file to only specify metadata information about the
+# package: name, version, etc.
+#
+################################################################################
+
+################################################################################
+# inner-janet-package -- defines how the configuration, compilation and
+# installation of a Janet package should be done, implements a few hooks to
+# tune the build process and calls the generic package infrastructure to
+# generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+define inner-janet-package
+
+$(2)_DEPENDENCIES += host-jpm janet
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	cd $$($(2)_SRCDIR) && \
+		$$(HOST_DIR)/bin/jpm build --verbose \
+			--ar=$$(TARGET_AR) \
+			--c++=$$(TARGET_CPP) \
+			--c++-link=$$(TARGET_CPP) \
+			--cc=$$(TARGET_CC) \
+			--cc-link=$$(TARGET_CC) \
+			--cflags="$$(TARGET_CFLAGS)" \
+			--cppflags="$$(TARGET_CPPFLAGS)" \
+			--headerpath="$$(STAGING_DIR)/usr/include" \
+			--ldflags=$$(TARGET_LDFLAGS) \
+			--libpath="$$(STAGING_DIR)/usr/lib" \
+			--modpath="$$(STAGING_DIR)/usr/lib/janet" \
+			--offline
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	cd $$($(2)_SRCDIR) && \
+		$$(HOST_DIR)/bin/jpm install --verbose \
+			--binpath="$$(STAGING_DIR)/usr/bin" \
+			--manpath="$$(STAGING_DIR)/usr/share/man/man1" \
+			--modpath="$$(STAGING_DIR)/usr/lib/janet" \
+			--offline
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	cd $$($(2)_SRCDIR) && \
+		$$(HOST_DIR)/bin/jpm install --verbose \
+			--binpath="$$(TARGET_DIR)/usr/bin" \
+			--manpath="$$(TARGET_DIR)/usr/share/man/man1" \
+			--modpath="$$(TARGET_DIR)/usr/lib/janet" \
+			--offline
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef
+
+################################################################################
+# janet-package -- the target generator macro for Janet packages
+################################################################################
+
+janet-package = $(call inner-janet-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
