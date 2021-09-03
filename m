Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9DBC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 22:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B2261057
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 22:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5B2261057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F6980C56;
	Fri,  3 Sep 2021 22:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-UIr9cFxVoK; Fri,  3 Sep 2021 22:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4625280C04;
	Fri,  3 Sep 2021 22:20:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B926A1BF366
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 22:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B54EF80C04
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vG2UlQIbxqXW for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 22:20:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91C8480BEC
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 22:20:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z4so644352wrr.6
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUYCyMG5E2hBhtoSCJ/I+DHW1+C6iMlQfbzR4BFajDs=;
 b=Ly2/MaivgQhozZwDFmB+wqa2A5WQuc6TsCO1KxdOsnloc3VJyvPBcZ0Waae3HDiZih
 thzz3b1RbMazwVWa9QX4kgHi4RNYHqOekeRAjTymW94d7qzd4Io9EcY/95QSIkKyS8IQ
 4H0nQVoL1n12ZW17oziaDFHM+jGMylH1HAs98jBZgpKBkRDuI8aGI/gKDxVIdsSrnfFX
 hOCNp0zj/3VStdKEwf2ypnRt+Im0uZnCgWe551WfjdWkf0BWJEjvpENVKnzHaaAkN+n3
 pFBNnEqtNnPCKKkCWv2LfsUA8wdPw3eNdwXKlLDBdAMMndVBV596Uj6BxQ3YK2vdszZ5
 UXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUYCyMG5E2hBhtoSCJ/I+DHW1+C6iMlQfbzR4BFajDs=;
 b=kOqqBiIHu46MNvYUU40f+L/yaPFKW4662QTVIf0R20d/XkyGOekblxvsLBiV7gCXUF
 3gLvYDSKybpRNcj9yPS3+krPBmITvVrVfu7llXufPP9j+0gDsjbM5qV8qPW6X2vB+Z/b
 hfzbk3SGUer9AEXIWPcOFVLfLpQvp3Ss/Uf9Zy/38hcbmG3BUsVcpFAw0gdrdbDYXnc9
 yEUrBlLxi9K5VPMOYdE+buQl/U2lggMEWiWRiylUQ0QFYviF0JwcIMaMFL68S3ClWakO
 jNzdtbcqvpuHHAA0aMM7Jiqjwh9lGL33VS1246LpJXDZp7VZUOrLqJ1Tj1zJvaSuSbMK
 u9tA==
X-Gm-Message-State: AOAM532oMWVqHQcb0l+5oPThg66f+vuOTrFSDgKSP9TavKU5xZTA0n/7
 1gXG8OERpNsZc/CINuYA9mCD+kFRcBK+2A==
X-Google-Smtp-Source: ABdhPJyBrgPG76hTFzOf5hvxhVEbC77JES/3Sfy9UrYhwZ9ZXZG51s8/3ZNRKp260EMuGuJbol7FrQ==
X-Received: by 2002:adf:8144:: with SMTP id 62mr1196065wrm.144.1630707627607; 
 Fri, 03 Sep 2021 15:20:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id s15sm453169wrb.22.2021.09.03.15.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 15:20:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 00:20:17 +0200
Message-Id: <20210903222017.1040418-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/xvisor: fix build with gcc 11
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failures with gcc 11:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/build/drivers/drivers.o: in function `psmouse_extensions':
/home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `lifebook_detect'
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `alps_detect'
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `ps2pp_init'
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `trackpoint_detect'
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `fsp_detect'

Fixes:
 - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Update patch to use static inline

 ...psmouse-back.c-fix-build-with-gcc-11.patch | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch

