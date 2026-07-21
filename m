Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE82C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 12:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3265280EEF;
	Tue, 21 Jul 2026 12:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fUVf53F1fwI; Tue, 21 Jul 2026 12:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2556680EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784638427;
	bh=CoL8h+Hh47TfJYPfYDlcHjh9m1Jhxq4axAurJV1hEWo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kT5cSS8HWRmP7Ep7xP7BCG1ZFe65vH4uSGtxPx5rzM73yOht9wHvoP8wIlDdvJuId
	 gBOgEb29gr0jRZBcGlrddfEETUfr/B/9mXvwuhErL1P1UQ36LG5DbX1/yXtOA8LWxf
	 2QAF4G+KeNvDNlC28WLvSshPIE1Yjm18xw2nhF3X9DxnuJBgvePVemR8bhcfZ08v4T
	 4UBl9GTAbGqC7FYwiMnwxPA6xWYsFs1Sg0fFzhfNal7UmIA4VhzhOmExYCNelHpLPp
	 SXq47O+kVQiHdENAtZOpXucrijBJaoz0Ai3RYtOSzKSONIZq1YMkZ4+h2MDXOSSzNo
	 9hU8ZfZRw4jXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2556680EF0;
	Tue, 21 Jul 2026 12:53:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9857F1099
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 12:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E04A4030B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 12:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UEPbuLCpNWf for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 12:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EB694025A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EB694025A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EB694025A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 12:53:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so26004775e9.0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 05:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784638422; x=1785243222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xbfigHpIxMBh4eXwnluc/KOZPTUTSH1J4ZWhnbVtl6U=;
 b=QD+HEZG14kF797jPkiQcoKxmpGI6SdY9v5rGGF/sMIlJZy+I6M/T3nSb7A67gSKB4/
 iWUESjvEZwn9TefS7O+7I2I1ix9j7OIgklYFkCSE7W17iCGoEubN0BPjFU1CiJcpDEdl
 0dvLGjUg+QUbjDD7Bk4Paq33z/vbH+C2bLfpaLQ11JyqDpmDaw3EFZcR6zxeK0lLcLpi
 +5fINbuRsypt38kZJ7c1drk6mFZiMu7agdxkN9VJ1SWRqtnBxsID5AeWWmfA4gJdMNa/
 mSM6Djj1e5Vi6ajyq1hsCbtntqlrwy/WspWOYHlYkDqNx/xlng0JRbP72ecP5yGfGACB
 +RpQ==
X-Gm-Message-State: AOJu0Yyj7J6IzYHwzceJ9Rv+vSd1q71HrJD8DotV5uP5MD8X3IgEZRlp
 RXB61+ywOOMLczP3pJw+NBzS0xxeidPgkZ2h9biS50EwusEnQ1eX33ICM240svYjlJA6NMtpvIT
 vsN7S
X-Gm-Gg: AfdE7ckLve90q0lffmeNwV5V1XVkQ4mWcP1HFowPBJBjU7l1jnd58oyAyV6LT50DUCt
 DyMbzVr45PVsjH9CsEY5XlJSFDiOl/2ksmYsd7lxWcV+RB/4F/RxvhUGc+z3Z2yf8mLwzRrpB0m
 h9YZeZyqP6+mg23zIpSdaMdkJ4UNWqQ8YHR+G4EJCZC5t7avgs8wEy1Lcn5I9INIRt2gGhfYQex
 54eBr8fs2NCOCwkPka01K6SAiH32QfUQlIWexoUcUVD2p53XxBSDSlqW0mrVjPZk419mQ76a/Cp
 iOXurgqAYNpq2LOAtlJIHnDHtA+/CoOS2o5fdnI/npVoJDfUqgeTAcc6UXLss/NPjYZMUBfJP3S
 YkbHyEdJEIXG0F0elusbGeUd1Gaefk1WnGmBNZHDQRQ81FjOlCsoRt55WRFtSQw3V7UyLDazI2+
 6+kdpokL5U6JV3KrrSjiBDDwkm2FyoEgqfI93MkooMxjfKiUMY0/4Tp9SI93FE3ICIgvxW5mm9g
 yDh3ost0jBba2+q4mge7PYdSWqr7ttpSf8ZPi//YPzIVoAB7bIqvTtseb7VpR7E5k7fIII2fQw0
 TeYHHlZ/hV8=
X-Received: by 2002:a05:600c:a010:b0:495:5365:c0d9 with SMTP id
 5b1f17b1804b1-4955365c1e7mr156347715e9.16.1784638422328; 
 Tue, 21 Jul 2026 05:53:42 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49565487eeasm69930685e9.13.2026.07.21.05.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 05:53:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 14:53:28 +0200
Message-ID: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784638422; x=1785243222;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xbfigHpIxMBh4eXwnluc/KOZPTUTSH1J4ZWhnbVtl6U=;
 b=GATqs0eaGTTIknzfq/LdFwWsA+n+qtndsRVvw6KTh3twb/jwDLnZacDpYFBTzI21of
 YkwgTTz7FUjiV7aOTgKlXqJ+T3g9hlcNo4KIPFZSw4FwvvBqvG+dWiNdt2EyBrqSjH4X
 YegSvquRm4ogrfZSjFJFgYcJXDHUnhugQaFz0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GATqs0ea
Subject: [Buildroot] [PATCH v4 1/3] package/jsoncpp: add host variant
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen Pei <cp0613@linux.alibaba.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Alistair Francis <alistair@alistair23.me>, Julien Olivain <ju.o@free.fr>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Gao Xiang <hsiangkao@aol.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v1

 package/jsoncpp/jsoncpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 7a472775901d..99d04db01ce8 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -11,5 +11,7 @@ JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_CPE_ID_VALID = YES
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
+HOST_JSONCPP_CONF_OPTS = -Dtests=false
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
