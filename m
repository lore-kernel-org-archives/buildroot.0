Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520B6F30924
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 09:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF36B81E16;
	Thu,  5 Mar 2026 09:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 118-mV5GMxMq; Thu,  5 Mar 2026 09:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF8781E22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772704205;
	bh=TN+SiO1O5YiUYgJsVmommuBQGr7zX70rEKmjcuWJiCA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWSLg9cMNIi4otOLm0dZTNtOXqx41JHduN5QPWAN/oPDMP1mTycgqjLZS4tf+q+qc
	 kSrXj3gInfZc1bFGZFNyz8E5VqwrkmWZH2cENh/QmQD+Vsed9PSffUdVRPYqTkJgqB
	 D/KE3SaxJNPVzjRmB7Zs7ts23NJhqtSgrWlKpDRAbl5AAl89DdGymvTURuBLsJhAsF
	 qNJ1MO72RDaR+XgV0JMxR8u9Md+tBSIcjrkQCu/8T7ONe94jcCuTkPiuf16QwmU9Fv
	 iT9CjYHEeFgZybFvVwggnxiUokEe0qB7rqADE0ffpool7tkGh9L/KJS2Dj/bJDIUAZ
	 z/76CXrrizGWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEF8781E22;
	Thu,  5 Mar 2026 09:50:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF83C1EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A57C0406DE
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 09:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0Fqz6iFZiRm for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 09:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C234C40AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C234C40AC8
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C234C40AC8
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 09:50:02 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-829781b2b01so914443b3a.2
 for <buildroot@buildroot.org>; Thu, 05 Mar 2026 01:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772704201; x=1773309001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2Eds7C/fkDbYFF7qK2uwWdtFZUhQy8wo1+Sb4JygY30=;
 b=F1Qp531oLdCbGbCKBVAAyUCBnIJAM0pcdPLAybmw/7glbUYtaeyB2RDAASU/BYBhA0
 ZzVRRylJpLpxeIftBFua67mXNv0qcf0Uz36IbR9byWjaLkvYx9GPStsDPV3I2u5kt8Ru
 P6CLR9RhIMzNChxqeSNp15E83FTz91V8c/iNAE8X4p6swDP1dVGiHpqiYwNkL4rptNz9
 cGsDEvwkJwynntACvKB58xKTb5AqN3AymY9oTRtVYM0aFlu8ip83lut6/DudyUm31DdS
 s9mMEHPlF/is5DGIbxmA87FLJSu/8XiXrzRytnXdav9ySsmOnPPckiQhBC+dL3M/bBTN
 46Hg==
X-Gm-Message-State: AOJu0YwkJLe2OYbhFEG2/zw0edtHO/pXSP1GlVkW5hSKb8VD1iLEBi1G
 r2PAOmVgkbsm0gbE+WGjKXJxBmtZv0mCNKAaf54J1RqkwKqiGPnKeurXdRjBO1Lm
X-Gm-Gg: ATEYQzykPJb3MauwfEdq5kfSEqMKH1h8ixE/VwUnAeFv9HoVzZBmiv3hNCM+PeXrybI
 4Umfy3xIZ8AwrUxSh6KWI6wGAOa8bryAQMFjS8mEGaYOIyFL7+Kqv7sIWtBby79t8vj3Y34sThC
 a1RaR+jps1sNew20f646D5EdPpmBS1MEa67ybcRJfwz0VNk6ZornKoBMvZwP9L9DV1KwTGVU72w
 +Og4engndIZLWZm3KB3m3YF/yVUZ2Ek/vYWtNIkPzwGrvSyEOlFKJcE9g/jrcOpNc8nzAvY7OF9
 Sk36v9oFvG9aJBh2Wa0mGIMcQYCXtVgWXnQK3z+CGLNEcFQwHr35WZ+GQGos46J4m6GlLBms4/3
 2aFqYu8SQj5d6lSdZz86YfRDS4fY4X/HknnjvwM7RYTfamnCa3Ca395suj6ABnY/OUVEpY86rv8
 nOrFwBfQvMARVWdCRXDkfPK4wZlldo6A==
X-Received: by 2002:a05:6a00:2499:b0:81c:92ec:ccf3 with SMTP id
 d2e1a72fcca58-82972b3c9c1mr3577872b3a.19.1772704201439; 
 Thu, 05 Mar 2026 01:50:01 -0800 (PST)
