Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC0DC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 17:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47EFD81F64;
	Tue, 16 May 2023 17:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47EFD81F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8a051i_R_ixx; Tue, 16 May 2023 17:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B6481F4B;
	Tue, 16 May 2023 17:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32B6481F4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B39DC1BF21A
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 17:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D0EA81F4B
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 17:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D0EA81F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5NzLx5I7ru5 for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 17:34:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E3E81F3F
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6E3E81F3F
 for <buildroot@buildroot.org>; Tue, 16 May 2023 17:34:18 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout11.t-online.de (Postfix) with SMTP id 15EEC27D5
 for <buildroot@buildroot.org>; Tue, 16 May 2023 19:34:14 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pyyYt-0TcshV0; Tue, 16 May 2023 19:34:12 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33666)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pyyYt-0007WU-28
 for buildroot@buildroot.org; Tue, 16 May 2023 19:34:11 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 19:34:11 +0200
Message-Id: <20230516173411.823978-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684258452-327FBCD8-520EC787/0/0 CLEAN NORMAL
X-TOI-MSGID: 3e512978-13ec-4f06-a185-6667687ce985
Subject: [Buildroot] [PATCH 1/1] package/icu: disable icu-config for host
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/6a2/6a2a4ed90c1a829e7b9442aaaaa1cd6e5efd9aab/

python-pyicu picks up ldflags from host version of icu-config
---
Building PyICU 2.10.2 for ICU 70.1 (max ICU major version supported: 72)

(running 'icu-config --cxxflags --cppflags')
Adding CFLAGS="-std=c++11 -I/home/buildroot/autobuild/instance-1/output-1/host/include" from /home/buildroot/autobuild/instance-1/output-1/host/bin/icu-config
(running 'icu-config --ldflags')
Adding LFLAGS="-L/home/buildroot/autobuild/instance-1/output-1/host/lib -licui18n -licuuc -licudata" from /home/buildroot/autobuild/instance-1/output-1/host/bin/icu-config
running build
---
leading to linking errors:
/home/buildroot/autobuild/instance-1/output-1/host/lib/libicui18n.so: file not recognized: file format not recognized

The icu-config script was deprecated upstream:
https://unicode-org.github.io/icu/userguide/icu/howtouseicu.html#notes-on-icu-config

To fix the build error we do not install the host version anymore:
---
Building PyICU 2.10.2 for ICU 70.1 (max ICU major version supported: 72)

(running 'icu-config --cxxflags --cppflags')
Could not configure CFLAGS with icu-config
(running 'pkg-config --cflags icu-i18n')
(running 'icu-config --ldflags')
Could not configure LFLAGS with icu-config
(running 'pkg-config --libs icu-i18n')
Adding LFLAGS="-licui18n -L/home/bernd/buildroot/output/per-package/python-pyicu/host/bin/../sh4-buildroot-linux-gnu/sysroot/usr/lib -licuuc -licudata" from /home/bernd/buildroot/output/per-package/python-pyicu/host/bin/pkg-config
running build
---

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/icu/icu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 8107796ae9..1f1dfea5bf 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -48,6 +48,7 @@ ICU_CONF_ENV += ac_cv_func_strtod_l=no
 endif
 
 HOST_ICU_CONF_OPTS = \
+	--disable-icu-config \
 	--disable-samples \
 	--disable-tests \
 	--disable-extras \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
