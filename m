Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2F5CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 12:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC7483AFB;
	Wed, 27 May 2026 12:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFSa6WmkPsxM; Wed, 27 May 2026 12:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21ABF83B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779884743;
	bh=fX8YvlhhNFgft9OakgXAkGSYyDzSrw/XR50l0U+3ZLQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Dw8V8gs1AzdCB9EBroRwrgR6SWgZ9jxEKjBnnqY4NvG+k4ORVoJ9lnppI83dIG7Wd
	 qyEQZDYTwTmcQ4JKxRKjRdidg6+cW6glNs8iryaBs1fkjmkitP19DSxvIOlS7WEjnr
	 B9H8IRUkq4FI7xYrlWX0LQOdSGI7T3wHxpVKpHsuhSxaCYaA82SM8/xry/XUF91+LD
	 1Uj07gYRo33UyGloOaSo8YqfMQc73G2/6kaiZ6OqrnXfZCdIMeUJqN3FqW48m8IjY6
	 SCk/cjvpGOvJNrilnhCVPje2VD0xEgtlKH4gaQb/ygIjuw/PR6S5NnWUoSvGqXrnjv
	 0bbKKPZXWO6xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21ABF83B4A;
	Wed, 27 May 2026 12:25:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D73C25C
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C46D83B4A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoasKnmhfjcy for <buildroot@buildroot.org>;
 Wed, 27 May 2026 12:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 053F683AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 053F683AFB
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 053F683AFB
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:25:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so53887395e9.3
 for <buildroot@buildroot.org>; Wed, 27 May 2026 05:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779884739; x=1780489539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2ECl0VXrozqatD2W9TdFWaOysS0GVXLmljch+6peZw=;
 b=m8ZYB0Yx2CXoLeUF8bW03rUGjmsDgECIHUO2gd3S4tbqHQNRr0RBjL/yuApT9AMtpK
 Rpf9h2L0HrpW9O9uLV/EVY7fpeTdF3ouqxdcDP2yBgHhbJOYuuaBSjeCVlzrZ86SZLd5
 nO1scDf25LHgIHkkcSBEp3xKMK3GkKrLABe2Xja7Sc4UZkePIIL35H5dLJuw4IJ1WJz6
 +M2jtmzE2FsD3hUzVSPhg4a5go3vzpKdS/Wxl8InYnC8Rtno5c5BNhItGqKUXyBZQ2g4
 I3SFcaI/IYePTR1Z8WhqYUusxYoP6/XGTCuqng1dILKvhRCLjbimMuVs/HsFHOAOgXA5
 9Q2w==
X-Gm-Message-State: AOJu0YzhqODYwP/vQC6uRjXiNI2y85Yx5N9mYR0Gu9rLnd2/CijYU8vr
 8a1INNeTuXzI/AcR6IKlz9TMaRlhI8g8FH9rmB/v8H1L+geyuOIeOlhP+0Ihlcpc6He6ZJhHp9g
 DJf0F
X-Gm-Gg: Acq92OEiIHOI2l/0HwoToQSwl01ohwgrnLkhkTrH1y8HYEBSDDhJHFwX0Ji+YJhO59q
 gMi+D/QLP2clVJxQRljg77zxQuXADVHr86Ya/kyJBlgEGPFejM1peD41SE9Vq3N0dkEtoXNRbtT
 NHSoplnQ+EPZwqGNLFvdUxDzQ78rZPRzCjQcZwcCbAkEsdBBBk5RzKlxtOtfoju3m4D1Cwcf1/i
 fFd+fD7HAoW11A1pSLtwuNl3jS0J+yQSCMgAPxLJtYDKXaxc68hvgiNoCKn7z6HH9IAO05FTZIA
 jRU3z6PeMZAbfHncFG5lUs+QprZtJNqOkKGdDP5WZ4DFLwpexIBFpC44Xe2THO+BmsG3u81BVh3
 lhoFJNDl6exupb7Mwfz/Ppug2PMEmYx2PFdeCjYtoMhBJGKCYUhzOrhc2CZ2ULMhWniG+UXhfLR
 ErxVfxLK5oOV5gLQGPE3Q7YJG+ZbFCNpjUM/uWuqwSl2PIR4ONEXP0rYqYug==
X-Received: by 2002:a05:600c:4746:b0:490:469c:556b with SMTP id
 5b1f17b1804b1-490469c56d6mr360950245e9.12.1779884738572; 
 Wed, 27 May 2026 05:25:38 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904527526dsm433406615e9.4.2026.05.27.05.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 05:25:38 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 May 2026 14:25:37 +0200
