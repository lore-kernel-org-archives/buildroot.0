Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C4CCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 23:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20FFE40750;
	Mon,  1 Apr 2024 23:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPbXNnRvVQSi; Mon,  1 Apr 2024 23:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4385340772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4385340772;
	Mon,  1 Apr 2024 23:40:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6231BF2F0
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 23:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A91381EF2
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 23:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK_pxV-ydxph for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 23:40:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 240CE81EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 240CE81EF0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 240CE81EF0
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 23:40:18 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7d0c3f6fbacso65355739f.2
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 16:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712014818; x=1712619618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jc414XfCq2mA8u+B0BuNIrbq1ll/Sva/sU+qqnqjNsM=;
 b=IiSx+xtCanjZOEryq1Br4DP8CXW/oEYAxRKS9fyOL2Ez7Mwc87FY0DxfCSquXo5MTW
 VraPW92QXLjJYUs+bMYosbHq6nzeZ6+PV66g1K52bU51InvxPboDN35z6WPK5caOEk28
 1t5LscP+FSo0gsb1WIjywxETutVJT8pBrxcewTF1QvH72AR7kB82iBZbQ9VngGYKvQyX
 W5iHG2yVEIl7kX94wm268p/9daDGbBnjlKr/dbdJyHvwnma9RAfdPFnQpxeduheQOGBx
 d51OcLQKiU98VVu2DSsy2Cy3z1YdyvfuRzY/lvz5dnM21/ia9aY/mjGy2lT45M3sP7I7
 mPfw==
X-Gm-Message-State: AOJu0YwG7G/m7ENlgOd6zQP1rSc6kJHM2Oxhz9mSIELQLb1OLcKkAwP2
 NzxyLNppLulcRk597Lxwmnow6tSYvoK5mNjuu2TxgrTVHq/j2uivyd4RhvHMcTFscg==
X-Google-Smtp-Source: AGHT+IFSNYcqKArW6XocXZJT6wyLF1qepmua7rlIfCX/89USt/4oGbRmWYVV8ofb3e3KZUhS2UXrKw==
X-Received: by 2002:a5e:d808:0:b0:7d0:3e86:6ba7 with SMTP id
 l8-20020a5ed808000000b007d03e866ba7mr13180847iok.17.1712014817705; 
 Mon, 01 Apr 2024 16:40:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 em6-20020a0566384da600b0047c08df15basm2836859jab.173.2024.04.01.16.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 16:40:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 17:40:13 -0600
Message-Id: <20240401234013.3570820-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401234013.3570820-1-james.hilliard1@gmail.com>
References: <20240401234013.3570820-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712014818; x=1712619618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jc414XfCq2mA8u+B0BuNIrbq1ll/Sva/sU+qqnqjNsM=;
 b=KD3TKp8g73HLsLeivHuq90dZLwXAmymrZHOrAqyEKoQIG04Krf4STzbotUf1nlSzac
 Se5q37RkaHCALxysdryPZiwDk4R87WihRxQf3rmn9AgzAJiijQAEVXejLCwq7rl/qGUs
 JdMmsyRatHBETx49LcFwkOFj/VMS/dy7XQls8ecfHGOxmsFa+rZOjW+ArqpzjJxhG0D5
 wl1PiWYxJv2iLwOkU5IW0nHfJNOmOPLEd6Y1LulXOaoJHQaOx9yRT9UjzllAWhVkjsmk
 yAiNkv1g4A3UDamwrBb0YEPiiUpaU4NmplvWBUOeGAKgxrtV0rwduUivQKGQqySg2sFv
 oMww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KD3TKp8g
Subject: [Buildroot] [PATCH 2/2] package/systemd: fix build with glibc 2.39
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
Cc: Sen Hastings <sen@hastings.org>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing systemd's libcrypt dependency this
broke any systemd build using glibc version 2.39.

To fix this add the libxcrypt dependency to systemd which is the
preferred way of providing libcrypt support in systemd as the glibc
variant is only used as a fallback due to being deprecated.

We should also have host-systemd depend on host-libxcrypt in case
the host system does not provide glibc with libcrypt support.

Fixes:
 - http://autobuild.buildroot.net/results/36e/36efcfc76c015c9b4c955c13afa0f81a98b529f4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in  | 1 +
 package/systemd/systemd.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index aa5143d484..a94e9b73b8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -28,6 +28,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBXCRYPT
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c6b006d1fb..8987dc19a6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -55,6 +55,7 @@ SYSTEMD_DEPENDENCIES = \
 	host-python-jinja2 \
 	kmod \
 	libcap \
+	libxcrypt \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
@@ -882,6 +883,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-util-linux \
 	host-patchelf \
 	host-libcap \
+	host-libxcrypt \
 	host-gperf \
 	host-python-jinja2
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
