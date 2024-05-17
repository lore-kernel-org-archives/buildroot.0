Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ABDC25B7A
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 17:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CEA440723;
	Fri, 17 May 2024 17:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30SZmhwXBPZn; Fri, 17 May 2024 17:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2106640713
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2106640713;
	Fri, 17 May 2024 17:13:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 670BF1BF357
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 543DB8299E
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQ3jhMQccJH3 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 17:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 045D8822BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045D8822BA
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 045D8822BA
 for <buildroot@buildroot.org>; Fri, 17 May 2024 17:13:04 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so26033681fa.2
 for <buildroot@buildroot.org>; Fri, 17 May 2024 10:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715965982; x=1716570782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D6De74Ov7uqwULkEccGlYUxTXEpVEHyC2IXtkQ09YPU=;
 b=N1IPSGugGln1JKkQ7/4RaNNw6GE6a8IsUkSnYFduOFvDxZLO/5Xo/szd7afgwpXbf5
 e+6Uqvz2zWnZ4t5cpUro/9KxCPkant7Su52Ebv5CE8nJhwqZHlLlxmmJJ5RAyAfdJn4R
 7kZOXGNhh3FNDLJym5UqMp5J15gKm79jBaUmz46PLVbd/1rqAnxCLYf3WVRJgikV0MTL
 wk/QnD9Dk+CulT5QNLyu379Hoq+cGsi0lBQgJZ6pxlCCj8mpK7Eu7xi+MRK1/tj7Hltl
 GHjOtgBQa/wS0ivsM9o/lmlD7yQD8tdzMLZqYSDQeBhthq3WU4JLr2bDrMOQVRoNRZcz
 Rc6A==
X-Gm-Message-State: AOJu0Yx4I9xZ9k9qIUSlS+I3Iz5UZ9ptz8j3F0PvLWDpJyJtM4iZLsW4
 edSglA5/CvY5nj9FajndSsY1qtOFIIahmZ5ePiJhuxG7BuLxvrm9UQY6Bg==
X-Google-Smtp-Source: AGHT+IGQElPZzcPSC+xiiQQjtIulBXWlG5pQ1JURWYFwUfJyiwK47SM6LcH2Rz0Z2z3d5/SfkhyY2A==
X-Received: by 2002:a2e:a175:0:b0:2e3:3b4e:43e4 with SMTP id
 38308e7fff4ca-2e5204b2ed4mr151957631fa.32.1715965981961; 
 Fri, 17 May 2024 10:13:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccfe1532sm306332755e9.46.2024.05.17.10.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 10:13:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 19:12:58 +0200
Message-ID: <20240517171258.783129-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715965982; x=1716570782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D6De74Ov7uqwULkEccGlYUxTXEpVEHyC2IXtkQ09YPU=;
 b=gXUNKMMpx8Y8u78CVzNJuuJxtgF3S2r/WNMpluhg5sscGyFkmZAhY8f3bI7HyiPWbe
 ZjMFRwwnK3gYmWBMRjgHfbRVJ1q/ER6ljxHYTPWrUG7NBbg/iVutD6L3ooEOMwlUsitv
 q/IRzP/VNL+idrCUUnVD9PgjY4Yx0c9o8vNVJFN6SieZ+svB4lV+kuJcUYWAlyXQxLwh
 wJUdGCJhsXtgKxPdYFGPXwlV5czL8dJijgCdu//JVm7kWerca67mhC738SwB7lSimfxJ
 jFhPeQr4HFTRJGFZ01TlDr6ouTSsFq1TnQZzf9ah7e+zi2CkhH61PJ6BgkBVA065j64g
 AEIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gXUNKMMp
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: fix python build
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following python build failure:

In file included from /home/buildroot/instance-0/output-1/host/include/python3.11/Python.h:38,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/common.h:266,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/attr.h:13,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/class.h:12,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/pybind11.h:13,
                 from /home/buildroot/instance-0/output-1/build/gr-osmosdr-0.2.4/python/bindings/device_python.cc:1:
/home/buildroot/instance-0/output-1/host/include/python3.11/pyport.h:596:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  596 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f009958c37902a224512b336fcb431903bdd0b96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gr-osmosdr/gr-osmosdr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 316ed80887..0d1e4edb30 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -23,7 +23,9 @@ GR_OSMOSDR_CONF_OPTS = \
 GR_OSMOSDR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
+GR_OSMOSDR_CONF_OPTS += \
+	-DENABLE_PYTHON=ON \
+	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 GR_OSMOSDR_DEPENDENCIES += python3 host-python-six
 else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
