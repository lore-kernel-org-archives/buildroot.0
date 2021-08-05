Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6FAC43216
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCCBC61029
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCCBC61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AE9825BF;
	Thu,  5 Aug 2021 09:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YS06nGdhD0zI; Thu,  5 Aug 2021 09:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA06F8343F;
	Thu,  5 Aug 2021 09:00:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0831D1BF865
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04DE48343F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5fYjsjjGSEK for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 09:00:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F65F825D3
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 09:00:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so3146337wmb.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/r7Ep4UdXjsSOBLf43lDyco5E+fdU0WXPV4WhdKrFu8=;
 b=Il6ggb8UCCGDgQ+5WU0sFAubJo67oMOZ+H84m6vfGrUGhc/M4N48xDLvCqBHgZ5aIU
 V75GVxs21x+mFLCvYWtZ1bIHZk0X9RIDqrLlsyPc7psHTL8RtJCqOsJCAq2Gr/bWtkN/
 q7AYVlm4YtVoNFfUTRGdFrGzF9WnhUwlPOT9YqRKfXD4LsSSAb6dkh30gcWdg76VcE4s
 pGATsprINuZUp+brbSLk1YVNuV4GsrM9PJcTpotKc0hPRqFTHCn033iMvhirSTR4RDDz
 1r0lSfbcHfwmVVgRxU5fflB8Fv034X/R9I5sEKtjkuY/4ziwlxjBxlXKyJg7C8d5DEal
 W1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/r7Ep4UdXjsSOBLf43lDyco5E+fdU0WXPV4WhdKrFu8=;
 b=NoMYWN/sBBtgUrAlC3dO42jDLUtsU2OjAmI2HKdbF/a3nqY0A2MFeXIZbup9lzjoVo
 P7VKsQDEPmGTaKDaPbQuqInKvQr3U3J1SWHxGafhTfmRDhPwXzvTxh/HOdZXOXD13zPb
 BX87nlaXsnAPY8pLGM19/7lahjjiFS4L6Z3JOcmqnT1ZXsGrdfOpuYF2MqsiXVt0pvXI
 ZgMifsY3hPbzxAjIHkbAjTb36WycdYAjdtuJEcP0TAJ8Y1kT+Y+H6tlj5FGiFpBZFqlC
 qKUzAvwAKwUaFr0Ts56twfmkMfPa4PJFC5vYMTX9nrZs2Q9rknt/KPZvQ2EJ4rDCr7eD
 d1bg==
X-Gm-Message-State: AOAM53265StYy1bKyN7ZdDgQKOCi3LoLmlt4UiR2BeiEc7v1eeajFgIQ
 ZDXajyK3hX2d9v8EqQEW+XFrkHgq4BlAdA==
X-Google-Smtp-Source: ABdhPJy1UASU8T1uQ9hGLOSicC82qranr+6wqhRPwENWKlMYDGDxxAyIFQ+KLl94zN/z8zAoqcJtWQ==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr14148677wmi.86.1628154002123; 
 Thu, 05 Aug 2021 02:00:02 -0700 (PDT)
Received: from kali.home (pop.92-184-97-192.mobile.abo.orange.fr.
 [92.184.97.192])
 by smtp.gmail.com with ESMTPSA id b15sm5514771wrx.73.2021.08.05.02.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:00:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 10:59:55 +0200
Message-Id: <20210805085955.2105652-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uhd: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/usrp/dboard/e3xx/e3xx_ad9361_iface.hpp:14,
                 from /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/usrp/dboard/e3xx/e3xx_ad9361_iface.cpp:7:
/tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/include/uhdlib/utils/rpc.hpp: In function 'bool {anonymous}::await_rpc_connected_state(std::shared_ptr<rpc::client>, std::chrono::milliseconds)':
/tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/include/uhdlib/utils/rpc.hpp:28:27: error: 'sleep_for' is not a member of 'std::this_thread'
   28 |         std::this_thread::sleep_for(std::chrono::milliseconds(1));
      |                           ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1591ff7fabb09e4eb79f3aa293fbb228c255c45b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-lib-Fix-missing-includes-in-rpc-hpp.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch

diff --git a/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch b/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
new file mode 100644
index 0000000000..b287beec71
--- /dev/null
+++ b/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
@@ -0,0 +1,28 @@
+From 9c4d9d826a6f40f199c526afd5ec168d5d088591 Mon Sep 17 00:00:00 2001
+From: Martin Braun <martin.braun@ettus.com>
+Date: Fri, 29 Jan 2021 12:23:50 +0100
+Subject: [PATCH] lib: Fix missing includes in rpc.hpp
+
+[Retrieved from:
+https://github.com/EttusResearch/uhd/commit/9c4d9d826a6f40f199c526afd5ec168d5d088591]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ host/lib/include/uhdlib/utils/rpc.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/host/lib/include/uhdlib/utils/rpc.hpp b/host/lib/include/uhdlib/utils/rpc.hpp
+index e87a2ee324..ca89c10547 100644
+--- a/host/lib/include/uhdlib/utils/rpc.hpp
++++ b/host/lib/include/uhdlib/utils/rpc.hpp
+@@ -12,7 +12,11 @@
+ #include <rpc/client.h>
+ #include <rpc/rpc_error.h>
+ #include <boost/format.hpp>
++#include <chrono>
+ #include <memory>
++#include <mutex>
++#include <string>
++#include <thread>
+ 
+ namespace {
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
