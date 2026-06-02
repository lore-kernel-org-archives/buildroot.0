Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8D2CD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 19:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCFB1829AF;
	Tue,  2 Jun 2026 19:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpp6nTT8GZ7k; Tue,  2 Jun 2026 19:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37C6E82998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780430146;
	bh=yOPKObVLNDjExA3LsL9ot9+baQa6R0LLy3lv6UHpiJs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=T3Jh8azYpMQ3kiyOAYYe6WaFwfdLbfsEFcXQfJuHzGQZ069lY9hxKwR+Hz4Yd1RbF
	 lRNmuldGMnuFAdo7ZPYAaif15UUE/8HjUTlUNXpMtcJRtxLDqEfpit//T792baFnNB
	 I3WP3fMA8OoRGBRZ6iJBeoh0J7GuaYZ6WXGY6Arna1W1YJ++1SeGXwW9yX2GvaMJKV
	 Gvug/oK1QOtcwmMF7nsTI3DC9PPc3MSAsimTprLbJUryux9/8wrZVFsDx0zJrEvGsg
	 OBkPKM3Q2BGr5q6aHo0/LAC0phKpa9SvZS3q6F8zAl2rgGwK0NuqT7ufGt1cOa+5WG
	 kIUn8sdqJFeLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C6E82998;
	Tue,  2 Jun 2026 19:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6850D3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C27E41E68
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ii4j7NcxZQWF for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 19:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D62941E67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D62941E67
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D62941E67
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:55:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45ebafde87cso8003159f8f.3
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 12:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780430141; x=1781034941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DM7UsAJKfwyP4MtI+AG83IZG1/780Q/S1R7pkVZPrCE=;
 b=AtHXzbRX+eakqSMR9m8A/+XNAWRrtkFsAsdJkQMcP5GPlhrSd0KhJW+Lsqj5XJfTtW
 o+xKAnD8e019fsWtxFmu9VUG+da5Ue+CSZPzi1bCzZPa5aNdbolSl8dKYyyEyqnBtYTt
 R+kjBLIsa5RtrSI4BmmZa15GA4etEs0FOWLniteOJ3NuaAQClxdfvjxLHaeIXKv7+vWc
 ULe9zk2ifr9MojzRHvCMF21tgOUbBWVBNDRRzLIoe4iertpu7rjTKonJpd53CK738VYT
 M9sNd4NZRq08exqkZos/FJS5BJRGLZvArFVqSQFVTVONethCuwrJNWQm8X8PUqOG69aV
 A7DQ==
X-Gm-Message-State: AOJu0Yyno0ebpOUmUP31sZXWnYGT4GeCVENrr91M7X86ZGHzcCtqVmAx
 I25rsvwR7+C7Rvg9oLRtFMCzeWttdoiSz8FCMPbItlnAkVhxrzEGbsMj36ViYau+NnRQ5XbUZnH
 RFz8m
X-Gm-Gg: Acq92OFMbNIcnLGE4ikhbyv1ysOAnPBH4pP3AOPJ4Q2IYxvALoYQEGrfrMHdig4yyWi
 7TQCpyiiTOOcRzaHBTmPLp6n2/f0A9GNSObDraLwrQTNzIiRhkVTskC9jk8pAf0+ShX762zO5Yk
 WuSdO+n4514pg34Raia9DaO7xbilDqVQ1elJNlfGDqd6brA4cntGKW1yf/AmgJOo2zdRp3UEMhB
 LDVJkC+2DIfOWv2qVSys00vo/XJnpoKkANc0+r0hGPt7qOECCyHV3VCsbK4v3RHXQ7vvbIiXwen
 iAeFo8A3I1GWPKRDVm6WE/TuNcXBkPTQHgs80oW+q2Q1219jb0xJwnxA6l9paIFYiFdrhZKlG92
 veWngr4nion055YqREjZi+NZ4RhxhaOyd+1g7qn1epZ+msOMFGenmzz0mb7ZRDOToAISCBz5l7/
 ek4abgpzuTVcgOrvylsdxwXbL5zzhqPJ1AVfHbl3ojTV25xhTNIoapfPm3WPCE9SdhyjxyOEgPZ
 bSy7n9blOeM3djpvM/Czxc7fGqIfrR4tSea
X-Received: by 2002:adf:e005:0:20b0:45e:b21e:f840 with SMTP id
 ffacd0b85a97d-460216bde85mr29953f8f.8.1780430141178; 
 Tue, 02 Jun 2026 12:55:41 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm1719967f8f.20.2026.06.02.12.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 12:55:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Tue,  2 Jun 2026 21:55:38 +0200
Message-ID: <20260602195538.2518105-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780430141; x=1781034941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DM7UsAJKfwyP4MtI+AG83IZG1/780Q/S1R7pkVZPrCE=;
 b=xJjhodGmcuVZ45Y9JqKz631to3IonrO9y9wqTHliqj2JxGGWwbywEJz1QOPcHhS32+
 PeUMWEl9eVPldPAjDEcOcsxouhVN9Z5CzKn78mL9TpQBSliVJRf3O5WFndAIIXUpLuL5
 zG8ppMSVAHygT1G1C9aTdFT2yRHTcG1n2Ucyg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xJjhodGm
Subject: [Buildroot] [PATCH] support/testing: TestAtop: use the default
 toolchain (BASIC_TOOLCHAIN_CONFIG)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The TestAtop use the really old toolchain br-arm-full-2019.05.1 because
BASIC_TOOLCHAIN_CONFIG from Buildroot 2019.08 provide an uClibc-ng
toolchain with 3.10 kernel headers (br-arm-full-2017.05-1078-g95b1dae)
[1].

Since then, we switched to glibc toolchains by default in Buildroot [2]
(2022.11) and BASIC_TOOLCHAIN_CONFIG was updated several time and now
use a Bootlin toolchain stable (2025.08-1). This toolchain use gcc 14,
5.3 kernel headers, glibc 2.41.

We need to update the toolchain in TestAtop since Busybox 1.38.0 added
yescrypt algorithms that requires explicit_bzero() introduced in Glibc
2.25 [4], uClibc-ng 1.0.47 [5] and musl 1.1.20 [6].

There is no real reason to keep this really old toolchain, so bump
the toolchain to Bootlin toolchain stable (2025.08-1).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622325905

[1] 9609a7c2c22160523bda5cb5b4417c9278ac27d9
[2] 4057e36ca9665edd5248512e4edba2c243b8f4be
[3] https://github.com/vda-linux/busybox_mirror/commit/80e676664e1d7a0b07f14bff44f93d1fef709cf4
[4] https://sourceware.org/git/?p=glibc.git;a=commit;h=ea1bd74defcf9d5291d14972e63105168ca9eb4f
[5] https://github.com/wbx-github/uclibc-ng/commit/9e7b342fde5505c0a1d4968e9d70537ac406f640
[6] https://git.musl-libc.org/cgit/musl/commit/?id=05ac345f895098657cf44d419b5d572161ebaf43

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_atop.py | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/support/testing/tests/package/test_atop.py b/support/testing/tests/package/test_atop.py
index 5a96684799..a5b549ef90 100644
--- a/support/testing/tests/package/test_atop.py
+++ b/support/testing/tests/package/test_atop.py
@@ -2,23 +2,9 @@ import os
 
 import infra.basetest
 
-BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 = \
-    """
-    BR2_arm=y
-    BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-    BR2_TOOLCHAIN_EXTERNAL_CXX=y
-    """
-
 
 class TestAtop(infra.basetest.BRTest):
-    config = BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 + \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_ATOP=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
