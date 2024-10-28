Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FE0D33998
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 16:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA09406D3;
	Mon, 28 Oct 2024 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0h5rrRHNfIo; Mon, 28 Oct 2024 16:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82223406C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82223406C3;
	Mon, 28 Oct 2024 16:29:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03EB9AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D855E409D7
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HzAMG9_cc6q for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 16:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 924754036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 924754036A
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 924754036A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:29:33 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83ab21c269eso177788039f.2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 09:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730132972; x=1730737772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CN1q78WWstjr8cYsjwxDruXC/fx5xEpMOQfiTi5Kfs0=;
 b=R3rgm9JWhramLRL60dGbvzsxEXOvf1yWLVZy3A3mpn+bkgVD/ygE97eKrpumZSbhv+
 ScdXoxKGdEWN6uLkKFX0/Z2qG25Hb4nKESasjl7nfKwaPKdxTwBHbLzGdRomPAsnTb4J
 YrvXzVoP50DeBvMs89VawwvQiK6pmd04ITmSrDzfmFLz0818y1Rtp3Z/4KsR7DZc0kWs
 i4eWWcK9PahJJTjHL9GDARxiZr3IaHpjeC2nkyV4c9+T2kiszy6jzFWQSVF/2LumOANJ
 RfhipyIJMAtWaxr8eF3Ywl1H2RZgjGdOKii/3ZwITn/E3A4EqmYMwJT4qryG/PUlnOw5
 eAkg==
X-Gm-Message-State: AOJu0YznETDycC7gOX1WcOFCIedeh4+5nYeknf3iDrVhFeLWMkR5G6WA
 VHz2ZGdrWwg56VOqeNTztFa33zykBGq3nh/S5AQ+Pa9HHRiU3E1ZKtHEBw==
X-Google-Smtp-Source: AGHT+IFgfN8NxZgCuXt3GzdwcGKNgHLqmPSoh5qiXORi1k6WtnYX33dRN9wYhe0sh/Xzdfy1WRaF7g==
X-Received: by 2002:a05:6602:13d3:b0:83a:c4e1:7d50 with SMTP id
 ca18e2360f4ac-83b1c3b8f77mr777834539f.2.1730132972218; 
 Mon, 28 Oct 2024 09:29:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc727502b5sm1791728173.109.2024.10.28.09.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 09:29:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 10:29:26 -0600
Message-Id: <20241028162926.209397-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730132972; x=1730737772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CN1q78WWstjr8cYsjwxDruXC/fx5xEpMOQfiTi5Kfs0=;
 b=drrbgh9KGE/EsdTC746bfF3v9IIN1pmtQYduL2VFS9imPQyYP242yhCXNGe9ZgctFG
 D/i39i7/fMsRgFbqY9g8YSHHCI9uM2Uk0ULDqIAMfSpQ8ZSAuCSPsB6Q11fbhiOrtKZJ
 I8DLDA0q3Xn24IGgSr8qyT0PbG8IyAIdKBeLKCX+H18Lq/TsWJMrJ9upI5P80F2IcCRy
 T0muW6GLnHOqVi71WgCgykRXqGt8hl849OoPUP+9ylzqFReP4tbXA2xWcjz48UKiMiGZ
 LjBXmfBHYJpiW0REfJrcj2oWBid1ZzQStDFYouL80Rr7LMdCniIRFtCaMG9J1YlvzYJW
 v1Mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=drrbgh9K
Subject: [Buildroot] [PATCH v6 1/1] package/tailscale: new package
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - bump to version 1.76.1
Changes v4 -> v5:
  - bump to version 1.72.0
  - remove GOPROXY override
Changes v3 -> v4:
  - restore GOPROXY override
Changes v2 -> v3:
  - set required CONFIG_TUN kernel config option
Changes v1 -> v2:
  - don't set GOPROXY
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/tailscale/Config.in      |  8 ++++++++
 package/tailscale/tailscale.hash |  3 +++
 package/tailscale/tailscale.mk   | 22 ++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/tailscale/Config.in
 create mode 100644 package/tailscale/tailscale.hash
 create mode 100644 package/tailscale/tailscale.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..a02bda2aca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1503,6 +1503,7 @@ F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
 F:	package/stb/
+F:	package/tailscale/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..d44886b9db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2625,6 +2625,7 @@ endif
 	source "package/stunnel/Config.in"
 	source "package/suricata/Config.in"
 	source "package/system-config-printer/Config.in"
+	source "package/tailscale/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/tailscale/Config.in b/package/tailscale/Config.in
new file mode 100644
index 0000000000..c81a7134ee
--- /dev/null
+++ b/package/tailscale/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TAILSCALE
+	bool "tailscale"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  The easiest, most secure way to use WireGuard and 2FA.
+
+	  https://github.com/tailscale/tailscale
diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
new file mode 100644
index 0000000000..a5492684a1
--- /dev/null
+++ b/package/tailscale/tailscale.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  46b68067a8b91f0e32ea8c23c292b9eb6675fac4c7bba5471a1f787bc3ad7412  tailscale-1.76.1-go2.tar.gz
+sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
new file mode 100644
index 0000000000..91290ba4a3
--- /dev/null
+++ b/package/tailscale/tailscale.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# tailscale
+#
+################################################################################
+
+TAILSCALE_VERSION = 1.76.1
+TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
+TAILSCALE_LICENSE = BSD-3-Clause
+TAILSCALE_LICENSE_FILES = LICENSE
+TAILSCALE_GOMOD = tailscale.com
+TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
+TAILSCALE_INSTALL_BINS = tailscale tailscaled
+TAILSCALE_LDFLAGS = \
+	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
+	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
+
+define TAILSCALE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
