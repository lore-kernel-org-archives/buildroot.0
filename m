Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF19E937FD
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 19:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED249423D1;
	Sun, 12 Apr 2026 19:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxfpINVJS8TJ; Sun, 12 Apr 2026 19:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07E40423E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776020465;
	bh=20lTBmn5pzDLusXovPiVxE147iyTMC8WGvIzNPLV5oE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Flkt5k6ewsOSDnX6Bbn4rfatWKFN6ZzRa/EPpr0X5R6TbGLl0b8hUH2NlqHEw3WyT
	 2n//g90Y8mAMEtK9DvsLuqb1fYgfxxaS7Vkn8RlMGV2jLE0kJg5jCwy7HsN0FNgRtd
	 81t8cwlbArRqVjt9/w64sGxeN+0OayB2yYgCBRjYx1eJfA0evTM6xkRj7nPEGVt4UR
	 Rk8E0F8IzacbwGlPA8PevXmSoCDWOyUZBymhD2llppd7LXLFA3iXRQbNLzOqhOaGfA
	 WAZluBZY+Y7EOV8TCmkbN7P9AThAFvNGcGiqh+jlppi2yzSIHZxmff2UBBEooB3Fx/
	 FHkz/TIxmuSag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07E40423E2;
	Sun, 12 Apr 2026 19:01:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12241237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0423E4053D
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJXjnXumwEBT for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 19:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B32E401A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B32E401A3
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B32E401A3
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:01:02 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-35da01fc0baso2370821a91.2
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 12:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776020462; x=1776625262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LR5Acv1wltfvFueqllSqM1syfmZYkPvYyH1EnkyGB8=;
 b=Vm90E6fRPEPpKVRWUJtyBjOwxyNv5uuIJlPh8SnS1995VI01NrEl5SydyeDlejGuXs
 Oj0xeMjhSbSV8uPUJhShtgawZEkT7Zuf1w3qV5zvKBbxg4UfQ0RQzOhFzn6IfCT0onG7
 OSHi9P0VevLqhj4fmTygw2hfNqnhrNzh94rfkHd269otwM6SMwVcpkMYrcsadmuNbHbS
 mFxNXSDRJjF3B7RRvCFVVj9yyDpHsdmJieK60A757Vsy3eMnbu/HRA/z7Ks2/o7vRxXQ
 B+VYpyq8BO3GPSlmR3f206f3HSCpmPql6Y7wXrpZC68xKJkxJdV2I1m3PGb2cDl2p9JQ
 pflA==
X-Gm-Message-State: AOJu0YzXWzEMyajmBTtlw+opwzasBd/nXNt153RTjY0HJnM+mfgpkWGB
 xzGDD9WQBH/apKBktZWWYid+nqlfvU4RbS4ndvsaTO32B7vGRgfLkKD1eSD5PKe/
X-Gm-Gg: AeBDieuEuY5V1b+VzKitiRflX1ImTa63VKionEDTszpEhGksKYjlyzvXqVI7oxXu4g1
 IlXlcrAqgmsa+o4ihxENhB/w9qVJ9Kbi6egmdCJe+K+th04a6HHYYIViWr9ksCT4h6fQbMZ5NoK
 d/aFKg2cXHgdyUrBtptLld368S1u7xmQlhYEcbxsioQreOVEzX29wZwkMhtSoKn8Bz5L0K+PhSl
 3/szfpyqeqjYScEa6sY/xNCCxOSL2gzMrACh3EAVsLSJtUDbHCNvPke9BXd1qvFj59nbI+4fNc9
 reCpiT2omI10zlERnKqyKBxkAPOJg8O8S28S6kXGk3SW1N4yRAKNn6Mv6DcYEpCgfCuwEnJyFSd
 5Dw8hocRfd1hlMeik927+HHPR89Cq8Yq0Geris27ZfLp+Wi7BpmtyXH8airY42rFs6GM5kmIoJ8
 jfjq4QYRC0+MVjW5GoCzq8snBQWyxmU5HBzQ==
X-Received: by 2002:a17:90b:38c8:b0:35d:a542:2dc4 with SMTP id
 98e67ed59e1d1-35e42842cc9mr11743873a91.21.1776020461770; 
 Sun, 12 Apr 2026 12:01:01 -0700 (PDT)
