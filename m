Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D23C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A568340A00;
	Sat, 10 Dec 2022 16:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A568340A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zRHYyjPZzBI; Sat, 10 Dec 2022 16:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A24ED4109F;
	Sat, 10 Dec 2022 16:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A24ED4109F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DF401BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14E0F4109F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E0F4109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DA4icmQZ3BH for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:36:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF57D40A00
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF57D40A00
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:36:14 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id x11so1380930ilo.13
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0FoHnhBEAYA+tYcSI232eq7a2BM2PMaRQ3+2RceqPYw=;
 b=s75DDd8DBpIkxrqN//u05WeYsFBdvis0b54E9tZiE8edT5xS29lRNZXh0Qm/ZG1xQ6
 vyl5RqwNKbTVwHAECqT7IBhx8+LUiX5ct2eCXfr6BFAz9A2ilPTbfixQD7klAnrHhKz+
 gBD+PYJphl9RfbRts0I3y0W4HUDjHxOgHm5SUF5VPetcBa5WsHNiGAT5ySSJ+B67GoN/
 CJLkisb/ZPeKNAcS3xHEci7FwkGoHWnso7CkIQrF2bBr9/h2kY6qM/k4Ol/M+GsNBToz
 QRfmIYFcMYEWTzwjwlVb4hMsukkjj1gASqhd8yhvD0R9nB50PxYBSVGCvV2lN9RyWVkB
 OV8Q==
X-Gm-Message-State: ANoB5pmNumlev7JTSwiLjC8OoFI52MMr9atCaDWTTIGBlPi/0uz/CPS0
 mnj1Mq4lV6FIVUBi7Jt06OIR6Xtfn/2/LA==
X-Google-Smtp-Source: AA0mqf6mq3PoIg/QUd/9VAFEqhNLYPwnutV723B7ZJrm/NZGprykzGmPFGOFCpMSPfaX9mpGcRUiyQ==
X-Received: by 2002:a05:6e02:dd3:b0:303:def:8e5 with SMTP id
 l19-20020a056e020dd300b003030def08e5mr5982215ilj.2.1670690173419; 
 Sat, 10 Dec 2022 08:36:13 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 cs28-20020a056638471c00b00349c45fd3a8sm1539618jab.29.2022.12.10.08.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:36:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:36:11 -0700
Message-Id: <20221210163611.2500041-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0FoHnhBEAYA+tYcSI232eq7a2BM2PMaRQ3+2RceqPYw=;
 b=mnv1QZQ55Q0SXRTlURl1rbO+QwWwg+DTMfgXhCPfwWLempnnbj82e+WlgR2iWH5mXT
 ee6lG6V1mPy8duy9PdLVemauhfxvGY9gsKObn6mDB9WHURyLyYxjbyliH/7joe/iyVy4
 Mrl9qh3EKE5JBH/wr2tZKjb1jJmpVE6SbfFT0t/7MIn9hOo1gXSO7Wq3wKh6oSUwYGkW
 L7Ap37jbJaR02yLE/CHWorvjbyoomaGlIIseiuwAwG3JtEIroh8E5xYok8dqyOG6eUgv
 cAqZBDO00FgRnro1W+7WzmI6Pwot4qT+F23ZRlBYEwT2UiVKEtw/oVZZa0gMuzhfU4Ez
 vfLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mnv1QZQ5
Subject: [Buildroot] [PATCH 1/1] package/python-cheroot: bump to version
 9.0.0
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
 package/python-cheroot/python-cheroot.hash | 4 ++--
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index e538d1fcdc..c3556109cd 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  70247d0948899f453b50e6181cddd0d7  cheroot-8.6.0.tar.gz
-sha256  366adf6e7cac9555486c2d1be6297993022eff6f8c4655c1443268cca3f08e25  cheroot-8.6.0.tar.gz
+md5  1617fdbaba7d6edbe5b0ff48f7563111  cheroot-9.0.0.tar.gz
+sha256  3d47ad9ee19ecbec144b4758399036692fdbf67a40b96eef1fb1454367b3d338  cheroot-9.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 95f2e39480..f75065c7da 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 8.6.0
+PYTHON_CHEROOT_VERSION = 9.0.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/99/c4/9b5ca09208047f2689c24ee63e195aa01ceffb7857d715cabc046559ddd6
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/8c/e7/8e6387d59a352c5799e917a23e7b76771a8bb97322c1ce7e42934d0066c3
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
