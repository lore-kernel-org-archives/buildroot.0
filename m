Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B62BC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 04:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3A1160E86;
	Sat, 29 Oct 2022 04:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A1160E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEZ5ajolimk8; Sat, 29 Oct 2022 04:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC0C60769;
	Sat, 29 Oct 2022 04:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC0C60769
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA3D1BF982
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 04:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 535A34148D
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 04:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535A34148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWGBBrhY8WjP for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 04:01:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BC54146F
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38BC54146F
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 04:01:00 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id d123so1381582iof.7
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+QgpCb//L7ZUCT6eCelCcaK/9PFeO2Ev11BD24i0W5M=;
 b=FdDTfmQYpU1P+dzQ4+K4o4ch4/G+nxo374fp9P2eZxWCghYnudUPqBaSikPUpEEUX+
 EVfibpyhWMGykuMojjP2eVzvR3edP1Uu3d4jVQZGK5po4VCCfDxeejHxzK+e+nVm/AlD
 g1yTYEMhrjk0ltQjXn7TORYtm52Turtuc7NANdiqb4V0WSc8wYC/Ukp/FdunTyGpTsF3
 gOBq0cnj12cLlLszzEylqpz7pdFOtiiWnAgTzvmwYDZkxVmohHX6zyW2CNw7KTkm4xYW
 5/3Z6M0bf9TAic94tW5iuojSLLX+auVEAufxe++pVu1Jw/6pIC+a7l5T+qTzAm4F5YgY
 SK6Q==
X-Gm-Message-State: ACrzQf0F9BHyDyB+AW5z9Osf0tVFMF7PTDH3BCq4KbsG0peqBSD90TlH
 eeMxeC56C51JWeRjAleo6ZUJs83Ae+bgcw==
X-Google-Smtp-Source: AMsMyM59Y9CDbO249PKH94JJ5kuNe9LkJ6XHMPEmKLaJs0xSwoSOT/Qa84RyYLPDA0p7ZahX18CopA==
X-Received: by 2002:a5e:8517:0:b0:6c6:fbe7:1c0e with SMTP id
 i23-20020a5e8517000000b006c6fbe71c0emr1036382ioj.95.1667006066950; 
 Fri, 28 Oct 2022 18:14:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q8-20020a02a988000000b003636b73cf29sm101605jam.8.2022.10.28.18.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:14:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:14:24 -0600
Message-Id: <20221029011424.1394984-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+QgpCb//L7ZUCT6eCelCcaK/9PFeO2Ev11BD24i0W5M=;
 b=SijqA9+LjUONLpeeCFjhy/C3FfxopOu8/LQcILuVNnqIoADRTG8klKrJwjBUAMk/pw
 oHM48qE+fqQHmxx0/frhIhc7KOFs9TzZExL2e+mNtEUUHCc1RtrqoP9mP99VRx/b+iWH
 /a9QwepoSc8iG7PNzHAj2onRVLFmRLqOh5tRi/Bitv18r31SUwkD9SWFVKJ2CNtwPRw5
 Ht+FkvgP7ggR8dPajwIbREnXVLGlxptqCbghPe2JPmOSvwI1USaxQcoO9gzZgy24rSYw
 Wc/5Lf0oe4N7effl7D/VuMJ/EuGlzMrJjJS/9V83623SNIY+9+oJfZRX0DXlsYjH22K+
 oRXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SijqA9+L
Subject: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to version
 22.1.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index 268136a406..d1594c3989 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  697deeb4fdcb620c45f114f173ed7c0d  aiofiles-0.8.0.tar.gz
-sha256  8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a901e59  aiofiles-0.8.0.tar.gz
+md5  b22db90039c881f6aa64431c6b23f30f  aiofiles-22.1.0.tar.gz
+sha256  9107f1ca0b2a5553987a94a3c9959fe5b491fdf731389aa5b7b1bd0733e32de6  aiofiles-22.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 996e5eb6c0..b65d2cfa82 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 0.8.0
+PYTHON_AIOFILES_VERSION = 22.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/10/ca/c416cfacf6a47e1400dad56eab85aa86c92c6fbe58447d12035e434f0d5c
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/86/26/6e5060a159a6131c430e8a01ec8327405a19a449a506224b394e36f2ebc9
 PYTHON_AIOFILES_SETUP_TYPE = setuptools
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
