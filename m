Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959B7C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB4D408E9;
	Sun, 19 Jun 2022 16:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB4D408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwpM5-qV2MgS; Sun, 19 Jun 2022 16:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36BC4408EB;
	Sun, 19 Jun 2022 16:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36BC4408EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 579C51BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E82740A05
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E82740A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NexAjf7lhcPK for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:35:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B24C2408AB
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B24C2408AB
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:35:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s1so11629812wra.9
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwg8lKXhtoPSCdCkoetckCARYWaos3FtgRSz3IWlIbc=;
 b=65HoVtDIXSuBrpDZ5rxSC9hJy5WdKQLjSfFW7lk0boyJ0qQsUmvFHjmbtyZrkAvDy+
 4KnJ8D7boGtVPSlQJZsu8jABso85Nnotrl+Xd0Uk0L5KZEQ4WVoLRdBaUD2LV1M7Tbui
 9q1+HY70R+rT1+ww8LE5ciP9RiTdIVxMdfTXFy/+lfY4mkg+rT4anxIfwcRfg3n7+VKx
 bd/VL7VKtZRaHIuXFdWoarIZ4S/TNWyWhC8tTy8KToiCGfhrNoikN2AP5ZOn/MEAWqKE
 bc1e988+eZbLgQAxYundw3VdQvGXkNymi8qk2ZnqEjGP+IciyXN5hmoxMRuat8/PAM+9
 huYQ==
X-Gm-Message-State: AJIora9UdVJ8V2TJTqSCuO+Re2//na9qlkAjcpK1mHH5ABpvFRCRBFGS
 SzqCNrH2cijXJW8xMeUmrcfACpukLK0=
X-Google-Smtp-Source: AGRyM1uLHD4ZB8uThIpqJ4JGeqLjNyfVqsGAsiltEcwyE8/umdzWRJHw+8ngCPAOF+RhIR5zUGq4ZQ==
X-Received: by 2002:a05:6000:1f8b:b0:219:bee5:6b77 with SMTP id
 bw11-20020a0560001f8b00b00219bee56b77mr18433422wrb.658.1655656541486; 
 Sun, 19 Jun 2022 09:35:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a7bcd85000000b0039c7c4a542csm11975878wmj.47.2022.06.19.09.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:35:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:32:55 +0200
Message-Id: <20220619163255.636101-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619163255.636101-1-fontaine.fabrice@gmail.com>
References: <20220619163255.636101-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwg8lKXhtoPSCdCkoetckCARYWaos3FtgRSz3IWlIbc=;
 b=gg8giCYy6uvb7uZk1CM7O75bjX2eAV37AB0JcARxzUREgSSSfGoapmWcZkkDfamGZM
 HGeZACKdNs3DdBfrtUN3iNq42vVzqjEG2JssQIUqndXZcZpXPMlSyH8Is0asTh/Y/CeY
 VHRitiy5rMsAyGfec7n/t8mS4/AeQo0ZDm4FJ9UmATuygXtYaOnP4n/NIjHMsWUWXX0H
 sSQhsZHgKIarPup0ddyD+YV8/i/tbzUBnbo3z4piKdlUnzPZEADh+ZOuh34bQYop/1Mp
 9jBBvDAtFxMvkyRKs+QI258rDKSWK8gweNixfnvacOUwo6LqSHWozO0cGBGCGW0+MB3Y
 HPrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gg8giCYy
Subject: [Buildroot] [PATCH 2/2] package/tcpreplay: security bump to version
 4.4.1
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

- Fix CVE-2021-45386: tcpreplay 4.3.4 has a Reachable Assertion in
  add_tree_ipv6() at tree.c
- Fix CVE-2021-45387: tcpreplay 4.3.4 has a Reachable Assertion in
  add_tree_ipv4() at tree.c.

https://github.com/appneta/tcpreplay/blob/v4.4.1/docs/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 8bcdae958c..32bfd219d4 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.3.4/tcpreplay-4.3.4.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.4.1/tcpreplay-4.4.1.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  42c055106e55852c29d94bb6e1b9e001a0723349f2985eb893a47d384c85002b  tcpreplay-4.3.4.tar.xz
+sha256  51f70ed14be5913f19c25cdfa530e98c14cedab1c76fbdd26eca7b61b57344f2  tcpreplay-4.4.1.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 9f2da6439b..86894e468e 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.3.4
+TCPREPLAY_VERSION = 4.4.1
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
