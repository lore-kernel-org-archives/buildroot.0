Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30713C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:43:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A066054F
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A066054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8950183F10;
	Sat,  4 Sep 2021 09:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KcennFki9VFP; Sat,  4 Sep 2021 09:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB51983F0C;
	Sat,  4 Sep 2021 09:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06D501BF836
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9C7760754
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBGtbuZ_Z2-C for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 09:42:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D71CA60753
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 09:42:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 74385882E1; Sat,  4 Sep 2021 09:41:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 11:42:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57aa6e718f8adbd0ac324179e28c9549cb862b59
X-Git-Newrev: 9524cdbc00f7128ce0629579b0b22016c203f71e
X-Patchwork-Hint: ignore
Message-Id: <20210904094134.74385882E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: fix build with gcc 11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9524cdbc00f7128ce0629579b0b22016c203f71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-psmouse-back.c-fix-build-with-gcc-11.patch | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
