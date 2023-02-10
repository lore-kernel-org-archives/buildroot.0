Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6842C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB9961208;
	Fri, 10 Feb 2023 22:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB9961208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYikDwwzPne9; Fri, 10 Feb 2023 22:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8778F61221;
	Fri, 10 Feb 2023 22:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8778F61221
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1698B1BF973
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFEEC61136
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFEEC61136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPxR5jROdJFK for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034EF60C1C
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 034EF60C1C
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bu23so6526050wrb.8
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WU8B/yEBRuNms8mgZwvcqvmS5uBjE4mvv4Tha7+KvH0=;
 b=rStOXpQpO8ExlHcOOm5N0GxDE2x6fEx9HLEZtq9ZCENgW2LeuBed7HFi6POmKZ+F/b
 PcGCNT3tTiA9vAHE4+zotXYZI3IePZu4pgkrmOnK8Df2ot/yaLYmy3z+3cea8c/kesfw
 aR7RTx/qWanE2VBrExs1VNPVoRN3hLFCOmQHWKybODkdTD3GMVBoAkPJ8mMOYYM6mSpp
 FPBtPz8RI+7NRY7fyOj89lraIn5xodtZHApyZk4djDNXEe546N20LMHVN0tCeCE54BH0
 GBkHavZtviU+R4BqndFdgg816arDc04WsuCubz/kgHe78XJRHqEl0LUJ56e5pptU4rxn
 k7WA==
X-Gm-Message-State: AO0yUKUmc8YGyOr70bSmywSZ9z+4760P6rMWnmAmKbDe3ORIqEfqqyEy
 /bIZe9M9cCL9hr6vvwFgYjLdupJXqdd/4aNv
X-Google-Smtp-Source: AK7set+JC5J01MeHRJvYPCOfu4kQI7md9omLrKjl8DE8hC519Ozhv2WgB+/k/zrjtR21xPfMMfF/sw==
X-Received: by 2002:adf:d4c7:0:b0:2c3:f8e8:e71e with SMTP id
 w7-20020adfd4c7000000b002c3f8e8e71emr12348865wrk.23.1676069251274; 
 Fri, 10 Feb 2023 14:47:31 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:30 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:15 +0100
Message-Id: <20230210224717.3293906-9-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WU8B/yEBRuNms8mgZwvcqvmS5uBjE4mvv4Tha7+KvH0=;
 b=CWR4UYG8YpgdINTlW8hC5ATrQ8dsSTrsEKgVtwKex9XbpqFE06fUdL29umfOt14mXV
 O63ALvoA4hePfHt2k7PsX19EN8Qsr8Jht1WF/UBsnxaafkVCqeSQfc2gnuCj3UsOM02r
 ds+ctEl+M0T/ayQPgHEH+KclSbeH1/WgayDml0P8W5wxT2i9SYpTqd8RrQtl9mucbGRE
 IB0AGnR9GiE+YZP83lKsoBxvl9EMjI8wI0rIrmrJaJe+WH4W0lMTbl7BIXPYO1/y8SyF
 boCjrC+xCeS0LmvT47M6fVnXMj8AKO4g1dAVxO+Yz4zwhburtNj4LYSBId+JqLH6mJ1M
 hcVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=CWR4UYG8
Subject: [Buildroot] [PATCH v3 08/10] package/llvm-project/llvm-libunwind:
 new package
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

Starting with version 15, lld needs the llvm implementation
of libunwind, therefore it is added as a host package.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: force llvm-libunwind version to 15.0.3 since LLVM_PROJECT_VERSION
    is still at 11.1.0
---
 .../llvm-libunwind/llvm-libunwind.hash         |  3 +++
 .../llvm-libunwind/llvm-libunwind.mk           | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.hash
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk

diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
new file mode 100644
index 0000000000..86775f5dba
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114  libunwind-15.0.3.src.tar.xz
+sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
new file mode 100644
index 0000000000..825e1beac0
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# llvm-libunwind
+#
+################################################################################
+
+LLVM_LIBUNWIND_VERSION = 15.0.3
+LLVM_LIBUNWIND_SITE = $(LLVM_PROJECT_SITE)
+LLVM_LIBUNWIND_SOURCE = libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz
+LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
+LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
+LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+HOST_LLVM_LIBUNWIND_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBUNWIND_INSTALL_HEADERS=ON
+
+$(eval $(host-cmake-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
