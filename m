Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DB4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72012817A9;
	Sat, 10 Dec 2022 20:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72012817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TpY_jVE-joD; Sat, 10 Dec 2022 20:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F1C781413;
	Sat, 10 Dec 2022 20:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F1C781413
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 124E31BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF53260AD1
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF53260AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFIxSHHLowEO for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:48:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D3460AC2
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0D3460AC2
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:48:35 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id g20so3876569iob.2
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Oq2t5i7KszQ3cHVoAwCsoS23yUr5h4pEssOZHwy8YI=;
 b=jPorShLu+uoUk74pAjTKU9Zwmg9xuf7LUpx825OyJZNGANGSvv/VDPTCUljJoQHGDr
 Gqh2hJ3C1YZLahk8JJa0wxmFJjV/goNzF3dOmw9b6fp/k5lb1TBDlyMQee0GN6fs+lJq
 nr5+rJH+j9VOopJ481eV+RlxY1d1ntl/baBuLUkLsT7zB7HjpjQkeZ7i7J1VMpGcccmr
 iZtn93TvNDeBBT6GEW80GL3VKIwIFc533dO+6v37yUQ2IY/n/KHfgU8PFdnn+N3ztEJX
 YE+HfEw2VbpyXj1x7eyczlcw6HUEDlEZcg5dQkSiDUqDoob2/LZtRM9AoFtZ9pV1qu/b
 lpNg==
X-Gm-Message-State: ANoB5pn5O2U6klM5tMsSxHRQFcDuJwcqfIDknZfIqMfViQ5Hd2u+wFFJ
 l0E/X7ji2Wluc40Z/1MVI4XVsiOg8bG6VP+q
X-Google-Smtp-Source: AA0mqf6wOiwJBV2RP82GIe3bZiKp4iUalZE0nySp668Xw4NlOBbIe2ulvKIgKnm39Ky5N9Sq4ezwxw==
X-Received: by 2002:a5d:8409:0:b0:6de:38a1:1c28 with SMTP id
 i9-20020a5d8409000000b006de38a11c28mr6384960ion.3.1670705314854; 
 Sat, 10 Dec 2022 12:48:34 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c4-20020a023f44000000b0037b319410c3sm1663185jaf.44.2022.12.10.12.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:48:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:48:33 -0700
Message-Id: <20221210204833.3609864-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Oq2t5i7KszQ3cHVoAwCsoS23yUr5h4pEssOZHwy8YI=;
 b=IdJBjKm8+e0tiysSpxv73wca2atkeSg40e2m9TNCa/LHRWJbZwT2/1a1kZBERIZxaT
 CtobPAePub6GbzJ7hwCYJkWxQyLDQXDN7eD9sdCgjtqrNyMKEYnk581jBl2k6JF9A+0L
 pCk8BEcRyilL4OjbtltUQB3ts/+6gviVMG3jHWo4l4nThhEEYzcrRhGzTkjeInqAt9AG
 IgYvbQXOT2rfE+Cm3nqms/5WcjUoFhjxOSkQJuqli/quDZysbDXmHtM8Te4dlKc8g+e0
 ssO30+EtKm9k6qAU6C+cck8a1V6NQKlsdWiPAACnGSWwqvbFTvHzp5U/NX3kDB942iXF
 VIAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IdJBjKm8
Subject: [Buildroot] [PATCH 1/1] package/python-texttable: bump to version
 1.6.7
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
index a769e91772..560749b238 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  15faadc07ba44d337cc1675ea6092a02  texttable-1.6.4.tar.gz
-sha256  42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9  texttable-1.6.4.tar.gz
+md5  83eb15fb541dd857ff051a8d0c979b9c  texttable-1.6.7.tar.gz
+sha256  290348fb67f7746931bcdfd55ac7584ecd4e5b0846ab164333f0794b121760f2  texttable-1.6.7.tar.gz
 # Locally computed sha256 checksums
 sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 59df5f6ff5..c63fb5786c 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.6.4
+PYTHON_TEXTTABLE_VERSION = 1.6.7
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/d5/78/dbc2a5eab57a01fedaf975f2c16f04e76f09336dbeadb9994258aa0a2b1a
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/e4/84/4686ee611bb020038375c5f11fe7b6b3bb94ee78614a1faba45effe51591
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
