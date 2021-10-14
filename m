Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F27FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C81B56101D
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C81B56101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D334014C;
	Thu, 14 Oct 2021 23:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhfOMmT1R4Lp; Thu, 14 Oct 2021 23:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6EEA400F1;
	Thu, 14 Oct 2021 23:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 895DE1BF292
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66BB8400F1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_m_jTxDQa-m for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:59:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E2E640018
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:59:00 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so5872585pjb.5
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcDkUxVU3N2ixSD844e7R1sZZEFWSCIQNEAQN8+oEBk=;
 b=mJGviIZKgoXA4lYjjOkSMO2s+nPqJf7SWHupjDz84D4nnNvMDJrvh9yhbdCH2B9+fH
 ZRCpAaTG6qe2mkJ2YQ2MTdwV2H1Zb5l7jUZ4xvm6xT+YoQ4VKqX9nq5dnmQntle4nEeH
 3x4In3y/v+h5J7Ki7c6C5WhTG8+TOpJDXf5F4rjHEwNAZJSHEssKJgT9yPHOqJ/gE3l6
 mRadLyGdFnL8rL+1wl6juAc+E94Y5atkQGSlk/qvkbgmFIIhbVt3TtWhThOlO1Iw1X/4
 gFMvfGfx4tD4qsnOQg3Nw1fq2s3irRjS00LvFaK66gRm5uipfDyXJ8lHvOQYuo9VtD3C
 UU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcDkUxVU3N2ixSD844e7R1sZZEFWSCIQNEAQN8+oEBk=;
 b=rwijRILqKnngoGe+9kCsHKhAbg5cnDhjVvDbCnybebHNmQ6jpgheaAGMi3K0dC9p4W
 sjZD8x14G6F4qJlRY8CBY5oJK5QiwAcpe3fj1G1ZYXEnkXqzYFVFB3zN/mUp2/PSxPGz
 nJnr2NO6mmsQLdFgGYZ1RN0pZcfpGma6+I+I11hRT0DSIoPcpKodFTKx/wJr9xXJrc8o
 OQN9bOgCuvGfaBJ6sI5TzRNGxqMQF+Yj0xI9asWqfcEUVHf4kTeeFyIJ2pA6adVtVVRf
 6y/DC9eqjSUH46AzG28aXBi/mLW1GyPx9B40jTPQkHthkDlI5jfa0X9C6yO4wAk/f3PY
 zl2Q==
X-Gm-Message-State: AOAM531E8Rm8/wrEndZr3PsVsC1tQzgQND6uCSWX+TWfjRFiA96uu4IO
 2UEQ03lu5cij7f+u7FZzz9GpsgcYaI0=
X-Google-Smtp-Source: ABdhPJzvFf2k+i3wGTQFtwpuA4kavz4B0APXzuwhXsxNTHqMHnmaocca8R/nLzu5ama67aUFj0J6AA==
X-Received: by 2002:a17:902:e846:b0:13f:551b:ba23 with SMTP id
 t6-20020a170902e84600b0013f551bba23mr7492136plg.77.1634252339707; 
 Thu, 14 Oct 2021 15:58:59 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:59 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:46 -0700
Message-Id: <20211014225849.832479-9-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 08/11] package/python-pyalsa: add
 0001-fix-pytuple-set-item-usage-no-return-value.patch
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
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is a backport of commit 5ea2f8709b4d091700750661231f8a3ddce0fc7c and
fixes compatibility with python 3.10.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...tuple-set-item-usage-no-return-value.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/python-pyalsa/0001-fix-pytuple-set-item-usage-no-return-value.patch

diff --git a/package/python-pyalsa/0001-fix-pytuple-set-item-usage-no-return-value.patch b/package/python-pyalsa/0001-fix-pytuple-set-item-usage-no-return-value.patch
new file mode 100644
index 0000000000..d3db1ed2e0
--- /dev/null
+++ b/package/python-pyalsa/0001-fix-pytuple-set-item-usage-no-return-value.patch
@@ -0,0 +1,48 @@
+From 5ea2f8709b4d091700750661231f8a3ddce0fc7c Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Thu, 10 Dec 2020 16:00:50 +0100
+Subject: [PATCH] Fix PyTuple_SET_ITEM() usage - no return value
+
+As noted in bpo-30459 (link bellow) the PyTuple_SET_ITEM() macro
+has not a return value. Let's make code compatible with python 3.10.
+
+Link: https://bugs.python.org/issue30459
+BugLink: https://github.com/alsa-project/alsa-python/issues/2
+From upstream-commit: 5ea2f8709b4d091700750661231f8a3ddce0fc7c
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ pyalsa/alsahcontrol.c | 4 ++--
+ pyalsa/alsamixer.c    | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pyalsa/alsahcontrol.c b/pyalsa/alsahcontrol.c
+index ebee1b7..7c9321f 100644
+--- a/pyalsa/alsahcontrol.c
++++ b/pyalsa/alsahcontrol.c
+@@ -1543,8 +1543,8 @@ static int element_callback(snd_hctl_elem_t *elem, unsigned int mask)
+ 
+ 	t = PyTuple_New(2);
+ 	if (t) {
+-		if (PyTuple_SET_ITEM(t, 0, (PyObject *)pyhelem))
+-			Py_INCREF(pyhelem);
++		PyTuple_SET_ITEM(t, 0, (PyObject *)pyhelem);
++		Py_INCREF(pyhelem);
+ 		PyTuple_SET_ITEM(t, 1, PyInt_FromLong(mask));
+ 		r = PyObject_CallObject(o, t);
+ 		Py_DECREF(t);
+diff --git a/pyalsa/alsamixer.c b/pyalsa/alsamixer.c
+index 39d7387..91fe198 100644
+--- a/pyalsa/alsamixer.c
++++ b/pyalsa/alsamixer.c
+@@ -1348,8 +1348,8 @@ static int element_callback(snd_mixer_elem_t *elem, unsigned int mask)
+ 
+ 	t = PyTuple_New(2);
+ 	if (t) {
+-		if (PyTuple_SET_ITEM(t, 0, (PyObject *)pyelem))
+-			Py_INCREF(pyelem);
++		PyTuple_SET_ITEM(t, 0, (PyObject *)pyelem);
++		Py_INCREF(pyelem);
+ 		PyTuple_SET_ITEM(t, 1, PyInt_FromLong(mask));
+ 		r = PyObject_CallObject(o, t);
+ 		Py_DECREF(t);
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
