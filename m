Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFDEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 21:37:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D30961209
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 21:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D30961209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC9E7401A4;
	Tue, 28 Sep 2021 21:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSYI5BXGTYgl; Tue, 28 Sep 2021 21:37:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD5EB405FD;
	Tue, 28 Sep 2021 21:36:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C67511BF5DA
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5A8960B94
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 21:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZT_4WZQnP8Gf for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 21:36:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.gallagher.co.nz (mail.gallagher.co.nz [203.167.229.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B90CD60B88
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 21:36:56 +0000 (UTC)
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by
 mail.gallagher.co.nz (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
 id <B61538af50000>; Wed, 29 Sep 2021 10:36:53 +1300
Received: from GNZ-PC2807.gallagher.local ([10.70.3.151])
 by gglnzdom1.gallagher.local with ESMTP id 2021092910365263-1082492 ;
 Wed, 29 Sep 2021 10:36:52 +1300 
From: Ankur Tyagi <ankur.tyagi@gallagher.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 10:36:50 +1300
Message-Id: <20210928213650.912-1-ankur.tyagi@gallagher.com>
MIME-Version: 1.0
X-TNEFEvaluated: 1
X-SEG-SpamProfiler-Analysis: v=2.3 cv=A8gSwJeG c=1 sm=1 tr=0
 a=qhWWnufYDz1ULA0Yxl8pUQ==:117 a=7QKq2e-ADPsA:10 a=uwzVE2XeAAAA:8
 a=vBNek-IZ6iLIW3PCQBAA:9 a=56Ks2SYG_ayP3Q2IVBAz:22
X-SEG-SpamProfiler-Score: 0
Subject: [Buildroot] [PATCH 1/1] package/libevent: add -fPIC to CFLAGS when
 BR2_PIC_PIE is set
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Ankur Tyagi <ankur.tyagi@gallagher.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Otherwise build fails with following error:
Toolchain wrapper executing: '/tools/aarch64-linux-gnu/bin//aarch64-linux-gnu-gcc' '--sysroot' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot' '-mabi=lp64' '-fstack-protector-strong' '-fstack-clash-protection' '-mcpu=cortex-a35' '-fPIE' '-Wl,-z,now' '-Wl,-z,relro' '-shared' '.libs/buffer.o' '.libs/bufferevent.o' '.libs/bufferevent_filter.o' '.libs/bufferevent_pair.o' '.libs/bufferevent_ratelim.o' '.libs/bufferevent_sock.o' '.libs/event.o' '.libs/evmap.o' '.libs/evthread.o' '.libs/evutil.o' '.libs/evutil_rand.o' '.libs/evutil_time.o' '.libs/listener.o' '.libs/log.o' '.libs/strlcpy.o' '.libs/select.o' '.libs/poll.o' '.libs/epoll.o' '.libs/signal.o' '-Os' '-g2' '-pthread' '-pthread' '-Wl,-soname' '-Wl,libevent_core-2.1.so.7' '-o' '.libs/libevent_core-2.1.so.7.0.1'
/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: .libs/evmap.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `event_changelist_add_' which may bind externally can not be used when making a shared object; recompile with -fPIC
.libs/evmap.o: in function `evmap_check_integrity_':
/home/user/work/cxos-buildroot/output/build/libevent-2.1.12/evmap.c:1007:(.text+0x13ac): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status
Makefile:1516: recipe for target 'libevent_core.la' failed
make[3]: *** [libevent_core.la] Error 1

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 package/libevent/libevent.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 93ba88ca88..dac3b589c0 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -36,5 +36,10 @@ else
 LIBEVENT_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PIC_PIE),y)
+LIBEVENT_CFLAGS += -fPIC
+LIBEVENT_CONF_OPTS += CFLAGS="$(LIBEVENT_CFLAGS)"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.1

###########################################################################
This email is confidential and may contain information subject to legal 
privilege.  If you are not the intended recipient please advise us of our
error by return e-mail then delete this email and any attached files.  
You may not copy, disclose or use the contents in any way.  

The views expressed in this email may not be those of Gallagher Group 
Ltd or subsidiary companies thereof.
###########################################################################
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
