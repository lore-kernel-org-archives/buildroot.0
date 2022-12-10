Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0DAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE814089C;
	Sat, 10 Dec 2022 19:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE814089C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ox9rNkusxSrS; Sat, 10 Dec 2022 19:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661DC408BA;
	Sat, 10 Dec 2022 19:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661DC408BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C8781BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A5440239
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A5440239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohexsDotyrJi for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:23:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69356400B8
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69356400B8
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:23:54 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id o13so1522848ilc.7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZuO29yBvmqPwUVeJ0WLKiZf9ycWyfjYeZl7O6uNXsdw=;
 b=pZ9MGoNYvx+9W9qCHgjs8K4BzE+qw7EC9W3DCNUCUdYDul+6wvHYqPCbN6JCgXWgqW
 Oma1uS67YBEQlAqdoYs23MTDO6JlTx8FqPVXGcc57nO3C7iZmuYtoYSG9fSWovmcb4HZ
 M5Y0VHWk3tv8hi3SCHH0WVoW7ktizqwQ9s4ENDgR3HjjEp7XAkPOcQdqqL5nnbl8HlwT
 GTfGTy3rn0ARe3lMFl5Y0vlIocrXQO1JaTvZVQRmoizPg9/v8U2kmJ2ghwY50PLE5pNM
 1PpRCtW9VtnDhUkk0Po7CeqPB3piS88g/Qfg5OZXuXbjcomu32rA090o2elvgex6UMkC
 3wew==
X-Gm-Message-State: ANoB5pnWtkTM75uJQqPzou4J8LauOLTYbWJme7XFDS8TLgzNlcv9/P0D
 E+UM+dJOGSAqNr6GTHR3EI/tT1aiXt8gWQ==
X-Google-Smtp-Source: AA0mqf7FgsbxhDDN8KlQq3WJOTIR5YcbybjKB0o6GdISr8irKm53zjzq8OieRJEffa6PMS48KsHHbQ==
X-Received: by 2002:a92:d0c2:0:b0:303:3785:5bc7 with SMTP id
 y2-20020a92d0c2000000b0030337855bc7mr5806883ila.20.1670700233184; 
 Sat, 10 Dec 2022 11:23:53 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o1-20020a92d4c1000000b00302f4f69f62sm1526236ilm.12.2022.12.10.11.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:23:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:23:51 -0700
Message-Id: <20221210192351.3102784-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuO29yBvmqPwUVeJ0WLKiZf9ycWyfjYeZl7O6uNXsdw=;
 b=FEMjBx8XX4D2+l2A/ZIqnyXdX8nOYrEvRp/IO8+PfsKTK5YgsGWQq0Og3NXfYILLqE
 cyZarErNIj5DA6X8YIW2t3pVPdBi68Me0CckEmLdIyOrlsauKB2BOrRe6WGA23iOLwO1
 4BrnEqiaGYvPqFfBiCT/G3x8rUD66OlnoaS8JnvSAn+QrRW608qvby6D8paPa0wB2aMy
 d5ulEP0s9Y9m25fuL99JkEocvgb7Wcx2Dj3xNzBIVF0O3v2Iawk8u6Gk71SwU/u+/N27
 IycXleJLDXjpbCJ3NVIi8vAV22BWtMV2LmaFmFJDy1uSaeTcKmUhcQvZSpYDfOdMEo+P
 lomA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FEMjBx8X
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.36
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

Drop no longer required six dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-prompt-toolkit/Config.in                  | 1 -
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-prompt-toolkit/Config.in b/package/python-prompt-toolkit/Config.in
index ad4f8162de..81d958884e 100644
--- a/package/python-prompt-toolkit/Config.in
+++ b/package/python-prompt-toolkit/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
 	bool "python-prompt-toolkit"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 8b91ee767f..62ba0c3cfe 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  0cc5e752cb2759e99658e2391644e767  prompt_toolkit-3.0.31.tar.gz
-sha256  9ada952c9d1787f52ff6d5f3484d0b4df8952787c087edf6a1f7c2cb1ea88148  prompt_toolkit-3.0.31.tar.gz
+md5  5a2bb559c0bcbc617f507a320c64ba03  prompt_toolkit-3.0.36.tar.gz
+sha256  3e163f254bef5a03b146397d7c1963bd3e2812f0964bb9a24e6ec761fd28db63  prompt_toolkit-3.0.36.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index bef761e20f..426fa41e0b 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.31
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.36
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/80/76/c94cf323ca362dd7baca8d8ddf3b5fe1576848bc0156522ad581c04f8446
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/fb/93/180be2342f89f16543ec4eb3f25083b5b84eba5378f68efff05409fb39a9
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
