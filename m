Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C0C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A2760899;
	Sat,  1 Mar 2025 15:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H06gyHl4ir5a; Sat,  1 Mar 2025 15:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACA060D51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACA060D51;
	Sat,  1 Mar 2025 15:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72915181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C91084C4C
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfMdvJEoQaLK for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F3F384C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F3F384C44
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F3F384C44
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4399ee18a57so19372175e9.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841548; x=1741446348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=US2/30TBb8CbIXQlVsme4zS67etx7aj+Z5EjWE8HfG8=;
 b=oNjCZkX6/rmbYQBMX57NN3w97JgGDU1hebhT1945bMU/7eU9EzsuWk5vas9pkla5WL
 gpzYbcAA2+6jN2VsgvebLgb4hhB6LkBwPwdXjRtgpn5h9eEZ4K9gmPKtUFi2Gyq/itll
 ZWNnyvEi+RpTsn9dtw6XKq0YslQjwYKmY99k+nOjeh4Hfbl8NV3lE2348rotL4y3na0r
 DiaJ9hol6ZkTAGgO3O0QATpxBG4vfjQLNccRqKI0crAW8/y/M+Oo+W+9e233lkDtSfQb
 kIFbDpFRtIseqTJnQU3euNkrGDLNyRWVH0HNisNMOZ9X6OYQjPsId6MzIMIRe8NpTm5b
 8t8A==
X-Gm-Message-State: AOJu0YxrvF3MSZgEmnPJLxrwKMrnESqCdZks0808jejuXeRSzOkjY8Is
 rGhlPS90ZV7rN4tY+3AOjhugJLKmakHZ0OWOfF6MhW42w3htqm48r8mbww==
X-Gm-Gg: ASbGncvOSIkJJASoOE85oqfgTtVJthKHTLN16s84fL8wFHYuBVscaBSmuCcZpdsC9Vx
 6HOQ90SdoHyEOjdSU9NwLDVEqKXsUQ1PjKu8Al/GISvapcwbRrFkIIueedUa4To0B1JLK0uhuJj
 nWQkPAS4OXHiXuwtOJbvHEjCNOY1S4YZJKDcvHKxem5nxU1+a7AzUNWy831TCHtK3yYT+LQ2gYU
 69SBUe4T/aoWnZe1VTPUrsgTcQaa5Fmum9qzhkPhlyy9VffilP2HrpvU0SUFCIT0/SQBxSrkB2t
 /K2W6s2ppg9nIqnRDfSG6QJUiP8LLSCL/GGVenwvhr19e+q6p+zOys0=
X-Google-Smtp-Source: AGHT+IEZ10gKJl7dYTbwWXyvjEYG0QPiYGT/G+yRGsQo8ogIyMAYuF4O742qCy7MuXqYFr1cbe+gXQ==
X-Received: by 2002:a05:600c:21d1:b0:439:7ef0:a112 with SMTP id
 5b1f17b1804b1-43b04da6fd9mr96305515e9.10.1740841547952; 
 Sat, 01 Mar 2025 07:05:47 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:47 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat,  1 Mar 2025 16:05:43 +0100
Message-ID: <249b8b6a5495b3cb0d4a46e279ef681192eea7a4.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841548; x=1741446348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=US2/30TBb8CbIXQlVsme4zS67etx7aj+Z5EjWE8HfG8=;
 b=Rvd8oD5UU1+2dn7AfbtTuR1GrcE0pIFULqG9QKDQwIOH5cfmEP/QpzyGTT+qBehZkv
 mMkEFOHaiQ8moZ1ayDNamMLKke+6qxJxy0+/RzbRz3j6zZbrdri+pj1mW/Pec119oY5y
 1vTnYWOZP9Nx5Rkk7itQwXD6lyVMh7QlmgUVjK+VWuRm8gRVAx73k+mDUUOzTR9297Zd
 GaRZ5usCUti/+68m8j63jsTMl6yld9V+X0lu2DS+kBKIzMAKwLpR/saJqFRW/x5w9y+A
 4Ka+kRosTzl8IU0JDqSUBkjeNu0zxC9LpjPisK6qHwu65HhSCMZD1cytoxZc2PeqM8kq
 kh2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Rvd8oD5U
Subject: [Buildroot] [PATCH 8/9 v3] package/netavark: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>

---
Changes v1 -> v2:
  - add licensing information  (Julien)
---
 package/Config.in              |  1 +
 package/netavark/Config.in     | 10 ++++++++++
 package/netavark/netavark.hash |  3 +++
 package/netavark/netavark.mk   | 19 +++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/netavark/Config.in
 create mode 100644 package/netavark/netavark.hash
 create mode 100644 package/netavark/netavark.mk

diff --git a/package/Config.in b/package/Config.in
index a152268209..460955cb90 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2559,6 +2559,7 @@ endif
 	source "package/ndisc6/Config.in"
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
+	source "package/netavark/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netavark/Config.in b/package/netavark/Config.in
new file mode 100644
index 0000000000..caac3c4872
--- /dev/null
+++ b/package/netavark/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETAVARK
+	bool "netavark"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Netavark is a rust based network stack for containers. It
+	  is being designed to work with Podman but is also applicable
+	  for other OCI container management applications.
+
+	  https://github.com/containers/netavark
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
new file mode 100644
index 0000000000..585763be42
--- /dev/null
+++ b/package/netavark/netavark.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  09471bd116fdebfd3f7a8100b37809e3a306d0f18e5feee8445ed1e01a22e0aa  netavark-v1.14.0-git4-cargo2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
new file mode 100644
index 0000000000..b2508bb5a8
--- /dev/null
+++ b/package/netavark/netavark.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# netavark
+#
+################################################################################
+
+NETAVARK_VERSION = v1.14.0
+NETAVARK_SITE = https://github.com/containers/netavark
+NETAVARK_SITE_METHOD = git
+
+NETAVARK_LICENSE = Apache-2.0
+NETAVARK_LICENSE_FILES = LICENSE
+
+# For protoc
+NETAVARK_DEPENDENCIES = host-protobuf
+
+NETAVARK_CARGO_ENV = PROTOC=$(HOST_DIR)/bin/protoc
+
+$(eval $(cargo-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
