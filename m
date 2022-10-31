Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750A8FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 16:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF6588184F;
	Mon, 31 Oct 2022 16:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF6588184F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTAmhZPj_7EU; Mon, 31 Oct 2022 16:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56144815AD;
	Mon, 31 Oct 2022 16:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56144815AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E66D1BF384
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 16:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56DC6815AD
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 16:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56DC6815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gjfntHucK-A for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 16:14:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC518148E
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEC518148E
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 16:14:56 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id d123so5383856iof.7
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MVsFW7DEZrNA8pdVw8i/nR/tziJCCrdKCH/lsHt6M6M=;
 b=iLtJrP85WFBbLsqAG4B2RztEYjnWvnkykLDgCkepJ5mog7VCVZC8TazLqiMaf0708K
 yZS1ISvDhImUCBqlmYc4LkPJQt/rhI67BVZVnGb7ISij8NLIYyHZzOVTSSg3tu4+FYXg
 8CUvKqsaQ++TH0rE1vHhoz0CrAnHgH7F2CBDw8MIDvoqCDqeyjIPm45JJy1Kbg81egYP
 67NHAq7UOw5GB8Jsp7JQwV9bzuSuMxKEjLNZWAPfNhXRsbQkSMO25eBXJlort/3TLaP1
 Aa2OMaFwNJCm+CqAt5VZ9nREZEEd+hH6KlusdXbmvAOIiludGQkdiXMfXSa7mGOFAlcE
 IJZw==
X-Gm-Message-State: ACrzQf3aICYiWQa/qoBBFZxKruBtmgVK747/kZCMVGYOYh+0ftCIGVkp
 wQHhF6CAPgxLGA6pd3YJY1/cG+f6LTwSXQ==
X-Google-Smtp-Source: AMsMyM7pbh4x/tsEwMHusBU/agInVuvUXtz9Oc3euWsaLxL2t26igsRd0TQsZjpnZ8tQE9YMMemczw==
X-Received: by 2002:a05:6602:14c1:b0:689:34d0:a0ef with SMTP id
 b1-20020a05660214c100b0068934d0a0efmr7133736iow.69.1667232894966; 
 Mon, 31 Oct 2022 09:14:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z35-20020a0293a6000000b00349d33a92a2sm2864562jah.140.2022.10.31.09.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 09:14:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:14:51 -0600
Message-Id: <20221031161451.2604400-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MVsFW7DEZrNA8pdVw8i/nR/tziJCCrdKCH/lsHt6M6M=;
 b=FXd7XbjUYOBN/RmGAvriJvbOnMiQ+54/7Ukd/IPHH/GTunRlew30nB9nQn9nPdAo15
 S7iU99sQJNBtN5iYBYSfbiVb/GHCBNcqBG7/ytTbMsxGwqo3QW6Y6rykGERLk6EMi5wH
 2zB8PeUcfQIVPQkj1jU26OCqkhaSbq6eFDYwoNBkqQNACRt4vf9F04GetTl9d05Enb+i
 WA7C8d5E+6VJdVEfA829UuB6Il5aNtedoEzN7FqmckxxI5ob/ij9SAKjvTBemtvsEo+O
 LAoG8BLl+6J8HaJGmnp/7uOair3KiNOrS6ha+KIWI+kqSktX18yghzs4eh/BhMii6Ax2
 2AXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FXd7XbjU
Subject: [Buildroot] [PATCH v2 1/1] package/iwd: fix D-Bus bus services
 directory error
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
dependency, however we still need it when building with systemd so
that the service directory is available via pkg-config.

Fixes:
checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - depend on dbus when depending on systemd
---
 package/iwd/iwd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 002988cf33..6e366e094d 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -31,7 +31,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 IWD_CONF_OPTS += --enable-systemd-service
-IWD_DEPENDENCIES += systemd
+# Need dbus for system_bus_services_dir variable provided by dbus' .pc
+IWD_DEPENDENCIES += dbus systemd
 else
 IWD_CONF_OPTS += --disable-systemd-service
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
