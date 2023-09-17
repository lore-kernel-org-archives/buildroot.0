Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B49CCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9522F610DC;
	Sun, 17 Sep 2023 12:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9522F610DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXeUDooRlShA; Sun, 17 Sep 2023 12:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8FCF610D7;
	Sun, 17 Sep 2023 12:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FCF610D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3BF1BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55F2F415AB
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F2F415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KjmWdv-AfJg for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:06:18 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF7B6415A7
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF7B6415A7
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31c4d5bd69cso3507118f8f.3
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 05:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694952376; x=1695557176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0XSiVfhaIuUFJ9RkmcBG5dFFHA/xD+/CtCDmSG9jXX0=;
 b=xRtUq/DxrhH4h+cyyf9YYTEn1zDjwxc//vgReUnayhs9b/3sKrFx3JTxPJCImdB2O5
 a6kMIMcxgfZjwt6LLmx+3gnTelLojxKKYKEvInsadsf4ZOT9aae0N4uKuOKvEYfTKWkV
 xW37acXr79hAUoD0ZhMKsAGwgFtjFpsH76MUqVMwd8xcWAVjTxKth6MS+1GbQ5Wgqsul
 jvqhYFDWOUIeWboSfeW4SFjD1MA/sQHuygBXY94x8W1E2aVEQG9boA9C/rLIrOhrvKBg
 eyYtpeKXlOmhCh00zVIt18soOACoiQhrWzeO0UudMBh3vswPvPdo7IU7MGUX5kFOY7wd
 5CQA==
X-Gm-Message-State: AOJu0Yzt2dx4g+TVn2SBhPVkGZ8ysQoPEgQZ5tCr+kj5b9ET5WTq5itl
 DBfUgxb3GWhFZFR17vkzUtW6Secpd2I=
X-Google-Smtp-Source: AGHT+IF2hGi3D1V1EKmDaqmWJnyjfdF0n+I7REWQ+cNbqvyAxp/YGDim2U5BNiWcp5HmFItSSX895g==
X-Received: by 2002:a05:6000:238:b0:320:1c4:e213 with SMTP id
 l24-20020a056000023800b0032001c4e213mr2577820wrz.1.1694952375495; 
 Sun, 17 Sep 2023 05:06:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t3-20020a5d5343000000b00317ab75748bsm9566186wrv.49.2023.09.17.05.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 05:06:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 14:06:13 +0200
Message-Id: <20230917120613.63980-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694952376; x=1695557176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0XSiVfhaIuUFJ9RkmcBG5dFFHA/xD+/CtCDmSG9jXX0=;
 b=Bt5Biz4vVgcVn+Co6dukzdJnbl0QLCpLQydEP/WfrOUbFpsOrgPq/Bqd27jMF7nKTX
 GouOvQ70a0DT15k80dji1Mu+79bUyQgfh7sf3PYug9TRujwFqELZi+fP1285Gg/2lhro
 AEGPxcyO4Iiq5XOVl0mniv+L+SVfbKGokeUujqKq9oGaq8pIsjtTw7yyvoUkCdq5DpTN
 /ZGD+65bMQsfGUGvmCWWzVvV4IIWaYc9b20LG9ha76oSDpucBVBUq7G3yT6ue7Faz2pw
 liXwrtSfoKCAvm6iQTajpiXtahg8pUByRHwnBnTx6hFhZB0jq9qBx2QyLfGqsL0iZqSs
 jn2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bt5Biz4v
Subject: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-26463: strongSwan 5.9.8 and 5.9.9 potentially allows remote
code execution because it uses a variable named "public" for two
different purposes within the same function. There is initially
incorrect access control, later followed by an expired pointer
dereference. One attack vector is sending an untrusted client
certificate during EAP-TLS. A server is affected only if it loads
plugins that implement TLS-based EAP methods (EAP-TLS, EAP-TTLS,
EAP-PEAP, or EAP-TNC). This is fixed in 5.9.10.

https://github.com/strongswan/strongswan/blob/5.9.11/NEWS
https://www.strongswan.org/blog/2023/03/02/strongswan-vulnerability-(cve-2023-26463).html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 4822f9152f..de8f18747a 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.8.tar.bz2.md5
-md5  f46b0d3e7aed88824650d0721c887443  strongswan-5.9.8.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.11.tar.bz2.md5
+md5  673e194cd256af77b46928179f2c81ad  strongswan-5.9.11.tar.bz2
 # Calculated based on the hash above
-sha256  d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c  strongswan-5.9.8.tar.bz2
+sha256  ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d  strongswan-5.9.11.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index cae1433e39..6058631696 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.8
+STRONGSWAN_VERSION = 5.9.11
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
