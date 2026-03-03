Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82990EDEBEB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C9EC6063F;
	Tue,  3 Mar 2026 20:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrKJ8jMw3ire; Tue,  3 Mar 2026 20:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0846606A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568185;
	bh=pfSFF1uoJKO5ZyoALoWN6RcHs4zsjbmRCGwefBs5Odo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Bef7i/Glr6HLMA+y/Dr/LnGjjs/gFIr+342uUf4EC1izZCU+GbOt0+gdaU6aKWavw
	 A59gSNO6AgF5sTSf5cXNjs18ht1bcadK9XYI5eat3iMWsr+o2lbhu1nk4aZLQcVScG
	 Q2CuZEc6zdpbtoNfLM3ss4dxacLurcocH7JE/d1qtVUwMFQrBY/J/4uLn2+Wfl8E+l
	 Ijkpikh7XmZ6UpH7YQsT/aZFIHbU2FX3Ga1n/xoWw4X8d36fNWKtR8hI0w6c0w6UZE
	 I5zPptJBpqZ+c6iv3zXoGDZdOw3b2Wn7Zg97fsvyGazvdaIK6qWiuI0t7AroKEp0W1
	 9x7XtMs2vU/1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0846606A6;
	Tue,  3 Mar 2026 20:03:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2561EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8AF94002D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHxIXkpFm2rM for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC2CC40184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC2CC40184
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC2CC40184
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2750A4C3415;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvM-000000003gI-1AMA;
 Tue, 03 Mar 2026 20:00:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:50 +0100
Message-ID: <20260303200054.784253-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568062;
 bh=jBLQQ6mgmfzaXErkwatbMB+qMeBzymhMj475hZ6FP+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Hq4IvMyB+Gyxz5cwQArocPfNBG8yOUGLOA76/caJZdses4Kt/51dV/T2yddu1/DQ7
 HV8lBAUh9SfFV9e0Nh5cznhnNk77ApC1W1Y8RXItA+iO7TcBcT0RR1FQx5YrhPdsHR
 4zkvADVAbjFvUXKggnDAP6nRO5CYrHE5KqLd+vTPwyglfXFIXfDcDgKgwDoo/WSNdR
 CBtDjRj8JwV5iZ6u43NUsQyBSgUbQSquYb9cSwqmRDiJzjI7YyGd4nq3EIJKgKy82I
 zUq+GVTqQXcfIU5JgVAA98m/oN3iPRP98biZr1Fj+HO1lc9kxQN5WkqxQN270jcsHZ
 hTJU0d+ffFqnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Hq4IvMyB
Subject: [Buildroot] [PATCH/next 11/14] package/freeswitch: disable mod_enum
 to fix build with glibc 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build is broken with glibc 2.43:

mod_enum.c: In function 'add_result':
mod_enum.c:246:23: error: passing argument 1 of '__assert_single_arg'
 makes integer from pointer without a cast [-Wint-conversion]
  246 |         switch_assert(new_result);
      |                       ^~~~~~~~~~
      |                       |
      |                       enum_record_t * {aka struct enum_record *}

Since both services (e164.org, freenum.org) used in the default
configutation of mod_enum
https://github.com/signalwire/freeswitch/blob/master/src/mod/applications/mod_enum/conf/autoload_configs/enum.conf.xml

seem to be dead for years now:
https://community.asterisk.org/t/asterisk-network-interconnect/88659

we do not care to try to fix the build error.
Instead the optional support for mod_enum is removed from the package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7e5dc3d872..1121bfa9cc 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -207,11 +207,6 @@ FREESWITCH_DEPENDENCIES += libks
 FREESWITCH_ENABLED_MODULES += endpoints/mod_verto
 endif
 
-ifeq ($(BR2_PACKAGE_LIBLDNS),y)
-FREESWITCH_DEPENDENCIES += libldns
-FREESWITCH_ENABLED_MODULES += applications/mod_enum
-endif
-
 ifeq ($(BR2_PACKAGE_LIBMEMCACHED),y)
 FREESWITCH_DEPENDENCIES += libmemcached
 FREESWITCH_ENABLED_MODULES += applications/mod_memcache
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
