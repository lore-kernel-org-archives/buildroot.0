Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA916C982D1
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 16:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FAF83896;
	Fri, 16 Jan 2026 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqsZKK7utzOI; Fri, 16 Jan 2026 16:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0CAE838AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768581819;
	bh=gA+qcgDpHLChYevNbp2Ujz0/eWlVjpP++8UzqzzKib4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FEv0BYSXrKLdx2AYg2jYQ8hkQ1Oc2akBPQrDW8OisiZZ88/cyUKWSkJ3cPplQJ3Qj
	 ZNwqCBJQvq43vZyjBNLG7xHkLPizVOe0uqh9kd4KrZ9N5sa/oZDGnwuCnCva2FYyLL
	 OjVREcVqjiC8EJJkwVEinfbXZ2j+p4Vd15qvU0BKci6cdee1NqwJJoU3erfOWlE5G1
	 jNhx4LZd7vo498CkAc6j59yczlefFU/iVK6F3QKZFAGYBUa9q4D9ZDkDd28Lh7Zoyv
	 AoZtyXqLdneaz+tLwT58wo5KnBJ+++akLCs0s7QKXlcVJGD2VJcB5ee5VmDg/5u344
	 qIOSIJ5w+xRgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0CAE838AC;
	Fri, 16 Jan 2026 16:43:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CCF3223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC6D40A7D
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 16:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zct14X0QO5XX for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 16:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BC8340741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC8340741
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BC8340741
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 16:43:37 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AB84F31E09EE; Fri, 16 Jan 2026 17:43:34 +0100 (CET)
Date: Fri, 16 Jan 2026 17:43:34 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aWpqtkIY1vt9B4w5@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.57+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1768581814; bh=MKKs331bRc8q0YrNGQ6z1/V4CUhwJvjJELaBdFD8EVM=;
 h=Date:From:To:Subject:From;
 b=aJXZHVTEkY+kqC/VVdd+lw2K8ZFEty20xdLSOeTOgo88uRed7eqiSJPgfDVPu5qfG
 qlScMg79VsDGS6nQ73JtjDRJix1pZBBlSEJ1FD6Q7OMc5zAcQbsXmjj67WCydbiuim
 zo1cujuQraz04Illimefds0aBKw+Jg/KY4VyeuIz0ucT38WdLlgkR/OdYboY4Sk/nA
 rkRwkb+G28S0efkrudvDsZ73+HMVNMs6DER5hviBmiSud8f++SL8JaJA1AEu+2kU67
 +luASgzxshDnYGeJRHG2R7qaxhekdzbTbK1cpEYwpfDqG0bEpboJ2cWevWKoFcUfbc
 12E8MUITwDcfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=aJXZHVTE
Subject: [Buildroot] [PATCH v2] package/nginx: security bump to 1.28.1
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

See here for changes:
https://nginx.org/en/CHANGES-1.28

Following security related issues are fixed:
    *) Security: processing of a specially crafted login/password when using
       the "none" authentication method in the ngx_mail_smtp_module might
       cause worker process memory disclosure to the authentication server
       (CVE-2025-53859).
    *) Security: insufficient check in virtual servers handling with TLSv1.3
       SNI allowed to reuse SSL sessions in a different virtual server, to
       bypass client SSL certificates verification (CVE-2025-23419).
    *) Security: processing of a specially crafted mp4 file by the
       ngx_http_mp4_module might cause a worker process crash
       (CVE-2024-7347).
       Thanks to Nils Bars.
    *) Security: when using HTTP/3, processing of a specially crafted QUIC
       session might cause a worker process crash, worker process memory
       disclosure on systems with MTU larger than 4096 bytes, or might have
       potential other impact (CVE-2024-32760, CVE-2024-31079,
       CVE-2024-35200, CVE-2024-34161).
       Thanks to Nils Bars of CISPA.

Update patch 0007, which does not apply cleanly.
License file was changed, year was bumped to 2025.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - forgot to mention license file update
---
 ...nix-ngx_linux_config.h-only-include-dlfcn.h-.patch | 11 ++++-------
 package/nginx/nginx.hash                              |  4 ++--
 package/nginx/nginx.mk                                |  2 +-
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
index c10fcd11c9..4656634bd3 100644
--- a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
+++ b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
@@ -10,11 +10,11 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/src/os/unix/ngx_linux_config.h b/src/os/unix/ngx_linux_config.h
-index 2f6129d..4244086 100644
+index d99358c93..612935524 100644
 --- a/src/os/unix/ngx_linux_config.h
 +++ b/src/os/unix/ngx_linux_config.h
-@@ -55,10 +55,12 @@
- #include <crypt.h>
+@@ -54,10 +54,12 @@
+ #include <sys/ioctl.h>
  #include <sys/utsname.h>        /* uname() */
  
 -#include <dlfcn.h>
@@ -27,7 +27,4 @@ index 2f6129d..4244086 100644
 +#endif
  
  
- #if (NGX_HAVE_POSIX_SEM)
--- 
-2.8.2
-
+ #if (NGX_HAVE_CRYPT_H)
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 77220665f3..7b79036b20 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa  nginx-1.26.3.tar.gz
+sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
 # License files, locally calculated
-sha256  f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9  LICENSE
+sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6ca1ac2075..41490caee2 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.26.3
+NGINX_VERSION = 1.28.1
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
