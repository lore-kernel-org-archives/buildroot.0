Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A7CC47072
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 20:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 495016F783;
	Fri, 22 Dec 2023 20:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 495016F783
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBLMdr-SOuW5; Fri, 22 Dec 2023 20:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82C16F740;
	Fri, 22 Dec 2023 20:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82C16F740
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BB001BF831
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3433D4286A
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 20:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3433D4286A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKfun-iIxCBS for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 20:53:33 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A5E642854
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A5E642854
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3369339f638so920614f8f.0
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 12:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703278411; x=1703883211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70Cz4mdJivM85yxp+jSaKVdXqLWen8lwzjp75dQzh7o=;
 b=hoo2Lebd1kRsKvyuAuYFa51PDmuHFcfMBxDDetbTvcX0DYEzMOX+LhPi6XYQU0ABKE
 /JgkoXm6wfdUZ3Y4s1ARtfkI1GIYmcpOCypx0GA6F8cyJXKtAGnwgRFqyYNCRmH+qUP9
 iCgnet6O7eZ6naYviuDU1CHLeG0n136+IyUnkHy0Bud5VZ8T7/Ls0f9PS+A9ErBt+mxB
 olsI2knovZkOwBkJeMsrmVep/kSO1bAJlxPrj4ZAiBV/eP6R3aNpCL6lr94Qng5W6m5t
 BqOPQ1JpEFEw1rhejdXIbS9Jtg/wJeB6P+IZBebzWG2Ja0uJ65rN5KUpUzwkndmEhKrm
 TsLQ==
X-Gm-Message-State: AOJu0YzGgqMkJsMYH13BGjB+O8kbJ+Jj7bpraWY/n+BNADDa1S3MeIsJ
 RaKc4MzWZEkiTnsFfu+vVNXe7fIKnrZRRQ==
X-Google-Smtp-Source: AGHT+IGoNlAPkPfndDSxae3yYuPZeb2Ubfhi8tjWVhtH5LmCjiT+ZF1aNK+1o36PzAK/MVBB9EcBtg==
X-Received: by 2002:adf:dd8c:0:b0:336:7643:3d90 with SMTP id
 x12-20020adfdd8c000000b0033676433d90mr796353wrl.57.1703278411376; 
 Fri, 22 Dec 2023 12:53:31 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 fg9-20020a056402548900b00552691fc7f9sm2952606edb.66.2023.12.22.12.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 12:53:30 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 21:53:21 +0100
Message-ID: <20231222205321.5588-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222205321.5588-1-petr.vorel@gmail.com>
References: <20231222205321.5588-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703278411; x=1703883211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70Cz4mdJivM85yxp+jSaKVdXqLWen8lwzjp75dQzh7o=;
 b=Ms2PkKxcHej+mXbX7mLkxXp36JRvt9wEG1L6xg+qmmDPSYgdlazusdPrhM+SHFt17Z
 1opF0dplBL7dQNlG16V4zmejC59iMbEdhWWjmDKx9/hBacODN/cJET2X2TKgybKjDJjV
 4EGFYCX5/Wzv662aG3agoNMf+MPwLfxpoNoUstK+V4XMul0CXx91HT4xqWHYI8L5JJGY
 OcOBuRp+sJ1QXwXuZ8Pz1oWWCpPrjnz4PcjvqFYAaSSXdsO6CVixq0n0xqecaBrD4uXo
 pym8GXZqc5/fQR/mxEgi8jVHfk1Gs3qZJ4qaFW+l7jykDLzk2dPep8HHoVxoaFqmwawl
 an9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ms2PkKxc
Subject: [Buildroot] [PATCH 2/2] iputils/iputils: remove note about fork
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After 10 years we don't have to justify the fork.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/iputils.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 783ed9a0e7..a8f93488bb 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,13 +4,6 @@
 #
 ################################################################################
 
-# The original upstream was forked to the github repository in 2014 to
-# pull fixes from other distribution and centralize the changes after
-# the upstream seemed to have gone dormant.  The fork contains the
-# latest changes including musl support, removing a libsysfs dependency
-# and IPv6 updates.
-# http://www.spinics.net/lists/netdev/msg279881.html
-
 IPUTILS_VERSION = 20231222
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
