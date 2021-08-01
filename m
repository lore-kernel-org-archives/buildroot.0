Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45CAC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ED5861054
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8ED5861054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4987583C9F;
	Sun,  1 Aug 2021 08:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yxBf9536VmH; Sun,  1 Aug 2021 08:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974D783C9B;
	Sun,  1 Aug 2021 08:04:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7888A1BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D148401D7
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeUR_3TGQKgx for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:04:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5A86400C2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:04:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id x17so2283775wmc.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=azFtf6rxCt4zugp+BZycGYMOTJLdP/ShMqgAbeVjNkQ=;
 b=dlTlzMYF7m6nThRqgJaEH4p0vwcugoQFEoEsMzI4J5i3uL5zpPwkJQpVVfvbjcLONp
 n836wb7/XuZqWqlByyhuYIY88SW4+6ynPtkpihK3/GoYVbxRouHow7nypMDgJ9PwMrxd
 G8cgHXIFuHDlgbuW9KED3ndHFXCpS5iNqlzcKIxJ/LaYdnZtSSfStTHC+VEVYcerKGbl
 /nMlVeanUfNX6kPnlWO0ymbJSqLxub2wktEcxYJic8UqwwXIioARcTyUlv4jPyjaG75B
 JGmjF4l+6E/Y/ksPoDYKUIK18yY5XTLEHX2iL3+r+bviZcIE4dHYR8EZlCPs//CEEB/M
 TkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=azFtf6rxCt4zugp+BZycGYMOTJLdP/ShMqgAbeVjNkQ=;
 b=PCYy5cIiffhftN+6kYvd6b4pdJvHWLiseUez0gwXGpcFskMy4SRIzcZyJDZtFIZM3P
 R66RO2QDPPheZefMmcva9w0TrfH9qwNx9D0L/8UcSHQPZcdvK56dlcOzkQIDx10kpNCZ
 Y11cPph06Bzdj5UHKIgaj5lXh8UV0tLR/40CNCyCUaLhlk9SpitdK9Gwr3sEdra3UvdQ
 wMZ4Tn7g1tQq9HJvX1oHRx4xudC7pEfsdiWEDYBJoArYRYXLHwRkHMBB7g32w5nHMQHo
 XqU43zEhEnbPKZ1JMHZ1+QNy4Dj0hydlo49GWEpZOfSYSBdXv6W+1Pl0LLdY2lYdtDLb
 XhLQ==
X-Gm-Message-State: AOAM533y1TAnwbY6yRJAeqDGP3klBJ3bs+G4AjZfUSfoLzTJTOy604iX
 7nI6X3zMMdpU180vf3/J+eWLNSlN0frlhw==
X-Google-Smtp-Source: ABdhPJzTMkv19ktx/qtH8//b6G0W2m9vA2ESsEJ7rrEl5GmCKjG6YidivkwCvhP3/dGNCmT3hLdUEg==
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr4717604wmh.106.1627805078650; 
 Sun, 01 Aug 2021 01:04:38 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id z17sm7436957wrt.47.2021.08.01.01.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:04:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:04:30 +0200
Message-Id: <20210801080430.2591526-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ibrdtn: fix build with gcc 11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from ../../ibrdtn/data/PrimaryBlock.h:30,
                 from ../../ibrdtn/data/Serializer.h:27,
                 from ../../ibrdtn/data/Block.h:29,
                 from ../../ibrdtn/data/Bundle.h:27,
                 from ../../ibrdtn/api/Client.h:26,
                 from Client.cpp:22:
/tmp/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/ibrcommon-1.0/ibrcommon/thread/Mutex.h:43:40: error: ISO C++17 does not allow dynamic exception specifications
   43 |                 virtual void trylock() throw (MutexException) = 0;
      |                                        ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c2d9033c68b5c1407d2cf87b98dff61958b8e7b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ibrdtn/ibrdtn.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
index 3f805c4024..99ff92d442 100644
--- a/package/ibrdtn/ibrdtn.mk
+++ b/package/ibrdtn/ibrdtn.mk
@@ -10,6 +10,7 @@ IBRDTN_INSTALL_STAGING = YES
 IBRDTN_LICENSE = Apache-2.0
 IBRDTN_LICENSE_FILES = COPYING
 IBRDTN_DEPENDENCIES = ibrcommon host-pkgconf
+IBRDTN_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 IBRDTN_CONF_OPTS += --with-compression
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
