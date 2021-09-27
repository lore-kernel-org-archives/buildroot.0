Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC926C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F4160560
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67F4160560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C66080F54;
	Mon, 27 Sep 2021 06:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgXcr7RTZ89y; Mon, 27 Sep 2021 06:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE7B80F37;
	Mon, 27 Sep 2021 06:39:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8DD11BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C610F40682
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzhMqwvKVG1W for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:38:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB92940659
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:38:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c21so19489998wrb.13
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmYW5/AzUY0BudcN0Iy6XMirTaj3UEuKTSAjkr2HcjM=;
 b=bBeWScd04/om/v8phR0pYfSqe1paZ1DOzjZHFFmnc+uopPsqslh1WyKngiMKo5Fq/6
 HavHBtrVnyv9riQ/ev4PR9PyXyBToiCh9HfGus8q6iiRSDMEcEDMZ+Cgo4zgTu5wYVzM
 G7SkqE4qqg6sa+mo4KL7I8LxTljEHBEebSNJfdSpSOGKzTeUdyOcQ/ViksnvOY+WxxMJ
 84tAo84qr/rYwta+GiPGOaxiQsaTn36cYfE7SiA0sNuKtKoOqIgRoPtVXiH45MT4ZQnX
 NudQKau9QDqd0EQvUaSqcCFM86s7gMpWX2NplQn4BzHvi8slGFwysZTlILflmhstARPk
 aeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmYW5/AzUY0BudcN0Iy6XMirTaj3UEuKTSAjkr2HcjM=;
 b=2TeuLsRj1qYfnihL6YiU1ZOHiZ0hHD+JYB4u5324rcGOBRCBwI5zSQHwkAr3DkUFOE
 EtJ+U2FghyrlYXZQ+titzifwyIP9izq+1ObelyaxhieSCp7aKYcuSWdwj4q43Ed855QM
 n9Z2YBrQ5Pyh/KtSDLJNVgcB4tA0/SH88UJb2wUR3pOP/feZz3KJKKuJ7mBENHehAjCR
 2pbzk8qozaBHr5IRzbjIubMduqvmlBTSPUGgYeA/2LglzqSpDXkiT5di3vOglPhxjkl7
 e7wsbIjfpj0nfVNFNxLE1QI8lKcme7cJfmMr/IaiF8U8fUXfLiZ74mqRIX/fFY/ez/yS
 Z5Vg==
X-Gm-Message-State: AOAM530tsT5HgMkrrXntrLbqbz6jPIY6kEYHGu7mDnUOF+qKFtyWc+qM
 V2HEGUdVcz8LojyQKWoEc+xIZNgeaWg=
X-Google-Smtp-Source: ABdhPJyUtpacO7/CPVSrM63uUlhelGhBgJmLdXalS1R05E5OX9WZA3O3i7XkoKC9vIjFfIs/pAFDHA==
X-Received: by 2002:adf:e906:: with SMTP id f6mr11292997wrm.207.1632724702992; 
 Sun, 26 Sep 2021 23:38:22 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id t13sm5061135wro.76.2021.09.26.23.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:38:22 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:38:09 +0300
Message-Id: <20210927063809.505480-7-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927063809.505480-1-asafka7@gmail.com>
References: <20210927063809.505480-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urwid: bump to version 2.1.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces on the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-urwid/python-urwid.hash | 8 ++++----
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 51a6e12ea1..3d7be017a7 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5	c70a7016fa1ad2c2a979dbebd4de78c2  urwid-2.0.1.tar.gz
-sha256	644d3e3900867161a2fc9287a9762753d66bd194754679adb26aede559bcccbc  urwid-2.0.1.tar.gz
-# Locally computed sha256
-sha256	36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
+md5  f7f4e6bed9ba38965dbd619520f39287  urwid-2.1.2.tar.gz
+sha256  588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae  urwid-2.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index f8a370234c..78b369ef86 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.0.1
+PYTHON_URWID_VERSION = 2.1.2
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/c7/90/415728875c230fafd13d118512bde3184d810d7bf798a631abc05fac09d0
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/94/3f/e3010f4a11c08a5690540f7ebd0b0d251cc8a456895b7e49be201f73540c
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
