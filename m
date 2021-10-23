Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A52C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 05:01:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819D060FE7
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 05:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 819D060FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2379981B84;
	Sat, 23 Oct 2021 05:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwOWH8iCtPD5; Sat, 23 Oct 2021 05:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D2A381B72;
	Sat, 23 Oct 2021 05:01:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 365501BF28C
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 05:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 218E740389
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 05:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y16Qgeiw3LXA for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 05:01:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A14F4037F
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 05:01:50 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 188so7922104iou.12
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 22:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDho9cEYFu8DZU2r8VP7qiqHgE0pVqXuff+VUenSejQ=;
 b=HGfDzE5LL3Pqh5itmvca8hvnFCPZt0OORotIwOZy3DSiVkvS/9lrsI4MOVlMbBkGzP
 J4nZquP+qz7i/0A4NqgOaa7WWMdilBMkhjnNRaBDGRWnfNUrs5NKKueIjB5NnxjTgPeP
 1eV/gSghU2stqVYjPhYgfhRpxBxbA4LxaG2ydQdJh0r3o9OjKH54revKJrF46O6vvRVC
 iZd+26zyLc8qC+/z5JCpaXNjc10OBJUlMHrrfI37CqTJ26bbPHT2/wQKSFAnmZbqUVKM
 aqz/tL9cDVvsG2VnQIQWAVUp0dO9fgPbTUm33H1V23TJ5QQ+61IDNs+8SvstciKvScSw
 bxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDho9cEYFu8DZU2r8VP7qiqHgE0pVqXuff+VUenSejQ=;
 b=TQNZgOppXBA0j/NyeiaqK2SWV0EBPqkcGQN4xwhsr+pwlTFUxlGYhnSWCDMxxT00nr
 X18qYH/fUwxubqQdLfG7l9mCcqxIYoTOtBOzJxTICqfxh1a5gfhK/o6vCIszNJNYtwK3
 x4Y7szO5SX2GYM68z1/K3KjbqYRYP3c6COdqqJEjSsHqMb6nnXkdk8ZPIYDp1lO0UI5W
 SQZQmuR65g0vzH2gpcFgW65xUXnojjNfbGT3GaUGduL6TlONkYkz8B8HoIyX0ikMuz2u
 vtxxD3etuJb/73kTMMgwAq0z/Yc7THhDMyVUpX83yGXn+xjB3UDCadAJHbYwZ8eUpPH8
 A0Ew==
X-Gm-Message-State: AOAM533kLQbpWIkUwkOzqMBWas+AoJyYCwMUYltZQmgRpra33sJEnbKc
 iHeyMBaDDJe5NEtfM1xU2X+3qXO7TtA=
X-Google-Smtp-Source: ABdhPJzgduR7N4GzHO0xoKD7Evi7Ms4gM+0xIlfG6Yy9GqnWGouXwfV3aBMSYTpglHot61x2tkcjTA==
X-Received: by 2002:a6b:b48b:: with SMTP id d133mr2573923iof.12.1634965309028; 
 Fri, 22 Oct 2021 22:01:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id e11sm2813306ils.34.2021.10.22.22.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 22:01:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 23:01:19 -0600
Message-Id: <20211023050119.3293369-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: expose capability to
 compile host library
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Linus Kaschulla <linus@cosmos-ink.net>, Daniel Price <daniel.price@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Linus Kaschulla <linus@cosmos-ink.net>

To use nodejs on the host (independant of the actual system)
to create some static files to place onto the target rootfs
nodejs can be very helpful.

The provided nodejs package didn't show the possibility to
create a host package. But upon further examination I noticed
that the package does it in fact (in the .mk). It specifies
dependencies for the package with the host prefix and also
invokes $(host-generic-package) as well as $(generic-package)
which is the only one assumed from the config.

With this change other packages can require BR2_PACKAGE_HOST_NODEJS
without any problems or the buildsystem not fully knowing about this.
Seems that someone added the capability (as a step for the cross-
compiled nodejs) and didn't notice that this is a handy package by itself.

When installing global npm packages (with -g), the parameter
`--prefix $(HOST_DIR)` can be used to ensure that nodejs doesn't try
to install it onto the real host filesystem.

I already used this change to create static web files from Angular
and place onto a target that doesn't need nodejs itself.

This patch contains fixes based on feedback from:
- Peter Seiderer <ps.report@gmx.net>
- Yann E. MORIN <yann.morin.1998@free.fr>

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - move nodejs 14 dependency selection to host package
---
 package/Config.in.host        |  1 +
 package/nodejs/Config.in      |  6 +-----
 package/nodejs/Config.in.host | 13 +++++++++++++
 3 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 package/nodejs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 6e5a5c5fc5..7400da5894 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -56,6 +56,7 @@ menu "Host utilities"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
+	source "package/nodejs/Config.in.host"
 	source "package/odb/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 771f735e97..8a2a6cf91b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -27,11 +27,7 @@ config BR2_PACKAGE_NODEJS
 	# uses dlopen(). On ARMv5, we could technically support static
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HOST_PYTHON3
-	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
-	select BR2_PACKAGE_HOST_PYTHON3_SSL
-	select BR2_PACKAGE_HOST_QEMU
-	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
+	select BR2_PACKAGE_HOST_NODEJS
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
new file mode 100644
index 0000000000..86eaf21dac
--- /dev/null
+++ b/package/nodejs/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_NODEJS
+	bool "host nodejs"
+	depends on BR2_HOST_GCC_AT_LEAST_7
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_HOST_QEMU
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
+	help
+	  Event-driven I/O server-side JavaScript environment based on
+	  V8.
+
+	  http://nodejs.org/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
