Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BC7B408D2;
	Wed,  2 Nov 2022 17:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC7B408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgJyMEBuenld; Wed,  2 Nov 2022 17:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A4BA408E9;
	Wed,  2 Nov 2022 17:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A4BA408E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C01A1BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C7E81E67
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C7E81E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUCHXQLZWdwV for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C1F81E65
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16C1F81E65
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:43:04 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id q142so9571466iod.5
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 10:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7BNQntB7PsyXYE6aEIrrI/6nmwrzGkWVnQdSP40VPM=;
 b=VQpo28K9mZPD7O+dHfqclVQxEbU1RqbYfLfKVbfkjIBKaJlZBRZpW8c4wKzKy3Sclt
 23m47TVrbJtlko2MteICpVf0r/kX1toL7dTJZ43gjHVbMaU/I+2E+jBLeYPmmcb7nfPA
 B4+RgitRL1PIp16V2r0FfzwhchVw6Mv846eNd3Tf7AuyhYxuIhGkN0wuG/0cV5JLlfvE
 nIZ1sw3o/OAszUTbu1F7UJI8nXBJGWAAmBoJBZM+2Dfl0Eq+ujMzjbZBqQGoyzMWJ31l
 W1frjoQuVaAq607BBgYZRInDfUf+CxzBocgeM6hm73EbFz+TaUaVdWLHyuAF2rXc3lfc
 fCMw==
X-Gm-Message-State: ACrzQf1N4p975nyHuNk8BYubdgLwXIGYmV8RpN+teZz0/GjM/OeEtHGQ
 r1miE1EKU0LljMqLRQIwfcTGZwplrGtYbw==
X-Google-Smtp-Source: AMsMyM4f4PK6AD2+kzeqUeqV1uWZpDdvOE5l0cz6qdXJSIMsOjNxd8kZNaTgCi46Fw8LxNBNBK9M+w==
X-Received: by 2002:a05:6638:448e:b0:375:681f:6973 with SMTP id
 bv14-20020a056638448e00b00375681f6973mr10058606jab.130.1667410982873; 
 Wed, 02 Nov 2022 10:43:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b17-20020a02a591000000b003751b68b84esm4932147jam.32.2022.11.02.10.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:43:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:43:00 -0600
Message-Id: <20221102174300.2265675-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L7BNQntB7PsyXYE6aEIrrI/6nmwrzGkWVnQdSP40VPM=;
 b=C3YzRYorP/IbBznSD5W4YzbzBhJBw2dTMihnoHpy/L9Rj8Tpa0dje97t7w3F3aHO4q
 Hmnq4uqsez7j+Bq4mHtWoAhFd74kFNCBy0JdVMGTjv1CGVCdAZ2rTDedhpyJAyUc5ItG
 qRp0zQc4ygMCBlq4u4yqUQfG/BlBQTFE/gGCycASxX7rAkV7lTswfmO7blB+/PoNxEyc
 tTxEc3bhcAdeeQ4naTX15QtYRJWO1L9FZ/cpV5xLd0YDfDuIL8zhmxyVadsMsOAOla2y
 A0V66CZvjqSuf/En8FicKd8XNvjni148VkvHbYqtFWE2LbuVKeC6DQPJWiwbPzblB/fw
 JfhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C3YzRYor
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.8.1
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
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 6a6782b397..e256e9dc08 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  3d336c248990cafc69ea403d6af18994  alembic-1.8.0.tar.gz
-sha256  a2d4d90da70b30e70352cd9455e35873a255a31402a438fe24815758d7a0e5e1  alembic-1.8.0.tar.gz
+md5  667a722df7dbef926a4ce760b9917622  alembic-1.8.1.tar.gz
+sha256  cd0b5e45b14b706426b833f06369b9a6d5ee03f826ec3238723ce8caaf6e5ffa  alembic-1.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f0e3f7a5080879ccae798882d9bee3d48fe335d0bad84ca8eec86fa594375ea0  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index d40acef5f7..735678b384 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.8.0
+PYTHON_ALEMBIC_VERSION = 1.8.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/43/f2/f6096d23eb43d436f7c3408a6c83f82a1c704bfb50fb608574b048484480
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/37/ab/80e6d86ca81235ea1a7104089dddf74de4b45f8af0a05d4b265be44d6ff9
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
