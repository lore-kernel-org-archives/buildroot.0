Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7DAC61DE5
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 16:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E316C60B96;
	Sat, 21 Feb 2026 16:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-zBnr_w2pih; Sat, 21 Feb 2026 16:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B41260B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771692716;
	bh=VXDl/GK99J/1A83e1Jr3DaciZTnQkJtYSYuG5wb3z+8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BMR8zxp2+uefMONX5JL9a8tLaPOs0z6bjRCHCqTdGCkmf/lZFbbO4V8swtfOodMCE
	 mxykzdUWeTlG3LI8gcpM6tnyflQoqMnG0G55aXly2ZVBxEsxzTOAU1FKJKs3mh5/aC
	 t82EP4pfnVUieH+aXFxX5NK2cVyixEXfXOG9XnyIIHKH6Wu5okWMSj4p91iIAikWRE
	 zhth5PoT5harq3IzzYbLfU21+ytBsDLwPft9rvj7/DB27OdCaNxBZk3XjFGDzGHF5z
	 9WyBYW6qgnf5gYUuRTWL+Z9nF75b/7kV605eUZCCyN+ZzGIbvkaH2lv2fhYkJwFGEp
	 pTJGZqOm7zdqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B41260B69;
	Sat, 21 Feb 2026 16:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5732A183
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 16:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C6FC60B69
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 16:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGp81rE2uGnH for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 16:51:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C684160B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C684160B66
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C684160B66
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 16:51:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E8A2A4C1201;
 Sat, 21 Feb 2026 17:51:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45856)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vtqCr-000000006Lb-2u36;
 Sat, 21 Feb 2026 16:51:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Semyon Kolganov <semenak94@mail.ru>
Date: Sat, 21 Feb 2026 17:51:49 +0100
Message-ID: <20260221165149.3917530-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771692710;
 bh=lFpsIp1i9QPQiRSxvh0V7XRSIAqK++hEgFAwjvEmPuw=;
 h=From:To:Cc:Subject:Date:From;
 b=oU4IGoSANAZ4h5dTUkn8Xva/MhGx41RAvXEZAqSOlKFTSeR9JwTXTNspPtYjMA+dT
 7pqbB0JXmXIUAaJ4lvrSZ0zXo04vKyVMeNk4ntDTC+rkvcWRGCXluw5q7ZWsKQHlCF
 wsVVD5WE4oJTqFFg8BlyhWm0N6dHEJKdz+/XpIumfKitgdEo5SrdqJk90OzhsKMsHo
 xIU7d3kitV3B0f9KcMIAdpU2Z3NhvK+muL/Twgc64mrovdxtDItHbCWihdLDKXOjyU
 fr9VaU5Iox+1TNZSZ70nrCOwRWgbgbkWp1ksSWMosdMZjZmBHXrz2NmATiWdKCQO+d
 XaP2n5w1sFSeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=oU4IGoSA
Subject: [Buildroot] [PATCH 1/1] package/mpir: fix build with gcc 15.x
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

Fixes:
https://autobuild.buildroot.net/results/8e8/8e87fc05c41eb420a026a7df86efcd9662b74353/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../mpir/0004-fix-configure-with-gcc-15.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/mpir/0004-fix-configure-with-gcc-15.patch

diff --git a/package/mpir/0004-fix-configure-with-gcc-15.patch b/package/mpir/0004-fix-configure-with-gcc-15.patch
new file mode 100644
index 0000000000..32ca76dde6
--- /dev/null
+++ b/package/mpir/0004-fix-configure-with-gcc-15.patch
@@ -0,0 +1,41 @@
+From da003143cc6f217dcf474517d54b3aee06c9c18f Mon Sep 17 00:00:00 2001
+From: Leon White <l.white@interstellarlab.earth>
+Date: Mon, 25 Aug 2025 17:24:55 +0200
+Subject: [PATCH] fix configure with gcc-15
+
+Added to Alpine Linux with commit
+https://gitlab.alpinelinux.org/alpine/aports/-/commit/ded83e23c95b2560d2d77c0e61a6425872aa273b
+
+Fixes compile error
+
+conftest.c: In function 'f':
+conftest.c:14:48: error: too many arguments to function 'g'; expected 0, have 6
+   14 | for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+      |                                                ^ ~
+conftest.c:13:17: note: declared here
+   13 | void h(){} void g(){}
+      |                 ^
+
+Upstream: https://github.com/wbhart/mpir/pull/300
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index cd917567..53b9ef9c 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -590,7 +590,7 @@ extern
+ __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
+ void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
+-void h(){} void g(){}
++void h(){} void g(int, t1 *, t1, t1 *, t1 *, int) {}
+ for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+ #else
+ int dummy;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
