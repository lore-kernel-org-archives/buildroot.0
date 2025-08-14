Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474B2CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E28880D14;
	Thu, 14 Aug 2025 19:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rm-aufbKbVA; Thu, 14 Aug 2025 19:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F027480DE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F027480DE1;
	Thu, 14 Aug 2025 19:56:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD2F8228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D9F14048E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpouNMx19jFe for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E0840480
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82E0840480
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8081087407; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c2a5677a5b503b54f759d3ab5219689315bb2222
X-Git-Newrev: 6336592f8979c81d52befc295ecabad57c908845
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.8081087407@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gnutls: security
 bump to version 3.8.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6336592f8979c81d52befc295ecabad57c908845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issues:

GNUTLS-SA-2025-07-08-1 CVE-2025-32989
Severity Medium; Heap read buffer overflow

When an X.509 certificate contains an SCT (signed certificate timestamp)
extension and its length field is malformed, the library could read the memory
buffer past the boundary. The issue was reported in the issue tracker as
<https://gitlab.com/gnutls/gnutls/-/issues/1695>.

------------------------------------------------------------------------------

GNUTLS-SA-2025-07-08-2 CVE-2025-32988
Severity Low; Memory corruption on error path

When any error occurs during exporting a certificate with an otherName in the
SAN (subject alternative name) extension, the library could potentially double
free the ASN.1 structure. The issue was reported in the issue tracker as
<https://gitlab.com/gnutls/gnutls/-/issues/1694>.

------------------------------------------------------------------------------

GNUTLS-SA-2025-07-08-3 CVE-2025-32990
Severity Low; Heap write buffer overflow

When the certtool program is invoked with a template file with a number of
string pairs for a single keyword, a NULL pointer could be written past the
memory boundary. The issue was reported in the issue tracker as
<https://gitlab.com/gnutls/gnutls/-/issues/1696>.

------------------------------------------------------------------------------

GNUTLS-SA-2025-07-08-4 CVE-2025-6395
Severity Medium; Denial of service

When a TLS 1.3 handshake involves a Hello Retry Request and the second
Client Hello omits the PSK which was present in the first Client Hello,
the GnuTLS server can dereference a NULL pointer. The issue was reported
in the issue tracker as <https://gitlab.com/gnutls/gnutls/-/issues/1718>.

https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 16d4159d44b23a07e50aa458cb8b619c09f3fa1a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index dcfe201f3d..1b2a7ba9b5 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.9.tar.xz.sig
-sha256  69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed  gnutls-3.8.9.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.10.tar.xz.sig
+sha256  db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7  gnutls-3.8.10.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index e71e411cf0..7536189429 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
