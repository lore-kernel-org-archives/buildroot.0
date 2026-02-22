Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BBDC636A0
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 13:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58EBD83E0D;
	Sun, 22 Feb 2026 13:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpkR6G4nwq0t; Sun, 22 Feb 2026 13:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F1F583DFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771767734;
	bh=EQFJco02R3kxKVCnXrUNPF7anH2JU6CN5+1YJSspFew=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EpRLOxn0GT8jOHLxcsTWe8YUfHjsKoYGWzu3U3fvFLR0O2VTx4cb+4sMJ7oqlqhYv
	 Sjc2RyAiB73LmfDMCLZeaLtfyqI8X8w+oRGgRcszHUsLAQamWU74TQWp4+4uxr/e/3
	 JchaS0rRdQQdoB1MfU6pRemBUYEsmpRJH7SlsqBCP02ZG2Wo6Pxz1MMQ7iV3aEDDuv
	 tGodFadz6ABRMJ036+IBVjuTvd379/cGJd9Z9nijTjVUmECRdhJQt/eIf07hn2W7gi
	 rspfvbILZsdsqxUjs81cYwSqVSZMe6AAan5mvu7mPDmZQHAXad6IV2pQmeizIGSeh8
	 C7WpnEkV5UX7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1F583DFC;
	Sun, 22 Feb 2026 13:42:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C3E91CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 13:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5B1360E4B
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 13:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fEeLNvGp10W for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 13:42:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F31E860B39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31E860B39
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F31E860B39
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 13:42:10 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-354c16d83b2so1619540a91.3
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 05:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771767730; x=1772372530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2nVdctSZXPTbv6lMvs1Dp+0l0CmEmRIWYlUM/ySvks=;
 b=AAX8texJhYhyhGB/ucu0O+hLUyOE3Ijtkm6GuwOArXK4TjTkPWmpKf64NW/4zaoKky
 81e2lWDbcCWbmqFrwyDq8xnQp/Pez6CW1iUyivsVEPQ4q8s6/78KfHBWTDha86vMjyrR
 2qEiG7j1LTYUXjT1BJHI6aAzKwboAbaE1CI407/+JXsLjABDy+IwRgWtMGGhwkkaTsHm
 dRLqaqqwWjTXVRJQPGuQfDSvSrkV0L7E/hO7Lk22PcgumKjVnQHoTzaNUVI7nDZ82EO5
 uzSQydqJhWAfPBpn9kQXW9391ybpQz6dx9GTWx2OqgnhLi7Tn+uS32JiKZuHMqf6XV+E
 PXtg==
X-Gm-Message-State: AOJu0YwTtRpp87b3Ue29rpB7YzCWwtC5YPwJNMNSCXDQaiCCiBmBTaKv
 g2oWzEtoChaTGqdt1wwlfcbYisQ+JVVKYdH/QRM+aXsuKIz+pgFvoxzV/FLfXQ==
X-Gm-Gg: AZuq6aK5Zmv8zFPixpRMVs4tyU4C33pqZgccKga9kZ94tceVfvQ6m0O7UDxhuOTuk7P
 3ad24GHdpXda1FCLQ4VQeyvW/eEpyjN6sBMcNJ+hTTs4BL992qUS1YMuWpR1J29817z1JB1PWad
 pbsTcDEMJJjTS0vMxaRka89k1cQVBUtGWmpss9Ziesul172fsH4RQGQeiYO0D7IP3Jv1Nbwu8B/
 fyuwCn4o7oDmd9wEZu38prLqnDtRwfhdlNul74q3z1Xie0EyfUv2pLu+UL4NJK28XiEFVGV5juk
 2+EQItSc8f2R2N6FQP1LAilDn1NLjTOPW3V5MKCpSd0fARBYv5gWUZL+lOaathmEqeMkQ2KogPH
 +bnuIPUgGgbkspmHP4IE2GPA/EVu4mqvl1dFoQumVcA2+9H9hvXr3Uw/HqXCQAR5ooE8E5ij1ZH
 YKxKvqrM7mk5qnFG91YfZ0XwuloNXmozT6K2Y=
X-Received: by 2002:a17:90b:3949:b0:354:bfea:efea with SMTP id
 98e67ed59e1d1-358ae8c2a87mr4326893a91.25.1771767729758; 
 Sun, 22 Feb 2026 05:42:09 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358a2afcd72sm3484350a91.7.2026.02.22.05.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 05:42:09 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: andrew.smirnov@gmail.com,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 22 Feb 2026 19:11:20 +0530
Message-ID: <20260222134120.1893854-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771767730; x=1772372530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j2nVdctSZXPTbv6lMvs1Dp+0l0CmEmRIWYlUM/ySvks=;
 b=H0xQ6CVxvkohAbFutFp62qRxWjY2RIzVguAnOeDis3BhEdYx2bT7vYsk0ID0tGRcAl
 P0fhjENYoS9jPn3pmGssFi5GksCRJabieW/1v3gNT+BbIUO2PUxFbvRdJa28PRv8ln2Z
 /7+68GdUUnIPzphnFBfO4NtIEPt5w5WXZSCLPq/nxt+VmVhu5DApct7vvS//r81gQPSc
 NBJeGS/KcPT35qsadNZjavyWfVTd+2dj36oVnp81rsgjY2+gR4xtidf2nxesW0WZnrLH
 zplH6GTjeaUL/G1HXK64ppz5rU2sOJ2L7XXoYqHbq6+Pv9LK7KHiE34qIqx4Ztiz4SBR
 JpoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H0xQ6CVx
Subject: [Buildroot] [PATCH v1] package/zstd: add pzstd support
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

PZstandard, or pzstd, is a multi-threaded implementation of the
Zstandard (zstd) compression algorithm.

This commit adds sub-options to build and install the pzstd binary
for both the target and the host versions of the zstd package.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                  |  3 +++
 package/zstd/Config.in      | 15 +++++++++++++++
 package/zstd/Config.in.host | 10 ++++++++++
 package/zstd/zstd.mk        | 26 ++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

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
index 70da1e7354..ad2a56749f 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -78,11 +78,23 @@ ZSTD_BUILD_LIBS = \
 		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
 			$(ZSTD_BUILD_LIBS_BASENAMES)))
 
+ifeq ($(BR2_PACKAGE_ZSTD_PZSTD),y)
+define ZSTD_BUILD_PZSTD
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		HAVE_THREAD=1 -C $(@D)/contrib/pzstd
+endef
+define ZSTD_INSTALL_PZSTD
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
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
@@ -96,6 +108,7 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		DESTDIR=$(TARGET_DIR) -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
+	$(ZSTD_INSTALL_PZSTD)
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
@@ -104,14 +117,27 @@ HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)
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
