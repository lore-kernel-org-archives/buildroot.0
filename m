Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4A4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0DE78254A;
	Sat, 15 Jan 2022 11:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aW7W0DnRGYch; Sat, 15 Jan 2022 11:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA9B582521;
	Sat, 15 Jan 2022 11:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE861BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C7C40884
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7r4apNIxIbJl for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:44:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00C714087E
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:44:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so12496881wmo.5
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 03:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alhgeH0SbP9tCsfpLPsvX6U2hDTAnxFdySKvqLfAPso=;
 b=ph7ggbPGrXboKqcwVLfrbBSb2AMa5H43RVDmeU/yWrsGJ2pxQCTRtMKUzmLEp/BcPG
 rnpEDJO2vMTmBFlZF0PK8cSdNpn2YdugYpAM4W4tosYaek9dLASrpFnNRgnKH7EzIsjb
 e6NAZ/Kh4oLnOgra5vDU23aaw9ZFHbb92MKSwkT6Ekhf7NEFLWa8ld+P49PjZjENGZwm
 X5U8HAqdj0kaii16zlG8zs0szoS4xiiTyqomW+ln26wR1fm74G09tefKHhmHYAeYX6RP
 PzKaX+IFWN0gGP4y4TutXaLbfHWSAYqjH4p1h7lAfBfwGjjnMKWrINJ0+qKkStJNhzR1
 algw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alhgeH0SbP9tCsfpLPsvX6U2hDTAnxFdySKvqLfAPso=;
 b=SI0vPGhN6g8xbmVtE0Lp62geiC513Z+K6kepLj14Sa11zN1CvbaA/ET2dAw3BvJFYR
 WbhRt9j8z/H66Q0nJpXLn0FEwqa2mUW6oE1Tc8o9JKr1IUjJQgnfm54RkEki1Q5W1PHy
 is39HzAaF3YfDHpq99xU/732pvfJ1f3CoWvHA/s8d4P0p4DMsFYO7sXQifrqnZKdNDXr
 LKM8YnKoHh8z2AvBI06jPv44CYx6cwu9dAlgMGsQTo7hmEcImvlsvv9Age8d9kJOxVjb
 aEuS0GaGFIteNrMRhwSXHmXf0pvVoxtdRiNNZy37stOYDidwkvfqmJYkv60MX8T2Tk0k
 r+Mw==
X-Gm-Message-State: AOAM532lXS+i7ZfU0GJc1A2Ij3pqxhoa2JCvDfPDURS7C43+2d76CyY0
 HqUGHQcg42Oiq0Gm7rQ3kJzpJZkeoQU=
X-Google-Smtp-Source: ABdhPJz8cZZzEFizXfPr1lCPgJdka2N7eZXk7Yjr+hBXqCviVSVqta2jsUijnez3GlTfhWN84BV5Rw==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr19132532wmc.141.1642247068157; 
 Sat, 15 Jan 2022 03:44:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id f16sm5397057wmg.48.2022.01.15.03.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 03:44:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:42:44 +0100
Message-Id: <20220115114244.1912724-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 3.2.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - CVE-2021-45115: Denial-of-service possibility in
   UserAttributeSimilarityValidator
 - CVE-2021-45116: Potential information disclosure in dictsort template
   filter
 - CVE-2021-45452: Potential directory-traversal via Storage.save()

https://www.djangoproject.com/weblog/2022/jan/04/security-releases

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 3eea17e70f..89bc5ffb19 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  eaf0c3b4ac6b22cae9068360e6fd2d1b  Django-3.2.10.tar.gz
-sha256  074e8818b4b40acdc2369e67dcd6555d558329785408dcd25340ee98f1f1d5c4  Django-3.2.10.tar.gz
+md5  6c4a53d2ccb464bc3dd772c6f2f07df9  Django-3.2.11.tar.gz
+sha256  69c94abe5d6b1b088bf475e09b7b74403f943e34da107e798465d2045da27e75  Django-3.2.11.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 4f80208f0e..25a645823b 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.10
+PYTHON_DJANGO_VERSION = 3.2.11
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a5/8e/c6dfc718d572e4b33b56824b9e71e5ab9be8072e6747fc6184d206c3fdb3
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/20/86/e4348aac45bc83fc8e9dda2cfd81004b007c65b68c1499a4233acabdaa3b
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
