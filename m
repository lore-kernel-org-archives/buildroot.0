Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C485EC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D7F40934;
	Sun, 12 Jul 2026 11:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pW3HM9MVJXEu; Sun, 12 Jul 2026 11:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A98FC4094A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855863;
	bh=phn2YjQV2L3XXTji/07Etd6FVv5dwXxOJhucumM7xUk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E18h0Yc5nKYnkWlfHWiCpp0VFExnmnsa/2QYM2eGwOJVGOQgtBf16b4l606RdK+tG
	 Ki5VbQOKWRm2GU7eLeJVFcprF/etXw6ZmmVjs4HZwGQPy1/76ZEuiC/JO/I/XI1ARP
	 UNy5D17p1thXuMG9rIu3ODo51z73E7fKo/Iu8OMQi5bUWCPzky1VPjemcdcWv8Qx1v
	 bOPIX4l6npwzJQHw/wriuf+5CDFrWO2F/c+SGMYRl4MrEPDOYuN0Hzg/j+xz8bmGbc
	 D2ptFpyxswOMKSg/ALnuN8+2Wh05j8n5FEKvPYva0BCDYIvB7A5G18NNyb52MbLoJq
	 oNxBSrtoGoKGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A98FC4094A;
	Sun, 12 Jul 2026 11:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F8182EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21B04813AE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_DX_AxkBWGS for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D35AE80E71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35AE80E71
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D35AE80E71
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C41CFA4C209B;
 Sun, 12 Jul 2026 13:30:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35390)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wisOg-000000002jy-1mz1;
 Sun, 12 Jul 2026 11:30:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 12 Jul 2026 13:30:55 +0200
Message-ID: <20260712113058.1579954-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783855858;
 bh=AbUGT75btWeqrkxLPPntSoIIBBrPpLxkCZnkehHDKBk=;
 h=From:To:Cc:Subject:Date:From;
 b=mirmSn+KsovW2ZDAQgzXftdeB2VY1rYtldUKO48fVDy5zoUakAnlfAHL91np9eVNT
 qfiVWroLMnvPRYJK0BlKRdFvbP5xzViRCA3bmUQ+MpvJ2JcrN6PK5wCtemuvgOAPDz
 vEnIsFmxwre4jf1vYJ7k/RTMD/unz5bQNMZqNUU1zrYkBryAortzAvF4twkKoqcvLS
 jbh8yrTjubRNjXCDcIF7jWvuxGleio5zkq8vT/4DJqiLUJrvhf7sTwKVwoRZZiMtdb
 j4eOAkmHP51XUmWytirgojpbvr/P4XhsIpOBGuSx16/OjPp94zHiWdDLWkftcMlxGl
 pY1MuTJhMV31A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mirmSn+K
Subject: [Buildroot] [PATCH 1/4] package/x11r7/xwayland: fix uClibc build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Copy patch from xserver_xorg-server to fix build errors with uClibc.

Fixes:
https://autobuild.buildroot.net/results/c03/c03d57ad7ed3feac008091a38ea50bfccfa62b08/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6

 .checkpackageignore                           |  1 +
 ...0001-include-misc.h-fix-uClibc-build.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6147f35b03..4ec39f9f36 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -971,6 +971,7 @@ package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstr
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
+package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
 package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch lib_patch.Upstream
diff --git a/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
new file mode 100644
index 0000000000..562aa79fbb
--- /dev/null
+++ b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
@@ -0,0 +1,31 @@
+From 2e8fca00f5bdb02f2f59aaa428d1e9d808ab0e86 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 16 Jun 2018 19:20:16 +0200
+Subject: [PATCH] include/misc.h: fix uClibc build
+
+A similar fix was used for Dovecot:
+https://www.dovecot.org/list/dovecot/2017-November/110019.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/misc.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/misc.h b/include/misc.h
+index 14920c3c3..390e52b60 100644
+--- a/include/misc.h
++++ b/include/misc.h
+@@ -185,6 +185,10 @@ typedef struct _xReq *xReqPtr;
+ #endif
+ #endif
+ 
++#undef bswap_16
++#undef bswap_32
++#undef bswap_64
++
+ /**
+  * Calculate the number of bytes needed to hold bits.
+  * @param bits The minimum number of bits needed.
+-- 
+2.17.1
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
