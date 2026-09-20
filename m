Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C5C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614DF40F3E;
	Sun, 20 Sep 2026 17:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7VhS61qs-Fa; Sun, 20 Sep 2026 17:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 843D940DD5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924691;
	b=KRh1i9PzKOSHpFSZg8oqD2LI9Sv9baZCyZT4WtbbWLWOJ2bW7cTxT9TXAcguPFUHhAfR
	 KxJoDmW2KbTYUD4QWUncgd6tMrkwmpwce3zijSAU+rMF3Qeu35HoJ8xzxmOvDTqKmXeL+
	 znSRrqH0CdU3lE9orhWvUAMv92RcBb3j2YnY5NGEzQ3LUMxZY4xPlajZ4cLJ2H2sMUGHn
	 11Z7vclnION+6MYveycsWUjUXRROVOOLF2JjuLmmrS7HxurCisgRL2wskdzF2y3WUNpFy
	 4w9SN6qzgr/oi0Krg8WAQ7Gi3Rloe9xea5ina6ADqISK1si/EDzhloRxhak65EKrjCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=oUQUXZU+gIQ3N3P+5BLYfmyDLcSmG+O73kYlupx9sHAHaOXAXEAWcWLUxpVNzFe13NcO
	 oDGovgz1djDrodXkbkUN6bncuwZl6QR3E4P6QjPvAlaihRy+iLL7rroYSaLsjfq+NHTjb
	 K1JQC/MUD8FlKOt/kL1hAY3WOj3GklpuDpQL15/9QOxsZ2cM4/+7ONEGCHN4AGnsP8v/c
	 qKuEYqYPrdaUvtVCH/ryPorrVJa3u7MUMMOZDFc0EyNmyZQmRd0twXLdkKhKolutw7Q7X
	 UKfepwEx9hyFHa6Q/6zPDmqVBtKReKjk86Zt9UiyWJ5t8mg8z2bSLvE27g4ZrHtemgw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924691;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gFSdnoveVkaUvnqTf+CUyws67T03TkgdFVaHOVgZlhjMisa/E4aagt+KywoQaD5Y5
	 DV0zQbBF7vFKxprnTudtH+aqiSaGhEBvy1DB0y7X5kvcHf6m6FECOT+30vfggGfCvZ
	 0aE4yJ3TXw1LB0rBqLfJSvzrAi3grhYBnkyDzdRd26v+Y/jZggPDEEqp5iXEW+TVyv
	 tc68+cPE3Lv2Zo3X2nh2kvXyGXbPE6h6bbdDjvxrbcfsS6e5ItOBfWYrrOLduhBuhl
	 TX/VWUSSPyV8eL/yxTJVwAta9bY02adDwoiCb02CafJHCe+nl+B4jThZgqT7r3TK2h
	 bth/0HrQoOJPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843D940DD5;
	Sun, 20 Sep 2026 17:18:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 555643FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 529D480D1D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LddWnUa_W84P for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:18:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 68B5780D07
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924689;
 b=Hqry1wQXC8JZSEQe7qNr3b8e9sSz38VDUoA2c/RE+UJkcbMbOF6OJmFxN65DQadoixhL
 kkXsTieMcyyqFqFkYibN/yqTkGNN/PmHJ5T4ksv6i4HmHM09yb02lwg+tXLFy47yTlH3K
 FFO3zDkIY2h6wATzpTyLcGuAxMEMWrjGojBIp0H+kNpGUvKsCaWF+1SCMIzzBoI1lcpxx
 kl5/T1WTM8Gjb8P7e5D0OT3rIiPi04zuCVnikw18K1E54qeEzeLoaQ6w/G1w2ys00emEg
 q4Cqw8wkjjEMlAU1SwZWF2cYr66B7uwzpXSbBCHky4Arbx1sDYzlFIMMrgHsOZofChg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924689;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=sIk9Da7egNW43KsEBqkbUZF0zC7UE0etK4KEa0yLu08nnkeIN/DZSpkt5JbvKgtezfUv
 PysIrLQGc13wwoFmUELXmKEiDRdEdmpB4sQWDrZ4eK8qwQ7Ma3kJNNmZGaymmaz+ziLYr
 6bukf/QmuiGLqPXt/YnbFfx0zFYRJjlSXOe1BvzXJeXXI2EMYOXGuhq544RMEaihMHq5p
 7XZFx414VIWbzVTzceAewnImtHGtQEvy8dz0dR7U0ngibH0Vlcog/JL3DOG+pYAfFdllr
 Q+SA2UI9mQaXyWNmB2me4V/+rgS7u4djaoHM6PfGRfUzp0E5dK4OHolJEmo2JHQCobQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jfXRkR1o; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jfXRkR1o
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68B5780D07
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924159;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jfXRkR1orAZTuCbMhAJhS5h12iWelb7roOkIQsYG0nAeDw1RhYIHov9RJrlMulsDx
 oxZCLcLNKyVu3P1jfXITSr6sYXfX62+5nrJ7v9mgMtkYAYu4Amxw3jL/uoHa8vSpRO
 +op3SeHoui1litvuhqntyzZTQxE9RcvS0p4v2ee3SAWFqfeEIvTv1liQPH6A1Fwfwj
 V5M3IpXwNFIs7QmkM4y8RvJ07SVoWwbgXpV2CHRn3aslZ1sDIpYFoWp2u6QY9XPBnP
 U9r6+tF9ifnvE6w11PkeH5IZLL/uhv2nmLWeU/e6icOm0zkQyGYGeP6Y9jzHJWHWU5
 H9I/DTNO4rYfQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:ksWZFeZgHTeHLcoRHEqJF8gnph4dgNyAFeFkfh6HsxqXBmSL8MR5adaUnD6pbv0aZPCgoVZSVZ9sykuSUpSwwPCDWWVqJxb4SPHJbQ7DdkPpdW9wTPIMqlY1WRtlxpZy2JsasxRzPdzlEdIW1hMik9Ive3WQ9izqJI92+fGjLASNtJcXxVAvdFgLMy904mNDp9HI+/1yY5ZqKXA8TgixOiQOWM+718R9pv5pWzhprWAWOmbklCXdVpLU+NkeWwo1uRbehfPqmMXRC/JAug6k4I6u5o7BYZvXC1/IMLEj9IQIp8ZPx0u9uc08q0U1EMge9eLSKXpyaMP3w5gKg1kgV8PU+XbI4nJVVb/Q0+R5T/2+eRuQZJZqKv/8RPoOMlpeS/eAA/JiVuhHPGwx9hixpWlH2uysPJczC5dowdWIt+Yi/n4TjO1QC1GoYJiNodsR9AFMT/etwSrauu4JXYIMw65ijiab5q5vgT30mQ5AN4897pfqAaexaZreGGMOJQNq3Foehltfi1lkTgNioOUVCsxgHWHfjPWlBIMNsakf7wZngjpqpOIyCMgt7AdaYloqJ9GD7qKFehp0JwnQkpUq2CUKU2Ku+Ouwsme8855Z416/1J
 uo2X3rKgfLiQou7hraN3IfdF3mRXwOYxB8GzEBGuVfSl68uhFetNJMqDO/kDh2I9v8NLD8gTFvdOXY35XcqGVnUhqX+j5A74eLqmv2uPjQDfkdXCe1uA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE8FAA4C4894;
 Sun, 20 Sep 2026 19:09:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1b-000000000o7-1Gjg;
 Sun, 20 Sep 2026 17:08:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:43 +0200
Message-ID: <20260920170815.240247-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 36/67] package/libesmtp: Fix build with
 OpenSSL 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
