Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF102C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7513B83F82;
	Sun, 18 Sep 2022 12:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7513B83F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LB-Xy2FsAIzo; Sun, 18 Sep 2022 12:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A201583EF7;
	Sun, 18 Sep 2022 12:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A201583EF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0FC11BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B82C141838
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B82C141838
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3XdrCgNKbsu for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:59:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DBC441814
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DBC441814
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:59:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id cc5so33261027wrb.6
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=66YFhwBvGAwL0fOydA3NO+u1hNyqRLtLaJM6nrgHVFs=;
 b=28gj5DLSDqiL9LwxEhrJAGHyPb00++ovfbLUc99LsmceEoVqQu2UJVfSRLKu2tRdtb
 7b5cdT06mxgqGzQGxUHBcolOjrzrcIQ44nYFDPgoTojxvU9NQkWknHbGSVzl58nlGU+w
 854SehWd87avpOGU5JMqvR5FL2tin5GivnyKqawxlV3I6bhInxZvzoJQuVS96qdie/A1
 PuvQayKAbpTZXUwPoH5cXx5818EZ3qm1m5CwVrQPKz8TPOUkmJq6blu5jd5W3w+ERFhI
 3tPnXCkXpB1xCQ09/ErzWUebPkorRd4ZHpnbXh02m486QP5YdhI4ZCSBi7uIxu5ayuzQ
 8JCw==
X-Gm-Message-State: ACrzQf1qNnZZIxtcBQttjoo2yVXYb4+teBkwIxHmYR9cu+7wb4JqB6wx
 SNhg/XzVRcfRAHdK1YvTL6QQV+ydY10=
X-Google-Smtp-Source: AMsMyM5M/Fqp7iy2kfiUKaSh21aA/G/sE9Q4AtxNI/8xMMeW4ekivysrRUqIk3xnhMSywxzucbbblA==
X-Received: by 2002:a5d:584e:0:b0:22a:f46d:b8d7 with SMTP id
 i14-20020a5d584e000000b0022af46db8d7mr3367290wrf.59.1663505938073; 
 Sun, 18 Sep 2022 05:58:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0022add5a6fb1sm7057020wrt.30.2022.09.18.05.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 05:58:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:58:48 +0200
Message-Id: <20220918125848.162170-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=66YFhwBvGAwL0fOydA3NO+u1hNyqRLtLaJM6nrgHVFs=;
 b=KcfNnbkA1wSlYonkHbls78ZudSJKBMP0u9yyIOf/ECO3tfdZbDieK8IXMNAfPcmMXL
 WyEdXgkbD1mbz6Pvr2bMJKdkHqfj5pWI33ZCLl9VFKYHo5GxG42cfcJbBWS2Q9oOdDnE
 dzuXl4P76tRJ3ByVeSJP3/lZjUHFODZNF/W88wuXzP/OzJwaV2Qr26Fm8XZDsCxImQR4
 29uhL7AEzm2Qj2PYv6H1Vvv3Krw0fvQJmTjaQzEdwqrEQ2w5TH8e9+pP7WxLkbRmiY3y
 JkiRMA5MCHMDeFYyWXqgRqVoRLwyJOmTuV8l1a0Fj2JpfX6KRV3syJQNn+nqa8Ts3/j8
 LEww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KcfNnbkA
Subject: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.14.13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pupnp/pupnp/blob/release-1.14.13/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index aebde064b8..fcb231cff6 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  091c80aada1e939c2294245c122be2f5e337cc932af7f7d40504751680b5b5ac  libupnp-1.14.12.tar.bz2
+sha256  025d7aee1ac5ca8f0bd99cb58b83fcfca0efab0c5c9c1d48f72667fe40788a4e  libupnp-1.14.13.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index a754ca76fc..8c6ae005a0 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.12
+LIBUPNP_VERSION = 1.14.13
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
