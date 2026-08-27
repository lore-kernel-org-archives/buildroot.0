Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D46C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D0BC6078A;
	Thu, 27 Aug 2026 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2VAJ0ZwKYif; Thu, 27 Aug 2026 20:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787861306;
	bh=n5694Z4JLjjc7lwHIwhh+s5cKFIJsGHTPHVuO9IE4qI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lWz2UNpwg1JPnMkYRSkstKI3KQtdrITT3xE3DUAr+tskGwo9yAUkKvd8QWwQiipx1
	 ZAnlyOUCVg4WeSOVdw85cgU8O9PVE0dxIHOP93N61FzL/Xc54x/JqI/r5+xWfda8T6
	 Uc9/70qLYaTSlbqXIH3Y7UAh2EF21Qz3BZJ39LtsrtLxRB7O19fxlfRREXWrISPc7T
	 xv8YbbxBcwW3Lgw3FYw3pX57eoXTTMvb4sy2a5yvMdMrGWwamSVAp9xYQ0/951+Zt1
	 ftMyUkbntnutZ24S2Z480uJ/6MmGO7/btyNr/EIwLoKxA+8APVhuWdP+FLHniiRfrA
	 Y5spYgoJpbuRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3166079B;
	Thu, 27 Aug 2026 20:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 340EDB2C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19FAA407E3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dz24axiwJTSh for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3701740794
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:08:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B96D21A1882
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:08:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8D64D5FFF4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:08:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE79411C78023; 
 Thu, 27 Aug 2026 22:08:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2026 22:08:13 +0200
Message-ID: <20260827200814.1801974-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/collectd: fix build of virt plugin
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of libxml2 from 2.13.8 to 2.15.0 in Buildroot commit
d81922c1ef8825f10b802984d9721412a1a1a377, the "virt" plugin of
collectd no longer builds:

src/virt.c:2208:49: error: expected ';', ',' or ')' before 'ATTRIBUTE_UNUSED'
 2208 | static void virt_eventloop_timeout_cb(int timer ATTRIBUTE_UNUSED,
      |                                                 ^~~~~~~~~~~~~~~~
src/virt.c: In function 'register_event_impl':
src/virt.c:2221:26: error: 'virt_eventloop_timeout_cb' undeclared (first use in this function)
 2221 |                          virt_eventloop_timeout_cb, NULL, NULL) < 0) {
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
src/virt.c:2221:26: note: each undeclared identifier is reported only once for each function it appears in

This is due to the fact that the virt plugin code was incorrectly
using the ATTRIBUTE_UNUSED define, which was supposed to be an
internal define of libxml2. But it turns out that up to libxml2 2.14.0
and its commit 208f27f9641a59863ce1f7d4992df77f7eb0ea9d, this define
had been made publicly available. It could therefore mistakenly be
used by collectd's virt plugin... until libxml2 was upgraded.

We backport an upstream patch from collectd that fixes the issue.

Fixes:

  https://autobuild.buildroot.net/results/4c8463f0372560f4c3a20b0f67854460f0d1c400/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...UTE_UNUSED-for-virt_eventloop_timeou.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch

diff --git a/package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch b/package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch
new file mode 100644
index 0000000000..6cf0a55ba2
--- /dev/null
+++ b/package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch
@@ -0,0 +1,45 @@
+From be6ac1ed28b4842e8f2e54c39a2b3fc48feaf8b2 Mon Sep 17 00:00:00 2001
+From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
+Date: Sun, 26 Oct 2025 18:36:56 +0300
+Subject: [PATCH] virt: Drop ATTRIBUTE_UNUSED for virt_eventloop_timeout_cb
+
+ATTRIBUTE_UNUSED seems to be never was a public part of the libvirt interface
+and leads to the following issue with recent libvirt versions were
+ATTRIBUTE_UNUSED has been renamed to G_GNUC_UNUSED:
+
+src/virt.c:2209:49: error: expected ';', ',' or ')' before 'ATTRIBUTE_UNUSED'
+ 2209 | static void virt_eventloop_timeout_cb(int timer ATTRIBUTE_UNUSED,
+      |                                                 ^~~~~~~~~~~~~~~~
+src/virt.c: In function 'register_event_impl':
+src/virt.c:2222:26: error: 'virt_eventloop_timeout_cb' undeclared (first use in this function)
+ 2222 |                          virt_eventloop_timeout_cb, NULL, NULL) < 0) {
+      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
+src/virt.c:2222:26: note: each undeclared identifier is reported only once for each function it appears in
+
+Drop ATTRIBUTE_UNUSED here as there is little use from it.
+
+Upstream: https://github.com/collectd/collectd/commit/050877ed952ffc15c849803a9b3e77c5cec15f81
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/virt.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/virt.c b/src/virt.c
+index 01c7c777..ee0440e9 100644
+--- a/src/virt.c
++++ b/src/virt.c
+@@ -2205,8 +2205,9 @@ static int domain_lifecycle_event_cb(__attribute__((unused)) virConnectPtr con_,
+   return 0;
+ }
+ 
+-static void virt_eventloop_timeout_cb(int timer ATTRIBUTE_UNUSED,
+-                                      void *timer_info) {}
++static void
++virt_eventloop_timeout_cb(__attribute__((unused)) int timer,
++                          __attribute__((unused)) void *timer_info) {}
+ 
+ static int register_event_impl(void) {
+   if (virEventRegisterDefaultImpl() < 0) {
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