Received: from fedora ([47.31.72.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82984a01827sm1905880b3a.43.2026.03.05.01.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 01:50:00 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: joseph.kogut@gmail.com, andrew.smirnov@gmail.com,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu,  5 Mar 2026 15:19:46 +0530
Message-ID: <20260305094946.344077-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260222134120.1893854-1-chakrabortyshubham66@gmail.com>
References: <20260222134120.1893854-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772704201; x=1773309001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Eds7C/fkDbYFF7qK2uwWdtFZUhQy8wo1+Sb4JygY30=;
 b=GRChmTzHdm6cWPEfH7zGhRfxWBduJsiNwLgyezl+j8On6YbNI6De+Ho4YdcpCCwBv5
 lY3mVD03fFcXtBkCM4cXy49vEr5qPrdOtjkeNcjfjpt8fSUGQ1WOUvwK3DxHj4xsYZog
 QAIHHEk7F1keQO5MbDL9HttzVOpUvTz1151jeNVwgngAA58KYagdaOupHa+gbzCU8AD+
 CFLEaHI8EupHaTytdKaCGrElB3EBAsjG6PoPsoyUPRz2TM5HJOd74nZyBshVJQJoWBgt
 WmLLOuCxtg32IjopLZRrwVSaW0/TLTtW6APeCi9ExGZNUOtpgn2kuytedO73988yxvSl
 y73g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GRChmTzH
Subject: [Buildroot] [PATCH v2] package/zstd: add pzstd support
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

Add support for pzstd, the multi-threaded implementation of zstd.

The pzstd build requires C++ and threads support. On some architectures
(e.g., Microblaze, SPARC), it also requires linking against libatomic
due to the use of atomic operations.

Ensure that -latomic is passed in LDFLAGS during both the build and
install phases. Consistently passing LDFLAGS is necessary because the
pzstd Makefile re-links the binary during the 'install' target due to
its dependency on the static library.

Fixes build failures reported with bootlin-microblazeel-uclibc and
bootlin-sparc-uclibc toolchains:
Pzstd.cpp:(.text+0x17e8): undefined reference to '__atomic_compare_exchange_1'
Pzstd.cpp:(.text._ZN5pzstd15BufferWorkQueue3popERNS_6BufferE): undefined reference to '__atomic_fetch_sub_4'

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
v1 -> v2:
  - Consistently pass LDFLAGS with -latomic to both build and install
    targets to fix link failures on Microblaze and SPARC. (Joseph Kogut)
---
 DEVELOPERS                  |  3 +++
 package/zstd/Config.in      | 15 +++++++++++++++
 package/zstd/Config.in.host | 10 ++++++++++
 package/zstd/zstd.mk        | 29 +++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..526f2b81c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3563,3 +3563,6 @@ F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
 F:	support/testing/tests/package/test_quazip.py
+
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/zstd/
diff --git a/package/zstd/Config.in b/package/zstd/Config.in
index 9fa70c65cc..0331c5e446 100644
--- a/package/zstd/Config.in
+++ b/package/zstd/Config.in
@@ -10,3 +10,18 @@ config BR2_PACKAGE_ZSTD
 	  compression formats
 
 	  https://facebook.github.io/zstd
+
+if BR2_PACKAGE_ZSTD
+
+config BR2_PACKAGE_ZSTD_PZSTD
+	bool "pzstd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  PZstandard, or pzstd, is a multi-threaded implementation
+	  of the Zstandard (zstd) compression algorithm.
+
+comment "pzstd needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/zstd/Config.in.host b/package/zstd/Config.in.host
index 05751f8fbf..a4ab64baf5 100644
--- a/package/zstd/Config.in.host
+++ b/package/zstd/Config.in.host
@@ -6,3 +6,13 @@ config BR2_PACKAGE_HOST_ZSTD
 	  scenarios at zlib-level and better compression ratios
 
 	  https://facebook.github.io/zstd
+
+if BR2_PACKAGE_HOST_ZSTD
+
+config BR2_PACKAGE_HOST_ZSTD_PZSTD
+	bool "host pzstd"
+	help
+	  PZstandard, or pzstd, is a multi-threaded implementation
+	  of the Zstandard (zstd) compression algorithm.
+
+endif
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 70da1e7354..318a2709a7 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -78,11 +78,26 @@ ZSTD_BUILD_LIBS = \
 		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
 			$(ZSTD_BUILD_LIBS_BASENAMES)))
 
+ifeq ($(BR2_PACKAGE_ZSTD_PZSTD),y)
+ZSTD_PZSTD_LDFLAGS = $(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic)
+define ZSTD_BUILD_PZSTD
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		LDFLAGS="$(ZSTD_PZSTD_LDFLAGS)" \
+		HAVE_THREAD=1 -C $(@D)/contrib/pzstd
+endef
+define ZSTD_INSTALL_PZSTD
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		LDFLAGS="$(ZSTD_PZSTD_LDFLAGS)" \
+		DESTDIR=$(TARGET_DIR) -C $(@D)/contrib/pzstd install
+endef
+endif
+
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
+	$(ZSTD_BUILD_PZSTD)
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
@@ -96,6 +111,7 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		DESTDIR=$(TARGET_DIR) -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
+	$(ZSTD_INSTALL_PZSTD)
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
@@ -104,14 +120,27 @@ HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)
 # We are a ccache dependency, so we can't use ccache
 HOST_ZSTD_ENV += CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
 
+ifeq ($(BR2_PACKAGE_HOST_ZSTD_PZSTD),y)
+define HOST_ZSTD_BUILD_PZSTD
+	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
+		HAVE_THREAD=1 -C $(@D)/contrib/pzstd
+endef
+define HOST_ZSTD_INSTALL_PZSTD
+	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
+		-C $(@D)/contrib/pzstd install
+endef
+endif
+
 define HOST_ZSTD_BUILD_CMDS
 	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) zstd-release lib-release
+	$(HOST_ZSTD_BUILD_PZSTD)
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
 	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) install
+	$(HOST_ZSTD_INSTALL_PZSTD)
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
