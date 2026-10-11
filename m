Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4E7CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8321E406CD;
	Sun, 11 Oct 2026 13:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AahNtyzQs3vY; Sun, 11 Oct 2026 13:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8E44D40704
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724255;
	b=Ku5Mi9wNvvOHDTmrRg009rB0v+gDA5N9LmfB+pw7o4rGLX6tBcRf0eEOX9toMBieg9Ui
	 ZXMWR3GfA567CXslsv2GbcFqU5+UWJOfpkw0nSU7F1qCfgvAeiRs/2bvuznkAzz6Gdk2p
	 +CWwYtOgipDwknV8hSnJ2zEAmqU/LfBrvyULZ9em1LlVHJHcXItx+x9AJYQSdwHBayeBu
	 dFBy8idV2ye4oP5W3IxXRoqLfDz2eL+lAKmLQg47SJan71CNN7+Ssb88Z2pLsFRwkzXx/
	 o+uOPofvSxoLhhvYQSt946xrO5AbHcGoWslWGSh3jxdUfGskD5ufak9aq2s1+O/3S4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	b=b/PepzV0RrEBLxwH90DSykws3AmGMbYlRSs2CjdYFioN23ukq4+r9lfpkMqSqcnUxPin
	 jx2almxjg6WJHC548eVFB3Pov75VeOPgFbVgfFWoPH3gYYkjGS6PJ2HqM80Rf6gZHzUOs
	 FrkJ7bo6gZYR+19Dw6XhHkOlEWgZPpbtKJUJ+u/P/kEzlajZqA0hXi2hgkmMEdxs3Pzm9
	 VtBcm7Q60+3/q/Y2wPZ8YANshfDEYAKD8RUu3vSSimiz+ytkO6ngakOpw0jM6xjYQWwFe
	 rOGmxRJl64G3lFScGof/m7kzoeVAg3fvewz2YBEq5PT7Hn7AICrdMEv/ZwF1BLxwgRg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=q2YmbgqQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724255;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EA5gQGuojHM/GkbcJIEo6RufPY9MUsGIb6pqD9CG5hRMsQafa1ogHGQewhZmrNfxS
	 Q4CZ8OMeI7sByQ73yJXRI9ESm0q3fPZX6OJ2F2yDXVIDxId9bRUpLp79Z8ik04R3BK
	 fymFIwwhdLMJhco8teR0Ca8DtttnWfd1+PDehpV9jfKEwcLhm6MLY0ZudO7SmVLnRt
	 7m1qHK/FZRfrWnGvsEyul9vYOI3iEhxFcXd0J17Z3Yut9zdOG/ujnf1Yj0V6c9mapp
	 AoeZJ0GyYviLq5bqvYQ4Gdt5mPEjbpxsAyT6T+cCJfTIJH1zsw54nDwf67lidiZ2Da
	 VvNhCMfaL+szg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E44D40704;
	Sun, 11 Oct 2026 13:10:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FB075
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4966640704
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x68rpLsCDWlR for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:10:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A385406CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724253;
 b=M/tdzajOb15jsyM9WOCpbq2z52A+g0luFFM9nfSNJqBPAjNkZzKVN6sf6nzaKYF9OMw4
 l7EqR5AFow5pwvuENsU2yyDModca/H/0NKK/VvYovxrYSacIfexYxMS91xnJDRaawJ19y
 ShZS1IDtxbqAaO5O6wlSB5sx83LDN2xyn+YeiuS7Ip6w8H6sJFUzp7ExqhTBwwlNVSBIf
 Nj7PqhENjOt5/XUpCG1kOtEhCZJw1tzfP4l2WQtYVtuL6j2L3d7HWK1CKHIeDtua6fvPE
 5kxmLekkl4dwuAlq9RIlngfgcQYfXXFKtyAColcj5auyi+Kr37cNCFn4rpi2gZOllDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724253;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 b=BPxb47c85xS5b/VeWRhyYDndh6WC+dz8YKkW5MCETBnokzVHv9zhG+Eb/M5TyzH2/+MU
 7cnnABTNr4g7KZFKOdvPW3+eSU2/QXmn/Ce8fvRyhScqkYawPWGNiVJ/1nh0vGk+ICl6Q
 zeMResRFWIppJeZZBQO70XrufTtsquWS6MdNacPv30TlKPRv0o5wYhHCDIPU5oyb8P2Ld
 EMUlWes3VnshpUeinLSiqanT+LblaC2KujJUnToy6bMGgylorm4F/6zNOfrPgtMVR6zRV
 thLTuG3pgkZMFr5zljpInQnEuTK4fzvv/7nyCwWssVT9NM6IjK2FTC1ew94K3rq5TmQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=q2YmbgqQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=q2YmbgqQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A385406CD
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723684;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=q2YmbgqQzRbHd8wqF+4qT6mPBA+79K3KqBaPC7+4EB+VfSXGfXSmsN+CSE/cOaYaA
 +hrs8rFN9NJF+B+TRthTdi8JZAm3n5VZigTXs2JdpeoSZ62VLvnPoVIihVRBJsPOqj
 Aqd6TCFH1rlpBC07fY9vrr+ZnahRnP4ZXBSmFNBH32DdVkrpVpMAcQrHOMrdI9wEha
 Ac/Rh2K+SvZ3QeTOBXMZUs3EfZxa55pponS2xp1+1E+sEGj+2EqJHEU3Ui+7UUzZ0R
 mfmFe6BGvPHGauYVl2S/n55FhRdlRafNFH/V6G8aolrgn7XYpU0Qwdn76MLW2kTkjs
 DeYJt/cUl0noA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 aW/NkOKPLKbdvCJyB6cp4T4aoNIwxRz9dmIUzD8WuN61TEM378roQWLjRve3XSAmaZP7BlYg2Jv
 gzxS75ZuH4wj1itJ20VG6sxAPuDpL+1jFixwOWq2ghB8vZDam7rosuVjphkmWZp/AkThWMn0ZkG
 MkHwq4CZGzsaGiVD9qsVEEYQDgXGRQcY9cWkIKhtoyXV73U1uV+6Dtz0bswxUNVhgsro612hbrR
 uv6yYE9cwFUuRaFG4FMyMKtf7wYmTdI3s4TybyYu3Sk8pP/JQ/SOtjbiS5rtYI8FxMiww+oMGCI
 QgVF6295i9L9FGGptSGdCbNCGQWDzf3uMflG0yuSkF9dUD/7NgE9eBFosZGB6zdgo0SuDWmcxmK
 lG4hwfgLl7mPybgj+/Qp6+bzBafk/bZCOUrX3qQD6HEHWmUftQYkntCDMF8OYInKfoNAZ34HmjE
 yxUKHaWaOCfs73iYhKd0H2ZFl5u5JFPNjemlqh1p+KHFRSNcwLcYxVMjSfE9fzN2ftnwZ7kVqbG
 G9BBI6r32CxKErkmGC87fCKPYOsOpa/niPPQHbTee9kgELTQ21UMJwmJrxbRcIoYNB88VhhRDxJ
 P7uvZq8=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CDADCA4C58B2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAo-000000007Fz-3iM1
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:53 +0200
Message-ID: <20261011130058.3443432-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 48/52] package/kodi-vfs-*: mass version bump
 to Piers
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash               | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk                 | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash             | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index e65ba18fa5..79e861b1aa 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aab35cb6b03191609a7e97df02f2f102659c12e414f7b95595f9bb2047554daf  kodi-vfs-libarchive-21.0.2-Omega.tar.gz
+sha256  378ac05a967e80dc02d36ddcaaff97dd8324ebd58c3ca7cc82b943037dec14a4  kodi-vfs-libarchive-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index ee1ca59b52..7ee7547f2b 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = 21.0.2-Omega
+KODI_VFS_LIBARCHIVE_VERSION = 22.0.3-Piers
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index c69e57758f..eded39b35a 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7492cf73d52299218acc982c4b35b020ea801d36d47e40460341f4dde712de50  kodi-vfs-rar-21.0.2-Omega.tar.gz
+sha256  b640feaa5579afbf1ae911eeb47abed78501d2bc2bb177ecc06022da04707181  kodi-vfs-rar-22.0.5-Piers.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 7cffe1274a..cc96dab863 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 21.0.2-Omega
+KODI_VFS_RAR_VERSION = 22.0.5-Piers
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 3a59241d7b..be2471c77b 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01a23958331cb0cd78fd2e9367d1269d4319c20b84db5b132632f9c1acd5f3c5  kodi-vfs-sftp-21.0.2-Omega.tar.gz
+sha256  e0d54427f74874da2352afdea0288864dbaf8dc38ecc5bbc0b1711a129233e0c  kodi-vfs-sftp-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index 18ea2bc099..c6eb220d18 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 21.0.2-Omega
+KODI_VFS_SFTP_VERSION = 22.0.6-Piers
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
