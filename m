Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDDFC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209114150E;
	Sat, 15 Oct 2022 23:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209114150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-MHfEqYrIY3; Sat, 15 Oct 2022 23:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687D7410A0;
	Sat, 15 Oct 2022 23:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687D7410A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B34B21BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F1BF60DED
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1BF60DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iv0xeFAxkRxJ for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ABFF60DE5
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ABFF60DE5
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:49 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id i9so4235405ilv.9
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQpqUK1+mSF0mco3lyQfBXEFXYz5jsqEq1vcgOoqWAA=;
 b=rlc3ubTtAQ2zXGhhWesG6BV7JOtjQJmyOG0/7tx4U0xR+5wHGR5+prvCGepFp0Yfwh
 L/KVVqMnnS9WXRnH+kTQJz28L+LruYPuHxNBYg+qC6AjXi7L8PMi+tkIJEOM6h3CiLZp
 dKmF4ygE++eACq8Rx4PNC2BSnnTvUCyRPE3MM9z/dDltB4RLLQ6s/z0Auhb9GQy8znKI
 fFOm13jywkGTO1ojsBA0bNBK74KV46GZ4YfrugQPGq/zzhuU93Lj0UmzrxffNHjG6QIP
 FAilISyddIsqNEv/rfE0qnfXvKHmPDQMLD4PsyKckwUJlh2LklYtH3IL6Ui3HrBUFPzv
 4M8Q==
X-Gm-Message-State: ACrzQf0mVYg8SWhNpQG4499e1g6EseZP8GcQ2iHkQgUf0eGKAXuQQa3Y
 N5Q69YiAeQzKnvmHUguxPA3JCy929nBhcA==
X-Google-Smtp-Source: AMsMyM5yU1GQz0Bj0ZgY1lCEqtkhA8vM0pmY5dikq29HiIqJWT/IDlpp4FcibR+10NEQhpQJ4CG77Q==
X-Received: by 2002:a05:6e02:15c5:b0:2d7:a1cf:6f87 with SMTP id
 q5-20020a056e0215c500b002d7a1cf6f87mr1931284ilu.30.1665875148214; 
 Sat, 15 Oct 2022 16:05:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:34 -0600
Message-Id: <20221015230534.4016536-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQpqUK1+mSF0mco3lyQfBXEFXYz5jsqEq1vcgOoqWAA=;
 b=DdAVUN+Uu9vajBSImOltkie/Dk0LPiVp0Xpdb04bS5KUVQEb7xt2jC2RS0CeXGMwA/
 jTCDnQvjyn0oNr1J75iCkGNMeUaBpGIZ9HReUQwZo04tjzPEb6B9AXB31zG7mI2gRfVf
 A7KJrYDA74i1yN/lsuvU7QMh3VKCkzorTgNssfqzlSCHZpny3ledobt7N9k7qLC7L7R7
 rD74aLNd05dY0sR7inGFzdZb+tLo4eoUzrckbxLB9f0yAz7RNgdtXxhjVlzCKtG6xGfU
 eYu5smtt42rL34scNWJOQgFYJFi+D0x8Hg7SI/mwCbhkCjZWO3iQDAZHVf/PvUbniHyj
 7qIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DdAVUN+U
Subject: [Buildroot] [PATCH 12/12] package/gst1-python: bump version to
 1.20.4
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 9501d94a97..adb116ac4c 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.3.tar.xz.sha256sum
-sha256  db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc  gst-python-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.4.tar.xz.sha256sum
+sha256  5eb4136d03e2a495f4499c8b2e6d9d3e7b5e73c5a8b8acf9213d57bc6a7bd3c1  gst-python-1.20.4.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 0fa1f661b8..feb2de718a 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.20.3
+GST1_PYTHON_VERSION = 1.20.4
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
