Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AC2CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 12:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F5783AF8;
	Wed, 27 May 2026 12:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9rmieyogBK6; Wed, 27 May 2026 12:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2449483AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779884716;
	bh=W+e1i2VDCyhdKRdkvHw3PAscwG3H1csPtAGotjcqGEE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AIGQRZV4UA0OylhIPNTQnZ2DJFg2HK9nTCDRZ5nNihe3EPhLHR1kwrMq1e2T+zJX+
	 0W/EOBQ8Qv2IdnGCyBTywvMFdywerVbUSzb6Xp+RqQ5SP6UsOi3opnjFzJfuyPf1AS
	 dB0RFQcR9h1WidQRMh95/U0wMUr5/VbcF9ypKqxIf/Yh2eOlbIID922y4PL+kbt5XH
	 8sB83aWDBKIMQJCKR6nQicIj/paFevFRAHp8q1QzVu/CYe+KYMQv9pJAYvMdbLMAL0
	 d6DrfbC/fKZixH+4WLSGFgj6bOTvZJdxXEXvliBsyeDpR5y+iFAh3+i+sJfgSEchSd
	 +N4DsCD8yTOnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2449483AFB;
	Wed, 27 May 2026 12:25:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F01A4297
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D114A4208F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQ8jTpRo0U-f for <buildroot@buildroot.org>;
 Wed, 27 May 2026 12:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A37E7405EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A37E7405EE
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A37E7405EE
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:25:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49056b9f04aso53604655e9.0
 for <buildroot@buildroot.org>; Wed, 27 May 2026 05:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779884711; x=1780489511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZsSfQikiEohf+S2wqAejDDXgFnGcqkFWIp0KZm/jjs=;
 b=dQz17Iw4jkiw/sQyqzvkdVMJIfK+jxNyW1Hrn62Rrw0ErTejxSV2L5fRDLhV0gDcEi
 03zp8lBSiPyHsGYXeQryBumhIPSlIvf1xUaDIAZoF7dyT6OyCfotQpc/EzjTGNna3izM
 VnLM+NK5FeaXU66Pjt27ywkMjFJCLt9DXkqlvnkdb0QrJDZu+gInnVG2wm1HZyWlXF1v
 8MvFE6i3c3yeBClfCmMz7NOrzNe+/6uQaJMpRas8PbqlCeu4hHKqWHDm56pz+SHV6hMx
 bE4SLW1rV67RCE9Bt6SxSI7Adus61StPTIp8L6tikT4YNKwoB8frkJXxktS+FDgXJPLs
 eKkg==
X-Gm-Message-State: AOJu0Yxwn576QT2D0+RC3+RPfcasEFR3UeIoqsRYF0O6ObCUJ5Yp67xr
 INH72GWU+QvBH1xLQxddWWINqgC+dKbMVqCHKqikea+x1eyf7ncvPEgBetmzeRkPFxwM1+hx4mb
 M/vOT
X-Gm-Gg: Acq92OGVPqm5R47ux9an551wBAoMquc3MZBL5o3r/CrbHyYemtuiy8RegOfnbggrXjU
 fQ1biFMxoJ5+HZ5xrxQltQVGl7QEn9xKNcXZUw7hljlFQ+WeXIBGzd7O99qTh8LO2qVgrAhktEw
 0CgvRnO/z55je6nWHLwF56ZvfVIZUhfgnmIGeg9tiXIF1NSfd+0SrldCPS48ULrvLeMNIFJVndR
 wB5IUM0Josr0DdIrMYlplGsqz+BH9EKRhr+4tEJa9guY+Y0tY+vk5FQaUVhfbrSOwTtOk5IwtLc
 kzbUPqI16Y5eszH+myWLMV6oNoh0XpIs0lWiyPnrJLzlJMZ0lAAwpxDvNXpYp7Z0wpIxYx0tCaK
 wHrIYbKdod5IfxYdwaEzlgrLZWY8cZfo4FIdEbunUrwtxoiQLu9jZhqwtKZ27kH/C4M2bVXlrEO
 mZbPeiFL9lmW43Co6px+1XR756NqswQXhzOU/+17NlguF9WY8kx+fLkmbt37SdAtke/FNh