Received: from fedora ([2409:40e1:502:1849:68c1:d0f0:6b7f:ab95])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b45e949464sm10490475ad.24.2026.04.12.12.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 12:01:01 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 13 Apr 2026 00:30:38 +0530
Message-ID: <20260412190039.117660-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776020462; x=1776625262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5LR5Acv1wltfvFueqllSqM1syfmZYkPvYyH1EnkyGB8=;
 b=ky04H8efDGF8sCYVFDipq5hPVVBfqNbXKZDf64mv2Fwu2Ouc5TXzk30VsVdfD+Gqgg
 GYZXcaTukJft+hpdQkqtrSgFZ/3SuSbSEJu1a5tkzPKGu1wkBK2esrJ38QWKvkWwQhqf
 s+hzpqrMeaJusbl3/hkejERnePYQyTMJyfdS36m1AUZhCER3d1YB/GHfdTwv4eWG6HDj
 YqMjbBqBV/tRhe95IhKmtRo7eiJalSTBcIu53B9LavFx/2znTkphE7wwKuXNaFL/v+sv
 OjMIRrmCwrhJXhmaSUqKonbwq6mg98iRZ+2iUskiVdJCbE4Rods4hwD5HNn+e3u+GFUf
 TXaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ky04H8ef
Subject: [Buildroot] [PATCH] package/binwalk: new package
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

Binwalk is a tool for analyzing, reverse engineering, and
extracting firmware images. It can identify and extract
embedded files, filesystems, executable code, compressed
archives, and various file formats from binary firmware images.

Key features:
- File signature scanning using libmagic
- Automatic extraction of embedded files and filesystems
- Entropy analysis to identify encrypted/compressed data
- Support for common firmware formats and compression types
- Recursive extraction (matryoshka mode)

Useful for firmware analysis, IoT security research, and
reverse engineering embedded systems.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/binwalk/Config.in      | 13 +++++++++++++
 package/binwalk/Config.in.host |  9 +++++++++
 package/binwalk/binwalk.hash   |  3 +++
 package/binwalk/binwalk.mk     | 15 +++++++++++++++
 7 files changed, 43 insertions(+)
 create mode 100644 package/binwalk/Config.in
 create mode 100644 package/binwalk/Config.in.host
 create mode 100644 package/binwalk/binwalk.hash
 create mode 100644 package/binwalk/binwalk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 15de0a3cb6..6387069959 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3061,6 +3061,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/binwalk/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/Config.in b/package/Config.in
index a2b0d885a7..65e0ab18a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -207,6 +207,7 @@ endmenu
 menu "Filesystem and flash utilities"
 	source "package/abootimg/Config.in"
 	source "package/autofs/Config.in"
+	source "package/binwalk/Config.in"
 	source "package/bmap-tools/Config.in"
 	source "package/bmap-writer/Config.in"
 	source "package/btrfs-progs/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index b990ce8b14..390b978c91 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ menu "Host utilities"
 	source "package/arm-gnu-toolchain/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
+	source "package/binwalk/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
 	source "package/bmap-writer/Config.in.host"
 	source "package/bootgen/Config.in.host"
diff --git a/package/binwalk/Config.in b/package/binwalk/Config.in
new file mode 100644
index 0000000000..b583928e49
--- /dev/null
+++ b/package/binwalk/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_BINWALK
+	bool "binwalk"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_HOST_PKGCONF
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_XZ
+	help
+	  Binwalk is a firmware analysis tool for scanning binary images
+	  and identifying embedded files and data.
+
+	  https://github.com/ReFirmLabs/binwalk
diff --git a/package/binwalk/Config.in.host b/package/binwalk/Config.in.host
new file mode 100644
index 0000000000..735493b843
--- /dev/null
+++ b/package/binwalk/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_BINWALK
+	bool "host binwalk"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Binwalk is a firmware analysis tool for scanning binary images
+	  and identifying embedded files and data.
+
+	  https://github.com/ReFirmLabs/binwalk
diff --git a/package/binwalk/binwalk.hash b/package/binwalk/binwalk.hash
new file mode 100644
index 0000000000..381a2e4a8c
--- /dev/null
+++ b/package/binwalk/binwalk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1e1b610b41d88e54e2908311aa85db98a9f19ad5f8f9dacd78e66e62dd706b8e  binwalk-3.1.0-cargo4.tar.gz
+sha256  479efc8ae5488a8fa1c6718fe37713d0641f04d4069f37d4a09e727ed6febf3a  LICENSE
diff --git a/package/binwalk/binwalk.mk b/package/binwalk/binwalk.mk
new file mode 100644
index 0000000000..9a0e1d7f23
--- /dev/null
+++ b/package/binwalk/binwalk.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# binwalk
+#
+################################################################################
+
+BINWALK_VERSION = 3.1.0
+BINWALK_SITE = $(call github,ReFirmLabs,binwalk,v$(BINWALK_VERSION))
+BINWALK_LICENSE = MIT
+BINWALK_LICENSE_FILES = LICENSE
+BINWALK_DEPENDENCIES = bzip2 fontconfig host-pkgconf xz
+HOST_BINWALK_DEPENDENCIES = host-bzip2 host-fontconfig host-pkgconf host-xz
+
+$(eval $(cargo-package))
+$(eval $(host-cargo-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
