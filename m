Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDE1C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 18:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C21C61017;
	Wed, 18 Jan 2023 18:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C21C61017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jfrw78BQE80j; Wed, 18 Jan 2023 18:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1CE60FEA;
	Wed, 18 Jan 2023 18:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1CE60FEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 602B81BF29C
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 18:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 483B341831
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 18:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 483B341831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbFS8Q0Tph61 for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 18:47:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F412F41828
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F412F41828
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 18:47:43 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ss4so78189687ejb.11
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 10:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9v+nEDKEF+WBXW9Ieh5DqlXllcS1vP6GbqEzuiCEjvA=;
 b=NWMFvYbKskH7j/Y7yNdp2j0nwwsu9qIBZVymX5IfghDyvo4Y2fWBZ9R4+8pObowLr5
 ue7D3Fl2BxTzw0hr6XXDigpM67OQ8e7h1RzDaOd8vAi39b/XsLka3jPa4ehuIXZy3Dl4
 38dbdipRsiL9AbwyH95kVNA6BTN4WRs3UOilzocS9gNKgPgRDlZ/p+8D0JHHHFtrqokJ
 7aABu3cNFvMcLDRon/lZ1rRwwKONg52P66PRtzAWpPvj+RkpBjrBcU13LdbIpliyjtIW
 tRtOSl4YMAF8VhYXIxs9y4pc/2SIm9V9LX0mSMPED3V+HQ20JGql/p/zwAxgeBH5xUtS
 GSQQ==
X-Gm-Message-State: AFqh2kqcxDGR4mQPRz8QzHe37d399vR9LxkiuASk24xGqqpQg5nc5ko7
 MgkkCmbMxOJt6nL4CslcrF/mgcZgmYI=
X-Google-Smtp-Source: AMrXdXsPoIwSt6QK7gtz5hhs7SuKSJ/fJErVgrCYrN/hwWSsrP9TN9G4iWpWJ+E6yTDIpWCLK2pFNQ==
X-Received: by 2002:a05:600c:214f:b0:3da:68e1:5d45 with SMTP id
 v15-20020a05600c214f00b003da68e15d45mr7652608wml.23.1674066217938; 
 Wed, 18 Jan 2023 10:23:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003daf89e01d3sm3186552wms.11.2023.01.18.10.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:23:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 19:23:33 +0100
Message-Id: <20230118182333.503773-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9v+nEDKEF+WBXW9Ieh5DqlXllcS1vP6GbqEzuiCEjvA=;
 b=IWGRgQvh/8iOL4yhptkRz39IF4vpL0dMgDmP0DfPLpRuSozznUQFRyH4rEMDDKb8Fw
 FDuIRERIrZjksK+YZXjZU1oCccD39TjhnKifhOmtuS3ty9D2MllO6Z2ELe7tdu4XBiND
 MCXJPRn+VpR6A3m1IYELsyOZl3WQQprEVCgkmzPKzHXI8ukJ5Z/AQXnsWchR7EPVmD42
 I6hURUk3+rpnx1tN1xzrKvRU+WQ1pqklkIhMQw4yIlr6JixoDhcRzXPVdANPhG+l6Nsq
 nscWxCKmjptylgUbDdMWWxQ5Xhw7gnv3/U97VxzRr2BuoBOkm61voijtnxRImiKIKmvB
 5lxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IWGRgQvh
Subject: [Buildroot] [PATCH 1/1] package/xxhash: set XXH_NO_INLINE_HINTS
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

Set XXH_NO_INLINE_HINTS to marks all internal functions as static,
giving the compiler full control on whether to inline or not. This will
fix the following build failure raised since bump to version 0.8.1 in
commit 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97:

In file included from xxhash.c:43:
In function 'XXH3_accumulate',
    inlined from 'XXH3_hashLong_internal_loop' at xxhash.h:4390:9,
    inlined from 'XXH3_hashLong_64b_internal' at xxhash.h:4453:5,
    inlined from 'XXH3_hashLong_64b_withSecret' at xxhash.h:4473:12,
    inlined from 'XXH3_64bits_internal' at xxhash.h:4554:12,
    inlined from 'XXH3_64bits_withSecret' at xxhash.h:4570:12:
xxhash.h:4196:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_512_scalar': function not considered for inlining
 4196 | XXH3_accumulate_512_scalar(void* XXH_RESTRICT acc,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f2c52238df97cc4c13117d8dc1423235231a094c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xxhash/xxhash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 04bc98690f..40e3c2696c 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -28,6 +28,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS) -DXXH_NO_INLINE_HINTS" \
 		$(XXHASH_TARGETS)
 endef
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
