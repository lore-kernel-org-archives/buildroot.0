Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5D0C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 17:34:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6444B60E09
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 17:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6444B60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1921360618;
	Sat, 24 Jul 2021 17:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1cx9m5vWzw_f; Sat, 24 Jul 2021 17:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB86605C7;
	Sat, 24 Jul 2021 17:34:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A14271BF59A
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 17:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D71140227
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 17:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PyiV24cZfZw for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 17:34:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91BB940135
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 17:34:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so5432174wms.2
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 10:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXK0UVx8zy0jpooDzhwiwFJeoKCwZtFoWfWRzjuGeOQ=;
 b=c3KpeJjfu5Sk+Y/Lw6TOy4jTmlcpojpJ7BeLNMEqDy9PGN3q9f45SCr5QCbVm1gz1u
 KmMaN5n1MyU7QMnM9jERnFVEIvgjiZTQio8TnYgbuHZtYKQbjLaHJUfeCUrTP3X7T+0r
 X/zJazCG2KQOdspp0gVayqtkK5te1KTEvH5bGk6w2+e3g1iHnMwm+XCKl7F9nhNbQpv2
 riGiWXciY9u5qUs03q7ZYBNfQKnesSKbos5AZVWwYfRMAsvGMX+O/ph0lrgjqi68x+Fw
 JlBBvmV3/NG1M4dj5n53398aSf0HVDjKAhDa4pVnNx5QK+Hm5J93tzeT8COJQDSlH6NY
 vrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXK0UVx8zy0jpooDzhwiwFJeoKCwZtFoWfWRzjuGeOQ=;
 b=LPZajWx3BvV88/SxNDd+EqkcQR/rJgBKXZb2dwYC0YwAkrTO0gWwP2uyJZijImMwUy
 eJOYIIeewEk5Wd0ce0tlIBjOf4mBu83tuBBG7AYcD9CQEQXvrl5y9hfa+6Dlm+IBvdL/
 JVsR5V+j+DDvkGOcy81X3xLZRgzWvDsYyrrahGdEb/7U8v8lkSJ+9w9jONz9V4FUJ6hF
 PHCaywFa1Ln7V172IYbexMdF0Zex5NQ1WkU6j+JPXp98mN3e/g6CKTWRYQ+77o22WltD
 VphRsYZGF+NrRYkzNGwl9TDH12vI7Ma7ixlx6EavODyQDAdrlZg+PtZEp6sLCC1hyZ6I
 F5lw==
X-Gm-Message-State: AOAM532n8Gm9yijUhdLN/qBNWUqCc+/UKMJ23YxWsDObj8JdjwRGqV7o
 nfKPY1hUPtIM/ypcDw810jlyT+z9WTdhmw==
X-Google-Smtp-Source: ABdhPJzTsglfuWI/B+lVICX+JS/SzWa/KD9c0EpayLN2aML6rVsJooYNYXvCDkkspKEhrLrZE1d9og==
X-Received: by 2002:a1c:494:: with SMTP id 142mr9865071wme.60.1627148081199;
 Sat, 24 Jul 2021 10:34:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l14sm34674076wrs.22.2021.07.24.10.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 10:34:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 19:34:22 +0200
Message-Id: <20210724173422.636905-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libinput: fix legal info
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit a87d99af2f88eb2755959163727584f673483748 forgot to update hash
of COPYING which was updated to replace master by main reference with
https://gitlab.freedesktop.org/libinput/libinput/-/commit/354df8bce9874e92de2ad8535fdcedaec0755b27

Fixes:
 - http://autobuild.buildroot.org/results/b82d53ac70737488dd780a7112fc7ea0153768ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libinput/libinput.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index de8e94f9fa..7958cbac88 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -3,4 +3,4 @@ sha256  18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a  libinp
 sha512  9a834f075d7a1f892416bb6b241eb052f749d3aa883c4b39c0f1c9616c115d6b9a541b587508646fddaf0d3fe57af92fe4629b522d1d51196499e7b523e0aa90  libinput-1.18.0.tar.xz
 
 # License files
-sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
+sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
