Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A760C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 16:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFADF417BE;
	Wed, 22 Jun 2022 16:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFADF417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvkoEZ-IFfWE; Wed, 22 Jun 2022 16:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F984179D;
	Wed, 22 Jun 2022 16:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F984179D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A77E51BF47F
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 16:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 814C64019F
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 16:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 814C64019F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUTdRzUrzo_U for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 16:50:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D8B40012
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68D8B40012
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 16:50:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g27so17602471wrb.10
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 09:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UCWc651SQhey52mGDdCWKt46SNbmQnqMt5GZpdmDVsE=;
 b=EJ1BnuXiMtG+jah3O1q2fq+gjBZ+4lY3D/QW26JvWGc8jH9Ref+O8vieNhkPTPLO1I
 tEmTVywMkMjokhabP0AzulLNg9AirEbFiPYrmhngk0i/lYXJZpA+G/SVzGAjkclyg0wz
 Fh7nG6aoL4QYdkbTHDAwkx/yQpc6CFKfrgCyN7OCx9XYoDJ9ciVJAVDYNhT77Zy5BHNf
 uwJCJF8GSRjI7g0FaE0FCkriE3iRyEkBwPQQ+rKtBBXWST1ZdeTkth13XeIw2w6NZIoh
 ZHF46e34VOYK0igG4rL+gPu6ms1akPRk51i1I0y8T+c6+S9TVZFZG0b067Fzwm31crMF
 8RnQ==
X-Gm-Message-State: AJIora/Weq8r4zmUGnmoplve2g7DbOhg3DqwLh6pxOvM2eKAEZSo+dsD
 A20MGrt39NaAHI6sxcWNKnZeuZHVbjM=
X-Google-Smtp-Source: AGRyM1tl0A3BRy++CL2SitEwzB5C2eg5TIVa0/B7lCv68gG5XgXK+eXTUqbLl/s3DENpKLu6PkPjDg==
X-Received: by 2002:a5d:52cb:0:b0:21a:3cc5:f5f4 with SMTP id
 r11-20020a5d52cb000000b0021a3cc5f5f4mr4142874wrv.367.1655916619481; 
 Wed, 22 Jun 2022 09:50:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056000104b00b0021b9662a0c7sm5941696wrx.78.2022.06.22.09.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 09:50:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 18:47:32 +0200
Message-Id: <20220622164732.65948-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UCWc651SQhey52mGDdCWKt46SNbmQnqMt5GZpdmDVsE=;
 b=UDBZyIcQu4lFfZiQk9oa8pHC3Xd3nSnVx7ztc0YYavWWqG9WGLSADRMgqEdT12jYpM
 J7aPGsHI2MtcKOK2jlsTh2cTliVQ7J6iTShgh8vRrvhxLiv9MU6UR+lWwKMve4IgI3id
 jADvFVAnCxk9DaSF5VtlTT4RMVfaDaDgK2nM+4a/wW3zIN84YJvSeAShOgwXb9AkwPPK
 00tfRJ7OeOpdNkF6wGX4RWFJ5nfMI7vEX1NsFOd65hCHHZ5Xl6TilLvuJLhZlhViLdur
 lrhJFLabYomcNP/20OR8MD98MsN+jzI/Co2fri0NAUzsr0p7rOrEMieHTQfQVeQakmpX
 /9Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UDBZyIcQ
Subject: [Buildroot] [PATCH 1/1] package/libnetfilter_cttimeout: bump to
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
 .../libnetfilter_cttimeout/0001-uclinux.patch | 26 -------------------
 .../libnetfilter_cttimeout.hash               |  7 +++--
 .../libnetfilter_cttimeout.mk                 |  3 +--
 3 files changed, 4 insertions(+), 32 deletions(-)
 delete mode 100644 package/libnetfilter_cttimeout/0001-uclinux.patch

diff --git a/package/libnetfilter_cttimeout/0001-uclinux.patch b/package/libnetfilter_cttimeout/0001-uclinux.patch
deleted file mode 100644
index 5d462d8fec..0000000000
--- a/package/libnetfilter_cttimeout/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d8d2ec14bc192f998afae2b71c69248e73518ddf Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 16:09:14 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d79e941..aeb6ad0 100644
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
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash
index af5a281e4d..81d54dd645 100644
--- a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash
+++ b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash
@@ -1,6 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_cttimeout/libnetfilter_cttimeout-1.0.0.tar.bz2.{md5sum,sha1sum}
-md5	7697437fc9ebb6f6b83df56a633db7f9	libnetfilter_cttimeout-1.0.0.tar.bz2
-sha1	24cba24b0371e80007be4ea0fa9d872df63b8a7a	libnetfilter_cttimeout-1.0.0.tar.bz2
+# From http://ftp.netfilter.org/pub/libnetfilter_cttimeout/libnetfilter_cttimeout-1.0.1.tar.bz2.sha256sum
+sha256  0b59da2f3204e1c80cb85d1f6d72285fc07b01a2f5678abf5dccfbbefd650325  libnetfilter_cttimeout-1.0.1.tar.bz2
 
 # Hash for license file:
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
index f5c5067b64..dcdf34c71e 100644
--- a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBNETFILTER_CTTIMEOUT_VERSION = 1.0.0
+LIBNETFILTER_CTTIMEOUT_VERSION = 1.0.1
 LIBNETFILTER_CTTIMEOUT_SOURCE = libnetfilter_cttimeout-$(LIBNETFILTER_CTTIMEOUT_VERSION).tar.bz2
 LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_cttimeout/files
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
 LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
-LIBNETFILTER_CTTIMEOUT_AUTORECONF = YES
 LIBNETFILTER_CTTIMEOUT_LICENSE = GPL-2.0+
 LIBNETFILTER_CTTIMEOUT_LICENSE_FILES = COPYING
 LIBNETFILTER_CTTIMEOUT_CPE_ID_VENDOR = netfilter
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
