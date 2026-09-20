Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F4C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CF040A27;
	Sun, 20 Sep 2026 12:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDd_3cAs5Vxy; Sun, 20 Sep 2026 12:32:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F423740A1B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907541;
	b=FSxTvw81piNe/RYMavWuBA0yC3yVTtBxZOgKCuAWMZDI+LTUuJGaGMfqyQmfXifLTdVj
	 bKW2JoYcAOgXDlT7AhsPm/LqdfVO+aH/sRIxcOfJGrBLM0rmEUE2QraFQWssRNoBR2UOS
	 FEuVwoOjEl85bv/GoCMhbiHdh7R4f/sNnqCIwexmS/c+hkaZq7i2YXMtmydGPeq26gyBe
	 pXIeCKVKfsQ8YAFlIngautLvg0WcrhrfYg8zmR0KrW+8UVIj7AJfzshcHZ5fmqkRPPxma
	 o5nlY6K+aMdaNkJIgLSt5u41ejZ7dSt6OZP4wbWAoluTGPIAQhpSddpnUGeRy0nd9Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=KKHrOWRyfRxRD+UCquCSNHDSwh5u33iQVukEOLWXIL0=;
	b=QYzd/cEIqV3D11tj7o7Fyha4w0ceZaJelHbJ9wK8y+iDHJlgg/atMTNjcbDjdngRNNZJ
	 6Y5arDrm4uFAHljCNf3raNUk/3jZrs4U4tIHRXogRPVrO0RqHWKtLc5gDWiyh4wfszMT3
	 5ZDaEQh/wNTQ03ZgNDVhYTUxGg3VNP9Vj2IS/2oOcSQB2tehyu3uWR6E1AmuYHnGFUcbz
	 2jUTEAujWKFHm3fLFsKYG+CVDDngTWmK1Rse/hIkaUcy/SMx7SAucfGXJMb7/QxHSn8Lj
	 piesBZekrqPeiWFcqDEOEnjjbE6IKGs5wp00PcoEhHjMqJpEKa/yKHKwmvZ6g/UMvBg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907541;
	bh=KKHrOWRyfRxRD+UCquCSNHDSwh5u33iQVukEOLWXIL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=podCp9iUOWMjxf+KMjlUmVCVVngZ9u7wDJhMoQ4YbAOq/KE0DdR92QxxPPcE/xt/4
	 QGqQqMkgPZyzJRku1fmVO5R/bIWXoNwQW3PT+hIAvNBi6ve5Dr5nNFs35kQhEBVYXP
	 xJdUn0xhJo9wWvyjAOfpR/978OO2S9R0N9Bya+N+AwFQ8TCQ0Xhv4bt/AR1y2vS7v3
	 CKVA8z5YFGmibgq+eujcRFnUD5Te8GaMiZCzH8aFUU1KGMN86B6wo7ogVjrz0ui7uf
	 ZKLysYblhj7T5axxxvAqEBp9Qn5i9Y0seaJXPGu1wV4uKsu34tHc3WLxsygtbAzvmr
	 4g3kAFs45/Ung==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F423740A1B;
	Sun, 20 Sep 2026 12:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59B7E224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B76B809BB
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJKpgXcquuDu for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:32:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B8D68809C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907538;
 b=poSGtNT55BAt3Hfa7J5RgSjfiQF7gzk6zvIt7zvClOhbrbuvuSid9cuKS8W927FgOnnR
 16tOmljrt27eerEiy/tO2cxZYO06DciAWoVjWHeiRkAHt6yLKeYxGRburA4nFyZXTahTB
 g69c3wJ/2r5ASVrVvPv93QkbqGJUcMXWEzJY/Xw+KmTgHMqI8RZ8YQ6QQXbOZxWqT3uPR
 t6K+E1jDbriyKutkVYSMuDyhfihFg2USPPun4hnq1ZHIl/5KwpUbFSq5FZ4IM+XkLwAVR
 INpMRehp0nxqn/nX2dNMF5UyEQhEmrAcdA3EoqHLPQLMb67abvrQW8Vy2i+IH0oLI9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907538;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VQY3r5yVe95esANvf5oMkYrce8aByVfeZ3bC6lmGgis=;
 b=CtQPJHIa5c89EeaUGAksTZjIRK6peJ+DhkTSSbKrbfPGLANsD7OGy+rR8X/zlfN0Ztu/
 8Q6B2p5Xm0Dz/s4S6/blhZgofv2N3QrJMUQM8sFuKh0ji7zHkjYPbtc2jv7uQkDBX/4uy
 XS+e7TB3bx4NnAuHl0GDlL+eruJSKecweTKkzjobEQMsGXpT3F0cfx4dvOh36x9ZBGsDn
 v1lEMPNe77kHJLk1sISRx+/6JDCkPff5EZ9jAAvgATHhCuoFJQiZR7jutxHywNouYZ6fT
 mbJ/xP06BMQHUo3uA0R28uyi1qgt5/wyBsPCEv+sEmz2ZRuZ6zJvpnCMb6CRGFauFPw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D68809C0
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:32:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6389F8B7E7; Sun, 20 Sep 2026 12:31:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:31:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0df986a59bf9a71986ff6a8d7faabdec4f4300ac
X-Git-Newrev: 32bf91daa724ca2fa2c54bec80e110d0f7305b24
X-Patchwork-Hint: ignore
Message-Id: <20260920123110.6389F8B7E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/heirloom-mailx: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3040952097899694797=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3040952097899694797==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32bf91daa724ca2fa2c54bec80e110d0f7305b24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building the package with OpenSSL 4.0.2 is broken:

