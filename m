Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19492C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8488606CF;
	Sun, 27 Sep 2026 10:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0KzuRcr2brn; Sun, 27 Sep 2026 10:57:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F0EB6067A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506667;
	b=i9pcIWJzAroISoeZPRRNW6nAKH3AzNq3FK/R0b6BWHo2jf63RQLA+Bd1J83dRRozsbIr
	 iDCOUp04hwHIiAANssnkq7nab5gz+LtbjAAlEyswJElHSVFJabOcISl43O2RGSdP1mhgB
	 yu4Smx3sknsTUep7lV99jS2nEokP49xZrx573nIHR68tumSEIzCeWIflOhDdPTMTBzA/K
	 6CQ3shmK6dRbkyLE9XULZmJHbU363QHaD2HcFne2iIjDClLkb09lAIGegp9tCswmNYLKX
	 2KR58oqcDZj5brRU1mnCKjRrMomSKOvDP86Pv9BTNpoYbOiukVhd5sPm/x6SWp1e66A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	b=QX+jtJgOSMYEwuKn6x4eiWuDEheqpqmT37zyMMLuTNXPFuA91wBQlPGRJJQOvoX3gfEy
	 N12xOVscN1bxz+XHs4sCzsE3qIxeuMQayPbNdRuJVE773JQGZvzYU6ADxgj5LPX3CeeIW
	 32s92UGADMTjYKS+n9LWuvTeAgmLjJisVEUP8AOWrIZTm0KesTAlpRhayLVrIoQEClPWh
	 Du6eDeNAb5L2EivN/5EKSWsu2pxYCOUvYAkP1zXaiiQGzn0p5O3ubKWhmsv8OHBLcM9Uv
	 H8Xm6xVaxb9LdIpJ++QO7Fsb/Beh5vV+QTNCKJeofP3nNe8zhgzETpavPPg99OdQBag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="fUWh/Yx/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506667;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B9hNR931xJ97zQv9A/3yZQTqoepc2jrQMkacgj01vAJ0nLqvIZxYSaR104lBqNj0k
	 g/wwUPzTM1M0xe4hVKCHYTlZ1GKQ8E/zTcYfBt6iTHTUy8K370R8xUdmpAlk800VbK
	 qm7RsinHCdAZWnDA6EOtu2KcxX7r5uM+b6pdK8EX4U4UHXO+98NJsc9uFipgS7YpQl
	 L8jcBFFHmAra7mMLwY6afTGNlPfmVZ9z2ZqCz27u0gmhCfPopD+GWorJm9R6qMh3kZ
	 tn8FH6NHu93ElwpPiAb2c/GFA4/mmCm+OCXgUPkRrqtq/hwrMB07LyqJzozdUakRnd
	 wm4Q7dThOln4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F0EB6067A;
	Sun, 27 Sep 2026 10:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4755AD1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38C9C6067A
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIYjbSByLrOY for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:57:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 596A76061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506664;
 b=cDAz/7gV1YAdk1TWCeG0vhmHviMPlFw22/kZKKqrMmxAL76uI0wzx1ri8uQHGUr+OtoT
 WbVw8NFSU/UuP+0ySDaWbSfxS+1AJIcVhgUCxQ6udcEE8KmRNb+QLtN8FuD4aRsz44Sol
 g8Pkj/7gNKhpmWdPecOB+La5noQbzkEPal1J3geueYSZOV6Wnpciwi2tLXbuvCamkcYl4
 AZopRUTuc/PdJ47jkfAK7rsH5fyxPfYniCr0eighuhocy7iwlABaM/VcHXAO/9NnrzGq4
 5NWAsEyi/L7A/7RfZyxsEnEQkawNmgVK6vJthAymF46MeBX1TgWeHcMy3Gp+1ij0OAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506664;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 b=IMMXKVkAiMeXvoZwZI1O4geASrULqjmWPv4vEZmwRifA/By9IctfBAA7/qWynxy3tqnF
 FVr7FUCM3YaD+QtBZqutuvDtNH3ZYJ/yyMk/+iv5P+YgryOnkm2JpjDut95vw6/IgSOHJ
 2WRRVnN16B+SPbsuTPGevnfyADr4Ae3jP/RtCsiDySLDpIoNp5ntntq2TzPsPLxiyVMxd
 A5bEGmnaXho/Wf+OHiIYzBYau48H/eso51y3dfLX784rZrG18906XpZyyktt1f/pepk81
 gnBCXzN9O6ZpKuSo7Ud/fp8td2LsJN1EX4+0gOtmnd52o7/2pX1G4b1wMJmHYb+WkWQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="fUWh/Yx/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fUWh/Yx/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 596A76061D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505865;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fUWh/Yx/xB4PBQemfhseGXvE3IBGvLrYKPdGsOUKwL4FTtBnunTrF/XR91O0AkV9X
 8mL5zV35q79mbvSRIkQp6tUVGELStLiVSj9H3GnRJp71UjAvwzYH9FTVB0he4UVEIR
 SdNtb3d+Gtgv6jWxDFMx16YSFRsL4EH4j/ztzfVa2qMfb9Gr5zTuJR8GEDMcMV35lp
 5HdUKngQFwukrG0D1Tpw22Fvru/JZcV2bay/EmSPIPPL9x48dEzwwctK2ZMxvw6DMO
 0at+oTHzSLMNR1NbHi/bHpKh6261gmunz0NNvO7KwMnmjbvR6xvoxn813iqhodPGbv
 r5lriost7MauQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 rXp9zjZZ6YTJBy1nrPaWLMbTTxKQOPMAivaWj9Tl8mtP4pzCAE6ml6iBNqXmf3AXACWEcO++x8H
 lfvcuivwQv0q5Xel5Pz5sb/94+gYQxI4N6SrUTcElXN9k/U0DK0KJGOsyXGH2THI/4nvKAGOH0S
 Jl4/qBrfVUbmTlj7Qpjzv7EGSoBQTRxwYtmL9NCw8AW/Z2gjcYZOwof7k4w6DE2N2E4n+ZHCX51
 vnndUB4kfZ+fapBVtC/GQX1EPF/IX8wxJMsrrbRnGF44Dd3dNRmqQ+81rRH/G6zMha9A4Hn6FQe
 bF/osYqDjF9LsN9C3nLy7HCV7I9ATy5YdNEDwz0bGs7trAai4C80KiUooo8Z4IO/06ep7jYkt3a
 9mjMJe4LfujbthbhhBzsV/AzrNGJQSFwFsobGYcw1+VOHa+eJEHb5lWO0qPe8QjUTqkvoVrLTXS
 wx/sNR29tJPGDqI4eGUPN/B7zkPLthIeatSNC7kuKxz4V7jtQr055zMdV1YR/C0ob9aZBf4dnom
 d/hZFzInN4XVf3gIst4zOO4AHjV8EFSp3R3pL099/esMTgfvnZyFOZDJ3bPXp/jmjR5xStJsf8X
 OY0Ha9mZnrG31DqSSTV39A5m0jTOQnoZ9iZafNJwSQ98ZXJXJbo43c+Ia/EwzbxtW8c/oXBHCyB
 9Us8voFnVTcAAnEsPDq0=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 391E3A4C507C;
 Sun, 27 Sep 2026 12:44:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLd-0000000007a-123x;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:22 +0200
Message-ID: <20260927104301.1801638-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v6 44/82] package/freeswitch: Add support for
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
