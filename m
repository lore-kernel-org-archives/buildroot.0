Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C9CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF282833DB;
	Sat, 26 Feb 2022 10:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDCR05vjmUBD; Sat, 26 Feb 2022 10:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED1738315C;
	Sat, 26 Feb 2022 10:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D33C81BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D031460A8D
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHgbroBf-8ls for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:34:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EACC960808
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:34:16 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s1so7977190wrg.10
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 02:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XpCnCiun5hiO5Xk1SOX37CFKQ5Cwjai78UdvXtRULQo=;
 b=a6IWaDVK6B3UuLgZF3eWlQU5E8y4imzzKYSioq9A86qvMNG2Lh1wAFddZo8sydZviP
 AyeF2eieczSRm9bux2sbJP04yeRIltIlTj0YcBRoE3ExoE+4iknR7fqYDtkMGdpM00A9
 hCr6OHbwBaqcN28Vnijj/1I0N/1ZTiQEfacc/GwzVc538BLYDOSgOYqyySlXGcRZ7ami
 17qFOkq+H3czO89notAMt2R5oo5l9YW8YtqpAcSVzRDLzAFnptu9rZsRLKrRpIOrZC3y
 LdjCuXibYZN5OSawLO07hEsMOnXHWbkHc/X1x10q4N3XCbWx0zsPGlvvkyggfQhLimfH
 260A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XpCnCiun5hiO5Xk1SOX37CFKQ5Cwjai78UdvXtRULQo=;
 b=eV5sVtZjTOWjcf1Pv2m5KF3jPZZfrZjrG85sZFmWkOCoh0LdOMWI4qoj4nuWWEtjuP
 wU/MjcDpaKOC8JCZZvanfmOSdKDhuKq8Q+JxV7ldmygBtOR5Nqqwi5X+zgGI5T6fwcLt
 aH2SK5fi2K0i3wqs5XwO8vV7AJItnr1NVhwJrz2SaCeRpNx/rSGbZDSH37rFVibuA85D
 u5DyWFw9CjyKqagDJgqrVw8Eze9fWKsC45tSKNd78FYLDyi2caUMZIDfPZmWOmJIRbys
 wyZ6EpVEb+tMIjcJ9lDF7UJ3tgESVQxBYL0aqd8W1BgmsE6U7z7xzmMoiPHfMhsAvdFE
 2W7A==
X-Gm-Message-State: AOAM5333eoFUDB3TgLB4SI8GzmvHWFkvne3n5c6vZ2/y9wRpyIVAHAgd
 5BmR+myOthTDxR+gEgijJn9jhH9oEn8=
X-Google-Smtp-Source: ABdhPJxJQDzFd40+cUs3GoAYWnwBGCi8sqtj/G7dTTt4BhkO9z9ffBrhZo7RDZz06p4D6hlPA8NWWw==
X-Received: by 2002:a5d:6d4c:0:b0:1e6:335f:6b65 with SMTP id
 k12-20020a5d6d4c000000b001e6335f6b65mr9448015wri.371.1645871654744; 
 Sat, 26 Feb 2022 02:34:14 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a7bc84e000000b0038100c9a593sm10771667wml.45.2022.02.26.02.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 02:34:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 11:33:44 +0100
Message-Id: <20220226103344.1850433-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libtorrent: fix build with
 libexecinfo
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

Fix the folllowing build failure on rtorrent raised on uclibc and musl
since the addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/libtorrent.so: undefined reference to `backtrace_symbols'

Fixes:
 - http://autobuild.buildroot.org/results/6cb4ba56fc0a3a8bd02b246ab9bc82edaa552ad9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent/libtorrent.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index c8310cab65..b966a72788 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -14,6 +14,11 @@ LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_LICENSE = GPL-2.0
 LIBTORRENT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+LIBTORRENT_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+LIBTORRENT_DEPENDENCIES += libexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBTORRENT_CONF_OPTS += --enable-openssl
 LIBTORRENT_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
