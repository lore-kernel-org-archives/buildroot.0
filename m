Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C4C44500
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 04:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEEF881183;
	Mon,  6 Jul 2026 04:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPZgRN9dQCGM; Mon,  6 Jul 2026 04:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE7D8113F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783313544;
	bh=V4AgmF348pUe4wmaqPjx72LoiFHaUturToBheoHdJZg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WAcAOXSgpNrGVGsn6nZPNFxKaMjExf9UXdRoUzlZAL+NWxYvoehvbSDPg25H7SM5Z
	 0ln57xr596J5gtxY3DvPflLMeLmk44hn+gETvzaiOxtoXx0786IFoYOf61j3EhdrpT
	 oPccMbdEj/mx3Io10LDnGcJJb/pKbCi8oLqXC0l2CIuJFvVBQJEj9ErpEwqDeobTKP
	 6MqBVZBLFbl0YMp6f12mtTjWRZ4+2x4FxsOA0tXTLfszIkgygPdQ7PegaWiTVlxqcZ
	 PabGW0qR5h9SJf/2KzyIQHxJEHut3qspzZfrk+Jtjvla/Wcf/g3W57X4b5QJTglZ0G
	 74TxqP+gIcEGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE7D8113F;
	Mon,  6 Jul 2026 04:52:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A79FAF2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D574409E7
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0ekStvT-1qu for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 04:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AF2C408F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF2C408F3
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AF2C408F3
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-39b293079d1so21280771fa.3
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 21:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783313539; x=1783918339;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=74EdZxlZWI7RQg/8eZMGZOohX4B/xXcOSoDTwrmq7wo=;
 b=WeYiu8eCIVx99mRwvwVxhg8nMKPirHmLZ35gjpIPaA/p1qatgKa8Ls2Urqso/Wyvyr
 sjWnjZLVqUYMOcC5AlDwTZ9YOb+P/+Y9EZA59AP1zT5vGjnbj2ez7PWR6CX+NMvPj0lv
 VCeuFMhsu2FIjmKTDSIGE/WyjjKgfDJ+VtNVGEyuDRmjTLLYHoE0hXLbvYZVWHNZRwmb
 9Q7giv/86rzXjlHmQVauX9qQCEux+dUeuGcTpfdeHChWTtoMeFTZtTuNWZwt7ZKVL1SH
 oCpsszVbFWCBF4BNi3M0BvguglqVxs6TnKKdF60ePSr2YY2E60GvQHjZov/R6RDoNx+5
 nJYQ==
X-Gm-Message-State: AOJu0YwwDz72jq/Ve34EnznBD+IURm3FSMtNa+x6PB0CQY3RcaCv205s
 eMdx1j2AISXCFITGOWEL93auiMCVKTxF5gzBXrdqkfOCj/RrZJBT/CzHERhaNNRiy5M=
X-Gm-Gg: AfdE7cneQ6dOjL57KTMMzNTbZVEBLsIT7Vt7YhBbCFNPF+B8ICd/jw1CqN8eckcPh4P
 SItPJY+iXU/rdNIUQntbxVWJFw4pVPXDpu+v78SUpBnYKduIfAPX3S4HHKVDzTyFWJCEkku3fp4
 fpyDpCyOkyid/bNSMOR3hQf2KdexM7aFpYYwRFJeaKHHoQ2aTa2TH/fLTwC++zj3bP4831tnMT3
 ZWC8ppZYziVUaXqZdU6nKSviIpbK/8r2ONwkK2Q1qcRhEV2+U5KiTM+Dsn7Tm+w123ZKGk1aCC8
 hcnBLBRF0sUuV4bhrQkjfriKpRhPTApst0BuI7bdqIW1JRcarN/t0w5GqYVNTnYFon99HHJqp/b
 PieioTE68bQvmxCzoNejsqL3XqKczpptXMlqZwgWfpiUsuHXepgFYg4NKU7KS4YBM2ku9yx3AEZ
 4S69DVLYl6h0z8K193Qcob23DfNGIIna9phHyhXQem
X-Received: by 2002:a2e:bc25:0:b0:396:7fa2:e082 with SMTP id
 38308e7fff4ca-39b53c3fdb2mr15171451fa.6.1783313538965; 
 Sun, 05 Jul 2026 21:52:18 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b4ad1887csm16866441fa.6.2026.07.05.21.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 21:52:17 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  6 Jul 2026 06:52:04 +0200