openssl.c: In function 'ssl_select_method':
openssl.c:223:34: error: implicit declaration of function 'SSLv3_client_method'; did you mean 'SSLv23_client_method'? [-Wimplicit-function-declaration]
  223 |                         method = SSLv3_client_method();
      |                                  ^~~~~~~~~~~~~~~~~~~
      |                                  SSLv23_client_method
openssl.c:223:32: error: assignment to 'const SSL_METHOD *' {aka 'const struct ssl_method_st *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
  223 |                         method = SSLv3_client_method();
      |                                ^
openssl.c:225:34: error: implicit declaration of function 'TLSv1_client_method'; did you mean 'TLS_client_method'? [-Wimplicit-function-declaration]
  225 |                         method = TLSv1_client_method();
      |                                  ^~~~~~~~~~~~~~~~~~~
      |                                  TLS_client_method
openssl.c:225:32: error: assignment to 'const SSL_METHOD *' {aka 'const struct ssl_method_st *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
  225 |                         method = TLSv1_client_method();
      |                                ^
openssl.c: In function 'ssl_check_host':
openssl.c:342:59: error: invalid use of incomplete typedef 'ASN1_IA5STRING' {aka 'struct asn1_string_st'}
  342 |                                                 gen->d.ia5->data);
      |                                                           ^~
openssl.c:344:67: error: invalid use of incomplete typedef 'ASN1_IA5STRING' {aka 'struct asn1_string_st'}
  344 |                                                 (char *)gen->d.ia5->data)

openssl.c: In function 'smime_verify':
openssl.c:610:67: error: invalid use of incomplete typedef 'ASN1_IA5STRING' {aka 'struct asn1_string_st'}
  610 |                                                         gen->d.ia5->data,

Debian removed the package in 2015:
https://tracker.debian.org/news/727466/heirloom-mailx-removed-from-testing/

The last upstream release dates back to 2005:
https://sourceforge.net/projects/nail/files/nail/