diff --git a/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch b/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
new file mode 100644
index 0000000000..28010034d6
--- /dev/null
+++ b/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
@@ -0,0 +1,114 @@
+From 0e07e82121697d99470a147eadad9a708889c4df Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 2 Sep 2021 18:13:03 +0200
+Subject: [PATCH] psmouse-back.c: fix build with gcc 11
+
+Fix the following build failures with gcc 11 by defining inline
+functions as static:
+
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/build/drivers/drivers.o: in function `psmouse_extensions':
+/home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `lifebook_detect'
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `alps_detect'
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `ps2pp_init'
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `trackpoint_detect'
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `fsp_detect'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ drivers/input/mouse/alps.h       | 4 ++--
+ drivers/input/mouse/lifebook.h   | 6 +++---
+ drivers/input/mouse/logips2pp.h  | 2 +-
+ drivers/input/mouse/sentelic.h   | 4 ++--
+ drivers/input/mouse/trackpoint.h | 2 +-
+ 5 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/input/mouse/alps.h b/drivers/input/mouse/alps.h
+index ae1ac354..acc1e89e 100644
+--- a/drivers/input/mouse/alps.h
++++ b/drivers/input/mouse/alps.h
+@@ -51,11 +51,11 @@ struct alps_data {
+ int alps_detect(struct psmouse *psmouse, bool set_properties);
+ int alps_init(struct psmouse *psmouse);
+ #else
+-inline int alps_detect(struct psmouse *psmouse, bool set_properties)
++static inline int alps_detect(struct psmouse *psmouse, bool set_properties)
+ {
+ 	return -ENOSYS;
+ }
+-inline int alps_init(struct psmouse *psmouse)
++static inline int alps_init(struct psmouse *psmouse)
+ {
+ 	return -ENOSYS;
+ }
+diff --git a/drivers/input/mouse/lifebook.h b/drivers/input/mouse/lifebook.h
+index 4c4326c6..0baf02a7 100644
+--- a/drivers/input/mouse/lifebook.h
++++ b/drivers/input/mouse/lifebook.h
+@@ -16,14 +16,14 @@ void lifebook_module_init(void);
+ int lifebook_detect(struct psmouse *psmouse, bool set_properties);
+ int lifebook_init(struct psmouse *psmouse);
+ #else
+-inline void lifebook_module_init(void)
++static inline void lifebook_module_init(void)
+ {
+ }
+-inline int lifebook_detect(struct psmouse *psmouse, bool set_properties)
++static inline int lifebook_detect(struct psmouse *psmouse, bool set_properties)
+ {
+ 	return -ENOSYS;
+ }
+-inline int lifebook_init(struct psmouse *psmouse)
++static inline int lifebook_init(struct psmouse *psmouse)
+ {
+ 	return -ENOSYS;
+ }
+diff --git a/drivers/input/mouse/logips2pp.h b/drivers/input/mouse/logips2pp.h
+index 0c186f02..439e9c58 100644
+--- a/drivers/input/mouse/logips2pp.h
++++ b/drivers/input/mouse/logips2pp.h
+@@ -14,7 +14,7 @@
+ #ifdef CONFIG_MOUSE_PS2_LOGIPS2PP
+ int ps2pp_init(struct psmouse *psmouse, bool set_properties);
+ #else
+-inline int ps2pp_init(struct psmouse *psmouse, bool set_properties)
++static inline int ps2pp_init(struct psmouse *psmouse, bool set_properties)
+ {
+ 	return -ENOSYS;
+ }
+diff --git a/drivers/input/mouse/sentelic.h b/drivers/input/mouse/sentelic.h
+index aa697ece..42df9e3b 100644
+--- a/drivers/input/mouse/sentelic.h
++++ b/drivers/input/mouse/sentelic.h
+@@ -123,11 +123,11 @@ struct fsp_data {
+ extern int fsp_detect(struct psmouse *psmouse, bool set_properties);
+ extern int fsp_init(struct psmouse *psmouse);
+ #else
+-inline int fsp_detect(struct psmouse *psmouse, bool set_properties)
++static inline int fsp_detect(struct psmouse *psmouse, bool set_properties)
+ {
+ 	return -ENOSYS;
+ }
+-inline int fsp_init(struct psmouse *psmouse)
++static inline int fsp_init(struct psmouse *psmouse)
+ {
+ 	return -ENOSYS;
+ }
+diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
+index e558a709..f14e59c0 100644
+--- a/drivers/input/mouse/trackpoint.h
++++ b/drivers/input/mouse/trackpoint.h
+@@ -145,7 +145,7 @@ struct trackpoint_data
+ #ifdef CONFIG_MOUSE_PS2_TRACKPOINT
+ int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
+ #else
+-inline int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
++static inline int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
+ {
+ 	return -ENOSYS;
+ }
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
