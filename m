Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DD5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922076112D
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 922076112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63ABD40209;
	Mon, 13 Sep 2021 21:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPlzFcQS8AGt; Mon, 13 Sep 2021 21:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C9D040195;
	Mon, 13 Sep 2021 21:05:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36F3D1BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 206FE80BE3
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ut95d9KxDlVJ for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9188B80BE7
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567054;
 bh=g4zZHtvuzUP5JMHgpW+RfXxVAIO7Sa1Oewa9pnhfhAQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=lLdyxXAOsBkqUPCSNWrSMXjyUuLfqiOpN4L8TF7OicMxp5P1G/kG5dDST5d/ikPu0
 McC5zVAqwwMF1vKTglsNMkeoADEQHH6Uzc/1Z126ILbyuwLgRpIni+TQmUp3H8cADE
 kaZWs+5vo7MccyU9IIM2p5rwMWewjDNJVU9SF644=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mkpf3-1mlynh28ND-00mJZ0 for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:11 +0200
Message-Id: <20210913210412.24042-13-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:pRrnIfRbBQD+crwmFyeRK2bZwfpJJisf4ulkw6yG4mcT41BMGQ5
 8WkdW4QRd3eu/mYi9XKWjmtGxXCTNv3rZ879S+TBfA19KnMiGp7/mgTkSQfHPsrFnjbueE8
 jtpZWQGrLREHBcWFkqWH8qrBMsRVsCPZgHNDFVynRHMXPaLJWucKnjcmpkZ7xIsgVQI/cqL
 LLXqIuHvURacDS19IDK6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F0gbt8+BJ+U=:gEioCQiehuZRFik5ouJPOx
 nUAEjxR/TFaMBXKLNz8rCpXXmdsSYUg0czN2yeFzK4TlK+L1NbY0GHsa0P6GxixweEi6bmxvS
 /AT1wMkNVcc/qPLJhNG3WZWB9cHu2MdT6sMRu2Bl8KSMJqt7m/qq2omxZi+GJlTj1abB2F+Vv
 TN0ck93ZVSKq/2l6hbTMZIxvQW6/nDEcz9pal+4PzNBLMFWkPyt0Czj1C2RaeN17qlf6xOE+n
 ykWLkiF9A+uutE25EkfWk54rznYmIuSFPhWF4zIRBrr3Neg6mIa+ka3BzL88WuxVTIrInmtO/
 o17KJXJwLH509ZP9twDpgyq0RB8W60EDesjYGMwA33LYgzME+7Co0BCPt065xHlXcAEv+LrTF
 n4zPFdr6WfExSv+3kLb6EotPCJ4z8XH+hd6iKeXMM0FEdLN0JBtiLjK75MNul5aXDTeO93skO
 N4FixvgUscP/H5Ryv+p3QNHoZNgTWAXS4bWuZ3CHmSQjBuqZG1bWUsLKtdjwuJmn4w7n3AxyP
 vYvyHm9Etcm36Copb0za1FlTsYdNip2cBdkG5uYXOe5lJiZlVurHN6Qo9RTkcmgs/NTgVVgl0
 bkj8jfwubntFL7lWkv72qO6yqygYZQ/eZT1yVJeI67DSwhzHmzjb4D/6Zgby/v7f9R0TsruFJ
 pzFHSZiuFD5vvFA8pb5tVXMpE88kTsesrIgRhvL5Abx4wzgx3lMfV+nPlSvQ0sWHyeclxB1BA
 OZDP3SByv2rAkddd1Wci+YWkGaca/0Q6BAJ36hjAOs39nsExm10EBkQJ0+ZkbbH7x1FmVTAmW
 bZrIKbFS63SKw1yn281Ld6RjmVKX9JdaYzie5uVVkgoqPC4Is1rqN7g55dHP2gaGKV4OnF5ln
 /gXYAW0ATTAGkklQ2QP7CQ5VmbvMoqGDWOnGpqHqG2y1Vb/C00ll1/pJ5wkV7qecrulDyzXA0
 PB30V9dNPgwW8sd4NdVYtG7Kp1imkt8JXA86CvLqc6SKjLGlWqbZdBRGZEpBQjkAvhMTlFRQm
 APpX23c6iXePbp+mBiNlQ6DNI59vM22o95fo0pKU4qsc1wB/hl49tzHP/dSd7eLoikWfI3DGM
 IiFF95VscSZkh8=
Subject: [Buildroot] [PATCH v1 12/13] package/gst1-python: bump version to
 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index f7c2d57077..2035c81fea 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.4.tar.xz.sha256sum
-sha256  cb68e08a7e825e08b83a12a22dcd6e4f1b328a7b02a7ac84f42f68f4ddc7098e  gst-python-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.5.tar.xz.sha256sum
+sha256  533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52  gst-python-1.18.5.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index ed127cdba8..614cb22396 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.18.4
+GST1_PYTHON_VERSION = 1.18.5
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
