Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A20C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9B69404E0;
	Sun, 27 Sep 2026 10:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxGaOMMMLnsE; Sun, 27 Sep 2026 10:47:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D5ABC4051C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506065;
	b=taY4wHIsFl7EphE7FiPdGG9PM0DVyaZV/SsWtHIizeqwN9j0okYWjlw7MYPOe7HLS5WJ
	 NJI6QttlAcjvHx1qqnUc4kSgzdkWGceeiodjtJ1CekSSdSES0hyOV1aNqm3IHVkrtY8r/
	 R+WlfUKg4IXQbbYLGe5d1DRvaWk557LAvYAgFgQsXM2ZbhjOetMlqLXlnDfkiETUxdEqn
	 AqbCd+OCNakwFUOzNiEsrsxP7/wfvQK26YuQDjoiPd/NXFm7WmrYlBLjoOWU9bvttgOoR
	 R2y0iWmdyp4v6l6WX+0cvF/m06EfiGcWts5H2KdAcXTT6++ZbqpgJMneYjbhwjf4PDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	b=gTwXQl737O1rS7SB4pDvYbiGnHiJ30HBX9pVkdz1j4YczIc4LbgBAYmNjVYY+hfyMMQN
	 4XkwlDsBa35nWl6oUadt2/G8mFM77r4IT/xY4ktHki76RRza6R1w++SG0Qm4GT3Ukrb+K
	 /5ue+bYuiRNNWpuxl3JJb8g4n2giLHSzDemzL6seQNiV7xD1tMuwsPtxjoubYcUUIxBtG
	 NI2GzBl3tVC8jeTpsfs0wwZD5T13gzYi2u+pgF1W+H07JKVcerDwZKGkyQ6g+pGUeAMT3
	 V1T+sEAJGJs0z2n3G0Zv6iQqj35HdDopHmpd90jMgDdEYg88rM4+YQiCE1YPh6oRe1A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=G1lEIvTl;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506064;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YX0RmQAwTzXP7WChdIQZExShyh0dDq6wHZzSR1+LP3BYbSUFU1oq3JDQbY0Y03UXA
	 cEpFUBL5Qfym3JCZVRuDaS1rCUfNtlhVQ/8dAYZA9XRNLSotao73XZO3iQLIF+3GTy
	 0kNQPA4XsWPiYlrTnYkedrc3ZwM2M0aSVottwZKnpN6QDvtKI/WVC4sPiRk7wcCXpO
	 14wx/x3Oc2fL+1N+vxZZTwlePqtILl3AKRHTMDAEccQCc93yoEL3sM6tzM08SEG0VT
	 H2EuaZhXrGpO9BPhkX78hIIlOJ3DKJ1/ONJXbrvC+J+eOe7K95BVTY/+l36T2VfelI
	 pm+SyvbJngwNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5ABC4051C;
	Sun, 27 Sep 2026 10:47:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39159335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AB1E4051C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_tA2QfBktQR for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:47:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 45FC7404E0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506063;
 b=oHSfSXJoRbB72fPYAR1my1mFHQYrBzLuDu0Ogcphu+VXQz6L+pxS+rze2Ck0RUxnPrHF
 Z6O9Rg8TWGT4QvS4XO+QqbLmsK4CAtOvKfAx/NC5a3UD0DW5R1Zks3f64CBJ69VAqZPUe
 FztEh1Hye4TeOIKxv+AOhd30GMe044gDCCBCSdBCj7SmUhnAfPZeLDWSA0eDtUeZEwoU1
 D4+KX3vBaoiHDCEhQHZOQI8z84Dt5TPq9+npeEv0ZiF4N8U1o8UutF5i9ZK7t64H3vLoX
 CQi1udwq+oKk49uCQuhE/BeSQOZZ+iWSXf4YjQZwrIRfdvrTozAlOMeKKWaMtnFbZ/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506063;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 b=hWWRYyTLPpmAzAwSn+PO4NU38pTIgGRZ4pygIEP3vK5gbacWMPZeg45/EU+1nhHha1qy
 9/Ci4scf60tRkIZek5DnyOZpY+sIVinW/ILKMH+AZbXWeAKQXOnv1fiyzhDf+gZECMe50
 Hc+YWo7vZuA2qW4ldtAXIsc/nfrojhhPMUgXU+oDymZElgnXm8W2Glsg4IfuIg9LmTKj3
 FqRH3FEe4lDhAGBYD0aOS/En+xYcN1DLeMqux5m/Mpo7YffSA7p/EawHysETt9coskN+5
 yGEy9Yi1/1KCDEf2VjzKp8sybUSVbLiKhGxDlY2uL9FKp/r/77ZoIIKRgQhgrLzAeqw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=G1lEIvTl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=G1lEIvTl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45FC7404E0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505834;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=G1lEIvTlsbEE8mguEdZNleDjo4vx3Ch1XX79W0mXatfr7oAi+bNHq/nT9faW9kzjA
 BS+SN8YWmy6KtX0TNhgC1V7gAwcEG+RsJyAA02Q85KF55J/YGfXG60d3EWar2qwb22
 lhjS7vRZ0l79xOHXUVP1GrpSGYssns7d01e64CRPM2Rjhptqa7CpPOLKk8+MCw8ZZ9
 Uvci1ebLk9+6fe21P6goK6Axi8TX28hCroZGQphBzGFYh5ixpg/Fz2tjNXPW5D0FHq
 +79xJ7gMrIsA7T+C6rwWn/vpWLLa8lbqYIIMWF1c5soEcM+uU/GWDR9sQZAVsDjlD1
 1iFrH10EMKozA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 Z5TlxcLgrxLeXjQKl7dfUq1gqfH1CYDobzTSiBLMN1ojpxKabkB04nm2qAD0ZWiXWIqeId7ypJZ
 zJukFvbpag2QQ8FGlrrV0e9zJkx0tgBntjcw4n/hxoqf6MzWaO6LEa6ctKUuSRuuKSmIlZ63PrQ
 kOap8bmx1gV6WVWNGbJS/dHe6BkdJAwJ+q4j/NSja4hsUCaSQzdqF3jAlqOny9GcjEw895Utop1
 vyODSBAjpVWP4evnOVNRpmS37SyNCRGQpXzGKt8w1FTqwve39m7QukULzGdbBAtGnWlGZYCnq2b
 apQV1FjGDu42W2I29wi1o8qlTVgX2KvoqBkwwDF+vox3uTAm8mJM327W9BSAI+RpjaRkjGbisEL
 P2nr+K42sMTB4ehqw8pdzJT0kdPr+7tCokt9MFzOri+dQM2Cijw3/vzKtQoC3qrqrwEpBoV3HJa
 ug+HKTSxh6xZkzChs/4D7zjPU0tVdRSrG26UK4UlVpdhp9bbU9f35mu6cuGfq+apB8vuUl1m16A
 eYwJ/nUFNiaQBx1bTDk4vX+sPe0G5JdCOlJMFxJszEmQAnPlKc8NC8O/O9bnauFVh6EsKZaDzUR
 M18WbjutXziNP7h6ewGLQ/Vt9VtpG2rj21yhAzOukWf7AkO14lNQrd9amj+xU6m0pH5jBh242Wx
 5c6yTbBHDjijv6gmL7t5s
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7BA67A4C4F7C;
 Sun, 27 Sep 2026 12:43:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLi-0000000007a-2RY8;
 Sun, 27 Sep 2026 10:43:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:48 +0200
