Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0EDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:59:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CCEC60F02
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CCEC60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B523801EA;
	Sat,  9 Oct 2021 20:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2c8lEWHSzCe; Sat,  9 Oct 2021 20:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FD08833CD;
	Sat,  9 Oct 2021 20:59:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 504541BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40171607D5
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP1_7ru4m3z6 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 752466073A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:46 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id k23so10203364pji.0
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcDkUxVU3N2ixSD844e7R1sZZEFWSCIQNEAQN8+oEBk=;
 b=lGWmQCxgZWgHUlPw9sWSVhFy6YOLBMyliV2u1uZnfch4AxVh9hgYsKsxGTgHRCLeVg
 pnPWD/qjWUBRKaceJrM8y4xWlE4jd2ZjaVRi2eMRF61Dyk3xiiy84mF4ejAZKDnhS37l
 +yj3W8rcWjPTvkSC7rNiCsM1L4fSLWpRHY0TRtt+Y+juwO+ow1hbXjfzxfD2iMsey86D
 dNTDL+q0KPcLwCXF4n69GV2eSWCpSVr65DW/2jClV+HnXB8HTibkgpTUPTWMpNK3eR0Q
 +OaUADwqVsjDv0Nrfgh4ojPLtBH6nPTDHJQDPog55isl/5Af6lPaNc5BuEiauMJRu7b2
 cXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcDkUxVU3N2ixSD844e7R1sZZEFWSCIQNEAQN8+oEBk=;
 b=MFshWzRfWEmdF1Pjk4umcHx51DHVSDXPPxH0JDe0Y7Zq3r06T3veDfABWRJBGVuDfk
 W5ZU9F+C/59c5oslhC8sx4Pr3i4TRHRUeXYCU+Wdpo8D5oJlCD+97EbQ8vCdVnRT03Q5
 o5VKCTlUbIYDTtNzU9zDa7d8GkIFmHpZJ0aZYc59LnYj3OE8biKYo24v34KpiL6GtC8k
 3CnWB3cbxI9orzk2nMb0PJmzl+kcOlLSR8aizHm3URUFczc9bORFKjRVQOks+axMf5nV
 9BcvWR/9TIXCjpKNLm+DSuMegLu0lrmQJXIE+JP5FI2lXWBMhNhZHI4yDY2xDfGR736z
 HjMA==
X-Gm-Message-State: AOAM533OFS2eTa5/cMJlpl0FaMCwUctfIGtBGTBAfVjD36Rre8ZJPvni
 D9YrWUQ2SwPCQQLK4QtqziEJGqNqXVLBjg==
X-Google-Smtp-Source: ABdhPJys3eKSuG1o5SEabnZ43iUfy1no5JUp2WLdsWl8Di4ZTqKChyz17UHg9V+EiBKHzBGAAFF9jg==
X-Received: by 2002:a17:903:230e:b0:13f:5f6:3722 with SMTP id
 d14-20020a170903230e00b0013f05f63722mr15981229plh.84.1633812945898; 
 Sat, 09 Oct 2021 13:55:45 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:45 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:21 -0700
Message-Id: <20211009205523.3137859-19-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 18/20] package/python-pyalsa: add
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
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
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
