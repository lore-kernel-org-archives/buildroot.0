Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19CBC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A26D340A99;
	Sun, 27 Sep 2026 10:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdR01Inl6bk5; Sun, 27 Sep 2026 10:53:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B2E5140AAA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506419;
	b=YCY6RbKF/xc2c/9/D1FPyMiJN+b6G5iZ93uHnZOHgFi9doIbIehW8bxokGmzcH6f9r/g
	 DWnuTNbhg+Vz7/ZSVVC/boCbqWy9TI7RO6kzm6DCdseW/l4lA4p0sYFhgKz6DrLu1b2S5
	 U0Zb8KLfGfkACOba0S02J8k2b7O3jAOsq6he6n+6yvI9nYo/h5hh2m6FObiWSYCNPU0FC
	 3r1d++dWQ4Bon1cKw+7SeR4nDRqJY0tw/sB+Baji22X+zDKB5FdYKPrjh9l1vox7ywAY/
	 pzrWY0OSq03ysJ0G9y8Rn2g2TFTGZzakLHJRUjb8WhtZaPw8/pGmyBignFUcTXG7jog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	b=KKi1NAY5rA/KAEBqQgVDE5U3mNn2TW7mAxnoPWr180I6vpu2zRGJMPwHqKZhgY3Bwm+C
	 xPDcMM3YLq8ITqaKhlPHyzXYwIQx9BhYjYjiNWeRY3io5lTfLTSosAns/MhLpNCiY1WSz
	 2SVJ0fNoWLt/9xpEeDEctaUEOK5vIwlb/a1qgbCkCdr230cQ6XGB91o+zuSrd+3eT5Vsb
	 j95JNWNYlragLGuKgNvVX6xAp+70564vFzOQop12uYaN13iXPmQhjcWFH0Qz+LyjJOns+
	 V0vnUxZrGdHWb5wBDpRpMG4teZHYAIcBOSbzI3hFhN69zR98gW/b1DlGTFYFgiILbwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506419;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UzI0hKWND/W78Rjqo9sOem2EyoFh+jE8n8dlB39Ej8Y4E92u1/HuQRANPheBRXsfb
	 4+utvJb3qRQdtufanwqY0v+FSyr0GrO2yAzW8JfdC+979RDyqVr4/Fq1TRk+yxJiTk
	 99pdMA6BHqt9hCsDLQplsqs/oobqe5YKst7neQARhWPSngY6DRAh4j40nRR6fJt3wZ
	 h609mQ5COTm8T7SGi6k+ZelaCFpfR/Nzma5t5TU298x9k47z2aIdAf8KZHOnR+E6a0
	 ceO3R2TNYC2o4deEDhTjY91K30bIMwBVGXhUNgbD+G8UkozI3+ZYCv3pm2CKA8ojo2
	 ak0TF25CQXaSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E5140AAA;
	Sun, 27 Sep 2026 10:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 907F6335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 767B340059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQRgTqJOp9OV for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:53:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7FEE340068
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506417;
 b=PPEuwJul6t6GLMb/PwQXiE6uHuTrMgJ6DhW3o0coBK8aJXwFALTJBHOhG9YkQ2e5z4eK
 7pRtM54t0ZGoIuSZIsjt+vceJltPznXwqn5j7DKYjKh8am+355/2YvGcapn3vqkZwdk91
 wg/09EwQF8hq/nX09MdoF9UrF793eO5u0o98IDh+6B7vj6kRqeuiVsjQkGUFWGAojxcvD
 ejoGaRQz3jknVW7dPFm4E5PH4vCYN3V4SOyn4tO/XpOwOfbs4FPAXVgnRwvrlWsW7UXCV
 T8WunrrHfMllXznx4fxkkujvWlDRi0lkvkRkhNphzH/M93BeLelykQyocoBeCsX9Wyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506417;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 b=AW07LI+eDJU5FIrLUK7BfdzQ7hnrPJCKKaGpwggA9MhZD/hiX3JRyMNpHoT1cVvzYXm6
 7xE/YrH3r4rTbYwREPCH/n9GUSbOyMMD0xltfd3hNyN0GTajDwKBLdFvM6c5DcIJQ41oP
 RyThL8aFsFHO1r/y4f0jBnapD+YR0jjk7zY0fpQV33UztzlLb2a1RsY6/YaeH+/261sgN
 Wq89WGxd7bv+rjx3kNiNqsucLakvYXs4aqEXV9ADVWAQ2USJlW30Xekb2Xm1tIYXtNMl0
 Oo8Kl/ABMCrvCLNcJaYMTKdXv4PaW4gkAjR3r/cbOXhJQB+V4KLMlJqxNprdItXiXeA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qbjbTKdd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qbjbTKdd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FEE340068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505853;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qbjbTKddvZse2ywEVl7FHPBK6ig0lQrcZ6BEhddm+Q2CQgKsj/EGlmp4ZwsaeOK18
 zfA2BPRU1M5SU6c97ERNZfmdxHW2mC9yooYIN3MqZpa5ieynvQvIiWRdyDnR7XT/l+
 GbGW+3KE6WV/Hcu0XETZyQDU2rns1nRCKVTr5uNZemNRJtrgKdzjs2xYiKD9xUbQKJ
 XX99bnRLSB7g9HtL7hT2LEVglPCON3fTr51GVj2J6CCa7hIgRLF2tpFrE69XM/ldAJ
 QQwN0L5BO6LfFORG3oL/9aAmlrSMKI8UEDodB4D+QHTHgD+VhHDHff2MtwxIY8WRsv
 t/pDWgJ5EZTKA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 prtqlkAlNoMLuHFnM1HwSAaCG05iQFER94d4OzC4Kw4MUUEp3/ofA7q+5bfyun1typ0WPsNEpLz
 0eOqxWUVvjdSycNE/PcG3A0cZR6zO3NhFYdUP0v9ThDinq6hbuxAUgpJNVehX0hCXwdRNg0L1Zu
 gHDUKCXglThJ55xce7oW+79tDfEaeMpDKxj5YfqvguW4TcN/0yRYqn7RiUtfZ9/J85lhUemuVj9
 75JQUCISlaDOtE1/Q6PM+KdDms/Cjy+2oNkQWRx00hlFBI+0a7RLtKVFNtHOEeIdK2dU9Or26J7
 0o8/iZJbg1o6zB+uHv1iba8Wk0GS+pXO0qOgktdC13nl1sZhvknW5lHKWcdGJqBDKiY4/SCAJqi
 M7TH1sV+PgLnt9RQQznKm9OBwNKfvom96OmlhTH7CqyyTttWYEETHd96EI/DGKy/RzJZcVXzZjD
 v6yKBvLLeeSNRj8dDTl56+WyVjDuC3MBktscL/G6+FvUjxovRX6S2Uo1s/BnkzuJsVlw+SM4OV3
 Atel/AdYnIFjS3LWNkskoDZ/IyFrPx6FnkhoAwQWWEg1KV7nEg6HP9caHk9JGqvX8uQ7WYwdH8k
 xdvahCNMAdDkWNxn+UUJB52nfsI8RefkVTLaN9HYMnXkFgZLZddqbfu/pO7HQNBcDW5QBwbgwPR
 C6M6Xx1aCmpB01b+gJr9PNBl9b/EouCd59KqMMzQlMSvnafrex/DNhPNosFGZuA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A2F74A4C4FAA;
 Sun, 27 Sep 2026 12:44:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLZ-0000000007a-1CLN;
 Sun, 27 Sep 2026 10:43:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:00 +0200
Message-ID: <20260927104301.1801638-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 22/82] package/asterisk: bump version to
 22.11.0
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d03f2bdde..7c5fdbaaa4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
