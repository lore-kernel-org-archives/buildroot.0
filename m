Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985B1C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 18:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5257E60BEF;
	Sun, 26 Nov 2023 18:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5257E60BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THxUjEbkX5fU; Sun, 26 Nov 2023 18:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A23D560B6A;
	Sun, 26 Nov 2023 18:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A23D560B6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 878421BF40F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F2DA404FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2DA404FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVdNQGDJxz9u for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 18:08:48 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AA3B404F9
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 18:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA3B404F9
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-35cd70d7735so228165ab.0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 10:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701022127; x=1701626927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ij2omiHskHLTWbe7z9SRmNJpmDyX9ZI8SWRzUcbal8w=;
 b=Gdtio5/ytU4ZpXERVfk3b6QWlCzmAX0vPjlGLBVXa2Ni11inEtN8tYlVG5OB2qkrIQ
 tM00w6wRpoja8S3GOvRQgWu7ogi9Xbpex3U4yA1N1Rg3ZBQpx0KWQt6rnr1BYsf13cwY
 n5ldlAEqq0p0022PbRjfWPih3izgPiglvDztEDP1oqvfaWjccuHzgn9cTjSDSTvjKADH
 4ZONpFS4HFSmXt7CAzKOrcKX4df/dlQMW7u4J8hDjtBtRoDlcIBkypixXH+8Sh0XMvLy
 Sg+pI2RU9okdHOR5iDXOzMWF6tF13cJKPsty9YlaArz/fG2t9+2z27l1P3MC0u+CoS3F
 QTwg==
X-Gm-Message-State: AOJu0Yyvtcq4cHbTverNhl1KFgq62IN6fkAx4uMV76JYnAUjdHra+AOx
 TpSsyqbPeTlACHXGGEYIp+jD+jV2aPk=
X-Google-Smtp-Source: AGHT+IE16Hes9vCQB1ka6xMMlnjr2u9Pf4NiBEFgFuCRDb57XQ7IzFT3J3XrF+BHeD6b1slQaR8Qqg==
X-Received: by 2002:a92:c642:0:b0:35c:d832:5d5d with SMTP id
 2-20020a92c642000000b0035cd8325d5dmr219360ill.27.1701022126957; 
 Sun, 26 Nov 2023 10:08:46 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 o9-20020a92d4c9000000b0035ccfc69f95sm153207ilm.20.2023.11.26.10.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 10:08:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 11:08:38 -0700
Message-Id: <20231126180840.2081945-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126180840.2081945-1-james.hilliard1@gmail.com>
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701022127; x=1701626927; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ij2omiHskHLTWbe7z9SRmNJpmDyX9ZI8SWRzUcbal8w=;
 b=GEPBFeUCa4w8LyIPi8qBDzKagu2bwpisop9f+nNF9vXjmsu0D/aUO0rttoGKuqwU6c
 OLowT3AH9jnt03X9xt9NOlw58mEeOzs62AGyqlnILxAw2WQzgd3pe5BLJEKB3BUrmOoG
 OM23f+S0pAsR6+/CEeJ22yGN3nCm7G/L62oQdmB7SO1rdIjJY7XJlLtDBCdK8oHhmVs4
 GQL185kUTKQswYXQ8bfXxHdA0aoRNCUqezjDCTf5//Jc07Y6IOkXpcu9blh0jlGLMxY+
 kocv3f2VXD70IMgR0s47W+OblFiO/2F4obIfWO/yHQ/tg35dBxoR1uw8XCcjAM8k7uzd
 iTPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GEPBFeUC
Subject: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host cython
 dependency
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-python-cython for python-msgpack to build correctly.
This is a hard error when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing msgpack.egg-info/PKG-INFO
writing dependency_links to msgpack.egg-info/dependency_links.txt
writing top-level names to msgpack.egg-info/top_level.txt
reading manifest file 'msgpack.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
warning: no files found matching '*.c' under directory 'msgpack'
adding license file 'COPYING'
writing manifest file 'msgpack.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	Cython~=0.29.30

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 061ff5a761..c915b23bf4 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -10,5 +10,6 @@ PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/c2/d5/5662032db157
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
+PYTHON_MSGPACK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
