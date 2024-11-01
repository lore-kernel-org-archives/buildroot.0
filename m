Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5522FE6F094
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B8160785;
	Fri,  1 Nov 2024 22:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CE2MPZTFWOuQ; Fri,  1 Nov 2024 22:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E43BE60784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43BE60784;
	Fri,  1 Nov 2024 22:51:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A28EC112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FA7060779
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKug6zOx3KGv for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B5BC6072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5BC6072A
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B5BC6072A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:51:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37ed7eb07a4so1827621f8f.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 15:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730501513; x=1731106313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jxv3EbIp7z+Vi5YZCTti8XnD/3doBM8Rz+L2hds3AH8=;
 b=VW/xiTks5wXoizcoqJNrZXoiMh+uUDA/88+4d9xj7kLKA9v08SBvUxVfEnXRkxBMlo
 wmWXXcwFVRpJb9DUxRAhogRUsCXidP5SXflehVxsWcfWKhX9cPcSGeKAavX31cJEzwEY
 AynmmowjKVrfqQ1xWBLJhvxQ/SmASSlMxgGr1rpH/KPQiPzJiIk0U/zpeii59TbGrJnp
 fUNmUU+G43jRp+PCfWACRbAt7XCzH2YgqUxBXKaMlVF85PqSgySKeR9qcacEvioVwH6f
 QLgVjhnP4v7kNWN8mp1yOsLjzAg6xEKOH9OIiQAIUDP1JWBoZvpZmpNqiv/roHR2NLtG
 ving==
X-Gm-Message-State: AOJu0Yw6Qn/mwGtC8DliVicVdw8zjm42xoti42m3n9BvL9BR1Z0i3A/1
 sjWACrC5i5WUtOYq3eoZ9zIibH6238sMnxgDYegdoIhAlP5XuZngvGbn7RT9EWV+EkQ/fGnd1vs
 w
X-Google-Smtp-Source: AGHT+IFOFBDfITvzEo2HbdJzTtsBokqKxBkfSRApAx1lJD+Ki8ZpHU+ztR4eYpX3BjSwazoKARDWHg==
X-Received: by 2002:a5d:5847:0:b0:37d:4e74:67f with SMTP id
 ffacd0b85a97d-381be907c52mr6971532f8f.37.1730501512864; 
 Fri, 01 Nov 2024 15:51:52 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e694sm6409741f8f.86.2024.11.01.15.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 15:51:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri,  1 Nov 2024 23:51:48 +0100
Message-ID: <20241101225148.3432542-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730501513; x=1731106313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jxv3EbIp7z+Vi5YZCTti8XnD/3doBM8Rz+L2hds3AH8=;
 b=P3Qg4tMPHjqOnN86e6M/c0fSGFhe8YaG9Yeig5W5i2Kl9R0hRxLdFCW+UGrecwOyj+
 S3mD8CtdPepg2DZ0jv8Ze2hMY6Ry0AGpKIezRZhSwrvUN7C4pqA97DU93OYwjoo5SOhZ
 xHwOi9M2vfo9bPBgZBcW0JfeBfK4nm+vZVoAM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=P3Qg4tMP
Subject: [Buildroot] [PATCH] package/util-linux: allowing building even on
 non-Y2038 compliant systems
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of util-linux to version 2.40.2 in Buildroot commit
f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
to 2.40.2"), the build will fail on systems that are not Y2038,
such as uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [0]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.

"--disable-year2038" is already used to build tar package since [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992338 (TestIso9660SyslinuxInternal)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992337 (TestIso9660SyslinuxExternalCompress)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992335 (TestIso9660SyslinuxExternal)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992259 (TestSysLinuxX86LegacyBios)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992257 (TestSysLinuxX86EFI)

[0] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html
[1] 7f1088f9cae9f191740423a0084bb31f94af2e75

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c3737a8d12..7a143290eb 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -42,9 +42,13 @@ UTIL_LINUX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
 	$(TARGET_NLS_DEPENDENCIES)
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. util-linux will support year2038 if
+# the system is compliant even with this option passed
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
-	--disable-makeinstall-chown
+	--disable-makeinstall-chown \
+	--disable-year2038
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
