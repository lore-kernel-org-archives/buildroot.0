Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E03CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FAB040124;
	Sun, 22 Sep 2024 03:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pj8tl82maUKg; Sun, 22 Sep 2024 03:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6317D4052C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6317D4052C;
	Sun, 22 Sep 2024 03:35:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2591BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C8240672
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3R6uU6SGo2F for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:35:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EEA840670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EEA840670
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EEA840670
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:35:49 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82ce603d8daso120297439f.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726976148; x=1727580948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r3TFrf8pRZGouPvMlh8K0VDEDpu3MxOnHS4dNwDzZ/w=;
 b=X5xWLhQPTcIlYYanSxg1NrdFA21gnxyDzoVXfAZ0AKvemPM7lpRAmREsEAC7QsLver
 9GFzlqS+zVCukyDatBtUuijyIT2/wdcejLeOcQ6PBiYPD4+7vlSQHVZX333PBXSJOXzF
 5r/8kG96V68wZeeji8t3+SctWCYphLnxzZWn1SCaoreLHLQuVPeIKoAqP4UFhDwynXKB
 2ZawhV6q9ryfOqUBXlVDJ9Jgzq+MUvoNMzkPD+Y5b9yRriE1WmR/hTdIB7ILl8214sGK
 IfrKcO+HQh8BDKCoDZto/N8YSB2vl2YpmA4WhIWU2dYpg550YI9hpVg2XKAb3tBeRkIT
 btcQ==
X-Gm-Message-State: AOJu0YzPTdZXdn9/qU2Ek0KZUS8Milv/phbPO5MhoCt8zMhclMVANTZa
 vv7xQ9J2t6LVTMyXY0fYIana2CMGAFEUXpd/1ZpbGJfhDghf/3qk8o+eNA==
X-Google-Smtp-Source: AGHT+IFlVAyNWeDKC42k+vlXJU9VIQ81X2yjst1oU6m6rwHUrXuixiZ0bwnBX0mBUPr3uXxFPKYuPQ==
X-Received: by 2002:a05:6e02:1d0e:b0:3a0:a2c9:5bd1 with SMTP id
 e9e14a558f8ab-3a0c8c5d2a5mr67364765ab.3.1726976147813; 
 Sat, 21 Sep 2024 20:35:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfdba4sm52207175ab.8.2024.09.21.20.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:35:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:35:45 -0600
Message-Id: <20240922033545.847153-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726976148; x=1727580948; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r3TFrf8pRZGouPvMlh8K0VDEDpu3MxOnHS4dNwDzZ/w=;
 b=QKajj/IvTVcGqzjzzpn0jh4MwuhJQQGPSRbHRT5vBv92auar0ouYlj9ekxU03mgErk
 OoZpjJW6EH/6bUdZHDFo765i26ZQruFtiUI5WSgOrga15Qs15w44UU/ksnsJt3qBivsC
 auSaDQ2r7JGqLum3BQ25ES+uk9D2FPBJKm8bKn3ZUE2I//btd38R38OerSZtKuLEqZNn
 4YyFF84+HOY18OJ/RCt06wukNAHA50RJ7kJdX6rJZARPNaE/HqS30GlkyjWBQw+JHnkq
 Twzk9/Cf0UsCDumeQQ3WijkCxhxsECb+19iTgK6W4nTQdEWaSxpDoozkaBi2DYIRN12b
 R1rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QKajj/Iv
Subject: [Buildroot] [PATCH 1/1] package/python-texttable: bump to version
 1.7.0
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
 package/python-texttable/python-texttable.hash | 4 ++--
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index 560749b238..538aa78458 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  83eb15fb541dd857ff051a8d0c979b9c  texttable-1.6.7.tar.gz
-sha256  290348fb67f7746931bcdfd55ac7584ecd4e5b0846ab164333f0794b121760f2  texttable-1.6.7.tar.gz
+md5  e5d380c04fab132ccf0bbfd4f761bd51  texttable-1.7.0.tar.gz
+sha256  2d2068fb55115807d3ac77a4ca68fa48803e84ebb0ee2340f858107a36522638  texttable-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index c63fb5786c..1e4e7572c9 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.6.7
+PYTHON_TEXTTABLE_VERSION = 1.7.0
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/e4/84/4686ee611bb020038375c5f11fe7b6b3bb94ee78614a1faba45effe51591
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/1c/dc/0aff23d6036a4d3bf4f1d8c8204c5c79c4437e25e0ae94ffe4bbb55ee3c2
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
