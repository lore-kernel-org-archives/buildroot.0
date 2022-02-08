Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3E3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1827D60F27;
	Tue,  8 Feb 2022 20:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ji1hGdiZ0xbr; Tue,  8 Feb 2022 20:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DF4660F28;
	Tue,  8 Feb 2022 20:52:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1491BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5408D410D2
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhCKwaU9YFN1 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:52:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62E8F410D0
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:52:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s18so509672wrv.7
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 12:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/MhCfBBg6Ya6/uOQ/uAGq8U9NjCHQkMQ88vhyGnzODk=;
 b=lK6glrARD5gfI5MmbhyrtgJhYoHbOgzE3Mp2xINsaYxocfqj56jInKTvmaiVV4huON
 96ejEmX3X3mudSWA0a5y4bONCcrs7Z9uj5lJZ2gam+8tcZOi3xsdGqdoB1+KJ5RJgGWP
 QroZ6fE5vs0NaO8G8+7Sbu0p/Brk/PYfJmTG6dPddl7o+oOtiJoWGGlW0lINwLCN3N1H
 Xk0f/O8r9Tdy3CSv4/DwoSIMEhAE6awsecdab0r6HfZMtMBV896gVFv4XruM5uMvm0ij
 ValAg34EKzu1t8QYK3Q5dE/5HJFzTpIOG+GQm2p5YWQDwBBTA1JTaex4QITWV/FpGmI7
 g3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/MhCfBBg6Ya6/uOQ/uAGq8U9NjCHQkMQ88vhyGnzODk=;
 b=GkOPDe9VuY2jyfz4ZStmo+oF1+hWNizHBaEK5HrM325tpFDLT5BMoP/2r1wEQjsKag
 PclqoYoyWx4W6yrTI92MqKl7EMj3gIIofhMsBivyZPUCyaPuaqxIoJuTxZdNEluRdxnd
 EozITHETycLZbSammZqpNNzJfS1JfxXPJYtYbn9UGPt+BTSdNiyCm9EU5CepIRGNa3lW
 dspppLuZjPL0mb1CHIhsIL4QVcgaxLklZh7B7f5TBUqXNpRE67GIzWB6ZCQmzjhiMQhd
 dBRWRQBfdHA+v0g3WPZlXVZYS+pKB1jveef2+5iTU1vfndk34gDOyay3Os5UqPXYx+bL
 3vbQ==
X-Gm-Message-State: AOAM532lSR7uSKriJV3HYjO6tOp2vInHiYqUvV+BhKaACjhHHmW9gr8M
 4MCsJsAPl7qPSUYksAOlHbZZYpCPAUs=
X-Google-Smtp-Source: ABdhPJxEiHsmHCgKeYL/BsZTWYsE0EY8KnO31zpGc68nXiue4sUwP7tZ7v2XVhE2EvTTjspOP+8Byw==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr5069177wrb.31.1644353531317;
 Tue, 08 Feb 2022 12:52:11 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id z17sm3043172wml.38.2022.02.08.12.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:52:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 21:52:32 +0100
Message-Id: <20220208205232.16362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sudo: drop openssl workaround
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

Drop workaround added by commit bf899e50d89439b1a1bdf22bc933075958ffc108
because sudo natively supports pkg-config for searching openssl (which
is enabled by default) since version 1.9.2 and
https://github.com/sudo-project/sudo/commit/4cadd549513ef35d4d740e941576294f4491d13d

As a side-effect, this will fix the following build failure when openssl
is not installed on host (as LIBS is set before AX_PROG_CC_FOR_BUILD):

configure:8162: checking whether the C compiler works
configure:8184: /usr/bin/gcc -O2 -I/home/buildroot/autobuild/instance-2/output-1/host/include -I/home/buildroot/autobuild/instance-2/output-1/host/include -L/home/buildroot/autobuild/instance-2/output-1/host/lib -Wl,-rpath,/home/buildroot/autobuild/instance-2/output-1/host/lib conftest.c -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -pthread -latomic -lcrypto -pthread -latomic  >&5
/usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a when searching for -lssl
/usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a when searching for -lssl
/usr/bin/ld: cannot find -lssl

Fixes:
 - http://autobuild.buildroot.org/results/7a5d4dd22343be46a5ddd1c1a1a8e1799517d564

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sudo/sudo.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f2c074e55f..a752217123 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -45,17 +45,17 @@ endif
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 SUDO_DEPENDENCIES += openldap
 SUDO_CONF_OPTS += --with-ldap
-# If we are building sudo statically and openldap was linked with openssl, then
-# when we link sudo with openldap we need to specify the openssl libs, otherwise
-# it will fail with "undefined reference" errors.
-ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_OPENSSL),yy)
-SUDO_DEPENDENCIES += host-pkgconf
-SUDO_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
-endif
 else
 SUDO_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SUDO_DEPENDENCIES += host-pkgconf openssl
+SUDO_CONF_OPTS += --enable-openssl
+else
+SUDO_CONF_OPTS += --disable-openssl
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
