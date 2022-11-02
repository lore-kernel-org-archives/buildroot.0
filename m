Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236CAC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 18:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A04AB416C3;
	Wed,  2 Nov 2022 18:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04AB416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V0Jux3OpovML; Wed,  2 Nov 2022 18:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FF641697;
	Wed,  2 Nov 2022 18:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FF641697
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBA6B1BF4DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B660C4014E
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B660C4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVaeJJKlLx6a for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 18:10:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22191400AF
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22191400AF
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 18:10:38 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id r2so2298786ilg.8
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 11:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HaMtt3pma/dsGeP5PQj5hEJVh+fE0QG4OOaYGGBHblo=;
 b=MrURkNHB7nFnedZnyhhAvABQLSMUmpY43Zp6L7mjKcaLQlt8kUd6QVMwV3VJkyVE95
 FLJLpVT6PROo4wX5kxetkmCUUDvVXf7YzsYIe3wmN6pLQSHWNqVb1p41ANDeZeCkrq+m
 ZQjkVtQVDJ11Z/NVbtKDenTuEQjb+Jrf0LWkM9p5SZlfNOdt+3uEqMSjYS/ihaocKpcU
 k5UGqmNMql2uByDbimP2tEwcTTs+jT15AokjEflA5uggZzMza41HOBj+Tl9R9gC/0ucs
 taiaDdIizxr7bOBriU6ihQEUJxLa+kD0IvejNR6v+d+GsekW4Hxy9zFkgNLv2+yY6m9S
 lKuA==
X-Gm-Message-State: ACrzQf0TFK2ISevdk89S+9PskFs6ur0CN8diTooKrG8DEVJN4KMB8wH0
 OZw+EQxZUeTc8oNjwvL17Mvve7hLl943GA==
X-Google-Smtp-Source: AMsMyM433HE9pELVSZu7+9I2YFnr+EGxBUhKaPxtFhtmvHc/h7xNQzhMF3eF9hja/pDVV7A/JMNaJA==
X-Received: by 2002:a92:7611:0:b0:300:ccfd:9363 with SMTP id
 r17-20020a927611000000b00300ccfd9363mr3533606ilc.23.1667412636869; 
 Wed, 02 Nov 2022 11:10:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n13-20020a92d9cd000000b002f956529892sm4775389ilq.2.2022.11.02.11.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:10:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 12:10:35 -0600
Message-Id: <20221102181035.3823486-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HaMtt3pma/dsGeP5PQj5hEJVh+fE0QG4OOaYGGBHblo=;
 b=qSVwq03HacEBmMJEbcjPGXbIV0pxbx5Pt0HxkVcMdZg74O/MSkgyT2SxnH0pKgwyi2
 IfV5vO7ySCvkMoBXg8FoogoOOejpWLT0Y6U7EBl9toRv24jPw4adWJvFgodXMHNzqqHw
 awVajfQFO4ACjSUKAsgDkrJRrjuiGpvSQvIByFCpQD9jzo+ce3W5pFX2d6ka9KbbTfGc
 W1H2Wn6zuH2nXYKljjvOhQjZYygrS42ZyIyMkN4iUyT5zPEasZvS2DlQTF2uG5pj9UaD
 1h79O2CLdW9th5r3oPvgNI385q8LgxszubtcgzH+SwKt7ZsKa8OA5GtkxWyAPeRrrXXX
 gBdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qSVwq03H
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.11.0
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to template update:
https://github.com/python-babel/babel/commit/8f5757cc85402a46c1db722f08c18cfa7f119858

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index 5211f20110..2b2f56d8c6 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  7166099733d78aa857d74fa50d8ff58c  Babel-2.9.1.tar.gz
-sha256  bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0  Babel-2.9.1.tar.gz
+md5  9ee7784fd452d456206ecd3a12694010  Babel-2.11.0.tar.gz
+sha256  5ef4b3226b0180dedded4229651c8b0e1a3a6a2837d45a073272f313e4cf97f6  Babel-2.11.0.tar.gz
 # Locally computed sha256 checksums
-sha256  28c97bf33e7506e277487bdaa3a69b70f170d6af5a82785ac0a74c8428042e40  LICENSE
+sha256  2499aec3c5f041c3ac2c448a15fb233314e4c20cbac1530be04ec31b2788631c  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index a503a139f9..8bc881e61c 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.9.1
+PYTHON_BABEL_VERSION = 2.11.0
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/17/e6/ec9aa6ac3d00c383a5731cc97ed7c619d3996232c977bb8326bcbb6c687e
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/ff/80/45b42203ecc32c8de281f52e3ec81cb5e4ef16127e9e8543089d8b1649fb
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
