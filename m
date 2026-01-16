Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAE3C982D1
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 16:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61625833D3;
	Fri, 16 Jan 2026 16:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTjf0IzvdSWv; Fri, 16 Jan 2026 16:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F1F6833AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768581347;
	bh=iEnra+YRpIUUTeqYg7JKv0A+kyoM3PGTKtwDoAIuwcE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dzPhbqeyepGbXC/VId2ljfoFKOCnEXgTL171BVf7Opia5huA4iO51RBsNRixqCVPQ
	 N7zSPtQBDTJa6MJlz2BkWgxJgX5U0ruOPCn05lc0+Chi5C4yuLCdxYdYYrUWRnY8pt
	 ICijALYlWOpCMfqrWiQblXcOFyju/+zWxVgWABdFgLS0rU+MRsWKoDRkq+DS1l4s7Q
	 FzoNtZpQcsGmxE/HuIhuX73U2YJ3rLwQWpUv82jb5JNltvdj5HUzfjcxQ/N8B/A/l0
	 okhHOKYCNaddn/JA7AQn6a6oXdwJflGlbXsLHs/wk6OeBMlbDr7BL1ZWmI15jVqnxE
	 xjsT2onm54Mww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1F6833AF;
	Fri, 16 Jan 2026 16:35:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 706E8223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 16:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6113160837
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 16:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6tuBQH1fR6X for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 16:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBDB060835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBDB060835
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBDB060835
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 16:35:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0BAB631E059B; Fri, 16 Jan 2026 17:35:35 +0100 (CET)
Date: Fri, 16 Jan 2026 17:35:35 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aWpo1wBWy1lQh61V@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.57+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1768581336; bh=ytcWzcMjzcB7ulUUZyLgxyGOG3ZFpgu9/9niWRZ/TFw=;
 h=Date:From:To:Subject:From;
 b=jroG2qjCib+ymSMSbRk4GNqLJCEEHcvlCOXfOH8QzxjGdvWmLs/lHJvjWTN+XRpNn
 Az5Kdk+qwrOjUgeDABhC9H+tXTdwmgz4SLGeKZ4Cz0WmdftGmGaMn79KgGGgPOhEKb
 013O77DDhD4lN13DmQGeUnFxqDpLPslHwyiwb6uQ52tQjPSc2m8bCmXu1LYaSlSkg3
 Q2rm9t6WkddgBak2XKwypDthwQhZ/E5ZMVBEWTbGs1TzpuZBg5egBAMUXTMOpoYCGt
 sraWwhLcG6gv2OcRk83QusWfA9Tbwo4A/V8Yv++pB6T8TB0m5exIleFikZngI8CUtm
 4weORgfJzeaEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=jroG2qjC
Subject: [Buildroot] [PATCH] package/nginx: security bump to 1.28.1
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
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
