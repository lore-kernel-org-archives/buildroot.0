Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E9C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB42880FAE;
	Sat, 13 Jul 2024 12:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pn40KBjKFx2b; Sat, 13 Jul 2024 12:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247398102D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247398102D;
	Sat, 13 Jul 2024 12:24:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CAA01BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1652C400DD
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4z2ok3B0j6R for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE766400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE766400A4
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE766400A4
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:23:57 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso3485888a12.3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720873435; x=1721478235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFavsMiFV1HxEd3u7LnnW6uMxYXzUWtmp/sbO71w6i4=;
 b=WA7dIk7HAYrvlInWN8JouTlQj8lfJeMV1j33bcwkT7xK4I7nHuJJBhXgC34ZloKbO6
 LAE5/bPZXBg949IW4qLQ3CyeO0S8ccGm8+Imt5p8/hA+QVpOIDfzVQtjpZ/3EoF3/Qyu
 yeC7BkyeDOdGOsEjoecF7YX++0fTEJlP82FBiqi5FjmfznbUhTNmX07YCzJcUkgDHjRY
 Orv9Zk14Wni+tzjt4s3AesXZAz6AE7NhqcmZ99rwzoVen4esEqxC7AmA7y9qkcf6U+Yb
 TYtjFRjGj/dksP0QA0gMQZ85+vAGt4AruyfAubB6Jn2aW0yhAhO0w47xreSaEJlhScAt
 NsWw==
X-Gm-Message-State: AOJu0YzJEE9wPpvshgN2jIMGwkdomBOlOEVwPtOqwtTsBD55WJFqi6GH
 lPL5AL4hf3jvXRG5OKFLf8CFKGOw1Uc7NCy1X0fhHH/jcpih4lVVPOIOig==
X-Google-Smtp-Source: AGHT+IFW397VJKN4V9CveYDRJtKbsnFFFv2tRNEkJkXu8q13sWh8hUcQABCADhrK5pnXqpNitDDVrg==
X-Received: by 2002:a05:6402:2554:b0:58b:d7f2:eef3 with SMTP id
 4fb4d7f45d1cf-594baf87f63mr11997854a12.12.1720873435188; 
 Sat, 13 Jul 2024 05:23:55 -0700 (PDT)
Received: from hthiery.fritz.box (ip5f5ba0e6.dynamic.kabel-deutschland.de.
 [95.91.160.230]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f621b8sm700586a12.85.2024.07.13.05.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 05:23:54 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org,
	Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2024 14:23:30 +0200
Message-Id: <20240713122331.298786-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240713122331.298786-1-heiko.thiery@gmail.com>
References: <20240713122331.298786-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720873435; x=1721478235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFavsMiFV1HxEd3u7LnnW6uMxYXzUWtmp/sbO71w6i4=;
 b=WgfCsg3sMqQ0s/k9lUqTOcfphiTjjDOx0KqixcUi+wcCaWCdfvfx46KW4gv4Atox4G
 QUHJYfU0OcJICBmB3mtDbDGGSyRqStk1GxXpGXv/cmwqJqACPvEUrpFZjRv/XtZ4S+eR
 eaQczU58OPY9iY/pwMBcUw4ejkmP3+mnQSTNWqW1apt4QQC5zULLS+PFx3+oz1db1SJi
 cSwv/XAt8OZnNrVzQ5QKlylzT+zTYXMXNqaBD7wGjLIjTOfATFqkVrC5g/nid3xiOsk0
 UFZxARIkWXNuHoXC1Iwn0kEyyHXEcGTTekI66c8RQPyqFLKmtlVTwA8pPlLXmCp03+E3
 mwig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WgfCsg3s
Subject: [Buildroot] [PATCH v4 1/4] package/blake3: add new host package
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is used and required for ccache update.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2:
    - on change

v3:
    - fix BLAKE3_LICENSE_FILES and corresponding hash values

v4:
    - use github macro to get tagged version instead of refs/tags
    - remove override of CMAKE_ASM_COMPILER (requires series https://patchwork.ozlabs.org/project/buildroot/list/?series=415079)

 DEVELOPERS                 |  1 +
 package/blake3/blake3.hash |  3 +++
 package/blake3/blake3.mk   | 19 +++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/blake3/blake3.hash
 create mode 100644 package/blake3/blake3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fa425f3ee..0222b37efd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1369,6 +1369,7 @@ F:	configs/kontron_bl_imx8mm_defconfig
 F:	configs/kontron_smarc_sal28_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
+F:	package/blake3/
 F:	package/ipmitool/
 F:	package/libnetconf2/
 F:	package/libyang/
diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
new file mode 100644
index 0000000000..2a00d19b02
--- /dev/null
+++ b/package/blake3/blake3.hash
@@ -0,0 +1,3 @@
+# sha256 computed locally
+sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
+sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
new file mode 100644
index 0000000000..5625046db6
--- /dev/null
+++ b/package/blake3/blake3.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# blake3
+#
+################################################################################
+
+BLAKE3_VERSION = 1.5.1
+BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
+BLAKE3_SUBDIR = c
+BLAKE3_LICENSE = Apache-2.0, CC0-1.0
+BLAKE3_LICENSE_FILES = LICENSE
+
+# We may be a ccache dependency, so we can't use ccache; reset the
+# options set by the cmake infra.
+HOST_BLAKE3_CONF_OPTS += \
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER
+
+$(eval $(host-cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