Message-ID: <20260927104301.1801638-71-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 70/82] package/sofia-sip: Fix build with
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...001-Fix-build-error-with-OpenSSL-4.0.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..4e1b2ad87d
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -0,0 +1,42 @@
+From b21b4cc7d0dd4c3eae1a98a3fa38f4cdb2e5a385 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 17 Jul 2026 16:41:11 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4.0
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/stun/stun.c | 2 +-
+ m4/sac-openssl.m4           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsofia-sip-ua/stun/stun.c b/libsofia-sip-ua/stun/stun.c
+index 22ca7c7..aa4b574 100644
+--- a/libsofia-sip-ua/stun/stun.c
++++ b/libsofia-sip-ua/stun/stun.c
+@@ -1368,7 +1368,7 @@ int stun_tls_callback(su_root_magic_t *m, su_wait_t *w, su_wakeup_arg_t *arg)
+     /* openssl initiation */
+     SSLeay_add_ssl_algorithms();
+     SSL_load_error_strings();
+-    ctx = SSL_CTX_new(TLSv1_client_method());
++    ctx = SSL_CTX_new(TLS_client_method());
+     self->sh_ctx = ctx;
+ 
+     if (ctx == NULL) {
+diff --git a/m4/sac-openssl.m4 b/m4/sac-openssl.m4
+index 289d3e1..76ba9f2 100644
+--- a/m4/sac-openssl.m4
++++ b/m4/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
