Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB2AC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 640DC81E77;
	Wed,  2 Nov 2022 19:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 640DC81E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zsc332oIkJK0; Wed,  2 Nov 2022 19:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DDC781E35;
	Wed,  2 Nov 2022 19:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DDC781E35
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63B831BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CA2F4014E
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CA2F4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPBtupEqvXzZ for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:13:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51B84400AF
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51B84400AF
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:13:19 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id 7so9940664ilg.11
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swaf2FS7rsfKajl3wvn6LkhnP0hbDhQ2pmUryB/98ZI=;
 b=oxPKBMUNLnmXF3joKv7R2EP7Ydfafy7JcDGfPJw15TCGiAdvkeGSWzs6NjssTR0l4m
 iNc4QLyU3GBzX/TVKjNQetX9ZSVZ6gVfrNJfvuJP8EpOfULFFc3gI5a9Ip5mGY3K0iW9
 ScIEfrCHlKZ7GjsxV5Opj7UcmV1HqmFRvVTzhiYrc0/FEr8ueLtVumauo3ASdGXgFV7V
 IRLIgO+4JpJtqjhOAlgBXlslRV3hJUPgT5L7ywH3AM72QICI3UYawtMQdjyTeDIt4zKe
 OuqYz+RD6lpPler4XAdTdTB1vXTjnCWphpPIahCgKRkqDpgkgpAN9D28rQo6w8yBIdNp
 CJBA==
X-Gm-Message-State: ACrzQf1Qv2Bo4GX+7FMyUC/RMmiq7nqiD0mAq44kf9LpuKbUcKt7Nq53
 gu4Ywwxy1wYbjGSzX8zABj+oV+oal75EsA==
X-Google-Smtp-Source: AMsMyM7O3hTMRWgsGDEdO9j0Cejs877mvkjkmmJLs7X/1ORHGjS+f1nck6od0gU++1EpXl344fu7Ww==
X-Received: by 2002:a05:6e02:20c1:b0:2fa:f48c:b395 with SMTP id
 1-20020a056e0220c100b002faf48cb395mr15803316ilq.289.1667416398006; 
 Wed, 02 Nov 2022 12:13:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f6-20020a02a046000000b00349c45fd3a8sm5080886jah.29.2022.11.02.12.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:13:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:13:15 -0600
Message-Id: <20221102191315.3290183-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swaf2FS7rsfKajl3wvn6LkhnP0hbDhQ2pmUryB/98ZI=;
 b=Pt2eh8UnOQMJF7eug33AS+Gfgu279239GvGcmNf/pR7w7Eye2OJB9m7q/66M2CneAc
 Z5vXjRW85nGRMN17d0fqn5H/KVyLt0jY0bjUfN7bc5pWgp/W+mLW3I4tDJo9ZIRzY2g5
 Wuo1ATY3K8CApwj88yZ9IDzfer8cDvguM645M7gOTkdovhvyqRLP1rLlJMqyeS44BMCV
 b+SX3aeg0Y2jTiqCoA/2hpVSirDsSvcRy4ft4XnNvpS55D0JJ2qUWfOmNrd8EGiS8FMt
 6UdUaegkdHb6F7KL0L9lC6VIdpfOOgdOzSj35ZW+UzjV+pyiUFZnsrC9JGOnoy+XtklU
 g+GA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Pt2eh8Un
Subject: [Buildroot] [PATCH 1/1] package/python-cheroot: bump to version
 8.6.0
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

License hash changed due to links update:
https://github.com/cherrypy/cheroot/commit/b4b8c11c8b9bc5dae1f9b37861f78b828882e57c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cheroot/python-cheroot.hash | 6 +++---
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index 06d9453163..e538d1fcdc 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  7ace4b584a8092deb9f6b0142a627086  cheroot-8.2.1.tar.gz
-sha256  5b525b3e4a755adf78070ab54c1821fb860d4255a9317dba2b88eb2df2441cff  cheroot-8.2.1.tar.gz
+md5  70247d0948899f453b50e6181cddd0d7  cheroot-8.6.0.tar.gz
+sha256  366adf6e7cac9555486c2d1be6297993022eff6f8c4655c1443268cca3f08e25  cheroot-8.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  da6dc218683f6dab91c6367f00bf33095d980fb1f04d430c81c5e6994b8605e0  LICENSE.md
+sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 9eae887989..95f2e39480 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 8.2.1
+PYTHON_CHEROOT_VERSION = 8.6.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/9b/4d/2e51e7ce60f54a5279e91648b9b9b497d4d22bc624ecae6af1b6866144a7
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/99/c4/9b5ca09208047f2689c24ee63e195aa01ceffb7857d715cabc046559ddd6
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
