Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA425C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 00:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E8860DFA;
	Sun,  5 Nov 2023 00:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E8860DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNeRfChlSFGU; Sun,  5 Nov 2023 00:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A713A60D64;
	Sun,  5 Nov 2023 00:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A713A60D64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99D571BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F0464193F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F0464193F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viFGiQ3Px77d for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 00:28:59 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 785C14193C
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 00:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 785C14193C
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7a93b7fedb8so123644139f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 17:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699144138; x=1699748938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S+Sf1zmFQMqhHR3974NU50p4eeDhgjlaKpwqaqBOx3Q=;
 b=dhojsSclu4tEYSlF9fkO4l9o+dgbpPsXgkxUzYxZTK+cab56UPdHO5bzQeNyl69/i6
 RVpM/qXoFzxVvMcKI69upECvf+6vw4IDoXE3Tk+Ytjd83nZfFi6XuSc5ND4JTo1pbpPN
 4oK56ZqxXxx6vlML6DhyjJgX8IQvegghYIPn6A3/XvkMsT43FvmwefDU5T41G/tl7r7W
 /VdnSgVzAbd+x+TkHuQqqdvUSed7CAhJxkAgI8ihmK7Rjs5oxO8uNFxOMx7WKXW483HU
 I9omxAlyN5czvAzjCclHXDUX+QLDRczerMb9oKLTmujO3Qvjz1a5Pb0CqVQVzjuw/S3t
 m4Qg==
X-Gm-Message-State: AOJu0Yw4XvQChhNUxcRar+MxQUv9s+tPjsxmYhyBGdMd6JAZ0ACJQCz2
 oPSNgaLUsX8OF6OzGegDCpqJdXhmtao=
X-Google-Smtp-Source: AGHT+IG5FWJvV9mR0CrKQJnCu7ARYybsWIMLNfKmJ8mhA/8zOm3yNOtyUerNaICnj9UDqDoTsjgObw==
X-Received: by 2002:a05:6e02:12ec:b0:351:5322:b820 with SMTP id
 l12-20020a056e0212ec00b003515322b820mr30666549iln.11.1699144137992; 
 Sat, 04 Nov 2023 17:28:57 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056e0205c500b003580cb49ce4sm1543031ils.41.2023.11.04.17.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 17:28:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 18:28:52 -0600
Message-Id: <20231105002852.2708915-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105002852.2708915-1-james.hilliard1@gmail.com>
References: <20231105002852.2708915-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699144138; x=1699748938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+Sf1zmFQMqhHR3974NU50p4eeDhgjlaKpwqaqBOx3Q=;
 b=COWkjHV9gPMsnBhVcENykuc0rQhYJ4L3jMuEiXQV8HNu4TFrwD4W5FQ7oPIxWO7iy7
 LLG0Jx0wY9EeyvLcM5fJcCDU22yFg+rnjhUI/9Zb7kIuVT/zmV4tpFuegqmw0VZoGXip
 3Srti3FUwaIgDWHyeYITTAiBbouzReEn7GOM34E7xeLLpNmrYTFp1/i/KJReZh+tLoZP
 Q1Emmi9ywmzRq+qk0ZeSLSzfvo9wnMaDeNL5L9AAtHQG1AslUlE9qFCzNQjkrEzhXuFV
 TEUEsFCJYPm7dG2O9sSPFK5UXidQ9et9RXHcgJJtAK6jJTGVdpkwU571olvfMl2FS0nh
 yTNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=COWkjHV9
Subject: [Buildroot] [PATCH 2/2] package/python-arrow: bump to version 1.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/arrow-py/arrow/commit/de0aea98051f9d99f237e7edd27ae3e5c6bf1489

Add new types-python-dateutil runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-arrow/Config.in         | 1 +
 package/python-arrow/python-arrow.hash | 6 +++---
 package/python-arrow/python-arrow.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
index 244956879c..4a43ef98a7 100644
--- a/package/python-arrow/Config.in
+++ b/package/python-arrow/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ARROW
 	bool "python-arrow"
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_TYPES_PYTHON_DATEUTIL # runtime
 	help
 	  Better dates and times for Python.
 
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 30fb88e8c0..6120069abf 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5  a964a7574e486b0642f3fbc02ef22773  arrow-1.2.3.tar.gz
-sha256  3934b30ca1b9f292376d9db15b19446088d12ec58629bc3f0da28fd55fb633a1  arrow-1.2.3.tar.gz
+md5  f03ecc3edbe2db99f366142f6e0f6d0b  arrow-1.3.0.tar.gz
+sha256  d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85  arrow-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  40d6e1255d7151f5f041a514725d3c94ffa8c1881e5a0c29b6bea93f03e2e3bb  LICENSE
+sha256  b481f87296cb0abdb13fd8cbb94b14c328be880ec9e68547a61b84dacffd067a  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index 1e34ef09c8..793cc2640f 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 1.2.3
+PYTHON_ARROW_VERSION = 1.3.0
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/7f/c0/c601ea7811f422700ef809f167683899cdfddec5aa3f83597edf97349962
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/2e/00/0f6e8fcdb23ea632c866620cc872729ff43ed91d284c866b515c6342b173
 PYTHON_ARROW_SETUP_TYPE = setuptools
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
