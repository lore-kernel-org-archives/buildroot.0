Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F2DECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA85844DB;
	Sun, 11 Sep 2022 21:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA85844DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEe-2l_AP6wl; Sun, 11 Sep 2022 21:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9571E82CCA;
	Sun, 11 Sep 2022 21:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9571E82CCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E48B11BF36D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C002082CCA
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C002082CCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJAz125Vfu0y for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 21:09:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4223D82C9C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4223D82C9C
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 21:09:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d2so12450911wrn.1
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 14:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=IIiHhV7RWfk0xKndp/xm521h5WtjKsfOQtiV9pvflnQ=;
 b=VjUkk8XrFCpe5HTUjV3nQeP4bvqdyxOOuhKhDsZAn+Jn3nRcRpW9nupOqBWSxxtjxh
 clcoNn5Tp0O/12nGKp8Gjsd8z0vbeqAJG/11TaGQ5rV2wn2/8fgsD/EpyJfJa4wssOZV
 XGBKhGVAnkdPZqMFl48js6PoS+zGUTvXLPnH2cxHFbxNYdwntNkmx6pCKR84ZNXQS636
 15/0X9vTLFFJIhevDO277kcOBFSUQcS19vrBNECa80Q+838zhiqEA1seg326/YOM+/B9
 OJOajQ+OfOL6tJog4qVb4NLYx1DAGJSN5X/psdtFO9+rMZ0a8K1HcZRK8CleWd5IQ7BL
 m3+A==
X-Gm-Message-State: ACgBeo1iBJjH5E/N3ujAYnPJNQ9uaRqi22+65uf0RNngc8U0qwXuZQzD
 fZ3Bz7alKN5l7xu8LKpSOpK1PRNtGHU=
X-Google-Smtp-Source: AA6agR6nMF7bfpNzVNWZ7ncSQ5Y0aV0/G6FGXPqo7qrstrMUiPBuAoRdN5oAsDPcRZy2eV6IoxgXAQ==
X-Received: by 2002:a5d:5289:0:b0:225:4852:4248 with SMTP id
 c9-20020a5d5289000000b0022548524248mr12614924wrv.228.1662930556364; 
 Sun, 11 Sep 2022 14:09:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b002285f73f11dsm6840569wrq.81.2022.09.11.14.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 14:09:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:09:13 +0200
Message-Id: <20220911210913.131268-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=IIiHhV7RWfk0xKndp/xm521h5WtjKsfOQtiV9pvflnQ=;
 b=jPrpIL2clcPcUa9jPxTondlDIZfEytaeE+S7R2i1XodlK+9SoAQpXV+KVzgJuR8HcP
 Q3vL8yPogkjmciqqadp+gyWrEoSKkothtOaZplP46nct7bk+YXiYfQbYhF9brtK11zlv
 Z+tMsPA4HMTzX+YhMb5sEKpfH0obMB0dcr+n3/ewpfjUSb2CyJWMqBUDKPK0KwxdUnGx
 YpKXnYaogMs9DrDpnjgOOYXssiGymQXbr7lHlTo6s/GCW2i0YgHMt6PWu43S3I2APber
 XcubxR8dO+wtI2zW02D8R0HUOdDWo43kX+CcVCiFq3uYwqwdiuWM4aagPPHc2iQrHX2S
 r+MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jPrpIL2c
Subject: [Buildroot] [PATCH 1/1] package/libnftnl: bump to version 1.2.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.2.txt
https://www.netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.3.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 0a183eedcf..113110fc1b 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  7508a5c414fab13e3cb3ce8262d0ce4f02c1590a8e4f8628ab497b5b4585937c  libnftnl-1.2.1.tar.bz2
+sha256  e916ea9b79f9518560b9a187251a7c042442a9ecbce7f36be7908888605d0255  libnftnl-1.2.3.tar.bz2
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 7ba1158154..fd87f70091 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.1
+LIBNFTNL_VERSION = 1.2.3
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
