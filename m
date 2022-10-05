Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41756C433FE
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 20:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDC1460FAC;
	Wed,  5 Oct 2022 20:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDC1460FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yEN6FR0NL7Vk; Wed,  5 Oct 2022 20:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6398860FD1;
	Wed,  5 Oct 2022 20:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6398860FD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D18031BF34A
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 20:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D1240138
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 20:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D1240138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSOOFsgCv9EL for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 20:06:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 425F740091
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 425F740091
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 20:06:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bk15so27469635wrb.13
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 13:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=qIbV3hliLAjIZ/6XZu3XhsSD+Qxo9AVCL+U1upjwniE=;
 b=jacI3qLDDOwsx1kIbmyQSuXwlSRvqKnEJ7+sxfGVzxvTHy4mlYUDL0l5liGJEPX5jr
 Tlh7hIDOIKdP1T6dyNpH7ukpub0ZI7GUqMy10dSY2gRq/pvzhTlHT4sd2LObBxn6d/M5
 /av3QdbrnmmVzLprNKI2cq6vck55YwE7PiNvWb/q8gdZrRnesTxukIAKQcnCl/jnB6jr
 8FLu6arch+dKEQBTjkiUPSp9g6dTy3i/v3PxQYort+8McxP8m5KG4EbGDVGY3Z/GOvAH
 kNkf0oEdf4fn/EmwWkYNrtqg9vbbos4igAz28px69UprpEMTBtRLct67kIDNNaczEtHA
 i14A==
X-Gm-Message-State: ACrzQf28lSVQLopbdl1DxqIylN+ScqPY3nGtQxX2z4u7bQ2nX0cWooJ0
 ac1qNXN3+gUWy92VCJHzqN0Ou73g61g=
X-Google-Smtp-Source: AMsMyM60quVdcENDoI7Uo9ztd4N+R6+gExL0Iud+JmhNAl1m19OBGAh2wvgwkojsrNoK1Np0H16sFw==
X-Received: by 2002:a5d:4683:0:b0:22e:6be0:dfc6 with SMTP id
 u3-20020a5d4683000000b0022e6be0dfc6mr112508wrq.573.1665000389944; 
 Wed, 05 Oct 2022 13:06:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d2-20020adffd82000000b0022e327f849fsm12003053wrr.5.2022.10.05.13.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 13:06:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 22:06:21 +0200
Message-Id: <20221005200621.229757-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=qIbV3hliLAjIZ/6XZu3XhsSD+Qxo9AVCL+U1upjwniE=;
 b=eo9SwJsPu3DF6pNoCU3/Hnj/LqcitmIzv5/4azqw8btvPfJktMyJPJ7CNovm75YrXV
 XYtyjdFFvjlynjyTKwADJmrSYJt6mXTlNgVKuaMCFzZBVSGrwyHvUgMRNOr4e9ACAOml
 NIexzXuwAC9VzNsI5pyEklVjsOhllxRM13UAqqVVPpQ3fBSi+lXhmaFrNUY5WbPCvTvn
 rcOL6t7LyLpll4uea7GwAt50QmH025+oICh2k4hFF1Z8uADmBVn0dlrzOdiSygrixXzt
 9LXaPFmUMYUG7dx6TxKhzBa3V9UNMm+/EMfGGbsmPAc0CtBTvFM+Y+G5V5CzTTyTXB+5
 +tuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eo9SwJsP
Subject: [Buildroot] [PATCH 1/1] package/liburiparser: bump to version 0.9.7
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/uriparser/uriparser/blob/uriparser-0.9.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 8b40807541..73b4ec6867 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a288a06668528c19e85e38c508335938e1de6fdd4b8f2072401b4533fcebf644  uriparser-0.9.6.tar.xz
+sha256  1ddae35cb3cc2c36e8199829d46f1c7f8b222e74a723fdae67ec8561e1ac5a39  uriparser-0.9.7.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index c9903bd74f..6d25b1d9bb 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.6
+LIBURIPARSER_VERSION = 0.9.7
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
