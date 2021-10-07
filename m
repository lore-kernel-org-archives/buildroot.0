Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A45C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 16:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF00A6120D
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 16:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF00A6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B54401CF;
	Thu,  7 Oct 2021 16:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ySgAPoF-IKI; Thu,  7 Oct 2021 16:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0EB401D6;
	Thu,  7 Oct 2021 16:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D01401BF354
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 16:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBA9B401D6
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 16:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obW20NXR0buq for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 16:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B880401CF
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 16:42:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i12so8355654wrb.7
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V2GiX4pUOz41RB5sBJKGAEqvy14vJthHBbBGMAm6NhQ=;
 b=SCvyomwahcJqGBzYBGmu7ccOlQ4X3QjY4gXU1kguzZUv7ne2SNZDqP7u4vNwsoXq//
 e7998FnmSBJDMZb/5BknP3/QRL3MZtpYZ7k7T4enXi29Su0j+vjQ1Wbn8she5upxQS7c
 YuKkP4jtLamDiflM2Vc4F1y0kGHZMA5XmooWyzQMnlY1dw+rqqJFAjn2uOFP3Odep81G
 xlvlUElw0ECMgP5i13pbb1JAiIzvoLXQU6sSFL9B7bS416F3Ikk04sOrtZwkjdXhc8xQ
 gsketXBHuj1mFZESCED5rqPjMIiqUiVZoPm6WCx7hBETKIS5l6P5jA6DmTK5BNAI9rla
 v6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V2GiX4pUOz41RB5sBJKGAEqvy14vJthHBbBGMAm6NhQ=;
 b=xZM2Rsfe7ZLo7WJGxcSNncKLTaAzd+IXWUjPvMODJanXXKAAVhUDbPK+hYHgCveZyO
 dsJcu+4rkJKghHAZYH/5JTfz8H1k/vOD5vqgjT7hMDrxWpBsoe1tzvbRffSflAwFOcTt
 PAxNyxZVMkJcrcp1nO08kyg/4yEw4R1tARHmUfqK/dNTZ+6+FT/GZxXr8/lhuK1EXmUQ
 yNVcMlwXJsSMTtycDhJ9DYISDThQ7Gg6TNUVpThltaMymwq4vyKFCoqqYkVk1tW8gxqB
 F+L2Pa8tMKVEHMRkuyBycdJRqf2ANS6G2Xsg7CwfbM3JNsmraq3WsmzNZbyw+xtce+U0
 rwig==
X-Gm-Message-State: AOAM530cbmFN6rp9VtWT6bZfElAE9PeoswyxRsV8I3nczLl/xhMcQBlm
 hNe/cXF4GbAu1uGUfQPxWYkkhPxL3lM=
X-Google-Smtp-Source: ABdhPJy3aorlrQmGL0m4cYOhyDLF8U68K56SThs+dLw4Ra1uBXTHuX3U8gryvmnkT4BWFdAUGgZP+Q==
X-Received: by 2002:a1c:c905:: with SMTP id f5mr5758898wmb.148.1633624931240; 
 Thu, 07 Oct 2021 09:42:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id 73sm63705wmb.40.2021.10.07.09.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:42:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 18:41:12 +0200
Message-Id: <20211007164112.3490293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boinc: fix build with autoconf >=
 2.70
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da and
http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=ec90049dfcf4538750e61d675d885157fa5ca7f8:

checking for /home/buildroot/autobuild/instance-0/output-1/host/bin/mips-linux-gnu-gcc options needed to detect all undeclared functions... cannot detect
configure: error: in `/home/buildroot/autobuild/instance-0/output-1/build/boinc-7.16.18':
configure: error: cannot make /home/buildroot/autobuild/instance-0/output-1/host/bin/mips-linux-gnu-gcc report undeclared builtins

This error raised because AC_CHECK_DECLS returns an error due to -mavx
flag:

mips-linux-gnu-gcc: error: unrecognized command line option '-mavx'

To fix this build failure, hard code ac_cv_c_undeclared_builtin_options
to 'none needed' as removing '-mavx' from CPPFLAGS will hinder the
detection of xgetbv, xgetbv, __xgetbv, cpuid, _cpuid and __cpuid

Fixes:
 - http://autobuild.buildroot.org/results/4b468a5d3bfbff9638316ca930ef791867774aef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 079b065efd..317cad55b4 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -14,7 +14,9 @@ BOINC_CPE_ID_VENDOR = rom_walton
 BOINC_SELINUX_MODULES = boinc
 BOINC_DEPENDENCIES = host-pkgconf libcurl openssl
 BOINC_AUTORECONF = YES
-BOINC_CONF_ENV = ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
+BOINC_CONF_ENV = \
+	ac_cv_c_undeclared_builtin_options='none needed' \
+	ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
 BOINC_CONF_OPTS = \
 	--disable-apps \
 	--disable-boinczip \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
