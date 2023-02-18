Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D613C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 10:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D334840985;
	Sat, 18 Feb 2023 10:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D334840985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zw5ZnlGGqfJL; Sat, 18 Feb 2023 10:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4777B40940;
	Sat, 18 Feb 2023 10:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4777B40940
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93DBB1BF5DB
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 754D2400E7
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 754D2400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCwP7wq_rFzU for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 10:14:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24CD640441
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24CD640441
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 10:14:35 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 w9-20020a17090a028900b00236679bc70cso1214361pja.4
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 02:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=50MU0xQiF6E+Oqqv0C1KSLjXSuaOlKNwLI+8XSC+E8Q=;
 b=FIXwK/00/lKAFcT6I0+SV4o1iY+MjXahDeRl1ufDL46IVxT+wAl3OrhNxSHPBJm3rd
 /tXAhVRVErmFYpad9C/awU3E9VYDBROvAPnbzIwbDYII00H69ekPX2MvRVWwxAbZCYxp
 BAUfaXeRF8YeVaSzkrTOEoZWYzJfCOXF1nvjiyZGw81W9cTwlNUZcOs4mArlt4p74kj6
 qAL44EwfHoedBuGUNX+ylQgYyb9e176j+c5/TmRNBzKU5nOe10Yw76SVNelZumUgornR
 UyFZHTLv5HVkbVI5VfmM4Mslf2WjI4Oa67ilbl5kOu1TSKoKDtJfQzaIjGR9dhxuq+Ee
 yznQ==
X-Gm-Message-State: AO0yUKXHxRiuFYMc+ZJp2zouz0Ex0AmVRdysw+bEX2atpKCE9jBhWZqn
 J9F4QYb//VfZ+B8mfz1F4LQD/blXHJ0=
X-Google-Smtp-Source: AK7set9aG/xBIpcikfUH93aH8Mhn8JPnNHcjXTk6T5FnlA8sTqLyUAttBsbfXfPUhO4KdIeMTgkorQ==
X-Received: by 2002:a17:90a:1de:b0:233:fa78:7c9e with SMTP id
 30-20020a17090a01de00b00233fa787c9emr4523330pjd.12.1676715274355; 
 Sat, 18 Feb 2023 02:14:34 -0800 (PST)
Received: from debian.. (subs28-116-206-12-56.three.co.id. [116.206.12.56])
 by smtp.gmail.com with ESMTPSA id
 cl1-20020a17090af68100b00233567a978csm1166646pjb.42.2023.02.18.02.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 02:14:34 -0800 (PST)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot <buildroot@buildroot.org>
Date: Sat, 18 Feb 2023 17:14:26 +0700
Message-Id: <20230218101426.630874-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=50MU0xQiF6E+Oqqv0C1KSLjXSuaOlKNwLI+8XSC+E8Q=;
 b=D27/o6iVuq/P3i7bbCHwrzeD+mNhT+RBi6fl2qtUkUbZ6289Go1svJ1CoQF8Sd9iTX
 1eya9aKvIFVMh1Wznme/X/qJgjaky6zQhQfLVJB9cippo0iyJJ7t3B/SGpyir/KCHdbO
 wi5DLCVnYtJXrQNmTwoqeAWbU7+CABp2KIY0tCqzrheVK6Wyce4FxEH0ooAB6qDmzSJh
 9Re+aBSd+5ZFNSVE9SiuMvEZC+5RIlYkeHIMG3JVD8l9oMha/C9TDIvabUep5CTK3fTl
 7YvsRJ+MGenZAWAECokTEG8smJx18peYDbvEzuRa/kzT/n2szbbtiPjNA1S2RMr+PDQx
 dGWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D27/o6iV
Subject: [Buildroot] [PATCH] Revert "package/gnupg2: bump to version 2.4.0"
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumping the package version to 2.4.0, it fails to cross-compile with
unsafe cross-compile paths (for example recent build log at [1]):

make[4]: Entering directory '/home/thomas/autobuild/instance-3/output-1/build/gnupg2-2.4.0/common'
/home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o t-stringhelp.o t-stringhelp.c
/home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=1 -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o libcommon_a-i18n.o `test -f 'i18
 n.c' || echo './'`i18n.c
/home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=1 -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o libcommon_a-mapstrings.o `test -
 f 'mapstrings.c' || echo './'`mapstrings.c
/home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=1 -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o libcommon_a-stringhelp.o `test -
 f 'stringhelp.c' || echo './'`stringhelp.c
aarch64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
make[4]: *** [Makefile:1283: t-stringhelp.o] Error 1

Revert the bump for now until the issue can be fixed upstream.

[1]: http://autobuild.buildroot.net/results/5bf00af86da6e41d1a48abc7304bf339908a0150/build-end.log

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/gnupg2/0001-ks_ldap_free_state.patch | 21 ++++++++++++++++++++
 package/gnupg2/gnupg2.hash                   | 10 +++++-----
 package/gnupg2/gnupg2.mk                     |  2 +-
 3 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 package/gnupg2/0001-ks_ldap_free_state.patch

diff --git a/package/gnupg2/0001-ks_ldap_free_state.patch b/package/gnupg2/0001-ks_ldap_free_state.patch
new file mode 100644
index 0000000000..fa55d27c04
--- /dev/null
+++ b/package/gnupg2/0001-ks_ldap_free_state.patch
@@ -0,0 +1,21 @@
+
+Fix undefined reference to `ks_ldap_free_state' if OpenLDAP is not
+installed
+
+Backported from: 7011286ce6e1fb56c2989fdafbd11b931c489faa
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+--- a/dirmngr/server.c
++++ b/dirmngr/server.c
+@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
+                ctrl->refcount);
+   else
+     {
++#if USE_LDAP
+       ks_ldap_free_state (ctrl->ks_get_state);
+       ctrl->ks_get_state = NULL;
++#endif
+       release_ctrl_ocsp_certs (ctrl);
+       xfree (ctrl->server_local);
+       dirmngr_deinit_default_ctrl (ctrl);
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index c642862fe2..f9c071ad45 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html
-sha1  63dde155a8df0d5e1987efa5fc17438beca83ac1  gnupg-2.4.0.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000476.html
+sha1  1f31b7b4c9c9adad97f94ea3acf1aa64c0424bcc  gnupg-2.3.8.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2.sig
-# using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483  gnupg-2.4.0.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA and AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD
+sha256  540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed  gnupg-2.3.8.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5935ce6939..9dc29ca99e 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.0
+GNUPG2_VERSION = 2.3.8
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+

base-commit: d00e437922fb1b611f35c3138b9fbf7bcff62757
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
