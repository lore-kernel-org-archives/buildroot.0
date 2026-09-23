Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80120C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4D4813C6;
	Thu, 24 Sep 2026 18:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nCwEm3nXMa9; Thu, 24 Sep 2026 18:58:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 384F381360
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276337;
	b=RGczVyAEQ5q3zuUs7yqCGxeDXHzw3aS2uUmEMeQBFzCupVa9e9q4Bh7BxE7NuqZyrOBj
	 YlSQn9YFEeZO4Idi6J2TxD6SeoB/P5mpASVR2fxU4yhhBvMohlH3AXFEMElSb5dS+XSH9
	 rKJu78529E50iOAT+evEQtg3y3dnnqmoF3/eqEe+Oq3WvsAH5S6YtH7qpHMQrWuXoP/8I
	 RzwUG7YOEn0ZWUkhm2EnMqdF4PW5rD+j7MEmHbJZDnw8b6uFVZ6CHG+8vKPA8O9VlIfB/
	 2CvduRuQOTeZ3d70fKaev3wgGIz50i7OX77DngEA9WB9mH2nIr5TUvqcslnLs1M7Fsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kKFU6kUDBJwBRXBQqnV6rubP8lGIvyv/PdQnUTYAvuw=;
	b=Y6blHCFTUuJbdPdQM9a6I/glOwkWO8qdrqVoommNfA4g74SpiAKAressdDLDL7DcgP6b
	 T5gAXqu5JxU2R9M3wsee1Jm34UPtvrtSbr5pcVBFun1bE2KTRwe2W3TtA1gqdTiMF9RYF
	 bvs9GB9+Qnqtl7+eV82wCjaOYODgryavh3RUoIeOQrFXNH+8JZq2JkHBFLtx8RW7LCsaL
	 yIZylWXpXxZLLwU2AZLZcRSoxmz5DQdocHnczXFY56JVJSgw2pg+PUtL4uJ8SxjVEkeo8
	 S0Rq0pn/33hGz73TADl9BftyyI31ea/tA8mMrr5odZ4sNVoKN0+GqscuYSiapwjYHVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276337;
	bh=kKFU6kUDBJwBRXBQqnV6rubP8lGIvyv/PdQnUTYAvuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZFSe8wfmt1/XZ7LHf/2TeQSjztfGSfibZTeRr9RKc/bs50SYQIYDXvoO+JbSdLGJQ
	 LfJLI0tIuJcZf9WMK1Hm5Ec07MgmnLmMSKdzARl9Ia9h9KfnHhw9qumEmmwCMCWRO6
	 F9tkhidC7C5Rqv8puSLuiQe+p87ahlT7CqMqWRkof+VmUJiYoo2u/whvxbefD16sdM
	 hMlr+9gj4wKsV/Ziwfrd4DadKKaUXWF6ruaOoZE3FVu+gg2vaPcwhuyBILSBESmXrz
	 E4lGCkYL9bB/kKt7u+IJOj1A+qqgXGt4AiGH6Zw4ocYQJX971jCfoG+0qWikV5qlJ4
	 k20HZgU5tYETg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384F381360;
	Thu, 24 Sep 2026 18:58:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A619328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77FCD404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yl4pUvpKQy5w for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 947A1404C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=EDSZd0KbmRrpPn/HesjMwpFhby05hMFoZK6Mc0x+rQpe5j3IJSclEtkGCPC1Lkp2jxh5
 B9IwBZz9gnwtzPdPAP9vNCjfVibTHq3bSmvfNin3LbUfLhGYZT6GMqgRdWfMkJVhJniFy
 yM9fDo7t50c2r6F2hAF7QkJ/5DEhmGWawybdEP8yl6gE8ElehO9f/hcikJstxEP9HZq0y
 JEt54r1T+RN1DkCGKldDiNAwQg0yUtKRg9tYKb9uae9oGFbyv3GqtQa5eu3kY0mqnjlHr
 1Ftf/RIR2gH7v1/RIfEGTR+MTu+aI90rsFPPHeB6kR1m2WNMRE19mLG1gtfB1urAAqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OP/8RuDwaiCVlcZJgH2B99869b1IMa6FIVcLepmCYWw=;
 b=UDoZUEeeZZZCZ9l+o6TZRdWeal/+sKpuFbeFyDPQ3qBthtvlup4hE6sGMkGDsDNlBI7m
 qGcsrEZRfKzH34K0bhdnZApbULRj8rox+Ds821CnC0xq0lT4muz3NTd2jbW9WOzOQHd4F
 a3TAH8cg92jYjsTwfxwN5arX/c9Z8PVj4E/Bo11KtcTRwH8P3hlI49+4K9WV0e7MjNNJQ
 mPQeA0Ev/7h38sQ60ju0cE82rYj+z2PICvWzQmdfan+EdZn4WdA+TyQQTk5CjqPbFa6GX
 GV0dWPAO2uVh7ftQ/VEiGN3MWMBHr/B1t4sbJD6vu1BuDqkAcGkdipsxAFYbT1s+1+Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 947A1404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37CF094D3E; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:05:28 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e249a14e995a38b8447e9a66ef2fcaf0720aaeeb
X-Git-Newrev: 52446419346fb5c1557aa7543bf674f616ae286a
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.37CF094D3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/qt5/qt5webengine-chromium: fix build with glibc >= 2.43
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4262956589913395480=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4262956589913395480==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52446419346fb5c1557aa7543bf674f616ae286a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

No autobuilder errors were recorded, the build error can be reproduced
with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 60dc97fceef21b8cc1271ef7eca61e7bbee28513)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0010-Fix-build-with-glibc-2.43-and-above.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch b/package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch
new file mode 100644
index 0000000000..3c3a202ad1
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch
@@ -0,0 +1,41 @@
+From bf8bd5512920b28468d99b9ce550f0617e57d7f4 Mon Sep 17 00:00:00 2001
+From: Peter Varga <pvarga@inf.u-szeged.hu>
+Date: Mon, 16 Feb 2026 16:12:58 +0100
+Subject: [PATCH] [sandbox] Fix build with glibc-2.43 and above
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes error:
+//sandbox/linux/system_headers/linux_seccomp.h:218:39: error: expected identifier before numeric constant
+  218 | #define SYS_SECCOMP                   1
+      |                                       ^
+error: expected ‘}’ before numeric constant
+
+See https://crbug.com/456218403
+
+Pick-to: 134-based 130-based 122-based
+Change-Id: I5f2ea6826650b9eff6b4defff694f24e301f7663
+Reviewed-on: https://codereview.qt-project.org/c/qt/qtwebengine-chromium/+/713181
+Reviewed-by: Moss Heim <moss.heim@qt.io>
+
+Upstream: https://github.com/qt/qtwebengine-chromium/commit/bf8bd5512920b28468d99b9ce550f0617e57d7f4
+
+[Bernd: backported patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ chromium/sandbox/linux/system_headers/linux_seccomp.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/chromium/sandbox/linux/system_headers/linux_seccomp.h b/chromium/sandbox/linux/system_headers/linux_seccomp.h
+index 8690a96eb01b..8988836508c7 100644
+--- a/chromium/sandbox/linux/system_headers/linux_seccomp.h
++++ b/chromium/sandbox/linux/system_headers/linux_seccomp.h
+@@ -6,6 +6,7 @@
+ #define SANDBOX_LINUX_SYSTEM_HEADERS_LINUX_SECCOMP_H_
+ 
+ #include <stdint.h>
++#include <signal.h>
+ 
+ #include "build/build_config.h"
+ 

--===============4262956589913395480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4262956589913395480==--
