Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00433C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 11:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD02D80ECB;
	Fri, 28 Aug 2026 11:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzvcEd5O1zSK; Fri, 28 Aug 2026 11:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787917179;
	bh=alJFFEBR5silo6iusMoI2Ri6lbJiCt1eoamdKVBF53w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m98d2Tw2ODfdAc5ZCFlIKzzkkuXdWIr/uGHJlX45nlzy+EYsMI1Xqo4zAlHwOE2Aa
	 uD+TyxD8JEQiTF60T8ffhP7zdMxu1l5bGM/LpsHTA8S8Wl591vkTftzEmqU/kG23Sk
	 h7dfB6OCIttvV03kPn544MJgAJvSC8IpyJNOvEa2s05TETF3NA+u/85OUpClrS9vCj
	 iz5vU5mzoafRFazkeTWtAx7QjqfVIPc1wvGhwxZSZA70MifTT9h16zeDZIgVEqnsmu
	 jOEO/1MVqXS+wKXX+G81mjpvT5q9BDUzau8zHc/Ml7rgMtFeoMj3yP23MzL782+STW
	 uGLEK0q9clyvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C5A980EC6;
	Fri, 28 Aug 2026 11:39:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 370A278B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E15580EC6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owPyx_KMQHAO for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 11:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6385680EC4
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 607BD921DA; Fri, 28 Aug 2026 11:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 13:28:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e06cfae9cb61e049076fa47585f44a9b569a1949
X-Git-Newrev: 83fc4aa55eeab8f6dab64e6fe26a04284fa73881
X-Patchwork-Hint: ignore
Message-Id: <20260828113839.607BD921DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: fix build of virt plugin
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83fc4aa55eeab8f6dab64e6fe26a04284fa73881
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...TTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