Message-ID: <20260706045206.2395575-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706045206.2395575-1-troglobit@gmail.com>
References: <20260706045206.2395575-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783313539; x=1783918339; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=74EdZxlZWI7RQg/8eZMGZOohX4B/xXcOSoDTwrmq7wo=;
 b=OtelZHlH/R0cwFVUZZrAtPq3eziNY6ocUiVBN3KPuROtmQWN4qdMKz4KFA7YEd7SzK
 pyyUGQmzwUOvM3Xvlt2yJfFZ5hFxTRQlZnhHIAsTVy1Zc1+5KhuLN9wzixsu32NYcvRT
 IvXTHGhS9ERk+huTVfiQ/5qvevT4SCvYXsHNeMaD0+sJjlFJrcAyR1G8KODQvJLbLeTv
 RyUxBL04BYtUwnLpC97kHS4HnSG5sBVvl2v42jxWn6V9jIQ+Oq4XmDjzLd+kUQR6qtjL
 bnZJUXs55XogoX5v8e5xtlHwiE4PWoFOAXpLZegd2E+/A1fji2Dt80NDNSmU4/RgU0/l
 qt1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OtelZHlH
Subject: [Buildroot] [PATCH 1/3] package/mini-snmpd: bump to version 2.0
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

This bumps from v1.6 directly to v2.0, for details, please see:

 - https://github.com/troglobit/mini-snmpd/releases/tag/v1.7
 - https://github.com/troglobit/mini-snmpd/releases/tag/v2.0

The release tarball is the canonical supported source for the project
and also ships a pre-generated configure script, hence the switch.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 .../0001-linux.c-fix-musl-build.patch         | 46 -------------------
 package/mini-snmpd/mini-snmpd.hash            |  3 +-
 package/mini-snmpd/mini-snmpd.mk              |  5 +-
 3 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 package/mini-snmpd/0001-linux.c-fix-musl-build.patch

diff --git a/package/mini-snmpd/0001-linux.c-fix-musl-build.patch b/package/mini-snmpd/0001-linux.c-fix-musl-build.patch
deleted file mode 100644
index 8e8bb090fd..0000000000
--- a/package/mini-snmpd/0001-linux.c-fix-musl-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 73fa408f51ec25121075aaccac9c9db1c68567cd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 12 Mar 2020 10:02:18 +0100
-Subject: [PATCH] linux.c: fix musl build
-
-Remove include on linux/if_link.h to avoid the following build failure
-with musl:
-
-In file included from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
-                 from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:4,
-                 from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/if_link.h:5,
-                 from linux.c:21:
-/home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
- struct sysinfo {
-        ^~~~~~~
-In file included from linux.c:19:
-/home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
- struct sysinfo {
-        ^~~~~~~
-  CC       mini_snmpd-globals.o
-
-Fixes:
- - http://autobuild.buildroot.org/results/6903a0f685076b4a2c2824de6158da40e9e712d8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/troglobit/mini-snmpd/commit/73fa408f51ec25121075aaccac9c9db1c68567cd]
----
- linux.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/linux.c b/linux.c
-index a657912..86a7085 100644
---- a/linux.c
-+++ b/linux.c
-@@ -18,7 +18,6 @@
- #include <netpacket/packet.h>
- #include <sys/sysinfo.h>
- #include <sys/socket.h>
--#include <linux/if_link.h>
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <sys/time.h>
--- 
-2.25.1
-
diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index fee76c07a3..d1e8f51f8e 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,3 +1,4 @@
+# sha256 from https://github.com/troglobit/mini-snmpd/releases/tag/v2.0
+sha256  851acf49a1a36356664af0a7a040fa31f75403eb26e03627eba188ee15d4854c  mini-snmpd-2.0.tar.gz
 # Locally calculated
-sha256  de00c475a3c70c56f3ee97cd683cb71009d3521d60b1f589c5a91b4671ede9f3  mini-snmpd-1.6.tar.gz
 sha256  8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56  COPYING
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 1f6e5c1919..89eca4ce79 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-MINI_SNMPD_VERSION = 1.6
-MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
+MINI_SNMPD_VERSION = 2.0
+MINI_SNMPD_SITE = https://github.com/troglobit/mini-snmpd/releases/download/v$(MINI_SNMPD_VERSION)
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
 MINI_SNMPD_CPE_ID_VENDOR = minisnmpd_project
 MINI_SNMPD_CPE_ID_PRODUCT = minisnmpd
-MINI_SNMPD_AUTORECONF = YES
 MINI_SNMPD_DEPENDENCIES = host-pkgconf
 
 define MINI_SNMPD_INSTALL_ETC_DEFAULT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
