Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47780C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8AD9418DD;
	Tue, 20 Sep 2022 19:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8AD9418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzgEa2rRDQH2; Tue, 20 Sep 2022 19:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BADCD41748;
	Tue, 20 Sep 2022 19:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADCD41748
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 501AA1BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 388B1812FB
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 388B1812FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRh3ua8u2dHz for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:03:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 380DE812D1
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 380DE812D1
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 19:03:44 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id e17so5261431edc.5
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 12:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=CR2gBU6clOhs//RevDcx024hkMn5+inx/o5Y9dQ/w64=;
 b=xk1NBmpQQYl8ySldN61yuuAEzrAkaK0vEOtZz8MOIKqdZXb+M/BBcfU6/ii0pXqp1c
 wXcq9VwsltpFgAN4WbZ/ur+K2NT8HMZn3DAms4VfaQgmxnXa0MUI8xJmaMACxknsu32A
 YhniVMQF3UUoVub+ImjlXXthXAIkq5PuP6jbEPVumt2EISGZgYtrvu9VqqEuDKRL9pE8
 UcjqoCaNrf9vjTZ4rG02ZhHDHVF1vY+NccWaRVl8CvMMOFmkiDZkJwqEyI/ApdjsSi0A
 AnIT/4jQ9YKhH1VDo+WX6W+7tlseFl3wzj2J72qP34Er0pCXzqpu/gEhqA5H/yW7u24D
 4Ktg==
X-Gm-Message-State: ACrzQf2ZoRJExEc8SpRntKccG9NlbHrXcAz/VNXjP71cdg7FpxO6osn+
 n8P9SmcZ3SGaLCJeh1NmEbaJZF53JyA=
X-Google-Smtp-Source: AMsMyM7JqjxxJjvW/248OONeFE3MiuWrnyvsg7/g9qiU5P7wt0NJBuqota5xQQhqRfBycPVopYJT+Q==
X-Received: by 2002:a05:6402:1345:b0:453:891e:763e with SMTP id
 y5-20020a056402134500b00453891e763emr17483127edw.139.1663700622410; 
 Tue, 20 Sep 2022 12:03:42 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a50ea83000000b0044f21c69608sm384950edo.10.2022.09.20.12.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:03:42 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 20 Sep 2022 21:03:38 +0200
Message-Id: <20220920190338.3688731-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=CR2gBU6clOhs//RevDcx024hkMn5+inx/o5Y9dQ/w64=;
 b=S1Qwi8z3wgbrGtYKpp3snVakl8Y7TUpZpnf7tGA1b1M/STmZkVR96iLfU85g02wAGw
 F3G3lQFhDr9S9t/AbnnIIT4xQMAjCpGMY0dsZ2ne5x3Qmt/8IXla8SOif+qOHNJB4A6z
 gbqjHN7KDz+gjQI4GW2KTw09xMGF6NqZX4rZKyZf9E73IXGiXsBgvicKg0zhq8qV49q9
 Tn+a+wg0x7k1kUfb0MRIdOOlVPHD0l3HC0CMZfsjINZDXrjeWIXdCvakyCD+oJsj7Png
 RPQ3i1TMtoXIl7pqgLYs2SV9LZwWMxnUdYXGyzw7NNc97JSzr/P3F8z+veyuEZQR+Cxn
 0EGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S1Qwi8z3
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.96.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sources are now hosted on github

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 7318c608c..9649e24f7 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c  lsof_4.95.0.linux.tar.bz2
+sha256  2753fc01452a3d2ee665e8365afdac0e9683197f3ec06231aa684a48b286d11c  lsof-4.96.3.tar.gz
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 21a327b99..8c8c46c4e 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.95.0
-LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
-LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
+LSOF_VERSION = 4.96.3
+LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
