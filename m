Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0252C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F97860E97
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F97860E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC94407C5;
	Fri, 15 Oct 2021 20:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9nyNEtai9N9; Fri, 15 Oct 2021 20:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C0F9404E0;
	Fri, 15 Oct 2021 20:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 756CF1BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7219E606DB
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3vfEYdNOOiw for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CCEB606A3
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:29:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r10so28305139wra.12
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qx/ad49BXI50hRnL9F2zqe7IzHhTzkYk2FQnbFKOpEA=;
 b=OuLnbuJ6b+qaI5ewqHGwD2vNJqsfsVj0a17BZULkuzMLRtLBq0TV819Nd9vLRqilAI
 DBARFzdB39KYugJl4jCERG5VMHyg9XQ+EJrXtcDh62CSxdSh5W1bZEEYyvM5LVuXFn33
 jfOEwBio/dQ6BtPgATUVY+zfqUN3C9vx5NIz1gYkyEuEIwbHgvWB8miFoQJfLsgl98zO
 hJs+6GaqYtpxqsEzgJvGi2PI71lt4e3k/f6kLwz70/MUU9JwXTznw1wkrjbrmUJeT4hu
 VBmbF9ZApC8vz5RbXb0SCsL9EP56Ks3OFgqYXmgrLJ/qjgUazJ0yzOaaOqmnq8XJqqxo
 RMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qx/ad49BXI50hRnL9F2zqe7IzHhTzkYk2FQnbFKOpEA=;
 b=iBV1vNoOFk1SQdaDYcV1Zcp5DN9xJAe+f1qNz2q7ZzdVqSXZkTop1p/8rXZ2m7tBzB
 gZzwepMqTjkcn29cHy9GFa6iOYHfWkRPYXEv3G1JDEUcABBHuNkhHP8EtXeO39yz5YC/
 GLSnlozI2BOZzWX7LicTwZCxWhR/iy2OLl72qve3sb7oYdNoTVTSL6Ad57x5RExiLeHG
 XYT6WkIOBul9iDm6XXSRQUPk8jFQBS3gN5gNAl3EbuqsDtel+rZNkRdHkwyxmAZgYIFK
 Xqg+b8clhkNhvTB02QK9Z9zeWg17dMq8dLq5KAp3EU5FJlolw0lN2VEGgYGHC0U9khkh
 2cJg==
X-Gm-Message-State: AOAM53265LJVGEj5fnzaJVEQWkIpdQPE1VSOEu6DQHtYksz67MW2CWam
 bIkgiZJzJDigriGh/dH5lLv3xH91AqY=
X-Google-Smtp-Source: ABdhPJwy4y0cBfVeR+fPu09VWWBX5owTUeDuxWPMxPzB/3LjK5WDdFBKnMU10LXaa4ku8PpILLgCdA==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr17309457wrg.359.1634329751415; 
 Fri, 15 Oct 2021 13:29:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id q17sm5531408wrm.6.2021.10.15.13.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:29:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:28:02 +0200
Message-Id: <20211015202802.1669233-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dante: bump to version 1.4.3
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

- Update indentation in hash file (two spaces)
- Update hash of license file (update in year and authors)

https://www.inet.no/dante/announce-1.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dante/dante.hash | 4 ++--
 package/dante/dante.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dante/dante.hash b/package/dante/dante.hash
index cb87cdc04a..a76018fdb6 100644
--- a/package/dante/dante.hash
+++ b/package/dante/dante.hash
@@ -1,5 +1,5 @@
 # From https://www.inet.no/dante/download.html
-sha256	4c97cff23e5c9b00ca1ec8a95ab22972813921d7fbf60fc453e3e06382fc38a7	dante-1.4.2.tar.gz
+sha256  418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d  dante-1.4.3.tar.gz
 
 # Hash for license file
-sha256	954ab6dbcf994711e28e603d8657d6eceef333cd6f9ca6705f0e9d118ab7d69a	LICENSE
+sha256  05e2db26147a8575005f090aada119ea6cb40a4382164929d647f00abef3bdfd  LICENSE
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 2c6ddad7ad..ae60252bed 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DANTE_VERSION = 1.4.2
+DANTE_VERSION = 1.4.3
 DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
