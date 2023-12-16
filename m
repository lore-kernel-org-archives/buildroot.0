Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57968C46CA2
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F48960FA7;
	Sat, 16 Dec 2023 16:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F48960FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32EDk96ZKN-5; Sat, 16 Dec 2023 16:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3710860F5F;
	Sat, 16 Dec 2023 16:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3710860F5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 457EF1BF867
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BD3460B99
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD3460B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiL5ku7MqcK6 for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E24A160B92
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E24A160B92
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c6ea99429so12257115e9.3
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743005; x=1703347805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B9AC7J69nFOif483FbICGfW2qwCO5U7Z/xNzISTTl2Y=;
 b=nxxwHr3X/wYk5t/BP5Hu87fkKVibCU07IHGoTI9kqrd+VGX4OkhN5gPol6JF1Wl8Fp
 2w8JO2DAzSi3qTV5iwGLDHTKX4GCUSuCRFwPY6Ph+EN4fdhaHcV/U6Bfuopu2VXacZN2
 0XIKTXxn4KgBcL5uqI36/mFrco8XBaRPdFmQ8l9jReonDh2GwyLmyC0XZAx7F6JFrjqm
 IZUKTmyniLNbtxGWvnzMWaiQEoPASZ15y3izGtKL/IWkZ7dzmvcl1ztIbsrCVXiu6cNX
 nxLzDfwPEbqjdEXZNeF1rBMleOKpk34P9lRG71oz8JpzdOOQ0nozd6Oa4NZLSV5GT+j5
 DGsQ==
X-Gm-Message-State: AOJu0YyJR+SLE11JBid72IclXj/xvDzdHVizenTdTIzFdbCDGYzda41z
 my4SZaKKJfE/boL1G1svs4tFMqKHx0E=
X-Google-Smtp-Source: AGHT+IEBw3+tRDfZOJQA/iSb5VQzS0D9EOvRo9pGSiXAjt0V7tPfNOV9jJCP5ZctWxVTk2A6ZNHlUA==
X-Received: by 2002:a05:600c:198d:b0:40c:6cab:8b04 with SMTP id
 t13-20020a05600c198d00b0040c6cab8b04mr958667wmq.20.1702743004706; 
 Sat, 16 Dec 2023 08:10:04 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:04 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:09:58 +0100
Message-ID: <694a881fb3cb6ae56ab470d11bb711b881cbab2c.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743005; x=1703347805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9AC7J69nFOif483FbICGfW2qwCO5U7Z/xNzISTTl2Y=;
 b=c9HJTII4rsPf7p1d9WU7VRphRwENvP5CcfkDmSA5lM3+d1RHNHfcKKJnJ06NZSa3zD
 OWncqHpxEvvQec3wm4WSiy5l10hSRXWESGAyAd9QMwg0vHUPc4pi8QZVAZaBq3HOrhCZ
 zqAV+oYod90THuu27Rs7wBhe1lQRTwq+pGbQiL04Rzfoe9gsMd+M88w6M5m7zCIClsoM
 AoLELG6Ul4BRqWXuHMYA7MENczJ4OR0chiuaVvyIF02nmtK5RcSsgdUr/AjC7Whd7F/7
 ehPPzGOeUa3W68asqrfSsqLWpbAgUtWCbZi6zIVQDnyyuMx8NrDYqS6MSG9amdCI3UxQ
 FzwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c9HJTII4
Subject: [Buildroot] [PATCH 5/9] support/docker: introduce per-distribution
 sub-directory
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we only generate one docker image, for use by the gitlab-ci
infra.

However, users have expressed an interest in using that image for other
uses, like:

  - reproducing build failures as reported by the gitlab-ci jobs,

  - having a ready-to-use base image to use as-is, or as a template for
    further customisations.

Additionally, some users have reported the need for similar base images,
but based off different distros, with the same goals as above, plus:

  - reproducing build failures reported by users on other distros.

As a first step toward providing such images, move our Dockerfile and
its accompanying resources to a sub-directory, named after the
distribution it is based off.

Add a symlink that allows to also reference our base image without
having to know what distribution it is based on.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/docker/base                                   | 1 +
 support/docker/{ => debian-bullseye}/Dockerfile       | 2 +-
 support/docker/{ => debian-bullseye}/apt-sources.list | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 create mode 120000 support/docker/base
 rename support/docker/{ => debian-bullseye}/Dockerfile (97%)
 rename support/docker/{ => debian-bullseye}/apt-sources.list (100%)

diff --git a/support/docker/base b/support/docker/base
new file mode 120000
index 0000000000..95f9ccb9fc
--- /dev/null
+++ b/support/docker/base
@@ -0,0 +1 @@
+debian-bullseye
\ No newline at end of file
diff --git a/support/docker/Dockerfile b/support/docker/debian-bullseye/Dockerfile
similarity index 97%
rename from support/docker/Dockerfile
rename to support/docker/debian-bullseye/Dockerfile
index b62cf32824..f45ff6b0f8 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/debian-bullseye/Dockerfile
@@ -1,6 +1,6 @@
 # This Dockerfile generates the docker image that gets used by Gitlab CI
 # To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker
+#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker/debian-stretch
 #   docker push registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
diff --git a/support/docker/apt-sources.list b/support/docker/debian-bullseye/apt-sources.list
similarity index 100%
rename from support/docker/apt-sources.list
rename to support/docker/debian-bullseye/apt-sources.list
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
