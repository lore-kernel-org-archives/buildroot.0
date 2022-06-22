Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73950C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 16:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99DB94176D;
	Wed, 22 Jun 2022 16:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99DB94176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBTVWtFa2EDW; Wed, 22 Jun 2022 16:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4289141763;
	Wed, 22 Jun 2022 16:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4289141763
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9081BF47F
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 16:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24CC960AC3
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 16:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24CC960AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4jsT7AQ0u8A for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 16:44:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8663060758
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8663060758
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 16:44:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n1so23988577wrg.12
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 09:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LS1ysRy0y66CVMrJOoZK/btJ5Y46t1GG3Xq7GYvLk1k=;
 b=V5GC7/6JCYmPnDvNLjvzlUdRGYphkkQwo4b/IpO9BjOizlc+HgFMcgnMlu60suEedr
 UFHmefXwarWDJXAt05YWHg6CX49R4EzdvrELPVMac5vdjTl6j/zbkxBb03Qq7iFaih9l
 hcLD7z1T7jaQELoQe7wQUH1prVzd/VmPlMJcHwTA4RbSse4/Jbbf/PKr8gFQRDLjbX0G
 l+cjPZDv72tKLPIbOsPUAaQP0SkGo1rMQ4uaHpYMuYa26qyfdTykzSV9gPN7zfSV6XaK
 yPZwDUEToJ21AXJgiCzAlwFTLmrJ2zeuHtoMsNYTCTpEyK6BEc6nji0Q7HOkNj8qRnBF
 lgOQ==
X-Gm-Message-State: AJIora+68l6SzZW4gZrI1pfyaFpXcPU2nHx0Lohd3CknmMw8RlUEXNdb
 8QN8y81clSW9OA4JGqqCxOZvuwtMTG8=
X-Google-Smtp-Source: AGRyM1va31IRdmjX9YMofKzQ5kCfNjrfuEn1IAKvV08aTrjO1Ji76jbRYx3E52v4UZaor/+LM6OCIA==
X-Received: by 2002:a05:6000:1f87:b0:21b:970b:e88c with SMTP id
 bw7-20020a0560001f8700b0021b970be88cmr4246183wrb.320.1655916292445; 
 Wed, 22 Jun 2022 09:44:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u25-20020adfa199000000b002184a3a3641sm20408408wru.100.2022.06.22.09.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 09:44:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 18:41:28 +0200
Message-Id: <20220622164128.61528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LS1ysRy0y66CVMrJOoZK/btJ5Y46t1GG3Xq7GYvLk1k=;
 b=cQidwOmOqgSD2tlc70s2KHeNfXAqk/7FYLVsjrkO9dNdGGAJzQ8jzAHgB+vKCbMjhR
 BvjYADtTH177wmKLgBVwvA1N/75vpE0D7ZNe2RXoNuot8ho6GsRVM/owzVV1j46CBpJ/
 hYRmvCiEOH4QzJgnkHQyrU76P3kqDcthd/voG50pr0MwnnACo6OF5pvwXQR1/s/8fr9P
 I0kF9O+OiSklgnCP1EqgGplQ7OSwbu3hBp33jnPpQ+GIMqcAJy68vGMcXWE2hXgrFW3D
 FnxsPgQZ91QhMrxSijONi0Tdnqkh6hWNGp9REsC+FWD3pacFvtwEKdqC6QnNhcP4vxcf
 ibIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cQidwOmO
Subject: [Buildroot] [PATCH 1/1] package/libnetfilter_cthelper: bump to
 version 1.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version) and so also drop autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libnetfilter_cthelper/0001-uclinux.patch  | 26 -------------------
 .../libnetfilter_cthelper.hash                |  7 +++--
 .../libnetfilter_cthelper.mk                  |  3 +--
 3 files changed, 4 insertions(+), 32 deletions(-)
 delete mode 100644 package/libnetfilter_cthelper/0001-uclinux.patch

diff --git a/package/libnetfilter_cthelper/0001-uclinux.patch b/package/libnetfilter_cthelper/0001-uclinux.patch
deleted file mode 100644
index 7a6ca70b53..0000000000
--- a/package/libnetfilter_cthelper/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d028334281b218209412ec6e1dba56ca96320bd9 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 16:08:29 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d52b1ce..9389b70 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,7 +22,7 @@ AC_DISABLE_STATIC
- LT_INIT
- CHECK_GCC_FVISIBILITY
- case "$host" in
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.hash b/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
index 42deade7dd..f390bf4936 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
@@ -1,6 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_cthelper/libnetfilter_cthelper-1.0.0.tar.bz2.{md5sum,sha1sum}
-md5	b2efab1a3a198a5add448960ba011acd	libnetfilter_cthelper-1.0.0.tar.bz2
-sha1	5d0a82794bd46aafde20c16800edca23d563de66	libnetfilter_cthelper-1.0.0.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libnetfilter_cthelper/libnetfilter_cthelper-1.0.1.tar.bz2.sha256sum
+sha256  14073d5487233897355d3ff04ddc1c8d03cc5ba8d2356236aa88161a9f2dc912  libnetfilter_cthelper-1.0.1.tar.bz2
 
 # Hash for license file:
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
index d74ea4d0fd..e0bbbab833 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBNETFILTER_CTHELPER_VERSION = 1.0.0
+LIBNETFILTER_CTHELPER_VERSION = 1.0.1
 LIBNETFILTER_CTHELPER_SOURCE = libnetfilter_cthelper-$(LIBNETFILTER_CTHELPER_VERSION).tar.bz2
 LIBNETFILTER_CTHELPER_SITE = http://www.netfilter.org/projects/libnetfilter_cthelper/files
 LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
 LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
-LIBNETFILTER_CTHELPER_AUTORECONF = YES
 LIBNETFILTER_CTHELPER_LICENSE = GPL-2.0+
 LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
 LIBNETFILTER_CTHELPER_CPE_ID_VENDOR = netfilter
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
