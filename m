Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5072BC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 251E540CB9;
	Thu, 17 Jul 2025 20:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiKDTbmMGCRE; Thu, 17 Jul 2025 20:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5542240F23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5542240F23;
	Thu, 17 Jul 2025 20:22:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBA7226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03C9160ACA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPToiSuf1-gl for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 481A4607EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 481A4607EE
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4505C8632B; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 18:33:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af3bf0e15ef098faa7403e726a17eb10e61d22d4
X-Git-Newrev: 2ee70bd451e16b6a8423b9835033a61e93e18407
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.4505C8632B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libiec61850: fix
 build w/ mbedtls v3.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ee70bd451e16b6a8423b9835033a61e93e18407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since the mbedtls bump to v3.6 [1] the libiec61850 package is failling
on the autobuilder with the following error:

```
[  2%] Building C object hal/CMakeFiles/hal.dir/tls/mbedtls/tls_mbedtls.c.o
/workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c: In function 'compareCertificates':
/workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:17: error: 'mbedtls_x509_crt' has no member named 'sig'
  122 |         if (crt1->sig.len == crt2->sig.len)
      |                 ^~
/workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:34: error: 'mbedtls_x509_crt' has no member named 'sig'
  122 |         if (crt1->sig.len == crt2->sig.len)
      |                                  ^~
...
```

The logic to support mbedtls v3 is already present on the version
present in buildroot.
This patch ensures that the CMake build uses the mbedtls headers and
libraries provided by buildroot rather than the bundled copy.

By setting the following variable the mbedtls v3.6 is correctly found
during the configuration of the package.

```
Found mbedtls 3.6 -> can compile HAL with TLS 1.3 support
```

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1

Fixes: https://autobuild.buildroot.org/results/5fc/5fca384510d2fb9dd1d01736dee34b53339d62ff/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 30fc97c2c52064fa29ddd811959e630c9c655a92)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libiec61850/libiec61850.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 92b27dc5c2..2bf98f1f3d 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -15,6 +15,9 @@ LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBIEC61850_DEPENDENCIES += mbedtls
 LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=ON
+LIBIEC61850_CONF_OPTS += \
+	-DCONFIG_EXTERNAL_MBEDTLS_DYNLIB_PATH=$(STAGING_DIR)/usr/lib \
+	-DCONFIG_EXTERNAL_MBEDTLS_INCLUDE_PATH=$(STAGING_DIR)/usr/include
 else
 LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
