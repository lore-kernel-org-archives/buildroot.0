Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB31C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 15:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86FD981C81;
	Sun, 19 Feb 2023 15:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86FD981C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Akx8iXFArSfX; Sun, 19 Feb 2023 15:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9A7F81C56;
	Sun, 19 Feb 2023 15:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A7F81C56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7B1A1BF426
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E21160BFC
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E21160BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1PkLNE6AEvi for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 15:04:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5126A60BF0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5126A60BF0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 15:04:41 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.20.96])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8508119F593;
 Sun, 19 Feb 2023 16:04:35 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 16:04:26 +0100
Message-Id: <20230219150426.1509780-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676819078;
 bh=LZQWAd6eJWAA4fCLV+lu3XKWgOpotbQwXsLJUcDWKyo=;
 h=From:To:Cc:Subject:Date:From;
 b=huY498vk9QzCu3z2w47tAfoEsYStwgENiYIvT1TemvTvUxvaJ42tyhZ9v92qFqo+L
 NmjhhC3qP18Ic/DF9AzUSGUv3Mx5mM547IfDq86jnUZ6t/Ye/BA1FQmJsYgHXk776B
 EGEt4aOw7ZYuLUtE0ahLI1a5I8vR+byrmo4Xbh/s5cM9iTWJRGKS9P5++uk85G5i9s
 joNQmYZNtZ4xtc+aCMC+NZlKJQnDNAjtkMIesI/D2TLkHCaDx/BdsFEkmMWIcU94Mj
 Lsk1KtctU0S9SqJNF9v1+Jwkjoy5O5w3F5+1rCsWErbJnjp3h8zxg/HQxlvTEna61N
 zCw9MOuVMD+7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=huY498vk
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: fix build failure when host
 provides an old gpgrt-config
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
Cc: Julien Olivain <ju.o@free.fr>, Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gnupg2 uses the libgpg-error library. The libgpg-error library has a
long plan to be renamed to "gpgrt" (see [1]). For the transition, it
provides two configuration scripts "gpg-error-config" (the old,
original one, kept for compatibility) and "gpgrt-config" (which is
meant to be the replacement). When both are detected, "gpgrt-config"
should be preferred.

gnupg2 configure script searches for "gpg-error-config" in the path
provided to --with-libgpg-error-prefix=PFX (more specifically, in
"PFX/bin").

The logic to find "gpgrt-config" is different: it is searched in
paths "$prefix/bin:$PATH". See [2]. On Buildroot, autotools target
packages are configured with "--prefix=/usr", which makes the
configure script to search in the host "/usr/bin".

In some host environment providing such a "/usr/bin/gpgrt-config"
script of an older version, host compilation flags are incorrectly
added for the target, which leads to compilation failures.

The issue can be reproduced in a Buildroot Docker image from [3] in
which the libgpg-error-dev package is added. When tested, the
libgpg-error-dev package was at version 1.38.

In that configuration, gnupg2 configure will output the message:

    checking for gpgrt-config... /usr/bin/gpgrt-config

and the compilation fails with a message:

    aarch64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

Note: it was observed that in some other configurations in which the
host /usr/bin/gpgrt-config was from libgpg-error version 1.46, the
host script was redirecting correctly in the buildroot sysroot.

Since gnupg2 searches for "gpgrt-config" with a
"AC_PATH_PROG(GPGRT_CONFIG, ...)" macro, this patch fixes this
issue by simply forcing the script path in the GPGRT_CONFIG
environment variable.

See also [4] which discussed the "gpgrt-config" search logic.

Fixes:
- http://autobuild.buildroot.net/results/423c3ce7317c181e9f2e4a49b76ee9d26167375c/
(and many others)

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=README;h=e0b9f16445a96942af0839bcdb9a0b0f8cf31380;hb=885a287a57cf060b4c5b441822c09d23b8dee2bd#l29
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=blob;f=m4/gpg-error.m4;h=a975e53d07d1b743f51d8aa1767cd8e0d71b4071;hb=c0556edb80518720b0d884251685fe008c8f0429#l68
[3] https://git.buildroot.org/buildroot/tree/support/docker/Dockerfile?id=b6085c00d0feece6f3ba635e7847ea653bc5fac3
[4] https://dev.gnupg.org/T5365

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on master branch at commit b6085c0 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_gnupg2
    ...
    OK

    utils/docker-run support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_gnupg2
    ...
    OK

    utils/test-pkg -p gnupg2
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/gnupg2/gnupg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5935ce6939..73de185ba7 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -23,6 +23,10 @@ GNUPG2_CONF_OPTS = \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-npth-prefix=$(STAGING_DIR)/usr
 
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+GNUPG2_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV),y)
 define GNUPG2_REMOVE_GPGV
 	rm -f $(TARGET_DIR)/usr/bin/gpgv
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