X-Received: by 2002:a05:600c:821a:b0:490:5cd8:d21c with SMTP id
 5b1f17b1804b1-4905cd8d437mr282729285e9.14.1779884711195; 
 Wed, 27 May 2026 05:25:11 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b28absm5805349f8f.27.2026.05.27.05.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 05:25:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 May 2026 14:25:10 +0200
Message-ID: <20260527122510.674604-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779884711; x=1780489511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZsSfQikiEohf+S2wqAejDDXgFnGcqkFWIp0KZm/jjs=;
 b=IQujRivZqQOpD2Aq7U3eC7vw8AjribYmaQ0uF9Qs1wM1l7KzGvAcJkoVy8wnYZqTuB
 0RSaIJs3+JEvuN6il64L3WYs3gU9AenN5Z+M6lAJ2GbnamQJuW20l0e+TB/2KFEnrXYU
 mzkZnKR8eiwVwph7c5sMFpvgFmSh3ejBaT95oDYkNtYyVEzrqP9idFWuuswpp8bot+UX
 7kJg+vQIqoO0HwSKcAfaOU+pwGCEuBFQv7EmdkjHvZom/cCaZd7dd39Sxbif3UrzUEWp
 yOe+uVvL98RXYnjQ7JWWZCk7c8cO4zk9uLAfQPOfczSJvcK8/T1SwjjQUOP4xHs2aP2x
 zJHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IQujRivZ
Subject: [Buildroot] [PATCH 2025.02.x] package/{glibc,
 localedef}: security bump to version glibc-2.41-137-gb676adadb
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerabilities:

- CVE-2026-4046:
    The iconv() function in the GNU C Library versions 2.43 and earlier
    may crash due to an assertion failure when converting inputs from the
    IBM1390 or IBM1399 character sets, which may be used to remotely crash
    an application.    This vulnerability can be trivially mitigated by
    removing the IBM1390 and IBM1399 character sets from systems that do
    not need them.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-4046
  - glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3

- CVE-2026-4437:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    Library version 2.34 to version 2.43 could, with a crafted response
    from the configured DNS server, result in a violation of the DNS
    specification that causes the application to treat a non-answer
    section of the DNS response as a valid answer.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-4437
  - glibc-2.41-131-gdbd8335c8ce8af11226ee1514d7a020b15c63345

- CVE-2026-4438:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    library version 2.34 to version 2.43 could result in an invalid DNS
    hostname being returned to the caller in violation of the DNS
    specification.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-4438
  - glibc-2.41-132-g502861645bb1baf650d58e2ddd6b230bc26676c9

> git shortlog 2.41-123-gfb4db64a0..glibc-2.41-137-gb676adadb

Carlos O'Donell (2):
      resolv: Count records correctly (CVE-2026-4437)
      resolv: Check hostname for validity (CVE-2026-4438)

DJ Delorie (1):
      include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h

Florian Weimer (8):
      Switch currency symbol for the bg_BG locale to euro
      nss: Introduce dedicated struct nss_database_for_fork type
      Linux: In getlogin_r, use utmp fallback only for specific errors
      nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
      iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
      posix: Run tst-wordexp-reuse-mem test
      Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)
      Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)

Michael Jeanson (1):
      tests: fix tst-rseq with Linux 7.0

Xi Ruoyao (1):
      elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso

Yury Khrustalev (1):
      posix: Fix invalid flags test for p{write,read}v2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 11 ++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index e999129ccc..3f1df7058a 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  3789146d175834dc4873f41bd87932cd6ad7c83d0b7bf340768ee6a927aac784  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2-git4.tar.gz
+sha256  c5856a16a8576d35adddd92f7e86c58faeedd849633582a7926f9a3e766ffe2d  glibc-2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 7c07dd5923..3ce6265a6d 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
+GLIBC_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -51,6 +51,15 @@ GLIBC_IGNORE_CVES += CVE-2026-0915
 # Fixed by glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
 GLIBC_IGNORE_CVES += CVE-2025-15281
 
+# Fixed by glibc-2.41-131-gdbd8335c8ce8af11226ee1514d7a020b15c63345
+GLIBC_IGNORE_CVES += CVE-2026-4437
+
+# Fixed by glibc-2.41-132-g502861645bb1baf650d58e2ddd6b230bc26676c9
+GLIBC_IGNORE_CVES += CVE-2026-4438
+
+# Fixed by glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3
+GLIBC_IGNORE_CVES += CVE-2026-4046
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 441145c38f..c3a959c5f5 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
+LOCALEDEF_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
