Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46CDC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700F64093B;
	Tue,  9 May 2023 20:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700F64093B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6haH9ksvJwC; Tue,  9 May 2023 20:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C9141D85;
	Tue,  9 May 2023 20:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00C9141D85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0931BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2027242742
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2027242742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NW2sj0_hp7l9 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:12:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC44E42773
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC44E42773
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:12:38 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so11864973a12.2
 for <buildroot@buildroot.org>; Tue, 09 May 2023 13:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683663156; x=1686255156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UPEHfPcbcZDdfTJGYTQ64lR7s4bhzXpB9uPF9NNOTbE=;
 b=TPRb9PfWDmyyaH6wrmh+B82FSwFsjO4pcZxEDsNWFJ4dBYMFuZ+4aUlYFK1yDvKfsf
 m6pAEQ+Qrr0c0GgSuc311+ECIzJyJwzh56OwuKWLaWK54DXYFKbJ2Q3MdeuhjQ2sBvx6
 EGGR+Y/LtCLx/8dreKKZ052q9kPgVKGi4OM3NF98h2cMuU2jI18MiHMANGsq8atSOnMn
 Lvy26VWaIO8d7RK7zdkWoVKTgmQSG9xWduBv7vfrdxLOLPzc5TiphMJw4NnOhJ5STWZD
 Cnoi83h1UzFqDx38cRJ/+W6oH79MQQXhlmCBJeFt17pQZWFKHnB/9xpPbYlaJR1pKDwB
 pkqg==
X-Gm-Message-State: AC+VfDz3ikhChe+gSCxZG2r4/p3UyuiCOrzfv3HYAuA5ny/Y0ZAhHgcN
 5vGvz0StJ72Rh3+xlFnodleYZm1hsH7VP9OLPSvbgw==
X-Google-Smtp-Source: ACHHUZ4tjhoPhL0ZrGv+3SES7Vnd0Y0RHeKav3Ss4LOmhChsUKrG4HVs9emWJ3OsQ2KAeZo2ciLEYg==
X-Received: by 2002:a05:6402:606:b0:506:8dba:bd71 with SMTP id
 n6-20020a056402060600b005068dbabd71mr12968939edv.27.1683663156470; 
 Tue, 09 May 2023 13:12:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-40-97-5.business.telecomitalia.it. [79.40.97.5])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7da17000000b00506987c5c71sm1157936eds.70.2023.05.09.13.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 13:12:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 22:11:53 +0200
Message-Id: <20230509201153.2413972-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
References: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1683663156; x=1686255156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPEHfPcbcZDdfTJGYTQ64lR7s4bhzXpB9uPF9NNOTbE=;
 b=TQT16VollCqOoSb6WjjQk4mx/hBAm+N9xJYM+EEWcfkqT9f4j0gG/ALQer9XXyAy4o
 V+vDNmED+9PPiuGaHGsO+qj43FMTsXxBKFhss6cvskWLLIKxNDlxaQ+EJ/Z7dTcwrto5
 77TYRmjbMCNmVHCPMoWb1WEL8FFle0MPbr19g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TQT16Vol
Subject: [Buildroot] [PATCH 4/4] package/libmnl: simplify
 LIBMNL_EXAMPLES_INSTALL_TARGETS setting
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simplify the setting of LIBMNL_EXAMPLES_INSTALL_TARGETS as suggested by
Arnout Vandecappelle in [1].

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220502051059.8301-1-dariobin@libero.it/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libmnl/libmnl.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 7c48196d7529..cea528422ea8 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -20,15 +20,12 @@ define LIBMNL_EXAMPLES_BUILD_CMDS
 endef
 LIBMNL_POST_BUILD_HOOKS += LIBMNL_EXAMPLES_BUILD_CMDS
 
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
-	$(addprefix examples/genl/, genl-family-get genl-group-events)
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
-	$(addprefix examples/kobject/, kobject-event)
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+LIBMNL_EXAMPLES_INSTALL_TARGETS = \
+	$(addprefix examples/genl/, genl-family-get genl-group-events) \
+	$(addprefix examples/kobject/, kobject-event) \
 	$(addprefix examples/netfilter/, nfct-create-batch \
 		nfct-daemon nfct-dump nfct-event nf-log \
-		nf-queue)
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+		nf-queue) \
 	$(addprefix examples/rtnl/, rtnl-addr-add rtnl-addr-dump \
 		rtnl-link-can rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
 		rtnl-link-event rtnl-link-set rtnl-neigh-dump \
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
