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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB150C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A4760FC1
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60A4760FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11966606F6;
	Mon, 13 Sep 2021 21:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KODFssQstUjh; Mon, 13 Sep 2021 21:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F5E606D4;
	Mon, 13 Sep 2021 21:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51A6D1BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EC2680BE8
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuHNAvgixoi7 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 485D980BE3
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567053;
 bh=+/tOfZkNp3a2M8yksecAFLONXZNym1KHmw+QBRhgjtM=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=QL8cjB2C/99omMVjfPZsDZUMcyVt1yZ3+J4a+BsnqkOE+AoSAxiRTtbF/7wT/zjMt
 1BD9u6L9SJf9KPMiN0HOKRnfCvx11jSlds97HDLt9JNnAa07linulTvVjFwQFPZI0/
 1E2RQXdtgEQwH2N+Cm/+qdyFWOjCCA6JcZfha3aI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MZTmO-1mSeXT0avO-00WZ4R for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:13 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:03 +0200
Message-Id: <20210913210412.24042-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4l5Qo5KNxI0pyp33xgT68E1xj5QxKMxKGMIoGkmAiepD10cyLjL
 A8pP27gcqrcP4e8CrDlSi6FK9wHuBChWA96h8VaJZ3NCZiMiviWCANEi4bKvaMLqEnkJWog
 NPKGFLcqSv5hSwUOo0RX/GOwS7SdF7uf45kW/h6pr/gXMQDxRaQdXpUtMnfta43puijxX7a
 yZQnQqmmvAHz1D1vN6rTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3OI+v8Nmfes=:ba8zfCWQ///hiHSBhLqimu
 WdH6CP5tMrWDjZZG9E1pXfKhze34WUNQftjkKqaVaHCy+bEQeZOQg+NxKpt7km+rZjMS408C5
 4tO0zTR9lG1agoXmuEBx453rSh/gJWi7x0K4/LcxvdfAcSunxqgePgGqvgk34LQGIGQLqRkmp
 uVBttN7zBQ/297PgqjLfP1ht7hBQ14/OjbJb0xuYC/HsG4aP+wFmqfOTbDOuyQ8uS9/iUHrjW
 UHOS9tfKRwn7NJyrhmjG2ALAb5LPMXapszSRQBrO89kXerCT54pCVeuWh67/aptlqz2/Liffn
 6xwD+9+ts1ZNvSbvjMAoakM+nmROIqI112Iuy8XF+kFdhz4mRkZKBZ0cjSbR4//vzhNw2NjFU
 XRNLKW+UF5gCqdrrF67OYwwmRNVF+gd4KXMr7B+gke32xNb5saxy3qQRDC3vmv9u0F65n4v92
 N5YQfJ3GG8zLG8NlrhWhqSYeQAigl6+MP0pDNJS98OyD9wxoaVgxZ6UuXEO1kwljhRCHA1DxM
 XWhVo+yfbEhbY5dBTDs/860kb0ZqJ4UmQvt9JpMo5CbjUxxamCZV8mpQ5s62ePgZxHGnTdCs4
 LnBXINqSN53v8fb0uewfpQ5hqjMIA9Xlve+yzt327sx7mUvG2W0vFy8t738kUXS0R6WtzEch2
 jPiUOz+X+zDn/L9nKoqdEUnpMr9+umb0aHIszVeE6ZX2AXT1Tm41bGThXgvai9cDQuqcFtIHj
 rNmHvXjEHyKW5DfCOhPOyzUoC3SgzVfrmgprfKhQyciuI6ZGc/I1FUAZnbFjc3qmnx84UKRza
 0DqMa3Io/OlFijzHc/8otWN/+As35BuEucRC/6iMAMXTq0+YRrfDi3AsRGjOs36VYlA76yijm
 +RvrHy1c3WBeVrIkszBrHfUXQJbhJxQ7rSdQ5AG5sx/jj6f5q+oOW1j39NrQUQcHmOW/4unA/
 9XTQ1VvoK9e7vUSNMaYw7dgSO906ZLarR8VBQyV22bDHx9V3TV3QqyaxFguQf57o+a6zriZWx
 +2zFqjPJhOXXt6DtMCC5Hj0seskYob4EsP5R1VSsV82G0Uvs6fVssU/Y5qdgeayatUCWVv8h3
 dkqDrF3Vhjz2ic=
Subject: [Buildroot] [PATCH v1 04/13] package/gst1-plugins-bad: bump version
 to 1.18.5
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
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 18c4ed4b63..cbb2729dab 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.4.tar.xz.sha256sum
-sha256  74e806bc5595b18c70e9ca93571e27e79dfb808e5d2e7967afa952b52e99c85f  gst-plugins-bad-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.5.tar.xz.sha256sum
+sha256  a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e  gst-plugins-bad-1.18.5.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f4cf0d534f..d8b2e2a5d3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.18.4
+GST1_PLUGINS_BAD_VERSION = 1.18.5
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
