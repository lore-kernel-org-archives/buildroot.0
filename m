Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14885C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28DC40287;
	Tue, 22 Feb 2022 10:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAK_tFCR249k; Tue, 22 Feb 2022 10:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 074A5401B7;
	Tue, 22 Feb 2022 10:23:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4F41BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDF1840155
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XY4_LfLgREiJ for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2103140137
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c6so32858641edk.12
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pTCqDXESoRGlH1wqdG3uwBcko71CJ9PttdSi6VC4qmA=;
 b=Tvn644kWk0BNIv8XRTXbp6qbH19YjfSUqjX+KCxSbirswOUC60s8bcvCHRQPQHruPo
 a6t29LWayAFGl8EAj40niIW+cEkDBND0rFbg14qclrTMZBCuNOdq8ns67E3sBJ9OYZFP
 FhA9MPquxPbwv8UZ1G9N3kfQe03LNb1V4n08OhY0C2eh/DaDASNqQZ0Nw7d8xVJaurGR
 6jjAefliGLfdi7N/Gyk+GPm32100zwna4A2uT6GkF46B/MI1DWJ1WoCnTn2o3wr3dxGG
 JRjn2ZByayPAG3PDugO2ZympGX8AD3gyFsOSNnKh8Zz39iyZ4TAMdL/Xo5eZGYO7Bdqx
 XfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pTCqDXESoRGlH1wqdG3uwBcko71CJ9PttdSi6VC4qmA=;
 b=Xtog7NmpDjSw5c+Y7uJIKNgwpmIWDQPFYy6ZTKCZv3Bj+1xatbg2CtsHy9sR7sLJsG
 DxjSVGCgJRkt3x3pu55vDhs2FEXsg5BPqe7aLTdDZetE8aVVjB+DzOLH0SlRz1aI9SWt
 zCZEDD0QEZKhVnKw22OVdsdp24IvIO/jhd/VbJN82r4SMKdkaq5bcdBs4U8m6qPPDG/l
 TRO3eejahkYEuav58RI7m9+pGhR51UORasE2oWUjc+bYdTeBi0zY1Onok+dJJzaCTuYL
 6+9G8Y0HwZBu3xahjuabkAECkZPq2WMrpsZDljm8DD+wDaSt6DOmDFrUtQIuH+jSKBn/
 6ggw==
X-Gm-Message-State: AOAM533nBeCqK8v2E2s3+fQYsdJw0JTTAy7ePm0cIqIyqU1kyl/srVB5
 MA8oEDxP6+UJv3YPokDlss/gugAqQCK/cA==
X-Google-Smtp-Source: ABdhPJwx413IIAcfbdVFLh58ynoEAr7wViIy5AqUdeW4NT00UYXz/6jN7aXvqfrWhgL7eO7gGfHUug==
X-Received: by 2002:a05:6402:294e:b0:40f:905b:dab5 with SMTP id
 ed14-20020a056402294e00b0040f905bdab5mr25573876edb.103.1645525346322; 
 Tue, 22 Feb 2022 02:22:26 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:26 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:07 +0100
Message-Id: <20220222102211.74573-5-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
References: <20220222102211.74573-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/7] package/systemd: remove hwdb-update
 service
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

since the source HWDB files are already removed from the target
system, it makes little sense to keep the service around.
If accidently triggered it could create an empty database.

The service is installed in both staging and host directory,
so a user could craft his own solutions if its necessary to
update the database.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d2c28b5b60..44297875f6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -310,6 +310,12 @@ define SYSTEMD_BUILD_HWDB
 	$(HOST_DIR)/bin/systemd-hwdb update --root $(TARGET_DIR) --strict --usr
 endef
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
+define SYSTEMD_RM_HWBD_UPDATE_SERVICE
+	rm -rf $(TARGET_DIR)/usr/lib/systemd/system/systemd-hwdb-update.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/*/systemd-hwdb-update.service \
+		$(TARGET_DIR)/usr/bin/systemd-hwdb
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_RM_HWBD_UPDATE_SERVICE
 else
 SYSTEMD_CONF_OPTS += -Dhwdb=false
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
