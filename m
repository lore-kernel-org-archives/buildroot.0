Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8501AC43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5607460FF5;
	Thu,  2 Jul 2026 16:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PGYD1dA5Ivq; Thu,  2 Jul 2026 16:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BDC26138F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783011481;
	bh=MmOSZDL78RqvLWAC7u3LO53U9ToFjciGmhHBMAzeD1s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ro2JgciUeeBaM1cjQWQjcL9jBD/EvDjOGpA/8dOPH/nT6grYSF7Fz4lwrPcUmNGuE
	 b1QYYnlyeTx/YuBPNLqntkD2JCD21lls7M9m0Y/Eg3xfaIHZOgENOW4eiDlesM7v+A
	 76ujL4KQBOjqPwHM8RbAd+69gQYOZg/M1YEiAokIRdUmE4h1njqmUMvCTFeIg4JHH0
	 ZNXrK9qOgIJVdHpfEl44qevFDHkhpqiNJTdB213sQfljvoPtpcRrxkzxNIdaHdw0hC
	 PG3ESmhSOXJ8/nA4mijQ4dFnylC9T7/TiF5MPGV6TXKUbCN/3HCiLm0TjCAOulwz4/
	 lil3LkZI6z4tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDC26138F;
	Thu,  2 Jul 2026 16:58:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A374392
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30433402B0
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdPDA6tmhasG for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 16:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AE704025F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE704025F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AE704025F
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:57:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1025191311; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 16:57:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wfKja-00000003RiT-1KgJ;
 Thu, 02 Jul 2026 18:57:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  2 Jul 2026 18:57:43 +0200
Message-ID: <20260702165744.821512-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=baWpIBGoB+259Jhw0un+wW6QiTChgUXfdS8w3SFP4u1h5TRwfo4yDDhWUgafit39pEgyO7ku82/I9NDDyIUaItXF8AKdb+GcrT7nduqeMpd6kwqQvn+Uaw2czRFGk7WAEmSMmHYfBf7xzvUfZWhlpCg48dOWOIUnN0RwYXAJzMflroJe9BEkw7IMzi7vtqUib9htGVGKOx9maYP3yKurCFobF62btWtoSR+2GrFBYYYDC7kyLzxyR0KsR2/mneirQKVKqST03Xax5oFikbhxw5Nq/Q/i0k3lnFUyiZbXRCjtbqQMhCF9Q6RGyNB+ab6YEPkbsuIcggir+WcNMrqEdQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=VCH/R48gtAO1/bET8PJ+Y36VtVjvypmE81zzKBpedXY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=baWpIBGo
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH-2025.02.x] package/{glibc,
 localedef}: security bump to version 2.41-143-gfc7a48bc9
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerabilities:

GLIBC-SA-2026-0009:
===================
scanf %mc off-by-one heap buffer overflow

Calling the scanf family of functions with a %mc (malloc'd character
match) in the GNU C Library version 2.7 to version 2.43 with a format
width specifier with an explicit width greater than 1024 could result in
a one byte heap buffer overflow.

The bug is in the buffer growth formula in __vfscanf_internal, which
under-allocates by one byte during realloc expansion, allowing a
controlled single-byte overwrite past the end of the heap buffer.

The impact is limited by the fact that to execute the overwrite you need
both user controlled input data and a specific choice of maximum width
that yields a smaller than needed allocation. The latter point has to
take into account malloc's particular chunk size rounding process.  The
"%[width]mc" format specifier does not appear to have notable use in
major Linux-based OS distributions, due to which the real world impact
may be limited to bespoke use cases.

CVE-Id: CVE-2026-5450

GLIBC-SA-2026-0010:
===================
Potential buffer under-read in ungetwc

Calling the ungetwc function on a FILE stream with wide characters
encoded in a character set that has overlaps between its single byte and
multi-byte character encodings, in the GNU C Library version 2.43 or
earlier, may result in an attempt to read bytes before an allocated
buffer, potentially resulting in unintentional disclosure of neighboring
data in the heap, or a program crash.

A bug in the wide character pushback implementation
(_IO_wdefault_pbackfail in libio/wgenops.c) causes ungetwc() to operate
on the regular character buffer (fp->_IO_read_ptr) instead of the actual
wide-stream read pointer (fp->_wide_data->_IO_read_ptr). The program
crash may happen in cases where fp->_IO_read_ptr is not initialized and
hence points to NULL. The buffer under-read requires a special situation
where the input character encoding is such that there are overlaps
between single byte representations and multibyte representations in
that encoding, resulting in spurious matches.  The spurious match case
is not possible in the standard Unicode character sets.

CVE-Id: CVE-2026-5928

https://inbox.sourceware.org/libc-announce/b11f0003-6ec1-4bd6-b9de-9e38a4efeca3@redhat.com/T/

git shortlog b676adadbc1f5fb2f31bc484a7628cca89ae6f22..
DJ Delorie (1):
      stdio-common: Allow partially-filled %mc buffers [BZ #12701]

Florian Weimer (1):
      iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)

Maciej W. Rozycki (2):
      support: Implement 'xfmemopen' for seamless 'fmemopen' use
      stdio-common: Reject insufficient character data in scanf [BZ #12701]

Rocket Ma (2):
      libio: Fix ungetwc operating on byte stream [BZ #33998]
      stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 8 +++++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 3f1df7058a..03e8722057 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  c5856a16a8576d35adddd92f7e86c58faeedd849633582a7926f9a3e766ffe2d  glibc-2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22-git4.tar.gz
+sha256  130d77e16a08f7e52e14b49d8554997877a4fe82ac6b840a0202716146ac8fb5  glibc-2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3ce6265a6d..8121968e02 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
+GLIBC_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -60,6 +60,12 @@ GLIBC_IGNORE_CVES += CVE-2026-4438
 # Fixed by glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3
 GLIBC_IGNORE_CVES += CVE-2026-4046
 
+# Fixed by glibc-2.41-138-g8941538b92a574a24e9308e164869239d2b0d845
+GLIBC_IGNORE_CVES += CVE-2026-5928
+
+# Fixed by glibc-2.41-142-g1a74f82eedaf0987eda1f522121e6a48fac502e7
+GLIBC_IGNORE_CVES += CVE-2026-5450
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c3a959c5f5..7b16932125 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
+LOCALEDEF_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
