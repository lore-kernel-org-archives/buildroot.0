Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C63C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F257481E04;
	Wed,  1 Feb 2023 05:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F257481E04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nS-wbLqyzfoz; Wed,  1 Feb 2023 05:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF1D81E0B;
	Wed,  1 Feb 2023 05:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF1D81E0B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 285291BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02C34405BB
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C34405BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyoVTP7divX6 for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7831405AE
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7831405AE
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id j4so3566189iog.8
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcPiskXBLmoG4+GRcpKfmaXB8xplo88bMXnui7RsfqE=;
 b=ud7hoiKsD2+8mFTH9raZvDQKI2oC0P26SAGLCYtDVpZgQWmWtiyXJHwR0fwcH/WXuh
 sunkxbQ5m2tBRnHz4r9W7xfUpY0mYh01KujvhAti8ndZQbX4pmcr6CmccJa8LitaA9Qv
 b8u2fjpzt5hQmK/MHRVp/3+3oHPC90FGK/d2YAU50EKuRH7v2XDVMBmaSN6zDdocvP4O
 ouK1psmMFuOoS8f0B9f40R/9XKOocYzGz34Q2T7XQBLVzPf0WHjODPBDROAfnMPQFSIT
 FEJwA1xPJm38lOo++BybZ8XSJJVSKSED1RZuQUI+Ct/30hozABepWwBxNdorEPW6pqDp
 6vlw==
X-Gm-Message-State: AO0yUKVSEnCEyPWe/BPuFeiqlvtdsnXyoraIG/t17DBRb/oiJuLfP91k
 1dYVkvB2dM9xJWFcgJL0tedQGc6DL5gQDQ==
X-Google-Smtp-Source: AK7set8pVfxbT0s63KHdB76hhx4p473DAMcD3/5zoZaigdenjGv9sd44iTN+fCUMpEpNHZfsCzohcg==
X-Received: by 2002:a05:6602:408a:b0:6ee:f9e1:423a with SMTP id
 bl10-20020a056602408a00b006eef9e1423amr925598iob.11.1675228638816; 
 Tue, 31 Jan 2023 21:17:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:58 -0700
Message-Id: <20230201051658.383420-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcPiskXBLmoG4+GRcpKfmaXB8xplo88bMXnui7RsfqE=;
 b=kmva4fgWFIDAQbi5IRxgPs+2bPt6k+fU/pcXI+dRVVYqwUtvA5e28n3HMnDppFoppw
 cwA/8VRCWCIeXEG0Uv2J3B8jvoslFXW27yGUWSQnuzIvTaSUVGiqnz5tG42u+5Oxe1t7
 qkMkLAiK05Li1SlulNOVl4+RS4n/4pBDnquYrhCoO+z0JcOFThFj73+ga7gNxhVw6g9M
 pWw/FJM1aWn6i5IIAQNqbgyoN7Khh2pmDZRZH0Mf/f4WQYXliGft6Clbq53/OQG5eQ34
 d13NT/WyyxKwL8epKYnmDPG6x2Mak1acKYevBRVLvh6Po7intkOHaU4VOci8NADYRxOD
 9/jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kmva4fgW
Subject: [Buildroot] [PATCH 13/13] package/gst1-python: bump version to
 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
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
index adb116ac4c..128a739c2c 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.4.tar.xz.sha256sum
-sha256  5eb4136d03e2a495f4499c8b2e6d9d3e7b5e73c5a8b8acf9213d57bc6a7bd3c1  gst-python-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.0.tar.xz.sha256sum
+sha256  6c63ad364ca4617eb2cbb3975ab26c66760eb3c7a6adf5be69f99c11e21ef3a5  gst-python-1.22.0.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index feb2de718a..2fc268b0ac 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.20.4
+GST1_PYTHON_VERSION = 1.22.0
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