Dropped BR2_TOOLCHAIN_HAS_GCC_BUG_101916 because no other uses this
option after the removal of heirloom-mailx.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   7 ++
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 ...e-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch |  57 -----------
 ...-SSL2-support-since-it-is-no-longer-suppo.patch |  39 --------
 ...ntian-warning-warning-macro-N-not-defined.patch |  23 -----
 .../0011-outof-Introduce-expandaddr-flag.patch     |  69 -------------
 ...ble-option-processing-for-email-addresses.patch |  77 --------------
 ...c-Unconditionally-require-wordexp-support.patch | 111 ---------------------
 ...4-globname-Invoke-wordexp-with-WRDE_NOCMD.patch |  29 ------
 .../heirloom-mailx/0015-usr-sbin-sendmail.patch    |  36 -------
 .../heirloom-mailx/0101-fix-libressl-support.patch |  55 ----------
 package/heirloom-mailx/Config.in                   |  22 ----
 package/heirloom-mailx/heirloom-mailx.hash         |   5 -
 package/heirloom-mailx/heirloom-mailx.mk           |  51 ----------
 toolchain/Config.in                                |   7 --
 16 files changed, 7 insertions(+), 583 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 565f100e57..ee4d978efe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_HEIRLOOM_MAILX
+	bool "heirloom-mailx has been removed"
+	select BR2_LEGACY
+	help
+	  The heirloom-mailx package has been removed because it is
+	  incompatible with OpenSSL >= 4.x
+
 config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801
 	bool "nxp-bt-wifi-firmware 8801 support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 51b939542d..988a32a914 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3258,7 +3258,6 @@ F:	package/gcc/
 F:	package/genext2fs/
 F:	package/getent/
 F:	package/gnu-efi/
-F:	package/heirloom-mailx/
 F:	package/igh-ethercat/
 F:	package/intltool/
 F:	package/jh71xx-tools/
diff --git a/package/Config.in b/package/Config.in
index 243b390d1c..1772f803fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2362,7 +2362,6 @@ menu "Mail"
 	source "package/dovecot/Config.in"
 	source "package/exim/Config.in"
 	source "package/fetchmail/Config.in"
-	source "package/heirloom-mailx/Config.in"
 	source "package/libesmtp/Config.in"
 	source "package/msmtp/Config.in"
 	source "package/mutt/Config.in"
