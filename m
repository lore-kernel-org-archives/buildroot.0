Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1048CF47CDA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8EC98133E;
	Thu,  5 Mar 2026 21:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVp4SWp7Biqq; Thu,  5 Mar 2026 21:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF218131F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745129;
	bh=pfSFF1uoJKO5ZyoALoWN6RcHs4zsjbmRCGwefBs5Odo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NXt/lt1JqMZGLMaxaT0ik/CroPu0SqQdsf4fRSIFjz6cRiL4y424wEWL2l7iCz9hy
	 WuIRGMENdAJOm52FjGtwV542KkDZVIuupZqXchxvxQOx8BaUOARyswJ+8+GMH3SzCN
	 EbYihfxNKrREWFyYHb54weWu87Y8w52M/MqszFeMEDsiFGAifJaGtosJvDCioLcTQn
	 eUwrMFLVFYMncvXb8njN7tAEmgjeZ4LfvEiM6+oycAEVxNBZvzIPnxc9afS5WfnOkk
	 Gc0d6Y3Ww1DaiT18Bx95BD1wjie2npSCx6M2mxXHQ9TdtHEgEHOXLOzGhi8REkUvai
	 xNK4Zju+t2iWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF218131F;
	Thu,  5 Mar 2026 21:12:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4D7D25B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AD8B40929
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGueBaZ8j8Qj for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:12:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88FE7407EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88FE7407EC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88FE7407EC
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21A46A4C373E;
 Thu,  5 Mar 2026 22:09:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFxA-000000003FD-1E8u;
 Thu, 05 Mar 2026 21:09:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:46 +0100
Message-ID: <20260305210950.3471974-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744998;
 bh=jBLQQ6mgmfzaXErkwatbMB+qMeBzymhMj475hZ6FP+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jco9wI9SJvWwrSSw+wBNHEZ5rh8YK0iN+1tvm321Z8CZtLiHo7peRKyRvXxdE/JD5
 nZ5afVOoBv9iU8JM7xRqrPZ++EJklhsrsTzZSkoQbAAa8qIC5tkel4klGh/rwUBcg5
 tJLmzpb0ZeAHZnzpDms7OldiOCNKqHDvL6I413v1e/YWNKXggfebs3J8dMXRIyu4LC
 IGYREgzOQ01sGUIKU+OUFg++xWb5LWYhYs6pTVt4cdl1prAPDRRSi/+CmcD5bb+ZRA
 yGFnCMKRZ6mssP6d9tETVz1YSY47aY80a6EyI5wh2KrXcZI2hecBIM3oLlY2u/ZZ19
 i1j2EANhOeWTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jco9wI9S
Subject: [Buildroot] [PATCH v2 11/14] package/freeswitch: disable mod_enum
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
