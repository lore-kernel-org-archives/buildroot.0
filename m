Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E985C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 14:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267EE414D6;
	Wed, 27 Dec 2023 14:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 267EE414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hbAImAZPT-q; Wed, 27 Dec 2023 14:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3951A40961;
	Wed, 27 Dec 2023 14:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3951A40961
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94DE31BF4D6
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E51A40961
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 14:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E51A40961
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0oCpgYITyfQ for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 14:06:55 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61E674092F
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 14:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E674092F
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d5d898162so5039525e9.3
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 06:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703686013; x=1704290813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJmfyP+10e26I+Sz7AqT+icB5cLK0A+NDrDO4Q0j57Y=;
 b=Vuny/tbgfbKzZcjyy0b6w2/KrKzuvZeD2IyXeyIH7695ETOm2j9UCf+rxP2Oia1HBS
 sy0zc+Z2zosRpCl9rozn7GKdXvDkS9yeNvdfnw6xSvFUJZYE16hTQI3nyWxJp7l1S+P3
 bYhkNvhJGl45Bk5qNgCYzNLlQrnZ2cMp5CLHRJX9oVUciBISSIl04rZVZRBgIOJEipFa
 uG7K1/WSHwTCUOj4g8seqXFskHp6mXEIYUlLR4TrvoYxIhAsTMK56GtdPq4jxM3iAmFS
 m3pUbIw/VPUOHwIORBIv8G0MpqwXwwz0oot0H4Qh8X1jdU1OkrF3wY3oPVJe54viZf18
 sC6A==
X-Gm-Message-State: AOJu0YyTkM8pTHPQCRu0aZe0NWHHBL4SX9XephHxR8vX/QoSNWhI1aE7
 BRZ4cOGdP0Ih2PZxL3rmiNEMjYETafE=
X-Google-Smtp-Source: AGHT+IHx5rD3qNxceUEzyfwoLzU/hjmvI7PoPU5lgzz732Fao7GV2FJyT0SC3kEWZqecpNdh8OkCqQ==
X-Received: by 2002:a05:600c:34d4:b0:40d:59ed:e8e6 with SMTP id
 d20-20020a05600c34d400b0040d59ede8e6mr1608223wmq.60.1703686013056; 
 Wed, 27 Dec 2023 06:06:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b004094d4292aesm24078081wmq.18.2023.12.27.06.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 06:06:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 15:06:51 +0100
Message-ID: <20231227140651.1303381-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703686013; x=1704290813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJmfyP+10e26I+Sz7AqT+icB5cLK0A+NDrDO4Q0j57Y=;
 b=RD2m+iiA9dPwM9ECFbNTDNs6xD10x5wZAUm+SqDk8s9jlL6bjZ+DPlpGH1E9l8o9jZ
 zUoVJCvs0HTmDbbi5CkU2ws+fW4gepPDgUqhDGASYkWVDdUgkqw/HBSZTBAGydpyqM/H
 7ATSY/dgaz/l3+PphoX/FBrDmDKuhHQqhdJAu4b77cGoRx+H6Of2OpierEbnrikMxT6k
 vc7edXup7fNQ9heS+7BQyoIUT0Z2DW51cY4QDzfBVUCLGMa+ApGicq/cTGmVFddn/yXo
 i++Eo5pbRmzcKbohjgNdlCF/y0d+JQCeatur2K5DALzzKIvJntm1EqFLauoZJHChh2wS
 Il0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RD2m+iiA
Subject: [Buildroot] [PATCH 1/1] package/mpd-mpc: bump to version 0.35
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
Cc: Thierry Bultel <tbultel@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/MusicPlayerDaemon/mpc/blob/v0.35/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd-mpc/mpd-mpc.hash | 2 +-
 package/mpd-mpc/mpd-mpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
index 4f4af9a91d..0ccda3c785 100644
--- a/package/mpd-mpc/mpd-mpc.hash
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  691e3f3654bc10d022bb0310234d0bc2d8c075a698f09924d9ebed8f506fda20  mpc-0.34.tar.xz
+sha256  382959c3bfa2765b5346232438650491b822a16607ff5699178aa1386e3878d4  mpc-0.35.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index 00d1964fe6..a58423b4bc 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_MPC_VERSION_MAJOR = 0
-MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).34
+MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).35
 MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