Message-ID: <20260527122537.699943-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779884739; x=1780489539; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/2ECl0VXrozqatD2W9TdFWaOysS0GVXLmljch+6peZw=;
 b=KuQvBYGry7CIKdc7kVMltTUPRum5CgLBkV2GI9n53kSG1pSCAYpgrgPrQKbTU2Ry/K
 xNKnbovlOuYspkzjb+sNOwinXU3586aAzUcH4kPacuyb0JB9HtJXB8auit2Z1ngLhOtZ
 kDKqXp0ngk1eZ0qOZ5VBgQvsL79zgD+xI3qosGX+eGPI+puv8hqO2RVgOeYxdFhTzws3
 /L5R0m8EQ6rCuzvQzmbVmitzz7jMIYh6IjZNnMKJp/+avhZdKX0hn5h7HSORv79mpfdU
 bNXchvCkWsKDTYS8Ms9ABXM4Vl0A770E+wD3oJQ9XpCDLG8pTK1qeTbBB8X1kHgfzPqH
 ltDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KuQvBYGr
Subject: [Buildroot] [PATCH 2026.02.x] package/{glibc,
 localedef}: security bump to version glibc-2.42-67-g4ebd33dd7
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
  - glibc-2.42-62-gf13c1bb0f97fbc12a6ba1ab5669ce561ea32b80a
  - https://www.cve.org/CVERecord?id=CVE-2026-4046

- CVE-2026-4437:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    Library version 2.34 to version 2.43 could, with a crafted response
    from the configured DNS server, result in a violation of the DNS
    specification that causes the application to treat a non-answer
    section of the DNS response as a valid answer.

For more information, see:
  - glibc-2.42-58-g8e863fb1c92360520704a69dc948be6bb4a17cb3
  - https://www.cve.org/CVERecord?id=CVE-2026-4437

- CVE-2026-4438:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    library version 2.34 to version 2.43 could result in an invalid DNS
    hostname being returned to the caller in violation of the DNS
    specification.

For more information, see:
  - glibc-2.42-59-g426378547e6ddead92f28f5558a124eb0821d2f9
  - https://www.cve.org/CVERecord?id=CVE-2026-4438

- CVE-2026-5450:
    Calling the scanf family of functions with a %mc (malloc'd character
    match) in the GNU C Library version 2.7 to version 2.43 with a format
    width specifier with an explicit width greater than 1024 could result
    in a one byte heap buffer overflow.

For more information, see:
  - glibc-2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
  - https://www.cve.org/CVERecord?id=CVE-2026-5450

- CVE-2026-5928:
    Calling the ungetwc function on a FILE stream with wide characters
    encoded in a character set that has overlaps between its single byte
    and multi-byte character encodings, in the GNU C Library version 2.43
    or earlier, may result in an attempt to read bytes before an allocated
    buffer, potentially resulting in unintentional disclosure of
    neighboring data in the heap, or a program crash.  A bug in the wide
    character pushback implementation (_IO_wdefault_pbackfail in
    libio/wgenops.c) causes ungetwc() to operate on the regular character
    buffer (fp->_IO_read_ptr) instead of the actual wide-stream read
    pointer (fp->_wide_data->_IO_read_ptr). The program crash may happen
    in cases where fp->_IO_read_ptr is not initialized and hence points to
    NULL. The buffer under-read requires a special situation where the
    input character encoding is such that there are overlaps between
    single byte representations and multibyte representations in that
    encoding, resulting in spurious matches. The spurious match case is
    not possible in the standard Unicode character sets.

For more information, see:
  - glibc-2.42-66-gb4bca35ab9e76890504c4dbdd5eaf15a93514580
  - https://www.cve.org/CVERecord?id=CVE-2026-5928

> git shortlog 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125..2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc

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

H.J. Lu (1):
      abilist.awk: Handle weak unversioned defined symbols

Michael Jeanson (1):
      tests: fix tst-rseq with Linux 7.0

Rocket Ma (2):
      libio: Fix ungetwc operating on byte stream [BZ #33998]
      stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]

Xi Ruoyao (1):
      elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 17 ++++++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0a11cfdb5e..b8738b3505 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  737e3b2bfee2e3e209e514133f4ff7d2bef0d0dc903fd46b4e2244f6c998f7b2  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
+sha256  5c278e563779ed471a8ee8b607d29274d1c83ac91c88ea127a3c1ecdc22b14a1  glibc-2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 80d21b86ed..12a4034ce0 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+GLIBC_VERSION = 2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -31,6 +31,21 @@ GLIBC_IGNORE_CVES += CVE-2026-0915
 # Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 GLIBC_IGNORE_CVES += CVE-2025-15281
 
+# Fixed by glibc-2.42-58-g8e863fb1c92360520704a69dc948be6bb4a17cb3
+GLIBC_IGNORE_CVES += CVE-2026-4437
+
+# Fixed by glibc-2.42-59-g426378547e6ddead92f28f5558a124eb0821d2f9
+GLIBC_IGNORE_CVES += CVE-2026-4438
+
+# Fixed by glibc-2.42-62-gf13c1bb0f97fbc12a6ba1ab5669ce561ea32b80a
+GLIBC_IGNORE_CVES += CVE-2026-4046
+
+# Fixed by glibc-2.42-66-gb4bca35ab9e76890504c4dbdd5eaf15a93514580
+GLIBC_IGNORE_CVES += CVE-2026-5928
+
+# Fixed by glibc-2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
+GLIBC_IGNORE_CVES += CVE-2026-5450
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 4da110417a..1f9533ba62 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+LOCALEDEF_VERSION = 2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
