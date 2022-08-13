Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EA9C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 11:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA9FC60C22;
	Sat, 13 Aug 2022 11:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA9FC60C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czNsO9a3miMY; Sat, 13 Aug 2022 11:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BAA860BBB;
	Sat, 13 Aug 2022 11:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BAA860BBB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE281BF3A8
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B3BC83E19
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3BC83E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncY43TaWtCjO for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 11:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E69D83E11
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E69D83E11
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 11:31:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso1628764wmb.2
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 04:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=C+QNFvyVeWI18dUhyMfHUKDr63INBwgEJQM1yxu6vEQ=;
 b=xENVjQrSrau4Bpg4s4bHFwVpt8ekyrdUrHqrrvpl5YGOB9Wr467NnShjQVVH8o4vuw
 Ic+EUuhM9Lxs3JKBU9LdVGWDJ7s0yb4Hdl4zH4MQB1lckKoCNiwHLIpS+RYqQurtTkaH
 iVS710piO0wwhFyFOWb8Qt+oKwhngEycOypzknFBm2WGitOAmG0Gvx6B6HSkP5twfL3j
 +i/V4cYmkqabXJOw3NeJtT1j1zEBkQKwn1SSa60m1a9CCF8AigSGhbSl5wnWFHYUFnBp
 hGGvueZlRfmbm7ugepKFNO/OaaYpHJ3vN3lM6+4QtBZfEYMpiVPfvkUJ3D55sxLWXB0B
 pqeg==
X-Gm-Message-State: ACgBeo1fyhX3c7+9TxPnANkH4tV+Um/slC+MPajl5nX7qj7SjTclOze/
 YwcaMV5B0mMZMDVGdAzsa0rgJCilSkE=
X-Google-Smtp-Source: AA6agR6PNvdT/JLNeo2C81qwtqEuEWtLPmg71Th71+4w8l26sTwsaaK25s1Je0zEXytqMur9VUuCFw==
X-Received: by 2002:a7b:cd01:0:b0:3a4:f06c:d1ca with SMTP id
 f1-20020a7bcd01000000b003a4f06cd1camr11569188wmj.41.1660390278034; 
 Sat, 13 Aug 2022 04:31:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b001c2477c403353e95.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:1c24:77c4:335:3e95])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfdc91000000b0021f0c0c62d1sm1867449wrj.13.2022.08.13.04.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 04:31:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 13:31:14 +0200
Message-Id: <20220813113114.986655-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=C+QNFvyVeWI18dUhyMfHUKDr63INBwgEJQM1yxu6vEQ=;
 b=eJbLk+9My26Qm/zglZdyfZ87ookeCPn7vhoCNALC3a4SXnVFxA/Xmz826lkuCS51yi
 a/OaW5Zl3qDzThoF+BzGrsVWAxfSbkj+5xX4aHgAsupfI9lzgd1Y2nFVd96bowpvhDB0
 NPyLbprO1iqOBgkzYpim5iT+wlsE3ddC/8YYKThoTlMOc5Gw2Yg0+JGTfLSaDhxBpkOp
 8uk2qYKrk0rGv7MD45+IpChidZ9104tNx2OA9JfFE7tfp6xOsMNuVILPfBbcv2kDPvOX
 RX1LtiqQRZ5QD+H36CFppNwhWDs4q5YQj7xVOj0T/6584ujrIyfpSpDSNUr0hWy1G0sH
 IGQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eJbLk+9M
Subject: [Buildroot] [PATCH v2,
 1/1] package/jack2: add host-pkgconf dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
69284b6700e5f45e25a583e87b86ed1eb95038fd:

Checking for program 'pkg-config'        : not found
The above check failed, but the checkee is required for --alsa.

Indeed, before this commit, host-pkgconf was pulled by libsndfile
dependency

Fixes:
 - http://autobuild.buildroot.org/results/cbdc251980f5571f75281202ebffc04ddecbf28d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update commit log

 package/jack2/jack2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 9e56dcdfd8..9d6a3b6479 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
 JACK2_CPE_ID_VENDOR = jackaudio
-JACK2_DEPENDENCIES = alsa-lib
+JACK2_DEPENDENCIES = host-pkgconf alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa --example-tools=no
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
