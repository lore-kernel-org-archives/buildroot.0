Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A857C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 09:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5EC440543;
	Sun, 25 Feb 2024 09:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iFGMgcEichw; Sun, 25 Feb 2024 09:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2EC4052A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2EC4052A;
	Sun, 25 Feb 2024 09:24:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 701031BF28D
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BFD54013B
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 09:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n12EQ4uyy1Cq for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 09:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E39240112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E39240112
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E39240112
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 09:24:24 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso34569831fa.2
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 01:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708853062; x=1709457862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHefgyfDk1x9fTM5ZGTbBBoZUtEezkv85C5/5W6RaI0=;
 b=aQJpDgzWZL2c6HAt7s3aB8/8C2VDp3fywM/vuRnqmCfYlX1xkBcrCqXFxreVfnlJLB
 IFTQIS4lBvN7b5A9zaELQNf5zd4JiFgLn4H5BZalsRWus0jwAI0h/kI6BF6k/QocRmyU
 rBO4JOMalvvo3AjOqEWr1tnS9G+9f+Ved7c5DDop1WdUrGqsqWRpGNH+8+66VbwQwsrg
 sIsJnQsXay8p+1AbbqtJrfeAPzUqG1HtoO9M9WoRF+zymSqjHHoatDO8Gm+4uwa0Tpms
 t1xTc+nP7MG0Vr3GWteR+3do5Ft8q7r0z0rQSHNFuJPPkcPXQiDJ024XTUngZm1MU6G+
 s6tw==
X-Gm-Message-State: AOJu0Yy+1YL1FPhR/1QEc1EYtsBaPDY5TuyLRAzgpkejJTf8T6d/7uWL
 hINEzH69DtkB6hMAHtOJzRfaM4+Joh9wDFFBJd20SFUpIfmZ1i9WtCsZ8Iyr
X-Google-Smtp-Source: AGHT+IEi7x7zjjPnna0jGXzOIUlU8M4Ee8NCFjaIi31vEyQIah2Hl8fPkwl+tlXEc62vRnQn1Khf8w==
X-Received: by 2002:a2e:300b:0:b0:2d2:607e:6d0a with SMTP id
 w11-20020a2e300b000000b002d2607e6d0amr2196502ljw.29.1708853061945; 
 Sun, 25 Feb 2024 01:24:21 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b00410df4bf22esm8471200wmm.38.2024.02.25.01.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 01:24:21 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 10:24:21 +0100
Message-ID: <20240225092421.1468140-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708853062; x=1709457862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=YHefgyfDk1x9fTM5ZGTbBBoZUtEezkv85C5/5W6RaI0=;
 b=bW9/+OihWzXJTvjpvMk/UdtED6FLONN4nh8f/gsvbl/KR0g9cODwXIEVKDgjzGZ5ic
 kF5HTIG53WAjy31+BBD1HehLHbLAclNT1FIh+YwTHPHhWJMzvUrZcY+YISu1AxRlN91l
 6v1FUV3fHEglWxMHfxqtYZdmf1y5inIzyAEhnzeDGMjgWm6GJ+cEn/BXJVKK6UEEZx+G
 ppjbgs28OdBs+vshSgD2IDW7n4XlYaTaNdcW3r0bolSkQY+QbtoDqB8+dV5Ng6vCA4MF
 exC5sJn20ztInskJURUIL4lKZtcjGXef6mbbkGjDGSLyNQZDLSMWbOEzuXLKH1YQjZBk
 v95w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bW9/+Oih
Subject: [Buildroot] [PATCH] package/openssh: fix dependencies with refpolicy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2c5a82a29ceb (package/openssh: select linux-pam if refpolicy
upstream is selected) did not account for the linux-pam dependencies
before selecting it, causing unmet dependencies warnings (unfortunately,
not errors), such as:

    $ KCONFIG_SEED=0xCF227CF4 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
      Depends on [n]: BR2_ENABLE_LOCALE [=n] && BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
      Selected by [y]:
      - BR2_PACKAGE_OPENSSH [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION [=y]

2c5a82a29ceb made the choice of having openssl bear the responsibility
to select linux-pam when the upstream refpolicy version was enabled.
Semantically however, the responsibility really lies within refpolicy
itself, since that's what imposes linux-pam to openssh.

Move the select to refpolicy and drop it from openssh. Then, ensure that
linux-pam is only selected when it is available.

That means that one may get an openssh that is not linked against
linux-pam, when the linux-pam dependencies are not met; refpolicy (by
way of libsepol) also has a more stringent requirement on gcc version
than linux-pam, so most probably the missing dependencies would be
locale, wchar, or a static build. We consider that situation to be a
corner case that we do not want to address.

In the future, we may have more similar situations, whereby refpolicy
would impose other packages be linked with otherwise optional
dependencies. If (when) that were (will be) the case, then the proposed
mechanism would quickly become ugly; we could then re-assess a nicer way
to do that. Until then, this is good ebough.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

---
Changes v1 -> v2:
  - simplify the logic: have refpolicy bear the select
---
 package/openssh/Config.in   | 1 -
 package/refpolicy/Config.in | 8 ++++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index a3038ba01f..08d3c7d391 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..8ae8f0448d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -36,6 +36,14 @@ choice
 
 config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	bool "Upstream version"
+	# Consider reworking the following when adding new entries:
+	# Upstream refpolicy for openssh expects linux-pam to be used
+	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_OPENSSH \
+		&& BR2_USE_MMU \
+		&& BR2_ENABLE_LOCALE \
+		&& BR2_USE_WCHAR \
+		&& !BR2_STATIC_LIBS \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Use the refpolicy as provided by Buildroot.
 
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
