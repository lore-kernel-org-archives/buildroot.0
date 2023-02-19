Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39388C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6DA7026E;
	Tue, 21 Feb 2023 02:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB6DA7026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxqMuQQ9yQVk; Tue, 21 Feb 2023 02:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D0070238;
	Tue, 21 Feb 2023 02:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D0070238
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93E8B1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F4A7000E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F4A7000E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdJsFTgTw7Ju for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB1E57002F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1E57002F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6629828C8; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 21:55:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99d5f1f7d3cd4b1f2041edbddd5d09caacf4848d
X-Git-Newrev: d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.C6629828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnupg2: fix build
 failure when host provides an old gpgrt-config
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
