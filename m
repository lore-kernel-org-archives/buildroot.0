Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA783C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77AFA60AA0;
	Sat, 30 Dec 2023 20:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77AFA60AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKjHCkDnxBM4; Sat, 30 Dec 2023 20:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB0FA60838;
	Sat, 30 Dec 2023 20:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB0FA60838
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7271BF5B5
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1224540189
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1224540189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWPQNp3KPLTF for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 20:39:51 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A94B24017A
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 20:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A94B24017A
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-336dcebcdb9so3781584f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 12:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703968788; x=1704573588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZuM9gFVg5SLyXAZST23QHJpRZy+FuJKz4xV2bz1AZhU=;
 b=O7s595kTBYmIol5+tD8RED34HwDz4M8GjqeZBzCe12v5BX649kJdJf6m/tEtzwQiFD
 wfpCPUUmAHVIjAgXVApbA82TxKiZsXEGCzI0RYUHdKIzfmt4FasPnrYfLIkCGdE5p4eJ
 lEKBILP3IsJaoJudK5s982YjLT83g1ybkpS7d4ENQkOO9yR8HRBQ/5XwRABsZxNhMP4J
 hUtHhufxWGdkfjH2dyW/ZivzQ/2UPYkq6jQ3UuUsHrPLUVjfvtaWzDqdUrpR5XruyWsQ
 InN7psz/nErht6aEGGOS5S6aTXwlKwcISJh1x4oPn70tU8uGyH9DwYREPgI3vEiMIOns
 g+tg==
X-Gm-Message-State: AOJu0YzuADUItot4mwFifhnUhXnUPiKEQY3OeSn6ylMQc+MvZFZvRHRA
 33acCVOBVdXSdE+kNVqz586xMTZd34A=
X-Google-Smtp-Source: AGHT+IGoPRpxDwGVtazZsWSstEbXVfDZvF5mD3vR6lZ8IsUXgUnZJlpZSUAY21Un+GN95OMyC337zA==
X-Received: by 2002:a05:600c:231a:b0:40d:60e2:d643 with SMTP id
 26-20020a05600c231a00b0040d60e2d643mr1408603wmo.26.1703968786950; 
 Sat, 30 Dec 2023 12:39:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r8-20020a5d4948000000b003367a5b6b69sm22070376wrs.106.2023.12.30.12.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 12:39:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 21:39:42 +0100
Message-ID: <20231230203942.1211689-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703968788; x=1704573588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuM9gFVg5SLyXAZST23QHJpRZy+FuJKz4xV2bz1AZhU=;
 b=XpCjrlDcYqpMS3Fvru005nk4o7CTFcT0lKBe9FZDo715DTKg8QllweKHJ3YInNJ2D/
 Iwn+ftwsNioZ479jWiZZPnEq4Asj6dqm2J1Bmfl7IB0enB4or9U4Vjuy+7nYVcNMtYOC
 IOYqBZCtcJ0bEseVXY6h/gkW8l0KwamUprg2wn1eL+TI39QBW4cz2LrnycynyQOI2m+N
 oJ9Bk8Ry7QPwm58ki7l6/47lE4oGC2lSs+cKGTpcs8jYLTSCKXHs7YWWwYdreI8NIioL
 L3G86reMZZF9VndVRqHyc0k90orGEM6eg1ix4CjpCgi8qztx+qeayvgd7d3F4nMf9U8q
 daNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XpCjrlDc
Subject: [Buildroot] [PATCH 1/1] package/librelp: bump to version 1.11.0
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/rsyslog/librelp/blob/v1.11.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librelp/librelp.hash | 2 +-
 package/librelp/librelp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librelp/librelp.hash b/package/librelp/librelp.hash
index 23ce8c15f8..8dcc502583 100644
--- a/package/librelp/librelp.hash
+++ b/package/librelp/librelp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  148db4e4d1a23e8136e9ec08810929a55faf5d45e24c2e3186d5ab34355dab31  librelp-1.10.0.tar.gz
+sha256  7719b5f31e07cbb9872289ad32b787c613b5355d407982a0a2c4d69938457fd6  librelp-1.11.0.tar.gz
 sha256  1ed76f935566e93e3c3c0d9f8fad22eb6d8bbe406e2eb8470a4a2764d9fd9685  COPYING
diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index f8bbdb131c..cf2e391f34 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRELP_VERSION = 1.10.0
+LIBRELP_VERSION = 1.11.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
