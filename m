Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6A1D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D6382239;
	Sun,  7 Dec 2025 17:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sj5IYsaxNpea; Sun,  7 Dec 2025 17:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA7C48221A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127951;
	bh=gwVXr+D5AEMB8ZE/mTbYvaEzUk9TRrA2YH7VQ7T09WI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NLg4dTSsB2LqlkGNAEy96wYOMj6ejKil6DkKRI4M9j9ymrdmco70iIfAKa9oHfrLa
	 WJmXCnNSQ1NDUS6Acc4nEkoN65O3UVLLs0JVQUSp0p/2vMnb8jRcCBo78jAqpRrJW2
	 M3OD0YwPaReRJUpU4VvPca6iq2PjV2QYXXFErzhzByf2HH5wuzSLU0TXeg+q6MkDTk
	 FufuKSBGR4basFGXxtlc+Jygb6OE1LFxxNfhIYhlT7s6X4zHzIcBzjnfXcsjubtpUW
	 LQJHmcPBBlsaQWxlWTtfMh4nXmilbJotkHMUoOrL+5EEFs8+qEli6BremFXKGCFG3h
	 4Iv666yKqy++g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7C48221A;
	Sun,  7 Dec 2025 17:19:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC51AE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C231D404A2
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4W5i2sZauiid for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06B704053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06B704053D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06B704053D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:19:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F6F4A4C028B;
 Sun,  7 Dec 2025 18:19:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSIPX-000000006H3-23XS;
 Sun, 07 Dec 2025 17:19:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Dec 2025 18:19:03 +0100
Message-ID: <20251207171903.3719015-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765127944;
 bh=HuJtKwReN4qNBtMHgofMNBld1WoL8rCf6V9l3srpU+Q=;
 h=From:To:Cc:Subject:Date:From;
 b=s6rUEAt0lbI9+EL+3VDei0/NnJADI4xOWX2vro/s5wito98e5H6WrOR+lrGcB0q6w
 Gueo7xWmmBJUzQy7RZE+MSQUcuNT004g+2EPgkb8uLfr3IwRfBwXo8Ik3XawAl3dkp
 lqM3ABa2hsFYbSuxH20+YT/lEYB+GyykUOoEv4+4LZPgWegFej25JlcM42aTgxILth
 f2DAXn418qYpnwvaswTDr2omQJIVBEpjlIR800DTZwvv5KUPfi/mO5bBbPKlrscH05
 3n3RUpISRbBZFmHzKFt8UMEv5BtFZEXALR7CeaQ4KFak2c/vRfjpfiVvALwg5MyvN1
 xVaUHUUbRrSeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=s6rUEAt0
Subject: [Buildroot] [PATCH/next v2 1/1] package/json-c: fix cmake 4
 compatibility
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
https://autobuild.buildroot.net/results/dcf/dcf72922750a830901279e8eb8fc2def95d35e01/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed check-package (Julien)

 .../0001-Allow-build-with-cmake-4.0.0.patch   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/json-c/0001-Allow-build-with-cmake-4.0.0.patch

diff --git a/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
new file mode 100644
index 0000000000..c9c957885f
--- /dev/null
+++ b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
@@ -0,0 +1,25 @@
+From 42864e12b0d7af01b1cf989d6da9e9a4477775a1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 23:14:48 +1100
+Subject: [PATCH] Allow build with cmake 4.0.0
+
+Update the min version to match parent CMakeLists.txt 3.9...3.12
+
+Upstream: https://github.com/json-c/json-c/commit/42864e12b0d7af01b1cf989d6da9e9a4477775a1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ apps/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
+index f7c9dec633..ef2271d131 100644
+--- a/apps/CMakeLists.txt
++++ b/apps/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-cmake_minimum_required(VERSION 2.8)  # see ../CMakeLists.txt for why 2.8
++cmake_minimum_required(VERSION 3.9...3.12)
+ 
+ if(POLICY CMP0075)
+     cmake_policy(SET CMP0075 NEW)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
