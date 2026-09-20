Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C7EC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BBEE40DF1;
	Sun, 20 Sep 2026 14:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7y4Qih10M5Sc; Sun, 20 Sep 2026 14:14:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A4BE540DEB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913672;
	b=ISKPq6mOpBzf1MdoBdO+nAXJw/QuX+ahgMgHXPCvSBJKSZwKryBnmjiWym94e5oKDy0N
	 yHyvhni90y/Esr+BdQb5jHbrv15kJ09cqcny6kIjvjhfRAC/I8o1lNrxRYK2Dy2VLfQsN
	 2l/sATXIg5tfIRthM4xpFz1HzwqUjUpjsa2B47oCX9SWtiheKPhnKf5WiKFHPjIvIZ6lR
	 nlhNFyhNNSMVgBN73M0MXPJBpBGeABfQs5d8+Kwoow/1hW/Fkmamt0KuNIBSim0fNnVEF
	 L2Nn/boBzbURrYle4+w/mGQEudurZFO55h7DG+1PG5sd+xNqKjPiPXRtJjxyjlimfOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913672;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	b=dGLQ9Y2lsMVkDL7CnEWcnFqIjkwTtjzjB4GRQn/xafZVGBPtuGnBMbTOzsEG0J6IndRb
	 etWBUjM/bZnvSRqZ3Yu0+0f2rYMCwXzsqqQGvfX/GAuSOC9jYC+JuGZumpq5HnZ5urCht
	 wkN0ljZ77zhIzk95c6CpYSnwXw3Gd5OoEFQs1bwclIFJlJR7iAere5XRm49jzQ5nFvOzx
	 CG5ZBOmGlm3sI7HFWh2efiB2V47gs3IRX1huAHVD2Biqwes2lJJIsB5aAC9tb5oR5h53d
	 duEjF6BEsHk4CaMuBsjO314+2mzMbxrN6AFDVF9aetQ0rDThBk5IEs3UndKBRO+XGtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913672;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WPUUz45jAsAHlyS8BELkASCeqltash5GNpXfeVki2ALEwbU9RkNZDmjUNcm6dYZrf
	 R03f5x2QrbnutYsv1iorTMzNPMaBxDxuWZObG1cPQ9oGy/0LUIGwBt+Qn01GJG/kmc
	 ybqXA893Os53TL9eaJ7rDif2E8EeeKIHEMle1W3wOdyXz9rUM5s6azwHctvvA+OjBn
	 GJ2qFDgzXRPi1M17ctCusJcqrDH9t4/isssE3xxCZYfkj76m1KFepYjb7RJZQvn172
	 tvLS6vZLOFiTRBtbJMb+UzVHuj6JMC4IkAH4MAVzzoaW+lsxwkCnydbMiatART/yAj
	 rX34Hej+WpbNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4BE540DEB;
	Sun, 20 Sep 2026 14:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65BDE371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 632FF400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uuinrufkmcd for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 76DEE40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913670;
 b=IStidmIC9csFS5l1p+Ev69th6dWEvcPv2x99LiShKYspydw3Br8hUzxnr76PSgKzTEW3
 qS0O7OM90CbFZsY9+WLfuCzrg6qTTSZHBrt2sUX7QQzlNdqn0EXS/uHb2/4YLfJzNf5D4
 rkJTSWnaJklvY3v0xTfd9phj0Edxb2rmyCJnZnq1q0SfHXtPC75suLU71qRYJ8jMKBr6p
 eUjiB/oshwj413kwFVvW/bGhwNEj6RAS3bKKL6O6dJxsH7YOQ6CRbantxl8WmZB+UEAAg
 WtiiyDcrVtooBvYElrjvePjvd+/gW0BCz1CNCV5rVjRhJpFEaQYK+LjUaBDpV/GLm6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913670;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 b=NL7IKMtCaFei+aZSJJmugu/TUhZkl3OORf3DUpHUZQ1TISjFigoGss4j25RavgvXA5FF
 9tvmh34nd3RZjdILXVg7SvaowdSUv79WXZlI2o/n5hdwSLLvf1zptcP0R3Q+5K0G1RyVG
 NvaUo2BZA2L7m4iNkVolUqUAFuO4CecJ5HGUrc4YyqnhiUlyhujhNRES9FGhsmavlRNE+
 Ydd1//Byan77+J9rbNskeYCmwQyhgBbZQ/YKbiGwjSZw3MQ/eKjDvYJy9EYdMz9nnVyad
 F3GRaKo+lIWia5yxYoOvmJANd/6ohkbbWZ/kemfoiPRO+swy+xwrlOaFcJ51GKneE1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WCNX1h9r; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WCNX1h9r
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76DEE40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913237;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WCNX1h9rOvtisyMwJhuNl/durM6P0o0P4Nj42OEoCFMQUPENLrxBbol/KUHvPIW+G
 Ss2i45k34VNfjFPaZoFt0Xwh8JA7Mo+DESU9p/itOYIu/U14SMzb4DIPPBaFuCEH7y
 c1513wunfVaz/z3Pv+x52jH4HFyuxleLXjRuNp8qSaenE5hYqryB7D+iGr2gMmfRaA
 /zzh4rG7M4pM6uGlUqqVG1HwwXIYKvR67XtvpjVjbW32yXLqrOYC17B4Mr0i9Sx/ul
 qDq1ish4vRxdbSz2ztj1n5Vi3bNgsC2NPHDlmOXz6xyahmZ8Q6VZd3R+ww4UvhkUFt
 bfMCfrxYcAjmw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:JqKRoxZGi4844MZjRhAc3MeIQikhXPJs2DkO3Nd2NwdWf4id9K/y7nFvBvq1rXXP0FwET7zDczPuNeaLormQDcWZNCA06O+SUA3ByFiym/RMiSs9+W5nGN5rEmrY7jPrJ3gG8WFDaBjPtQrv7aF0FyaLkdBjYzqXxqFyo4ujZQaPg1wZ9zfKNO3HErYWLUvwTdVubpJ0d4CYAswgwt3WGZJVLq0G8pNbz+oR+yjbQjtHaCKEsWl4F2pObaXDARRKPhPS84dgKJFsH6eZSXFZI25xF/dtoTQrT7VQ2ESDxZruTN9rC9yeJGLuL+A8sW8ceTk+Wtg5vlnbHDTAM04MAHT2WJzrNrrpkpw564ON3DRR8m0AHzNPTShtKZxikBQLsHginHn8E9IbIgvML9lOZA7VqHs+/da6KIN5DRYPRIkz1A8OP9940tsMCRpvpn1l6e5m9kg4Rj0MoL/a30AOaWmqSs2t5lgFDVrIlk837U4jffWUrUgs36k1EFAXU0/csQd/LPVRK4zPHHhqAlF+TzNlelyXX2IeZe236C01YFVGBa5eGFiPwwWY9HaF+hRi3rWRzjaGrdDoib4XNT02gWnBzWVSy8kbs/kPul9UvW0NGC
 hNIxdxPguc2wx/2Zm0S6Ln6A2OiEVS29ReYYCfFhxPxYBNQd7n3YSsyrZtG8sl6/s=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD9DFA4C4876;
 Sun, 20 Sep 2026 16:07:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-2qX1;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:28 +0200
Message-ID: <20260920140605.3005461-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 30/66] package/freeswitch: Add support for
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

configure checks for DTLSv1_method() and DTLSv1_2_method() to make sure
OpenSSL >= 1.0.1e is used, the functions itself are not used by
freeswitch. The two functions were removed from OpenSSL 4.0.0 breaking
the configure check. To fix the problem we let Freeswitch force-detect
the function to finish configure successfully.

Bug was reported upstream:
https://github.com/signalwire/freeswitch/issues/3159

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e27c53650f..524599870c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -75,6 +75,11 @@ FREESWITCH_CONF_ENV += \
 FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
+# fix build with OpenSSL 4.0.0
+FREESWITCH_CONF_ENV += \
+	ac_cv_lib_ssl_DTLSv1_method=yes \
+	ac_cv_lib_ssl_DTLSv1_2_method=yes
+
 FREESWITCH_CONF_OPTS = \
 	--without-erlang \
 	--enable-fhs \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
