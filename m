Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992E2CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 18:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB57810EA;
	Sun, 13 Oct 2024 18:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lt-NMzKIsRGI; Sun, 13 Oct 2024 18:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246ED810EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 246ED810EC;
	Sun, 13 Oct 2024 18:42:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 373061BF3DF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32E4C60621
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WFEkdxosxvE for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 18:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3845760603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3845760603
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3845760603
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 18:42:40 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a3b7d95a11so12629935ab.2
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 11:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728844959; x=1729449759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W5JyaAviiqazZgR8HpWT3wBukzvHIQ0FqNdsW6Ltb9o=;
 b=exFgykbCAeu0/pZR7y73r944/TbTiwhCx28yirFFU4t4gpBNpgKrUES5A2RgQQkWkm
 oReFh4Uu1OOjE/EM1ax/UzeVyaWZMN0wTpyBGlyimtF+t53zMvPYmRVtNF9TMSyj6zxa
 7CwuQS0uL9vtDg0h4igD9y2QBsv53DeHlqOMkkc0g+mRJrlN9KRqF9LxLePfyRHqvefE
 cWyPpsZ2vfNjnNIum7u78Axjq/OHBSCr/BjidHjBy+Lx1UNoPqzYulyz979RkXUL0/Nv
 KGsgLahaf8smJjoMm3s6+zcGVFwPj64loRxJTPirWGMR4veGLWMDufgjH6FSERvmrpxF
 UEFA==
X-Gm-Message-State: AOJu0Yy8xLPOEPczzD+HJptd8CUvzEWCOr9Q3NJf8jzGTW2cS3/JgzNW
 7QhvXw+1avOdV4jMZ2SZkv4qFtzwvbs1gwdCYTHN7bjdjprU6bADg5ry6w==
X-Google-Smtp-Source: AGHT+IEm2SeynhxcQe7am90cagzizy4sDGFPoBOhREGAinQW4ib7IU+tNCPtnDLeg1roP2MsXX7UlQ==
X-Received: by 2002:a05:6e02:168e:b0:39f:5d96:1fde with SMTP id
 e9e14a558f8ab-3a3b5f7a6c2mr58552475ab.3.1728844958938; 
 Sun, 13 Oct 2024 11:42:38 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbc395e4afsm847228173.136.2024.10.13.11.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 11:42:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:42:36 -0600
Message-Id: <20241013184236.2789089-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728844959; x=1729449759; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W5JyaAviiqazZgR8HpWT3wBukzvHIQ0FqNdsW6Ltb9o=;
 b=A/mWhRl7m7G70PBvo3iGn8GqqdTXgMv2zYmhnxfAyw6fZdzgTEQezCRI8eUSfGYF+C
 Pk8EMCT5k+zHdZOxB61th8YFoA3gAbI2qvze1Qi6eDXOz+Ajk9miMJQPdUyW1tQhmSyG
 kAbhqzh3XUFx1K753vKgIPgIbJxPGeocRMP1c037/feVGHrAh1pYCGjQJoJBTYQHN/ve
 BRwx2gca5UpXP7ewFdEl3GPzAT8X2zXEanyZPjVrQQ/kzCnahCVtCBfA28SR6amaawNT
 HF6tA2qb+bQ+721old88IAxJYtCgzD2Qu5WAvNotaWsh39MXOSNF0+OxmWc1HI7kR9hK
 gh1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A/mWhRl7
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index cef737c2e3..f5c2adb0e1 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  4f9f633a30dd452fa4bb764f39fb0d3c  markdown2-2.5.0.tar.gz
-sha256  9bff02911f8b617b61eb269c4c1a5f9b2087d7ff051604f66a61b63cab30adc2  markdown2-2.5.0.tar.gz
+md5  1b6f79fa3baea447e6b4dda5132e2fbc  markdown2-2.5.1.tar.gz
+sha256  12fc04ea5a87f7bb4b65acf5bf3af1183b20838cc7d543b74c92ec7eea4bbc74  markdown2-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index b3d30cacde..228c5d0eff 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.5.0
+PYTHON_MARKDOWN2_VERSION = 2.5.1
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/da/00/3c708de5bffa0494daf894d2e8e2b6165f866ef3ae7939546fae039b5f0e
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/05/92/22e3645e352562ea9bfc89aeaeb9a76feb79e20907b18bc25d5ca340b50f
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
