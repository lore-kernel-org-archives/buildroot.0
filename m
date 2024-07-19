Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7716C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 06:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D3A60EB3;
	Fri, 19 Jul 2024 06:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3w-ICH762I6; Fri, 19 Jul 2024 06:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C01060E9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C01060E9B;
	Fri, 19 Jul 2024 06:32:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1727A1BF990
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05836608AA
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQmPsOdMKJku for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 06:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F26E607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F26E607C4
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F26E607C4
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 06:32:42 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7f99d50c1a6so65814039f.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 23:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721370761; x=1721975561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MBx3qZXNxJ0Mb7nwW8UnxLSQEoxRxSDvcLADQDCmpGo=;
 b=ZUHaIp9h1IsvzrIKNeJQK2TF+xqnhQK+2laRvNlAgdF1a73nVGDq7te99M09SrLhAS
 me5jINqkhS+mkAUK9/z83k75fUOA6d74nBhu7OzsR7iSADKVZAItHBqNWezy89vkqoi3
 WbDLl6B/Zk/Bt1ZXGiCenKVagI0f3sgeeA43Ox/xygr+wK0lOrFimuh4lm/6uaYVJNXg
 6KBbr3kOS09G4V9byXeaSL+PmKtzqQP7xQ35Dg6kTGI25/wEgmWeDrsvgp7swvMGefuv
 ipvZJdnyiyn1Zur57bvOl4/WIuplFaduFf7ws7yYtPqFLusohNh57hvJtPGyAZDfxyWd
 ac5w==
X-Gm-Message-State: AOJu0YxyZM+PJ3NSIX0vGE1MVd4eLiDk/YgTR3gkviQvH5RdCz3Iok3e
 OZzFk8M2u2rjxBaTp3haTfibYBfNxdytLatcL4LX/D1LN6FG/zUGysCzgw==
X-Google-Smtp-Source: AGHT+IGCFWT8kp8YUF2R9B6hsNpvW8gcekc+vTmcKUKaJW64KmKvNCZENHxdTRcfyGGIdZ9NiI/X/w==
X-Received: by 2002:a05:6602:6d11:b0:7f6:85b2:6384 with SMTP id
 ca18e2360f4ac-817120027b3mr908406339f.14.1721370760835; 
 Thu, 18 Jul 2024 23:32:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-819ac79ab26sm29587239f.22.2024.07.18.23.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 23:32:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 00:32:32 -0600
Message-Id: <20240719063235.3823015-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719063235.3823015-1-james.hilliard1@gmail.com>
References: <20240719063235.3823015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721370761; x=1721975561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBx3qZXNxJ0Mb7nwW8UnxLSQEoxRxSDvcLADQDCmpGo=;
 b=gsby/ht2OKUd2Wi3cpBXx1JtETZkk84Q899RasGXAPifQW5P53ZW2EG86u1ITF/+c9
 ypmB5RR9iwHi2AiqbSsX6DAvCBbR+tBXtHTS5sOBGQ8FZ7P4xb8C8HKhstZe8AUz2YZj
 yVS+cwb4xnOI3AoB+PYyjv26XVNNWOwlHrgj/fZ9EXWJDdUZZu8ZUdXC+Ax6LSS/KGAF
 GDNfA4gMlxii5VHjjRyPTyVtQy/8DWUtwX61fl+ESPakNlT+9UFkbGzjPONnOzZu7UGH
 SEkXXph/r7OMinH9vkYKyvOCYSlfZq712srWcNNTutikJkZ1p1QicNIQFz5HBOenVZm+
 O0Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gsby/ht2
Subject: [Buildroot] [PATCH v4 3/6] package/python3: add option to support
 lzma/xz in host-python
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be needed by the upcoming host-python-uswid package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python3/Config.in.host | 5 +++++
 package/python3/python3.mk     | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 88c286c55b..f3fcd63567 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -12,6 +12,11 @@ config BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	help
 	  bz2 module for host Python3.
 
+config BR2_PACKAGE_HOST_PYTHON3_XZ
+	bool "xz"
+	help
+	  xz (a.k.a lzma) module for host Python3
+
 config BR2_PACKAGE_HOST_PYTHON3_CURSES
 	bool "curses"
 	help
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f85dcfad30..7d6c9fe93f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -57,6 +57,12 @@ else
 HOST_PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_XZ),y)
+HOST_PYTHON3_DEPENDENCIES += host-xz
+else
+HOST_PYTHON3_CONF_ENV += py_cv_module__lzma=n/a
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_CURSES),y)
 HOST_PYTHON3_DEPENDENCIES += host-ncurses
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
