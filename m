Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9E5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:05:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A167610CA
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A167610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3578E4048B;
	Thu, 28 Oct 2021 16:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSpoRJhUSQu0; Thu, 28 Oct 2021 16:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71FEE40343;
	Thu, 28 Oct 2021 16:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB6661BF9D1
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB70F607A9
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTELPBj-ajla for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 16:04:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A004A6072C
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 16:04:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso9899042wmc.1
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OEILnyEvZDrcLVXCsHyL4NqqMqCdnwzYWzSU/uUCFVk=;
 b=h5iIziK8P8CkX4lE+1LUa2PF4T8DQsbypdyTIp39FT1p47HrpYZiSd6Tte2xkxTyka
 gXtjwSYhstztBTDusboCjrCnEZRh2Oz31j43UfwB93Ad+ZvQy8mG/y+f5grHhcy829Jd
 kEM8r6BEHFih21ylFHJC3A6pIIevT7tLrXPY5Jn/1RQf7jFpZprcrNMo9W0RLeFIXa7D
 wc1+gaKEdKIAzcMT7DwvsdWO+aBvI9jI/sF+OC2uOWhtxP1mRGYrREonWCkg3izuh2eV
 XiOzFvku/9aBoWF3O71icM8w3Romh+IYNUbBvUKdM4tLN6HVljworSd1+wTOrAQq2Uo7
 70qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OEILnyEvZDrcLVXCsHyL4NqqMqCdnwzYWzSU/uUCFVk=;
 b=Q4bFZxv5lnJRxNA7y7pBFOoxprzmK3mQaGdg+G8yhWXOIT+c3i0aiBj5VRVs+6GD4p
 Tb3kyJqAgGyUVYohyDjmQlymUtkGWwmPNHnLsmm3wHqrytLVEIK0N7CMmfNhS0dWIjKA
 kagxmDmASI4UJ3SGBuBf9xne8B2FRpNy2WRK988bgrAkbHVBCey90Ie27uIDvtdhFVBm
 Eh5qeUggq6kHxOGuhIywgpT6LyPiMSC9sTLCTtZFXTRn5A8EIQZIuY0e4y2OWzDJ29zc
 8ei4hSm/XkgfBAR4brri5Vy9LbkL1Ltwl+2PHGinHqEtCwqjYTt7pNGERfIYtmEZ2ucy
 I1IA==
X-Gm-Message-State: AOAM5338nzQPFRXIEx9VefVbMvk/f1s7MnYLPZ5SxPlsCwioqLKNdY2H
 y1JVLo6D9qOAPxHbsjonBQ9XzCxEaWI=
X-Google-Smtp-Source: ABdhPJwvPqf4VGHd8OX96TJcnPBJM/02+t/svPW6r0aMNCb5KR0NnjHZgBaxJBK2V2bPD3kjgjQ18w==
X-Received: by 2002:a05:600c:21c2:: with SMTP id
 x2mr13648091wmj.93.1635437083599; 
 Thu, 28 Oct 2021 09:04:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id w10sm3331933wrq.88.2021.10.28.09.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:04:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 18:03:07 +0200
Message-Id: <20211028160307.1123157-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028160307.1123157-1-fontaine.fabrice@gmail.com>
References: <20211028160307.1123157-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/netdata: disable unit tests
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable unit tests which are enabled by default if cmocka is found since
the addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/netdata.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index d66a9602e2..34365cbf56 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -10,7 +10,9 @@ NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
 # netdata's source code is released without a generated configure script
 NETDATA_AUTORECONF = YES
-NETDATA_CONF_OPTS = --disable-dbengine
+NETDATA_CONF_OPTS = \
+	--disable-dbengine \
+	--disable-unit-tests
 NETDATA_DEPENDENCIES = libuv util-linux zlib
 
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