diff --git a/package/heirloom-mailx/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch b/package/heirloom-mailx/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
deleted file mode 100644
index 967344159e..0000000000
--- a/package/heirloom-mailx/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From: Luk Claes <luk@debian.org>
-Date: Sat, 4 Jul 2009 10:54:53 +0200
-Subject: Don't reuse weak symbol optopt to fix FTBFS on mips*
-
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- getopt.c |   10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/getopt.c b/getopt.c
-index 83ce628..82e983c 100644
---- a/getopt.c
-+++ b/getopt.c
-@@ -43,7 +43,7 @@ typedef	int	ssize_t;
- char	*optarg;
- int	optind = 1;
- int	opterr = 1;
--int	optopt;
-+int	optoptc;
- 
- static void
- error(const char *s, int c)
-@@ -69,7 +69,7 @@ error(const char *s, int c)
- 		*bp++ = *s++;
- 	while (*msg)
- 		*bp++ = *msg++;
--	*bp++ = optopt;
-+	*bp++ = optoptc;
- 	*bp++ = '\n';
- 	write(2, buf, bp - buf);
- 	ac_free(buf);
-@@ -101,13 +101,13 @@ getopt(int argc, char *const argv[], const char *optstring)
- 		}
- 		curp = &argv[optind][1];
- 	}
--	optopt = curp[0] & 0377;
-+	optoptc = curp[0] & 0377;
- 	while (optstring[0]) {
- 		if (optstring[0] == ':') {
- 			optstring++;
- 			continue;
- 		}
--		if ((optstring[0] & 0377) == optopt) {
-+		if ((optstring[0] & 0377) == optoptc) {
- 			if (optstring[1] == ':') {
- 				if (curp[1] != '\0') {
- 					optarg = (char *)&curp[1];
-@@ -127,7 +127,7 @@ getopt(int argc, char *const argv[], const char *optstring)
- 					optind++;
- 				optarg = 0;
- 			}
--			return optopt;
-+			return optoptc;
- 		}
- 		optstring++;
- 	}
diff --git a/package/heirloom-mailx/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch b/package/heirloom-mailx/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
deleted file mode 100644
index 156aea7a37..0000000000
--- a/package/heirloom-mailx/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From: Hilko Bengen <bengen@debian.org>
-Date: Wed, 27 Apr 2011 00:18:42 +0200
-Subject: Patched out SSL2 support since it is no longer supported by OpenSSL.
-
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- mailx.1   |    2 +-
- openssl.c |    4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/mailx.1 b/mailx.1
-index 417ea04..a02e430 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using OpenSSL.
- .TP
- .B ssl-method
- Selects a SSL/TLS protocol version;
--valid values are `ssl2', `ssl3', and `tls1'.
-+valid values are `ssl3', and `tls1'.
- If unset, the method is selected automatically,
- if possible.
- .TP
-diff --git a/openssl.c b/openssl.c
-index b4e33fc..44fe4e5 100644
---- a/openssl.c
-+++ b/openssl.c
-@@ -216,9 +216,7 @@ ssl_select_method(const char *uhp)
- 
- 	cp = ssl_method_string(uhp);
- 	if (cp != NULL) {
--		if (equal(cp, "ssl2"))
--			method = SSLv2_client_method();
--		else if (equal(cp, "ssl3"))
-+		if (equal(cp, "ssl3"))
- 			method = SSLv3_client_method();
- 		else if (equal(cp, "tls1"))
- 			method = TLSv1_client_method();
diff --git a/package/heirloom-mailx/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch b/package/heirloom-mailx/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
deleted file mode 100644
index 724f7c8b81..0000000000
--- a/package/heirloom-mailx/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Hilko Bengen <bengen@debian.org>
-Date: Sat, 14 Apr 2012 20:22:43 +0200
-Subject: Fixed Lintian warning (warning: macro `N' not defined)
-
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- mailx.1 |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mailx.1 b/mailx.1
-index a02e430..b0723bd 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -3781,7 +3781,7 @@ you could examine the first message by giving the command:
- .sp
- .fi
- which might cause
--.N mailx
-+.I mailx
- to respond with, for example:
- .nf
- .sp
diff --git a/package/heirloom-mailx/0011-outof-Introduce-expandaddr-flag.patch b/package/heirloom-mailx/0011-outof-Introduce-expandaddr-flag.patch
deleted file mode 100644
index 7825b788bc..0000000000
--- a/package/heirloom-mailx/0011-outof-Introduce-expandaddr-flag.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 9984ae5cb0ea0d61df1612b06952a61323c083d9 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 11:13:38 +0100
-Subject: [PATCH] outof: Introduce expandaddr flag
-
-Document that address expansion is disabled unless the expandaddr
-binary option is set.
-
-This has been assigned CVE-2014-7844 for BSD mailx, but it is not
-a vulnerability in Heirloom mailx because this feature was documented.
-
-CVE: CVE-2014-7844
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0011-outof-Introduce-expandaddr-flag.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- mailx.1 | 14 ++++++++++++++
- names.c |  3 +++
- 2 files changed, 17 insertions(+)
-
-diff --git a/mailx.1 b/mailx.1
-index 70a7859..22a171b 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -656,6 +656,14 @@ but any reply returned to the machine
- will have the system wide alias expanded
- as all mail goes through sendmail.
- .SS "Recipient address specifications"
-+If the
-+.I expandaddr
-+option is not set (the default), recipient addresses must be names of
-+local mailboxes or Internet mail addresses.
-+.PP
-+If the
-+.I expandaddr
-+option is set, the following rules apply:
- When an address is used to name a recipient
- (in any of To, Cc, or Bcc),
- names of local mail folders
-@@ -2391,6 +2399,12 @@ and exits immediately.
- If this option is set,
- \fImailx\fR starts even with an empty mailbox.
- .TP
-+.B expandaddr
-+Causes
-+.I mailx
-+to expand message recipient addresses, as explained in the section,
-+Recipient address specifications.
-+.TP
- .B flipr
- Exchanges the
- .I Respond
-diff --git a/names.c b/names.c
-index 66e976b..c69560f 100644
---- a/names.c
-+++ b/names.c
-@@ -268,6 +268,9 @@ outof(struct name *names, FILE *fo, struct header *hp)
- 	FILE *fout, *fin;
- 	int ispipe;
- 
-+	if (value("expandaddr") == NULL)
-+		return names;
-+
- 	top = names;
- 	np = names;
- 	time(&now);
--- 
-1.9.3
-
-
diff --git a/package/heirloom-mailx/0012-unpack-Disable-option-processing-for-email-addresses.patch b/package/heirloom-mailx/0012-unpack-Disable-option-processing-for-email-addresses.patch
deleted file mode 100644
index 64a1e7f246..0000000000
--- a/package/heirloom-mailx/0012-unpack-Disable-option-processing-for-email-addresses.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From e34e2ac67b80497080ebecccec40c3b61456167d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 11:14:06 +0100
-Subject: [PATCH] unpack: Disable option processing for email addresses
- when calling sendmail
-
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0012-unpack-Disable-option-processing-for-email-addresses.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- extern.h  | 2 +-
- names.c   | 8 ++++++--
- sendout.c | 2 +-
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/extern.h b/extern.h
-index 6b85ba0..8873fe8 100644
---- a/extern.h
-+++ b/extern.h
-@@ -396,7 +396,7 @@ struct name *outof(struct name *names, FILE *fo, struct header *hp);
- int is_fileaddr(char *name);
- struct name *usermap(struct name *names);
- struct name *cat(struct name *n1, struct name *n2);
--char **unpack(struct name *np);
-+char **unpack(struct name *smopts, struct name *np);
- struct name *elide(struct name *names);
- int count(struct name *np);
- struct name *delete_alternates(struct name *np);
-diff --git a/names.c b/names.c
-index c69560f..45bbaed 100644
---- a/names.c
-+++ b/names.c
-@@ -549,7 +549,7 @@ cat(struct name *n1, struct name *n2)
-  * Return an error if the name list won't fit.
-  */
- char **
--unpack(struct name *np)
-+unpack(struct name *smopts, struct name *np)
- {
- 	char **ap, **top;
- 	struct name *n;
-@@ -564,7 +564,7 @@ unpack(struct name *np)
- 	 * the terminating 0 pointer.  Additional spots may be needed
- 	 * to pass along -f to the host mailer.
- 	 */
--	extra = 2;
-+	extra = 3 + count(smopts);
- 	extra++;
- 	metoo = value("metoo") != NULL;
- 	if (metoo)
-@@ -581,6 +581,10 @@ unpack(struct name *np)
- 		*ap++ = "-m";
- 	if (verbose)
- 		*ap++ = "-v";
-+	for (; smopts != NULL; smopts = smopts->n_flink)
-+		if ((smopts->n_type & GDEL) == 0)
-+			*ap++ = smopts->n_name;
-+	*ap++ = "--";
- 	for (; n != NULL; n = n->n_flink)
- 		if ((n->n_type & GDEL) == 0)
- 			*ap++ = n->n_name;
-diff --git a/sendout.c b/sendout.c
-index 7b7f2eb..c52f15d 100644
---- a/sendout.c
-+++ b/sendout.c
-@@ -835,7 +835,7 @@ start_mta(struct name *to, struct name *mailargs, FILE *input,
- #endif	/* HAVE_SOCKETS */
- 
- 	if ((smtp = value("smtp")) == NULL) {
--		args = unpack(cat(mailargs, to));
-+		args = unpack(mailargs, to);
- 		if (debug || value("debug")) {
- 			printf(catgets(catd, CATSET, 181,
- 					"Sendmail arguments:"));
--- 
-1.9.3
-
-
diff --git a/package/heirloom-mailx/0013-fio.c-Unconditionally-require-wordexp-support.patch b/package/heirloom-mailx/0013-fio.c-Unconditionally-require-wordexp-support.patch
deleted file mode 100644
index 6938daec12..0000000000
--- a/package/heirloom-mailx/0013-fio.c-Unconditionally-require-wordexp-support.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 2bae8ecf04ec2ba6bb9f0af5b80485dd0edb427d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 12:48:25 +0100
-Subject: [PATCH] fio.c: Unconditionally require wordexp support
-
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0013-fio.c-Unconditionally-require-wordexp-support.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- fio.c | 67 +++++--------------------------------------------------------------
- 1 file changed, 5 insertions(+), 62 deletions(-)
-
-diff --git a/fio.c b/fio.c
-index 65e8f10..1529236 100644
---- a/fio.c
-+++ b/fio.c
-@@ -43,12 +43,15 @@ static char sccsid[] = "@(#)fio.c	2.76 (gritter) 9/16/09";
- #endif /* not lint */
- 
- #include "rcv.h"
-+
-+#ifndef HAVE_WORDEXP
-+#error wordexp support is required
-+#endif
-+
- #include <sys/stat.h>
- #include <sys/file.h>
- #include <sys/wait.h>
--#ifdef	HAVE_WORDEXP
- #include <wordexp.h>
--#endif	/* HAVE_WORDEXP */
- #include <unistd.h>
- 
- #if defined (USE_NSS)
-@@ -481,7 +484,6 @@ next:
- static char *
- globname(char *name)
- {
--#ifdef	HAVE_WORDEXP
- 	wordexp_t we;
- 	char *cp;
- 	sigset_t nset;
-@@ -527,65 +529,6 @@ globname(char *name)
- 	}
- 	wordfree(&we);
- 	return cp;
--#else	/* !HAVE_WORDEXP */
--	char xname[PATHSIZE];
--	char cmdbuf[PATHSIZE];		/* also used for file names */
--	int pid, l;
--	char *cp, *shell;
--	int pivec[2];
--	extern int wait_status;
--	struct stat sbuf;
--
--	if (pipe(pivec) < 0) {
--		perror("pipe");
--		return name;
--	}
--	snprintf(cmdbuf, sizeof cmdbuf, "echo %s", name);
--	if ((shell = value("SHELL")) == NULL)
--		shell = SHELL;
--	pid = start_command(shell, 0, -1, pivec[1], "-c", cmdbuf, NULL);
--	if (pid < 0) {
--		close(pivec[0]);
--		close(pivec[1]);
--		return NULL;
--	}
--	close(pivec[1]);
--again:
--	l = read(pivec[0], xname, sizeof xname);
--	if (l < 0) {
--		if (errno == EINTR)
--			goto again;
--		perror("read");
--		close(pivec[0]);
--		return NULL;
--	}
--	close(pivec[0]);
--	if (wait_child(pid) < 0 && WTERMSIG(wait_status) != SIGPIPE) {
--		fprintf(stderr, catgets(catd, CATSET, 81,
--				"\"%s\": Expansion failed.\n"), name);
--		return NULL;
--	}
--	if (l == 0) {
--		fprintf(stderr, catgets(catd, CATSET, 82,
--					"\"%s\": No match.\n"), name);
--		return NULL;
--	}
--	if (l == sizeof xname) {
--		fprintf(stderr, catgets(catd, CATSET, 83,
--				"\"%s\": Expansion buffer overflow.\n"), name);
--		return NULL;
--	}
--	xname[l] = 0;
--	for (cp = &xname[l-1]; *cp == '\n' && cp > xname; cp--)
--		;
--	cp[1] = '\0';
--	if (strchr(xname, ' ') && stat(xname, &sbuf) < 0) {
--		fprintf(stderr, catgets(catd, CATSET, 84,
--				"\"%s\": Ambiguous.\n"), name);
--		return NULL;
--	}
--	return savestr(xname);
--#endif	/* !HAVE_WORDEXP */
- }
- 
- /*
--- 
-1.9.3
-
-
diff --git a/package/heirloom-mailx/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch b/package/heirloom-mailx/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
deleted file mode 100644
index 378b157d8a..0000000000
--- a/package/heirloom-mailx/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 73fefa0c1ac70043ec84f2d8b8f9f683213f168d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 13:11:32 +0100
-Subject: [PATCH] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)
-
-CVE: CVE-2004-2771
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- fio.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fio.c b/fio.c
-index 1529236..774a204 100644
---- a/fio.c
-+++ b/fio.c
-@@ -497,7 +497,7 @@ globname(char *name)
- 	sigemptyset(&nset);
- 	sigaddset(&nset, SIGCHLD);
- 	sigprocmask(SIG_BLOCK, &nset, NULL);
--	i = wordexp(name, &we, 0);
-+	i = wordexp(name, &we, WRDE_NOCMD);
- 	sigprocmask(SIG_UNBLOCK, &nset, NULL);
- 	switch (i) {
- 	case 0:
--- 
-1.9.3
-
-
diff --git a/package/heirloom-mailx/0015-usr-sbin-sendmail.patch b/package/heirloom-mailx/0015-usr-sbin-sendmail.patch
deleted file mode 100644
index 195b606c01..0000000000
--- a/package/heirloom-mailx/0015-usr-sbin-sendmail.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Description: Sendmail is at /usr/sbin/sendmail
- As per Debian Policy §11.6
-Author: Ryan Kavanagh <rak@debian.org>
-Origin: Debian
-Forwarded: no
-
-Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0015-usr-sbin-sendmail.patch/
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
-Index: heirloom-mailx-12.5/Makefile
-===================================================================
---- heirloom-mailx-12.5.orig/Makefile	2011-04-26 17:23:22.000000000 -0400
-+++ heirloom-mailx-12.5/Makefile	2015-01-27 13:20:04.733542801 -0500
-@@ -13,7 +13,7 @@
- 
- MAILRC		= $(SYSCONFDIR)/nail.rc
- MAILSPOOL	= /var/mail
--SENDMAIL	= /usr/lib/sendmail
-+SENDMAIL	= /usr/sbin/sendmail
- 
- DESTDIR		=
- 
-Index: heirloom-mailx-12.5/mailx.1
-===================================================================
---- heirloom-mailx-12.5.orig/mailx.1	2015-01-27 13:18:49.000000000 -0500
-+++ heirloom-mailx-12.5/mailx.1	2015-01-27 13:20:32.382336867 -0500
-@@ -4922,7 +4922,7 @@
- which just acts as a proxy.
- .PP
- \fIMailx\fR immediately contacts the SMTP server (or
--.IR \%/usr/lib/sendmail )
-+.IR \%/usr/sbin/sendmail )
- even when operating in
- .I disconnected
- mode.
diff --git a/package/heirloom-mailx/0101-fix-libressl-support.patch b/package/heirloom-mailx/0101-fix-libressl-support.patch
deleted file mode 100644
index 25cc92d580..0000000000
--- a/package/heirloom-mailx/0101-fix-libressl-support.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From aad28d30af6c3a74c522dd61943788e908860c84 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Fri, 4 Aug 2017 07:22:47 -0400
-Subject: [PATCH] fix libressl support
-
-heirloom-mailx has two small issues when compiling against LibreSSL:
-  - RAND_egd is used (LibreSSL does not support RAND_egd)
-    Solution: "Guard" the code calling RAND_egd
-
-  - SSLv3_client_method function is used (LibreSSL does not support SSLv3)
-    Solution: "Guard" the code with #ifndef OPENSSL_NO_SSL3
-
-Upstream: N/A
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- openssl.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/openssl.c b/openssl.c
-index 44fe4e5..c4a1bb7 100644
---- a/openssl.c
-+++ b/openssl.c
-@@ -137,11 +137,13 @@ ssl_rand_init(void)
- 
- 	if ((cp = value("ssl-rand-egd")) != NULL) {
- 		cp = expand(cp);
-+#ifndef OPENSSL_NO_EGD
- 		if (RAND_egd(cp) == -1) {
- 			fprintf(stderr, catgets(catd, CATSET, 245,
- 				"entropy daemon at \"%s\" not available\n"),
- 					cp);
- 		} else
-+#endif
- 			state = 1;
- 	} else if ((cp = value("ssl-rand-file")) != NULL) {
- 		cp = expand(cp);
-@@ -216,10 +218,15 @@ ssl_select_method(const char *uhp)
- 
- 	cp = ssl_method_string(uhp);
- 	if (cp != NULL) {
-+		#ifndef OPENSSL_NO_SSL3
- 		if (equal(cp, "ssl3"))
- 			method = SSLv3_client_method();
- 		else if (equal(cp, "tls1"))
- 			method = TLSv1_client_method();
-+		#else
-+		if (equal(cp, "tls1"))
-+			method = TLSv1_client_method();
-+		#endif
- 		else {
- 			fprintf(stderr, catgets(catd, CATSET, 244,
- 					"Invalid SSL method \"%s\"\n"), cp);
--- 
-2.13.3
-
diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
deleted file mode 100644
index ed2a519436..0000000000
--- a/package/heirloom-mailx/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_HEIRLOOM_MAILX
-	bool "heirloom-mailx"
-	# uses fork()
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2 if BR2_PACKAGE_LIBOPENSSL
-	help
-	  Heirloom mailx (previously known as nail) is a mail user
-	  agent for Unix systems.
-
-	  It can be used as a command-line mail reader, but also more
-	  importantly on embedded systems, as a mail composition
-	  program and SMTP client, in order to send e-mail from shell
-	  scripts. It supports SMTP authentication (login, plain,
-	  cram-md5), SMTPS, MIME encoding of attachments, and more.
-
-	  http://heirloom.sourceforge.net/mailx.html
-
-comment "heirloom-mailx needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-	depends on BR2_USE_MMU
diff --git a/package/heirloom-mailx/heirloom-mailx.hash b/package/heirloom-mailx/heirloom-mailx.hash
deleted file mode 100644
index c42f9b6de7..0000000000
--- a/package/heirloom-mailx/heirloom-mailx.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20150815T155609Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.dsc
-sha256  015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad  heirloom-mailx_12.5.orig.tar.gz
-sha256  0140cef831f966cf65a0a6ba2ed4eef4f2bfb402b7b18db7307bc42e63328ce6  heirloom-mailx_12.5-5.debian.tar.xz
-# Locally computed
-sha256  5ddc00aed98a0cf75fc7edfd9f3aeb1e919ae0ad5e9ff55d61f643d62d802b07  COPYING
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
deleted file mode 100644
index 075b5f6a59..0000000000
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ /dev/null
@@ -1,51 +0,0 @@
-################################################################################
-#
-# heirloom-mailx
-#
-################################################################################
-
-HEIRLOOM_MAILX_VERSION = 12.5
-HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
-HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20150815T155609Z/pool/main/h/heirloom-mailx
-HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPL-1.1 (nss)
-HEIRLOOM_MAILX_LICENSE_FILES = COPYING
-HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
-HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
-# 0011-outof-Introduce-expandaddr-flag.patch
-HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
-# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
-HEIRLOOM_MAILX_IGNORE_CVES += CVE-2004-2771
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HEIRLOOM_MAILX_DEPENDENCIES += openssl
-endif
-
-define HEIRLOOM_MAILX_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SHELL) ./makeconfig)
-endef
-
-HEIRLOOM_MAILX_CFLAGS = $(TARGET_CFLAGS)
-
-# -fPIC is needed to build with NIOS2 toolchains.
-HEIRLOOM_MAILX_CFLAGS += -fPIC
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101916),y)
-HEIRLOOM_MAILX_CFLAGS += -O0
-endif
-
-define HEIRLOOM_MAILX_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		CFLAGS="$(HEIRLOOM_MAILX_CFLAGS)" \
-		-C $(@D)
-endef
-
-define HEIRLOOM_MAILX_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		PREFIX=/usr \
-		UCBINSTALL=$(INSTALL) \
-		STRIP=/bin/true \
-		DESTDIR=$(TARGET_DIR) \
-		install
-endef
-
-$(eval $(generic-package))
diff --git a/toolchain/Config.in b/toolchain/Config.in
index ad73204b14..7452d96122 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -196,13 +196,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
 	bool
 	default y if BR2_microblaze
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101916
-# ICE: on SH4: Segmentation fault signal terminated program cc1.
-# This bug still exists in gcc = 11.1.0
-config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
-	bool
-	default y if BR2_sh4
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
 # ICE: on SH4: unaligned opcodes detected in executable segment.
 # This bug still exists in gcc = 11.1.0

--===============3040952097899694797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3040952097899694797==--
