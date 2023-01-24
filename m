Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB4CC38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 09:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2517740BD9;
	Tue, 24 Jan 2023 09:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2517740BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9IGc478DrvI6; Tue, 24 Jan 2023 09:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50AF340BE6;
	Tue, 24 Jan 2023 09:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50AF340BE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D13D1BF2B0
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04B7640289
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B7640289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCs-67HMWY-q for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 09:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0532D401D2
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0532D401D2
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 09:22:46 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i1so7175385ilu.8
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 01:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3u/8RbCXRmpx/Qmh2fzWXIPZParsUCqtk6wX+kbSgM=;
 b=jkZEb0uhgoUe+9LenPXvreXcg8Zb6MbzDIpztscHwon+TS/7OPDHf53NLEShzVLF0O
 vaCK26WOHAJZYMU9T3DEZQd2OCg6i0DEx9s9HAZyxdvxK2XeTM8rEUFY/lhDU4P64Pk/
 Wpi6c0qh8H97ilfcj8EL977VI/6xBuX2rU5X/H7d5JnJQ8Nhuqk3x0xmFrk837qrXohY
 aoQ3tJJvIx19E3g7UV9h6Wswe/dNTOAADFexk2ESisP4DJN68Pbjgt1o/JfQlbTdgZSa
 l8FSF7OveqU7fHVmR8UUgigmiajfP2q9VExljWz6CZYLqYbGfwWRcUfQy7Dn1Wf4nx7E
 e8FA==
X-Gm-Message-State: AFqh2kqqTlwj5SARguvsA17eKOwLSLm+4Pj8+IAiyMka/Mv66S/PELxP
 qSKWTnouIZel5iJDRn1iAqn6w9KTChXRsQ==
X-Google-Smtp-Source: AMrXdXuEfG2oyZtMRrz4YCXNZr9j6wMaL2487vD7iLAsUAueNcElL4GfSgB1xcQSz3lgZS0SaOkUrw==
X-Received: by 2002:a05:6e02:214b:b0:30d:bfa3:ebce with SMTP id
 d11-20020a056e02214b00b0030dbfa3ebcemr25251145ilv.27.1674552165945; 
 Tue, 24 Jan 2023 01:22:45 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v26-20020a02b91a000000b003a7d5061e1bsm524923jan.111.2023.01.24.01.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:22:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 02:22:32 -0700
Message-Id: <20230124092235.806969-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124092235.806969-1-james.hilliard1@gmail.com>
References: <20230124092235.806969-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3u/8RbCXRmpx/Qmh2fzWXIPZParsUCqtk6wX+kbSgM=;
 b=iqgL8DgXTMClMcQ3+4J9nMt6FOrGRjOaw0y6QjSvjfpeG5n8FjWpzFR92+y77j/JKn
 hP8h7Orn0WCuE5v5LK1LiB3vOL19JlPCLODV3RCtiLjbJ0jZLh9DqVFSFzSfy+kKtvIG
 jUxtfSGqTQuoaHT7DzHyjlyKU4oAu78alaOfbat92Eht6gkTs3yb5WbMjAnNExN+TbuZ
 fvB7Bmc/lTc6Ds/k8WzhcsOxVg10q8PQd9kJKHeu/kyAC8FfaiL+UZPr+xUstYl2zKf8
 3GUHIkjeVbNt0n089eAJW0HDXXiOsCgZ60Zk446gzVb3kXd0WAlMc5aGRm9KDISQ/xdF
 EdvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iqgL8DgX
Subject: [Buildroot] [PATCH v3 5/8] package/neon-2-sse: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/neon-2-sse/Config.in       |  9 +++++++++
 package/neon-2-sse/neon-2-sse.hash |  4 ++++
 package/neon-2-sse/neon-2-sse.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/neon-2-sse/Config.in
 create mode 100644 package/neon-2-sse/neon-2-sse.hash
 create mode 100644 package/neon-2-sse/neon-2-sse.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f48ea66660..a711f9f1ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2704,6 +2704,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/neon-2-sse/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index 8f78080963..6377ddd2e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2101,6 +2101,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
+	source "package/neon-2-sse/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
diff --git a/package/neon-2-sse/Config.in b/package/neon-2-sse/Config.in
new file mode 100644
index 0000000000..25613c5ec4
--- /dev/null
+++ b/package/neon-2-sse/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NEON_2_SSE
+	bool "neon-2-sse"
+	help
+	  The platform independent header allowing to compile any
+	  C/C++ code containing ARM NEON intrinsic functions for
+	  x86 target systems using SIMD up to SSE4 intrinsic
+	  functions.
+
+	  https://github.com/intel/ARM_NEON_2_x86_SSE
diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
new file mode 100644
index 0000000000..ded20d58f5
--- /dev/null
+++ b/package/neon-2-sse/neon-2-sse.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  019fbc7ec25860070a1d90e12686fc160cfb33e22aa063c80f52b363f1361e9d  neon-2-sse-a15b489e1222b2087007546b4912e21293ea86ff.tar.gz
+# License files, locally calculated
+sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
new file mode 100644
index 0000000000..0e9d066abd
--- /dev/null
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# neon-2-sse
+#
+################################################################################
+
+NEON_2_SSE_VERSION = a15b489e1222b2087007546b4912e21293ea86ff
+NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
+NEON_2_SSE_LICENSE = BSD-2-Clause
+NEON_2_SSE_LICENSE_FILES = LICENSE
+NEON_2_SSE_INSTALL_STAGING = YES
+NEON_2_SSE_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
