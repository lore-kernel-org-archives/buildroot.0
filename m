Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB57C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 14:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D00425EB;
	Fri,  8 Jul 2022 14:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D00425EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfNfG4fRVVxm; Fri,  8 Jul 2022 14:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD795425E8;
	Fri,  8 Jul 2022 14:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD795425E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BDA11BF41F
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 14:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 760C040534
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 14:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760C040534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzinD2jaA9Jr for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 14:21:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444B4400EC
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 444B4400EC
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 14:21:56 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout10.t-online.de (Postfix) with SMTP id 51EF41B120
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 16:21:52 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.9.36]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o9ore-3zX2ZN0; Fri, 8 Jul 2022 16:21:50 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:38640)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o9ore-0004b8-BO
 for buildroot@buildroot.org; Fri, 08 Jul 2022 16:21:50 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri,  8 Jul 2022 16:21:50 +0200
Message-Id: <20220708142150.234611-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657290110-014272E6-8776914E/0/0 CLEAN NORMAL
X-TOI-MSGID: 902b31e4-8018-4586-82ed-6ec6ea3ea361
Subject: [Buildroot] [PATCH 1/1] package/pixman: fix powerpc64le build
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

Disable vmx support to fix build error:

pixman-vmx.c:268:5: note: in expansion of macro 'LOAD_VECTOR'
  268 |     LOAD_VECTOR (src);
      |     ^~~~~~~~~~~
pixman-vmx.c:268:5: error: cannot convert a value of type 'int' to
 vector type '__vector(4) unsigned int' which has different size

Fixes:
http://autobuild.buildroot.net/results/fda886768fce25ccd9b52b635ff5b13da7ba2d0c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pixman/pixman.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 64302fa49a..0f00a20cd8 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -21,7 +21,8 @@ PIXMAN_AUTORECONF = YES
 # don't build gtk based demos
 PIXMAN_CONF_OPTS = \
 	--disable-gtk \
-	--disable-loongson-mmi
+	--disable-loongson-mmi \
+	--disable-vmx
 
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
