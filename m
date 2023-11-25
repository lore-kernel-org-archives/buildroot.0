Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248C8C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 08:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1E2615FE;
	Sat, 25 Nov 2023 08:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1E2615FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBDwU4_Yoj-t; Sat, 25 Nov 2023 08:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2730260E59;
	Sat, 25 Nov 2023 08:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2730260E59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 498EA1BF3D2
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E998615FE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E998615FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUaU6OPjJEAk for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 08:22:12 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 333E86161E
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 08:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 333E86161E
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35c8adc38f2so535425ab.1
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 00:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700900530; x=1701505330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Tj0V20xax2Ur1q1stuHC1gEt63MaJ9kec1E4T2Un74=;
 b=M4QtUDgQFNjsJlbBNpeoS7lK9zwmIjODEJxQX8MgRpKOAtpqF2NZv/0Ooz5gNV0mar
 q6hrTboadC1CjqOBcJHH0Shs6EF0Sjjc1AdQh9JZaHGFYD+pUIiPreGzcXZc5uU3lztS
 OCrUE54bNVdBAOju2IeUtV+4Dg5GDeMQPFvAYah5dU4cIb+gsi2sfYNHbb0GT+QAf+oE
 /sbR09vgfvqiLTSi6j2Z0ZvLyA7Bj1uE/4WEg3sT2QhaZczdyLYpyAIuPm+XNO2d2Wcf
 vVXDvf7g6pQD/TNnk6JblE4JCluMg6xkzTg1FClyqU6UVf5CbuQszAfkTefkFNc9DD1A
 IyCA==
X-Gm-Message-State: AOJu0YwCbkHlMeuoRCtrLqmJCMEjj3qaT/UpMykHWLL9m2Fb1mIGHUWQ
 j6sxXdKsnVGO8gXcgnFE+nepjYvcSg4=
X-Google-Smtp-Source: AGHT+IHqXFWPEQ2fMKPE/XS0HM9JNckT5otHxLItcD2rXLmjAGOZ7IAsvu5UH0DbK+RB8185hZhz6w==
X-Received: by 2002:a92:c5c9:0:b0:357:592a:8c4a with SMTP id
 s9-20020a92c5c9000000b00357592a8c4amr5960130ilt.12.1700900529856; 
 Sat, 25 Nov 2023 00:22:09 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05663824ca00b004640798fc0dsm1228016jat.153.2023.11.25.00.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 00:22:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 01:22:08 -0700
Message-Id: <20231125082208.888608-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700900530; x=1701505330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Tj0V20xax2Ur1q1stuHC1gEt63MaJ9kec1E4T2Un74=;
 b=RR7GksXK87NKNXIqwou4DSo/LciMFNmBC2saJXQ3/Sl/KzKXvcqvjNDIK35oF7znKl
 cyfVfNNl0mI3DebJKDmIgNG66t+D73RwIz1z26GZ2XMAxwBKfa/rjzuejHK/OkIf+slK
 oTBeUTP39+3/N0XlI8CEgqm3J1Hgcb8K4GO4/Z2iQCrVzZwWy4mLUe00aC4VzOo9AqWU
 cBljnij/qYmwjKanIUevFMiynYlt/6a2WDumXckWc8gKXsh8iECrFEoZw1A2hckRRWM6
 qmJS+BR5T1xQce2jcBwm+BUDNWUl/YGH+bwskCh/b/MvWYWJGfP5PMd1hQnJ3MN7Xyyv
 0cVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RR7GksXK
Subject: [Buildroot] [PATCH 1/1] package/python-pyelftools: bump to version
 0.30
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Olivier Matz <olivier.matz@6wind.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyelftools/python-pyelftools.hash | 4 ++--
 package/python-pyelftools/python-pyelftools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index 7cffe2d646..70af8104b9 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyelftools/json
-md5  2afc97cd239c0dea0cca97d00d3dcb42  pyelftools-0.29.tar.gz
-sha256  ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff  pyelftools-0.29.tar.gz
+md5  2b4f82fd30436834b9357a5e74b8ceb7  pyelftools-0.30.tar.gz
+sha256  2fc92b0d534f8b081f58c7c370967379123d8e00984deb53c209364efd575b40  pyelftools-0.30.tar.gz
 # Locally computed sha256 checksums
 sha256  ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 7566f24895..0e52c0b885 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYELFTOOLS_VERSION = 0.29
+PYTHON_PYELFTOOLS_VERSION = 0.30
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/0e/35/e76da824595452a5ad07f289ea1737ca0971fc6cc7b6ee9464279be06b5e
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/84/05/fd41cd647de044d1ffec90ce5aaae935126ac217f8ecb302186655284fc8
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
