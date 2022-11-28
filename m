Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9021DC433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30F3660BDF;
	Mon, 28 Nov 2022 18:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F3660BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9TLjL2ALJHu; Mon, 28 Nov 2022 18:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB9260BBA;
	Mon, 28 Nov 2022 18:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB9260BBA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5EA1BF20B
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6836B8135A
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6836B8135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJoLDa5v_cMl for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FBA81252
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85FBA81252
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id y6so8193474iof.9
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/UR+AP32JF4xzJacsTP0deBX+kUNIvU6O7VWLCP4w0=;
 b=YHWe9z8gtXnInFINF6gC7DuCpvCrDU3P610ZO3Bqf45VsE5FGYN7pwlHt+JyLStkoe
 FWFGCKYPvsIYqohJmGl5GGg4X2zIG6tcq+lxmMMtexlJy1huG26Tusw5LqjqFgIk9idB
 seO2BEALA/Ohf7gIbR0TaFjlhDL2fV8YevLaM0hmwWberr53RBYuDTAz68zVkkZ2Afsa
 AjLWItrACxSkPUGkyQEjxeAxZc1020SaFPW9gCl3UHjG7DzPx+QIRy00rdS8cBfnUJ3I
 8NG1qmEZz3z8rh5lWZ7z8I+DtUbwimSi+gDN8xBZwYHtRdRR6c0z9nIInSF+NJmUVJcw
 OkgQ==
X-Gm-Message-State: ANoB5pnRt/1exlWNeevTLVCfJ2Nq6wl+Pw24rhA+++N0nDKdTNgy6djx
 8YvvkBqORaVrDDl+GIhjLiPJfRFHojAMD3zq
X-Google-Smtp-Source: AA0mqf4MDHUn7wGLKs2m0J332qRmRsYeObccHKaYPptpvvw4LcRjPHwXuz4zaJ2uyIu357HYNZHa0w==
X-Received: by 2002:a02:9f9a:0:b0:389:deee:1c18 with SMTP id
 a26-20020a029f9a000000b00389deee1c18mr3492326jam.90.1669658340955; 
 Mon, 28 Nov 2022 09:59:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:59:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:50 -0700
Message-Id: <20221128175851.1913859-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/UR+AP32JF4xzJacsTP0deBX+kUNIvU6O7VWLCP4w0=;
 b=R08B1CMZ3asUikN880aiwM1Y2/1d35/NFdC2F5vZPO9SxkOshDdqn5TpSqK6ahz2da
 vtZ3+/qsuTs7f1pqH0SrDi6JZZdSr49uTCnSyQl76Xay67aled1a0iz5n80s0rMqQ/9Q
 5mk8XE1Z0cEgVv0hisErYoGsax7nRIDb+bCJQxVP7lj/zFEBCZqWJlDW/2AcpMRVQHqb
 onhKtrDgpmi7g+p5bdOOxE5N+07Z+xmDliKX/QClL+97YVOw4hzVoJbwu70qqNQPP9tF
 GG5nOk8MELnqYqtiTMJUxdckONWJHgHqyCenoy/m8LbzkR3mQLAIvseS6YuDw6TdWsOH
 cLTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R08B1CMZ
Subject: [Buildroot] [PATCH v2 7/8] package/farmhash: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in              |  1 +
 package/farmhash/Config.in     |  7 +++++++
 package/farmhash/farmhash.hash |  4 ++++
 package/farmhash/farmhash.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/farmhash/Config.in
 create mode 100644 package/farmhash/farmhash.hash
 create mode 100644 package/farmhash/farmhash.mk

diff --git a/package/Config.in b/package/Config.in
index fe636fde9d..a59d074430 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1988,6 +1988,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/farmhash/Config.in"
 	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
diff --git a/package/farmhash/Config.in b/package/farmhash/Config.in
new file mode 100644
index 0000000000..0ad16f933b
--- /dev/null
+++ b/package/farmhash/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FARMHASH
+	bool "farmhash"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  FarmHash, a family of hash functions.
+
+	  https://github.com/google/farmhash
diff --git a/package/farmhash/farmhash.hash b/package/farmhash/farmhash.hash
new file mode 100644
index 0000000000..afdfc0f994
--- /dev/null
+++ b/package/farmhash/farmhash.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  18392cf0736e1d62ecbb8d695c31496b6507859e8c75541d7ad0ba092dc52115  farmhash-0d859a811870d10f53a594927d0d0b97573ad06d.tar.gz
+# License files, locally calculated
+sha256  4162dd091caae234f72d3b57e138174f733e736b2430a4c51b098b17d866fcb6  COPYING
diff --git a/package/farmhash/farmhash.mk b/package/farmhash/farmhash.mk
new file mode 100644
index 0000000000..6ab7d1a88b
--- /dev/null
+++ b/package/farmhash/farmhash.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# farmhash
+#
+################################################################################
+
+FARMHASH_VERSION = 0d859a811870d10f53a594927d0d0b97573ad06d
+FARMHASH_SITE = $(call github,google,farmhash,$(FARMHASH_VERSION))
+FARMHASH_LICENSE = MIT
+FARMHASH_LICENSE_FILES = COPYING
+FARMHASH_INSTALL_STAGING = YES
+FARMHASH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
